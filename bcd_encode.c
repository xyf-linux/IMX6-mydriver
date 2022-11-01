#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/of.h>
#include <linux/cdev.h>
#include <linux/gpio.h>
#include <linux/fs.h>
#include <linux/slab.h>
#include <linux/of_gpio.h>
#include <linux/poll.h>
#include <linux/uaccess.h>
#include <linux/delay.h>

#define DEBUG

#define DEV_NAME "bcdEncodeDriver"

static unsigned int major = 0;
static unsigned int minor = 0;
static struct class *cls = NULL;
static struct device *dev = NULL;

static unsigned char kbuf[8] = {0};
int BCD_data[100] = {0};

struct BCD_encodeInf
{
    struct cdev BCD_encodeDev;
    unsigned int BCD_pinNum;
    unsigned int PinState;
};

static struct BCD_encodeInf *pgB_encode = NULL;

static void SecMinHor_to_BCD(int data, int first)
{
    int i, j, y;
    for (i = 0; i < 2; i++)
    {
        if (i == 0)
        {
            y = data % 10;
            for (j = 0; j < 4; j++)
            {
                if (j == 0)
                    BCD_data[first + 4 * i] = y % 2;
                if (j == 1)
                    BCD_data[first + 4 * i + 1] = y % 4 / 2;
                if (j == 2)
                    BCD_data[first + 4 * i + 2] = y % 8 / 4;
                if (j == 3)
                    BCD_data[first + 4 * i + 3] = y / 8;
            }
        }
        if (i == 1)
        {
            y = data / 10;
            for (j = 0; j < 3; j++)
            {
                if (j == 0)
                    BCD_data[first + 4 * i + 1] = y % 2;
                if (j == 1)
                    BCD_data[first + 4 * i + 2] = y % 4 / 2;
                if (j == 2)
                    BCD_data[first + 4 * i + 3] = y % 8 / 4;
            }
        }
    }
}

/*以天数来计算*/
static void Date_to_BCD(int data, int first)
{
    int i, j, y;
    for (i = 0; i < 3; i++)
    {
        if (i == 0)
        {
            y = data % 10;
            for (j = 0; j < 4; j++)
            {
                if (j == 0)
                    BCD_data[first + 4 * i] = y % 2;
                if (j == 1)
                    BCD_data[first + 4 * i + 1] = y % 4 / 2;
                if (j == 2)
                    BCD_data[first + 4 * i + 2] = y % 8 / 4;
                if (j == 3)
                    BCD_data[first + 4 * i + 3] = y / 8;
            }
        }
        if (i == 1)
        {
            y = data % 100 / 10;
            for (j = 0; j < 4; j++)
            {
                if (j == 0)
                    BCD_data[first + 4 * i + 1] = y % 2;
                if (j == 1)
                    BCD_data[first + 4 * i + 2] = y % 4 / 2;
                if (j == 2)
                    BCD_data[first + 4 * i + 3] = y % 8 / 4;
                if (j == 3)
                    BCD_data[first + 4 * i + 4] = y / 8;
            }
        }
        if (i == 2)
        {
            y = data / 100;
            for (j = 0; j < 2; j++)
            {
                if (j == 0)
                    BCD_data[first + 4 * i + 2] = y % 2;
                if (j == 1)
                    BCD_data[first + 4 * i + 3] = y % 4 / 2;
            }
        }
    }
}

static void Year_to_BCD(int data, int first)
{
    int i, j, y;
    for (i = 0; i < 2; i++)
    {
        if (i == 0)
        {
            y = data % 10;
            for (j = 0; j < 4; j++)
            {
                if (j == 0)
                    BCD_data[first + 4 * i] = y % 2;
                if (j == 1)
                    BCD_data[first + 4 * i + 1] = y % 4 / 2;
                if (j == 2)
                    BCD_data[first + 4 * i + 2] = y % 8 / 4;
                if (j == 3)
                    BCD_data[first + 4 * i + 3] = y / 8;
            }
        }
        if (i == 1)
        {
            y = data / 10;
            for (j = 0; j < 4; j++)
            {
                if (j == 0)
                    BCD_data[first + 4 * i + 1] = y % 2;
                if (j == 1)
                    BCD_data[first + 4 * i + 2] = y % 4 / 2;
                if (j == 2)
                    BCD_data[first + 4 * i + 3] = y % 8 / 4;
                if (j == 3)
                    BCD_data[first + 4 * i + 4] = y / 8;
            }
        }
    }
}

