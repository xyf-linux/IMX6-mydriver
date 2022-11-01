#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/platform_device.h>
#include <linux/of.h>
#include <linux/of_gpio.h>
#include <linux/gpio.h>
#include <linux/delay.h>
#include <linux/cdev.h>
#include <linux/fs.h>
#include <linux/kdev_t.h>
#include <linux/slab.h>

#define BUZZER_DEVICE_NAME "xueyifengBuzzer"

static struct myBuzzer_Dev{
    struct cdev myBuzzerDev;
    unsigned int buzzerPinNum;
    unsigned char state;
};
static struct myBuzzer_Dev *pgMyBuzzer_Dev = NULL;

static unsigned int major = 0;
static unsigned int minor = 0;
static struct class * cls = NULL;
static struct device * dev = NULL;

#define BUZZER_TYPE 'a'
#define BUZZER_ON  _IOW(BUZZER_TYPE,0,char)
#define BUZZER_OFF _IOW(BUZZER_TYPE,1,char)
#define BUZZER_INT _IOW(BUZZER_TYPE,2,char)



static int myBuzzerOpen(struct inode *pnode, struct file *pfile){
    pfile->private_data = (void *)(container_of(pnode->i_cdev,struct myBuzzer_Dev,myBuzzerDev));

    printk("-------->%s--------->%d---------->\n",__FUNCTION__,__LINE__);

    return 0;
}

static int myBuzzerClose(struct inode *pnode, struct file *pfile){
    printk("-------->%s--------->%d---------->\n",__FUNCTION__,__LINE__);
    return 0;
}


static long myBuzzerIOctl(struct file *pfile, unsigned int cmd, unsigned long arg){
    int i;
    struct myBuzzer_Dev *pmyBuzzerDev = (struct myBuzzer_Dev *)pfile->private_data;
    switch(cmd){
        case BUZZER_ON:
            pmyBuzzerDev->state = 1;
            gpio_set_value(pmyBuzzerDev->buzzerPinNum,pmyBuzzerDev->state);
            printk("BUZZER ON\n");
            break;
        case BUZZER_OFF:
            pmyBuzzerDev->state = 0;
            gpio_set_value(pmyBuzzerDev->buzzerPinNum,pmyBuzzerDev->state);
            printk("BUZZER OFF\n");
            break;
        case BUZZER_INT:
            pmyBuzzerDev->state = 1;
            for(i=0;i<3;i++){
                gpio_set_value(pmyBuzzerDev->buzzerPinNum,pmyBuzzerDev->state);
                msleep(300);
                gpio_set_value(pmyBuzzerDev->buzzerPinNum,!(pmyBuzzerDev->state));
                msleep(300);
            }
            printk("BUZZER INT\n");
            break;
        default:
            printk("BUZZER exit\n");
            break;
    }
    return 0;
}

static struct file_operations myBuzzerOps = {
    .owner = THIS_MODULE,
    .open = myBuzzerOpen,
    .release = myBuzzerClose,
	.unlocked_ioctl = myBuzzerIOctl,
};


