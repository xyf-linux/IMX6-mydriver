#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/of.h>
#include <linux/fs.h>
#include <linux/device.h>
#include <linux/slab.h>
#include <linux/cdev.h>
#include <linux/of_gpio.h>
#include <linux/interrupt.h>
#include <linux/delay.h>
#include <linux/timer.h>
#include <linux/wait.h>
#include <linux/io.h>
#include <linux/poll.h>
#include <linux/sched.h>

#define DRIVER_NAME "bcdDecodeDriver"
#define DEBUG

static unsigned int major = 0;
static unsigned int minor = 0;
int time_cnt = 0;

static struct class *cls = NULL;
static struct device *dev = NULL;

static struct resource *IRQ_res;
static int count = 0;

static wait_queue_head_t wq;
static int have_data = 0;

struct timedate
{
    unsigned char second;
    unsigned char minute;
    unsigned char hour;
    unsigned char date;
    unsigned char month;
    unsigned char year;
    unsigned short allday;
};

struct BCD_decodeInf
{
    struct cdev BCD_decodeDev;
    unsigned int BCD_pinNum;
    unsigned int BCD_pinState;
    struct tasklet_struct tsk;
    struct timer_list timer;
    struct timedate timedate_per;
};

static struct BCD_decodeInf *pgB_decode = NULL;

static int BCD_data[100] = {0};

static void BCD_to_timedate(void)
{
    int judge_year,judge_month,judge_date;
    int monthDate[2][13] = {
        {0,31,29,31,30,31,30,31,31,30,31,30,31},
        {0,31,28,31,30,31,30,31,31,30,31,30,31},
    };
    pgB_decode->timedate_per.second = BCD_data[2] * 1 + BCD_data[3] * 2 + BCD_data[4] * 4 + BCD_data[5] * 8 +
                                      (BCD_data[7] * 1 + BCD_data[8] * 2 + BCD_data[9] * 4) * 10;

    pgB_decode->timedate_per.minute = BCD_data[11] * 1 + BCD_data[12] * 2 + BCD_data[13] * 4 + BCD_data[14] * 8 +
                                      (BCD_data[16] * 1 + BCD_data[17] * 2 + BCD_data[18] * 4) * 10;

    pgB_decode->timedate_per.hour   = BCD_data[21] * 1 + BCD_data[22] * 2 + BCD_data[23] * 4 + BCD_data[24] * 8 +
                                      (BCD_data[26] * 1 + BCD_data[27] * 2) * 10;

    pgB_decode->timedate_per.allday = BCD_data[31] * 1 + BCD_data[32] * 2 + BCD_data[33] * 4 + BCD_data[34] * 8 +
                                      (BCD_data[36] * 1 + BCD_data[37] * 2 +BCD_data[38] * 4 + BCD_data[39] * 8) * 10 +
                                      (BCD_data[41] * 1 + BCD_data[42] * 2) * 100;

    pgB_decode->timedate_per.year   = BCD_data[51] * 1 + BCD_data[52] * 2 + BCD_data[53] * 4 + BCD_data[54] * 8 +
                                      (BCD_data[56] * 1 + BCD_data[57] * 2 + BCD_data[58] * 4 + BCD_data[59] * 8) * 10;

    judge_date = pgB_decode->timedate_per.allday;
    pgB_decode->timedate_per.year % 4 == 0 ? (judge_year = 0) : (judge_year = 1);
    for(judge_month = 1;judge_date > monthDate[judge_year][judge_month];judge_month++){
        judge_date -= monthDate[judge_year][judge_month];
    }

    pgB_decode->timedate_per.month = judge_month;
    pgB_decode->timedate_per.date  = judge_date;

}

static int BCD_decodeOpen(struct inode *pnode, struct file *pfile)
{
    pfile->private_data = (void *)(container_of(pnode->i_cdev, struct BCD_decodeInf, BCD_decodeDev));
    
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);

    return 0;
}

static int BCD_decodeClose(struct inode *pnode, struct file *pfile)
{
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);

    return 0;
}

static ssize_t BCD_decodeRead(struct file *pfile, char __user *pbuf, size_t len, loff_t *pos)
{
    struct BCD_decodeInf *pB_decode = (struct BCD_decodeInf *)pfile->private_data;

    int i;
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);

    count = 0;
    wait_event_interruptible(wq, have_data == 1);

    BCD_to_timedate();
    if (copy_to_user(pbuf, &pB_decode->timedate_per, sizeof(struct timedate)))
    {
        return -EFAULT;
    }