static int days(int mon, int date)
{
    int sum = 0;
    int i;
    int m[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    if (kbuf[5] % 4 == 0)
    {
        m[1] = 29;
        for (i = 0; i < mon - 1; i++)
        {
            sum = sum + m[i];
        }
        sum = sum + date;
        return sum;
    }
    else
    {
        for (i = 0; i < mon - 1; i++)
        {
            sum = sum + m[i];
        }
        sum = sum + date;
        return sum;
    }
}

static void BCD_config(void)
{
    BCD_data[0] = 2;
    BCD_data[1] = 2;
    BCD_data[10] = 2;
    BCD_data[20] = 2;
    BCD_data[30] = 2;
    BCD_data[50] = 2;
    BCD_data[60] = 2;
    BCD_data[70] = 2;
    BCD_data[80] = 2;
    BCD_data[90] = 2;
}

static void write_0(void)
{
    gpio_set_value(pgB_encode->BCD_pinNum, !!1);
    mdelay(2);
    gpio_set_value(pgB_encode->BCD_pinNum, !!0);
    mdelay(8);
}

static void write_1(void)
{
    gpio_set_value(pgB_encode->BCD_pinNum, !!1);
    mdelay(5);
    gpio_set_value(pgB_encode->BCD_pinNum, !!0);
    mdelay(5);
}

static void write_P(void)
{
    gpio_set_value(pgB_encode->BCD_pinNum, !!1);
    mdelay(8);
    gpio_set_value(pgB_encode->BCD_pinNum, !!0);
    mdelay(2);
}

static void write_BCD(void)
{
    int i = 0;
    for (i = 0; i < 99; i++)
    {
        if (BCD_data[i] == 0)
        {
            write_0();
        }
        else if (BCD_data[i] == 1)
        {
            write_1();
        }
        else if (BCD_data[i] == 2)
        {
            write_P();
        }
    }
}

static int BCD_encodeOpen(struct inode *pnode, struct file *pfile)
{
    pfile->private_data = (void *)(container_of(pnode->i_cdev, struct BCD_encodeInf, BCD_encodeDev));
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);

    return 0;
}

static int BCD_encodeClose(struct inode *pnode, struct file *pfile)
{
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);

    return 0;
}

static ssize_t imxBcdWrite(struct file *pfile, const char __user *userdata, size_t size, loff_t *offset)
{
    struct BCD_encodeInf *pBcdDev = (struct BCD_encodeInf *)pfile->private_data;
    int i;
    int sum = 0;

    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);
    if ((copy_from_user(kbuf, userdata, sizeof(kbuf))) > 0)
    {
        printk("[BCD ###] (COPY SEC FAILED) --->>> (Line[%d]) <<<---\n", __LINE__);
        pBcdDev->PinState = 0;
        return -1;
    }
    else
    {
        for (i = 0; i < 6; i++)
        {
            printk("[KBUF[] @@@] --->>> kbuf[%d]:%d <<<---\n", i, kbuf[i]);
        }
        pBcdDev->PinState = 1;

        SecMinHor_to_BCD(kbuf[0], 2);
        SecMinHor_to_BCD(kbuf[1], 11);
        SecMinHor_to_BCD(kbuf[2], 21);
        sum = days(kbuf[4], kbuf[3]);
        printk("sum=%d\n", sum);
        Date_to_BCD(sum, 31);
        Year_to_BCD(kbuf[5], 51);
        BCD_config();

#ifdef DEBUG
        for (i = 0; i < 99; i++)
        {
            printk("[BCD_DATA[] ###] --->>> BCD_data[%d]:%d <<<---\n", i, BCD_data[i]);
        }
#endif

        write_BCD();
    }

    return 0;
}

static struct file_operations BCD_encodeOps = {
    .owner = THIS_MODULE,
    .open = BCD_encodeOpen,
    .release = BCD_encodeClose,
    .write = imxBcdWrite,
};