static int buzzerProbe(struct platform_device *pdev){
    struct device_node *np = NULL;
    np = pdev->dev.of_node;

    printk("-------->%s--------->%d---------->START\n",__FUNCTION__,__LINE__);

    /* 主设备号 cat /proc/devices | grep myBuzzer     查看 */
    major = register_chrdev(0,"myBuzzer",&myBuzzerOps);
    if(major < 0){
        printk("[PROBE:ERROR]:REGISTER_CHRDEV (error major:%d)\n",major);
        return -1;
    }else{
        printk("[PROBE:SUCCESS]:REGISTER_CHRDEV (get major:%d)\n",major);
    }

    /* /sys/class/myBuzzer/dev_MyBuzzer0 */
    /* /dev/dev_MyBuzzer0 */
    cls = class_create(THIS_MODULE,"myBuzzer");
    if(NULL == cls){
        printk("[PROBE:ERROR]:CLASS_CREATE (error major:%p)\n",cls);
        return -1;
    }else{
        printk("[PROBE:SUCCESS]:CLASS_CREATE (get major:%p)\n",cls);
    }

    dev = device_create(cls, NULL, MKDEV(major,minor),NULL, "dev_MyBuzzer%d",0);
    if(NULL == dev){
        printk("[PROBE:ERROR]:DEVICE_CREATE\n");
        return -1;
    }else{
        printk("[PROBE:SUCCESS]:DEVICE_CREATE\n");
    }
    
    pgMyBuzzer_Dev = (struct myBuzzer_Dev *)kmalloc(sizeof(struct myBuzzer_Dev), GFP_KERNEL);
    if(NULL == pgMyBuzzer_Dev){
        printk("[PROBE:ERROR]:KMALLOC\n");
        goto err_exit;
    }else{
        printk("[PROBE:SUCCESS]:KMALLOC\n");
    }
    memset(pgMyBuzzer_Dev,0,sizeof(struct myBuzzer_Dev));

    cdev_init(&pgMyBuzzer_Dev->myBuzzerDev,&myBuzzerOps);

    pgMyBuzzer_Dev->myBuzzerDev.owner = THIS_MODULE;
    cdev_add(&pgMyBuzzer_Dev->myBuzzerDev,MKDEV(major,minor),1);



    /* 设备树里的名字 */
    pgMyBuzzer_Dev->buzzerPinNum = of_get_named_gpio(np,"bzr-gpios",0);
    
    if((-ENOSYS) == pgMyBuzzer_Dev->buzzerPinNum){
        printk("[PROBE:ERROR]:OF_GET_NAMED_GPIO (error code:%d)\n",pgMyBuzzer_Dev->buzzerPinNum);
        goto err_exit;
    }else{
        printk("[PROBE:SUCCESS]:OF_GET_NAMED_GPIO (get code:%d)\n",pgMyBuzzer_Dev->buzzerPinNum);
    }

    if(!gpio_is_valid(pgMyBuzzer_Dev->buzzerPinNum)){
        printk("[PROBE:ERROR]:GPIO_IS_VALID fialed\n");
        goto err_exit;
    }else{
        printk("[PROBE:SUCCESS]:GPIO_IS_VALID\n");
    }
    /* GPIO别名 */
    if((-ENOSYS) == gpio_request(pgMyBuzzer_Dev->buzzerPinNum,"buzzerGpio")){
        printk("[PROBE:ERROR]:GPIO_REQUEST fialed\n");
        goto err_exit;
    }else{
        printk("[PROBE:SUCCESS]:GPIO_REQUEST\n");
    }

    if((-ENOSYS) == gpio_direction_output(pgMyBuzzer_Dev->buzzerPinNum,0)){
        printk("[PROBE:ERROR]:GPIO_DERECTION_OUTPUT fialed\n");
        goto err_exit;
    }else{
        printk("[PROBE:SUCCESS]:GPIO_DERCTION_OUTPUT\n");
    }

    gpio_set_value(pgMyBuzzer_Dev->buzzerPinNum,!!1);
    msleep(500);
    gpio_set_value(pgMyBuzzer_Dev->buzzerPinNum,!!0);

    printk("-------->%s--------->%d---------->END\n",__func__,__LINE__);
    
    return 0;

    err_exit:
        unregister_chrdev(major,"myBuzzer");
        class_destroy(cls);
        device_destroy(cls,MKDEV(major,minor));
        kfree(pgMyBuzzer_Dev);
        return -1;
}


static int buzzerRemove(struct platform_device *pdev){
    printk("-------->%s--------->%d---------->START\n",__FUNCTION__,__LINE__);
    gpio_set_value(pgMyBuzzer_Dev->buzzerPinNum,!!0);
    gpio_free(pgMyBuzzer_Dev->buzzerPinNum);
    unregister_chrdev(major,"myBuzzer");
    class_destroy(cls);
    device_destroy(cls,MKDEV(major,minor));
    kfree(pgMyBuzzer_Dev);
    printk("-------->%s--------->%d---------->END\n",__func__,__LINE__);
    return 0;
}

static struct of_device_id __ofBuzzerDeviceID[] = {
	{ .compatible = "fsl,imx6q-qiyang-buzzer", },
    {}
};


static struct platform_driver myBuzzerDriver = {
    .probe = buzzerProbe,
    .remove = buzzerRemove,

    .driver = {
        .name = BUZZER_DEVICE_NAME,
        .owner = THIS_MODULE,
        .of_match_table = of_match_ptr(__ofBuzzerDeviceID),
    },
};


static int __init myBuzzerTestInit(void){
    printk("*************************************************\n");
    printk("*************************************************\n");
    printk("                                                 \n");
    printk("              MyBuzzerTest_init                  \n");
    printk("                                                 \n");
    printk("*************************************************\n");
    printk("*************************************************\n");

    return platform_driver_register(&myBuzzerDriver);

}

static void __exit myBuzzerTestExit(void){
    platform_driver_unregister(&myBuzzerDriver);
}


module_init(myBuzzerTestInit);
module_exit(myBuzzerTestExit);


MODULE_LICENSE("GPL");
MODULE_ALIAS("my buzzer test");
MODULE_AUTHOR("xue yi feng");
MODULE_DESCRIPTION("Driver for IMX6ULL BUZZER");