#ifdef DEBUG
    for (i = 0; i < 100; i++)
    {
        printk("[BCD_DATA_READ[%d]]:%d\n", i, BCD_data[i]);
    }
#endif

    have_data = 0;
    return len;
}

static struct file_operations BCD_decodeOps = {
    .owner = THIS_MODULE,
    .open = BCD_decodeOpen,
    .release = BCD_decodeClose,
    .read = BCD_decodeRead,
};

void timer_function(unsigned long arg)
{
    struct BCD_decodeInf *pB_decode = (struct BCD_decodeInf *)arg;
    if ((pB_decode->BCD_pinState = gpio_get_value(pB_decode->BCD_pinNum)))
    {
        time_cnt++;
        #ifdef DEBUG
        printk("gpio state = %d\n", pB_decode->BCD_pinState);
        #endif
        mod_timer(&pB_decode->timer, jiffies + 1);
    }
    else
    {
        if (!pB_decode->BCD_pinState)
        {
            #ifdef DEBUG
            printk("time cnt = %d\n", time_cnt);
            #endif
            switch (time_cnt)
            {
            case 0:
            case 1:
            case 2:
            case 3:
                BCD_data[count] = 0;
               #ifdef DEBUG 
                printk("BCD_data[%d]:%d\n", count, BCD_data[count]);
                #endif
                count++;
                time_cnt = 0;
                break;
            case 4:
            case 5:
            case 6:
                BCD_data[count] = 1;
               #ifdef DEBUG 
                printk("BCD_data[%d]:%d\n", count, BCD_data[count]);
                #endif
                count++;
                time_cnt = 0;
                break;
            default:
                BCD_data[count] = 2;
               #ifdef DEBUG 
                printk("BCD_data[%d]:%d\n", count, BCD_data[count]);
                #endif
                count++;
                time_cnt = 0;
                break;
            }
        }
    }
}

static irqreturn_t BCD_decodeHandler(int irqno, void *arg)
{
    struct BCD_decodeInf *pB_decode = (struct BCD_decodeInf *)arg;
    tasklet_schedule(&pB_decode->tsk);
    return IRQ_HANDLED;
}

void BCDdecode_func(unsigned long arg)
{
    struct BCD_decodeInf *pB_decode = (struct BCD_decodeInf *)arg;
    have_data = 1;
    mod_timer(&pB_decode->timer, jiffies + 1);

    wake_up_interruptible(&wq);
}