static int BCD_encodeProbe(struct platform_device *pdev)
{
    struct device_node *np = NULL;
    np = pdev->dev.of_node;

    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);

    /* init */
    if ((major = register_chrdev(0, "bcd_encode_device_name", &BCD_encodeOps)) < 0)
    {
        printk("[BCD PROBE ##] (REGISTER FAILED) --->>> (major[%d]) <<<---\n", major);
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (REGISTER SUCCESS) --->>> (major[%d]) <<<---\n", major);
    }

    if (NULL == (cls = class_create(THIS_MODULE, DEV_NAME)))
    {
        printk("[BCD PROBE ##] (CLASS CREATE FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (CLASS CREATE SUCCESS) --->>> ./sys/class/bcdEncodeDriver\n");
    }

    if (NULL == (dev = device_create(cls, NULL, MKDEV(major, minor), NULL, "bcdEncodeDriver%d", 0)))
    {
        printk("[BCD PROBE ##] (DEVICE CREATE FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (DEVICE CREATE SUCCESS) --->>> ./sys/class/bcdDecodeDriver/bcdDecodeDriver0\n");
    }

    if (NULL == (pgB_encode = (struct BCD_encodeInf *)kmalloc(sizeof(struct BCD_encodeInf), GFP_KERNEL)))
    {
        printk("[BCD PROBE ##] (KMALLOC FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (KMALLOC SUCCESS) --->>> [<%p>]\n", pgB_encode);
    }
    memset(pgB_encode, 0, sizeof(struct BCD_encodeInf));

    cdev_init(&pgB_encode->BCD_encodeDev, &BCD_encodeOps);

    pgB_encode->BCD_encodeDev.owner = THIS_MODULE;
    cdev_add(&pgB_encode->BCD_encodeDev, MKDEV(major, minor), 1);

    /* device tree */
    if ((-ENOSYS) == (pgB_encode->BCD_pinNum = of_get_named_gpio(np, "bcd-encode-gpios", 0)))
    {
        printk("[BCD PROBE ##] (OF_GET_NAMED_GPIO FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (OF_GET_NAMED_GPIO SUCCESS) --->>> Pin[<%d>]\n", pgB_encode->BCD_pinNum);
    }

    if (!gpio_is_valid(pgB_encode->BCD_pinNum))
    {
        printk("[BCD PROBE ##] (GPIO IS NOT VALID) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (GPIO IS VALID) --->>> Pin[<%d>]\n", pgB_encode->BCD_pinNum);
    }

    if ((-ENOSYS) == gpio_request(pgB_encode->BCD_pinNum, "bcdGPIO"))
    {
        printk("[BCD PROBE ##] (GPIO REQUEST FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (GPIO REQUEST SUCCESS) --->>> Pin[<%d>]\n", pgB_encode->BCD_pinNum);
    }

    if ((-ENOSYS) == gpio_direction_output(pgB_encode->BCD_pinNum, 0))
    {
        printk("[BCD PROBE ##] (GPIO DIRECTION INPUT FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (GPIO DIRECTION INPUT SUCCESS) --->>> Pin[<%d>]\n", pgB_encode->BCD_pinNum);
    }

    return 0;

err_exit:
    unregister_chrdev(major, DEV_NAME);
    device_destroy(cls, MKDEV(major, minor));
    class_destroy(cls);
    kfree(pgB_encode);
    return -1;
}

static int BCD_encodeRemove(struct platform_device *pdev)
{
    printk("----->%s----->%d\n", __FUNCTION__, __LINE__);
    gpio_set_value(pgB_encode->BCD_pinNum, !!0);
    gpio_free(pgB_encode->BCD_pinNum);
    unregister_chrdev(major, DEV_NAME);
    device_destroy(cls, MKDEV(major, minor));
    class_destroy(cls);
    kfree(pgB_encode);
    return 0;
}

static const struct of_device_id BCD_encodeDts[] = {
    {
        .compatible = "fsl,imx6q-qiyang-bcd-encode",
    },
    {/*sentinel*/}};

static struct platform_driver BCD_encodeDriver = {
    .probe = BCD_encodeProbe,
    .remove = BCD_encodeRemove,
    .driver = {
        .name = DEV_NAME,
        .owner = THIS_MODULE,
        .of_match_table = of_match_ptr(BCD_encodeDts),
    },
};

/*
    module_platform_driver(BCD_encodeDriver);
    */

static int __init BCD_encodeInit(void)
{
    printk("----->%s----->%d\n", __FUNCTION__, __LINE__);
    return platform_driver_register(&BCD_encodeDriver);
}

static void __exit BCD_encodeExit(void)
{
    platform_driver_unregister(&BCD_encodeDriver);
}

module_init(BCD_encodeInit);
module_exit(BCD_encodeExit);

MODULE_LICENSE("GPL");
MODULE_ALIAS("bcd_encode");
MODULE_AUTHOR("qy");
MODULE_DESCRIPTION("BCD Encode Driver");