static int BCD_decodeProbe(struct platform_device *pdev)
{
    struct device_node *np = NULL;
    np = pdev->dev.of_node;
    init_waitqueue_head(&wq);

    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);

    /* create device */
    if ((major = register_chrdev(0, "bcd_decode_device_name", &BCD_decodeOps)) < 0)
    {
        printk("[BCD PROBE ##] (REGISTER FAILED) --->>> (major[%d]) <<<---\n", major);
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (REGISTER SUCCESS) --->>> (major[%d]) <<<---\n", major);
    }

    if (NULL == (cls = class_create(THIS_MODULE, DRIVER_NAME)))
    {
        printk("[BCD PROBE ##] (CLASS CREATE FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (CLASS CREATE SUCCESS) --->>> ./sys/class/bcdDecodeDriver\n");
    }

    if (NULL == (dev = device_create(cls, NULL, MKDEV(major, minor), NULL, "bcdDecodeDriver%d", 0)))
    {
        printk("[BCD PROBE ##] (DEVICE CREATE FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (DEVICE CREATE SUCCESS) --->>> ./sys/class/bcdDecodeDriver/bcdDecodeDriver0\n");
    }

    /* kmalloc */
    if (NULL == (pgB_decode = (struct BCD_decodeInf *)kmalloc(sizeof(struct BCD_decodeInf), GFP_KERNEL)))
    {
        printk("[BCD PROBE ##] (KMALLOC FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (KMALLOC SUCCESS) --->>> [<%p>]\n", pgB_decode);
    }
    memset(pgB_decode, 0, sizeof(struct BCD_decodeInf));

    cdev_init(&pgB_decode->BCD_decodeDev, &BCD_decodeOps);
    cdev_add(&pgB_decode->BCD_decodeDev, MKDEV(major, minor), 1);
    pgB_decode->BCD_decodeDev.owner = THIS_MODULE;

    /* gpio */
    if ((-ENOSYS) == (pgB_decode->BCD_pinNum = of_get_named_gpio(np, "bcd-decode-gpios", 0)))
    {
        printk("[BCD PROBE ##] (OF_GET_NAMED_GPIO FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (OF_GET_NAMED_GPIO SUCCESS) --->>> Pin[<%d>]\n", pgB_decode->BCD_pinNum);
    }

    if (!gpio_is_valid(pgB_decode->BCD_pinNum))
    {
        printk("[BCD PROBE ##] (GPIO IS NOT VALID) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (GPIO IS VALID) --->>> Pin[<%d>]\n", pgB_decode->BCD_pinNum);
    }

    if ((-ENOSYS) == gpio_request(pgB_decode->BCD_pinNum, "bcdDecodeGPIO"))
    {
        printk("[BCD PROBE ##] (GPIO REQUEST FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (GPIO REQUEST SUCCESS) --->>> Pin[<%d>]\n", pgB_decode->BCD_pinNum);
    }

    if ((-ENOSYS) == gpio_direction_input(pgB_decode->BCD_pinNum))
    {
        printk("[BCD PROBE ##] (GPIO DIRECTION INPUT FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (GPIO DIRECTION INPUT SUCCESS) --->>> Pin[<%d>]\n", pgB_decode->BCD_pinNum);
    }

    pgB_decode->timer.expires = jiffies + 1;
    pgB_decode->timer.function = timer_function;
    pgB_decode->timer.data = (unsigned long)pgB_decode;
    init_timer(&pgB_decode->timer);
    add_timer(&pgB_decode->timer);

    /* interrupt */
    if (NULL == (IRQ_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0)))
    {
        printk("[BCD PROBE ##] (GET RESOURCE FAILED)(check decive tree) --->>> (Line[%d]) <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (GET RESOURCE SUCCESS)\n");
    }

    tasklet_init(&pgB_decode->tsk, BCDdecode_func, (unsigned long)pgB_decode);

    if (-1 == request_irq(IRQ_res->start, BCD_decodeHandler, IRQF_TRIGGER_RISING, "BCD_decodeIRQ", pgB_decode))
    {
        printk("[BCD PROBE ##] (IRQ REQUEST FAILED)(check decive tree) --->>> (Line[%d]) <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (IRQ REQUEST SUCCESS) --->>> cat /proc/interrupts\n");
    }
    count = 0;
    printk("probe count = %d\n", count);
    return 0;

err_exit:
    unregister_chrdev(major, DRIVER_NAME);
    device_destroy(cls, MKDEV(major, minor));
    class_destroy(cls);
    kfree(pgB_decode);
    free_irq(IRQ_res->start, pgB_decode);
    return -1;
}

static int BCD_decodeRemove(struct platform_device *pdev)
{
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);
    free_irq(IRQ_res->start, pgB_decode);
    gpio_free(pgB_decode->BCD_pinNum);
    unregister_chrdev(major, DRIVER_NAME);
    device_destroy(cls, MKDEV(major, minor));
    class_destroy(cls);
    kfree(pgB_decode);

    return 0;
}

static struct of_device_id BCD_decodeDts[] = {
    {
        .compatible = "fsl,imx6q-qiyang-bcd-decode",
    },
    {/*sentinel*/}};

static struct platform_driver BCD_decodeDriver = {
    .probe = BCD_decodeProbe,
    .remove = BCD_decodeRemove,
    .driver = {
        .name = DRIVER_NAME,
        .owner = THIS_MODULE,
        .of_match_table = of_match_ptr(BCD_decodeDts),
    },
};

static int __init BCD_decodeInit(void)
{
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);

    return platform_driver_register(&BCD_decodeDriver);
}

static void __exit BCD_decodeExit(void)
{
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);

    platform_driver_unregister(&BCD_decodeDriver);
}

module_init(BCD_decodeInit);
module_exit(BCD_decodeExit);

MODULE_LICENSE("GPL");
MODULE_ALIAS("bcd_decode");
MODULE_AUTHOR("qy");
MODULE_DESCRIPTION("BCD Decode Driver");
