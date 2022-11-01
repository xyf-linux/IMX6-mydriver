
bcd_decode.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <BCD_decodeClose>:
BCD_decodeClose():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:93
    return 0;
}

static int BCD_decodeClose(struct inode *pnode, struct file *pfile)
{
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);
   0:	e3000000 	movw	r0, #0
   4:	e3001000 	movw	r1, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:92

    return 0;
}

static int BCD_decodeClose(struct inode *pnode, struct file *pfile)
{
   8:	e92d4008 	push	{r3, lr}
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:93
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);
   c:	e3401000 	movt	r1, #0
  10:	e3a0205d 	mov	r2, #93	; 0x5d
  14:	e3400000 	movt	r0, #0
  18:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:96

    return 0;
}
  1c:	e3a00000 	mov	r0, #0
  20:	e8bd8008 	pop	{r3, pc}

00000024 <BCD_decodeOpen>:
BCD_decodeOpen():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:84
    }
}
*/

static int BCD_decodeOpen(struct inode *pnode, struct file *pfile)
{
  24:	e92d4008 	push	{r3, lr}
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:86
    pfile->private_data = (void *)(container_of(pnode->i_cdev, struct BCD_decodeInf, BCD_decodeDev));
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);
  28:	e3a02056 	mov	r2, #86	; 0x56
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:85
}
*/

static int BCD_decodeOpen(struct inode *pnode, struct file *pfile)
{
    pfile->private_data = (void *)(container_of(pnode->i_cdev, struct BCD_decodeInf, BCD_decodeDev));
  2c:	e5903134 	ldr	r3, [r0, #308]	; 0x134
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:86
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);
  30:	e3000000 	movw	r0, #0
  34:	e3400000 	movt	r0, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:85
}
*/

static int BCD_decodeOpen(struct inode *pnode, struct file *pfile)
{
    pfile->private_data = (void *)(container_of(pnode->i_cdev, struct BCD_decodeInf, BCD_decodeDev));
  38:	e5813090 	str	r3, [r1, #144]	; 0x90
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:86
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);
  3c:	e59f1008 	ldr	r1, [pc, #8]	; 4c <BCD_decodeOpen+0x28>
  40:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:89

    return 0;
}
  44:	e3a00000 	mov	r0, #0
  48:	e8bd8008 	pop	{r3, pc}
  4c:	00000010 	.word	0x00000010

00000050 <BCD_decodeRemove>:
BCD_decodeRemove():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:370
    }

    return 0;

err_exit:
//    iounmap(MEM_res);
  50:	e92d4010 	push	{r4, lr}
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:371
    unregister_chrdev(major, DRIVER_NAME);
  54:	e3000000 	movw	r0, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:372
    device_destroy(cls, MKDEV(major, minor));
  58:	e3004000 	movw	r4, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:371

    return 0;

err_exit:
//    iounmap(MEM_res);
    unregister_chrdev(major, DRIVER_NAME);
  5c:	e3002173 	movw	r2, #371	; 0x173
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:372
    device_destroy(cls, MKDEV(major, minor));
  60:	e3404000 	movt	r4, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:371

    return 0;

err_exit:
//    iounmap(MEM_res);
    unregister_chrdev(major, DRIVER_NAME);
  64:	e3400000 	movt	r0, #0
  68:	e59f1064 	ldr	r1, [pc, #100]	; d4 <BCD_decodeRemove+0x84>
  6c:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:372
    device_destroy(cls, MKDEV(major, minor));
  70:	e5943000 	ldr	r3, [r4]
  74:	e3a01000 	mov	r1, #0
  78:	e5930000 	ldr	r0, [r3]
  7c:	ebfffffe 	bl	0 <free_irq>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:373
    class_destroy(cls);
  80:	e5940004 	ldr	r0, [r4, #4]
  84:	ebfffffe 	bl	0 <__arm_iounmap>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:374
    kfree(pgB_decode);
  88:	e5943008 	ldr	r3, [r4, #8]
  8c:	e593003c 	ldr	r0, [r3, #60]	; 0x3c
  90:	ebfffffe 	bl	0 <gpio_free>
unregister_chrdev():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/fs.h:2327
	return __register_chrdev(major, 0, 256, name, fops);
}

static inline void unregister_chrdev(unsigned int major, const char *name)
{
	__unregister_chrdev(major, 0, 256, name);
  94:	e3003000 	movw	r3, #0
  98:	e3a02c01 	mov	r2, #256	; 0x100
  9c:	e3403000 	movt	r3, #0
  a0:	e594000c 	ldr	r0, [r4, #12]
  a4:	e3a01000 	mov	r1, #0
  a8:	ebfffffe 	bl	0 <__unregister_chrdev>
BCD_decodeRemove():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:376
    free_irq(IRQ_res->start, NULL);
    return -1;
  ac:	e594100c 	ldr	r1, [r4, #12]
  b0:	e5940010 	ldr	r0, [r4, #16]
  b4:	e1a01a01 	lsl	r1, r1, #20
  b8:	ebfffffe 	bl	0 <device_destroy>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:377
}
  bc:	e5940010 	ldr	r0, [r4, #16]
  c0:	ebfffffe 	bl	0 <class_destroy>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:378

  c4:	e5940008 	ldr	r0, [r4, #8]
  c8:	ebfffffe 	bl	0 <kfree>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:381
static int BCD_decodeRemove(struct platform_device *pdev)
{
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);
  cc:	e3a00000 	mov	r0, #0
  d0:	e8bd8010 	pop	{r4, pc}
  d4:	00000020 	.word	0x00000020

000000d8 <timer_function>:
timer_function():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:141
    .open = BCD_decodeOpen,
    .release = BCD_decodeClose,
    .read = BCD_decodeRead,
};


  d8:	e92d4008 	push	{r3, lr}
__gpio_get_value():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/asm-generic/gpio.h:95
 * the GPIO is constant and refers to some always-present controller,
 * giving direct access to chip registers and tight bitbanging loops.
 */
static inline int __gpio_get_value(unsigned gpio)
{
	return gpiod_get_raw_value(gpio_to_desc(gpio));
  dc:	e590003c 	ldr	r0, [r0, #60]	; 0x3c
  e0:	ebfffffe 	bl	0 <gpio_to_desc>
  e4:	ebfffffe 	bl	0 <gpiod_get_raw_value>
timer_function():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:143


  e8:	e3500000 	cmp	r0, #0
  ec:	1a000002 	bne	fc <timer_function+0x24>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:146



  f0:	e59f0010 	ldr	r0, [pc, #16]	; 108 <timer_function+0x30>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:149



  f4:	e8bd4008 	pop	{r3, lr}
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:146






  f8:	eafffffe 	b	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:144
};





  fc:	e59f0008 	ldr	r0, [pc, #8]	; 10c <timer_function+0x34>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:149





 100:	e8bd4008 	pop	{r3, lr}
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:144
};





 104:	eafffffe 	b	0 <printk>
 108:	00000040 	.word	0x00000040
 10c:	00000038 	.word	0x00000038

00000110 <BCD_decodeRead>:
BCD_decodeRead():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:99

    return 0;
}

static ssize_t BCD_decodeRead(struct file *pfile, char __user *pbuf, size_t len, loff_t *pos)
{
 110:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
 114:	e1a08002 	mov	r8, r2
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:103
    int i;
    int res = -1;
   // int time_cnt = 0;
    wait_event_interruptible(wq, have_data == 1);
 118:	e59f7148 	ldr	r7, [pc, #328]	; 268 <BCD_decodeRead+0x158>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:99

    return 0;
}

static ssize_t BCD_decodeRead(struct file *pfile, char __user *pbuf, size_t len, loff_t *pos)
{
 11c:	e24dd018 	sub	sp, sp, #24
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:103
    int i;
    int res = -1;
   // int time_cnt = 0;
    wait_event_interruptible(wq, have_data == 1);
 120:	e5973014 	ldr	r3, [r7, #20]
 124:	e3530001 	cmp	r3, #1
 128:	0a000013 	beq	17c <BCD_decodeRead+0x6c>
INIT_LIST_HEAD():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/list.h:27
#define LIST_HEAD(name) \
	struct list_head name = LIST_HEAD_INIT(name)

static inline void INIT_LIST_HEAD(struct list_head *list)
{
	list->next = list;
 12c:	e28d3010 	add	r3, sp, #16
BCD_decodeRead():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:103
 130:	e3a02000 	mov	r2, #0
 134:	e28d4018 	add	r4, sp, #24
INIT_LIST_HEAD():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/list.h:27
 138:	e58d3010 	str	r3, [sp, #16]
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/list.h:28
	list->prev = list;
 13c:	e58d3014 	str	r3, [sp, #20]
BCD_decodeRead():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:103
 140:	e5242014 	str	r2, [r4, #-20]!
 144:	ea000002 	b	154 <BCD_decodeRead+0x44>
 148:	e3500000 	cmp	r0, #0
 14c:	1a000007 	bne	170 <BCD_decodeRead+0x60>
 150:	ebfffffe 	bl	0 <schedule>
 154:	e59f0110 	ldr	r0, [pc, #272]	; 26c <BCD_decodeRead+0x15c>
 158:	e1a01004 	mov	r1, r4
 15c:	e3a02001 	mov	r2, #1
 160:	ebfffffe 	bl	0 <prepare_to_wait_event>
 164:	e5973014 	ldr	r3, [r7, #20]
 168:	e3530001 	cmp	r3, #1
 16c:	1afffff5 	bne	148 <BCD_decodeRead+0x38>
 170:	e1a01004 	mov	r1, r4
 174:	e59f00f0 	ldr	r0, [pc, #240]	; 26c <BCD_decodeRead+0x15c>
 178:	ebfffffe 	bl	0 <finish_wait>
 17c:	e59f50ec 	ldr	r5, [pc, #236]	; 270 <BCD_decodeRead+0x160>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:99

    return 0;
}

static ssize_t BCD_decodeRead(struct file *pfile, char __user *pbuf, size_t len, loff_t *pos)
{
 180:	e3a04000 	mov	r4, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:116
    // Read_decode();


    for (i = 0; i < 99; i++)
    {
        printk("[BCD_DATA_READ[%d]]:%d\n", i, BCD_data[i]);
 184:	e1a01004 	mov	r1, r4
 188:	e59f00e4 	ldr	r0, [pc, #228]	; 274 <BCD_decodeRead+0x164>
 18c:	e5b52004 	ldr	r2, [r5, #4]!
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:114
        }
    */
    // Read_decode();


    for (i = 0; i < 99; i++)
 190:	e2844001 	add	r4, r4, #1
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:116
    {
        printk("[BCD_DATA_READ[%d]]:%d\n", i, BCD_data[i]);
 194:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:114
        }
    */
    // Read_decode();


    for (i = 0; i < 99; i++)
 198:	e3540063 	cmp	r4, #99	; 0x63
 19c:	1afffff8 	bne	184 <BCD_decodeRead+0x74>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:119
    {
        printk("[BCD_DATA_READ[%d]]:%d\n", i, BCD_data[i]);
    }

    printk("1set value : %x\n",gpio_get_value(pgB_decode->BCD_pinNum));
 1a0:	e5973008 	ldr	r3, [r7, #8]
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:121
    gpio_set_value(pgB_decode->BCD_pinNum,1);
    printk("1set value : %x\n",gpio_get_value(pgB_decode->BCD_pinNum));
 1a4:	e3a0500a 	mov	r5, #10
 1a8:	e59f60c8 	ldr	r6, [pc, #200]	; 278 <BCD_decodeRead+0x168>
__gpio_get_value():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/asm-generic/gpio.h:95
 1ac:	e593003c 	ldr	r0, [r3, #60]	; 0x3c
 1b0:	ebfffffe 	bl	0 <gpio_to_desc>
 1b4:	ebfffffe 	bl	0 <gpiod_get_raw_value>
 1b8:	e1a01000 	mov	r1, r0
BCD_decodeRead():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:119
    for (i = 0; i < 99; i++)
    {
        printk("[BCD_DATA_READ[%d]]:%d\n", i, BCD_data[i]);
    }

    printk("1set value : %x\n",gpio_get_value(pgB_decode->BCD_pinNum));
 1bc:	e59f00b8 	ldr	r0, [pc, #184]	; 27c <BCD_decodeRead+0x16c>
 1c0:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:120
    gpio_set_value(pgB_decode->BCD_pinNum,1);
 1c4:	e5973008 	ldr	r3, [r7, #8]
__gpio_set_value():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/asm-generic/gpio.h:99
}
static inline void __gpio_set_value(unsigned gpio, int value)
{
	return gpiod_set_raw_value(gpio_to_desc(gpio), value);
 1c8:	e593003c 	ldr	r0, [r3, #60]	; 0x3c
 1cc:	ebfffffe 	bl	0 <gpio_to_desc>
 1d0:	e3a01001 	mov	r1, #1
 1d4:	ebfffffe 	bl	0 <gpiod_set_raw_value>
BCD_decodeRead():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:121
    printk("1set value : %x\n",gpio_get_value(pgB_decode->BCD_pinNum));
 1d8:	e5973008 	ldr	r3, [r7, #8]
__gpio_get_value():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/asm-generic/gpio.h:95
 * the GPIO is constant and refers to some always-present controller,
 * giving direct access to chip registers and tight bitbanging loops.
 */
static inline int __gpio_get_value(unsigned gpio)
{
	return gpiod_get_raw_value(gpio_to_desc(gpio));
 1dc:	e593003c 	ldr	r0, [r3, #60]	; 0x3c
 1e0:	ebfffffe 	bl	0 <gpio_to_desc>
 1e4:	ebfffffe 	bl	0 <gpiod_get_raw_value>
 1e8:	e1a01000 	mov	r1, r0
BCD_decodeRead():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:121
 1ec:	e59f0088 	ldr	r0, [pc, #136]	; 27c <BCD_decodeRead+0x16c>
 1f0:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:122
    mdelay(10);
 1f4:	e30605b0 	movw	r0, #26032	; 0x65b0
 1f8:	e5963004 	ldr	r3, [r6, #4]
 1fc:	e3400666 	movt	r0, #1638	; 0x666
 200:	e12fff33 	blx	r3
 204:	e2555001 	subs	r5, r5, #1
 208:	1afffff9 	bne	1f4 <BCD_decodeRead+0xe4>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:125


    gpio_set_value(pgB_decode->BCD_pinNum,0);
 20c:	e5973008 	ldr	r3, [r7, #8]
__gpio_set_value():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/asm-generic/gpio.h:99
}
static inline void __gpio_set_value(unsigned gpio, int value)
{
	return gpiod_set_raw_value(gpio_to_desc(gpio), value);
 210:	e3a0400a 	mov	r4, #10
 214:	e593003c 	ldr	r0, [r3, #60]	; 0x3c
 218:	ebfffffe 	bl	0 <gpio_to_desc>
 21c:	e1a01005 	mov	r1, r5
 220:	ebfffffe 	bl	0 <gpiod_set_raw_value>
BCD_decodeRead():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:126
    mdelay(10);
 224:	e30605b0 	movw	r0, #26032	; 0x65b0
 228:	e5963004 	ldr	r3, [r6, #4]
 22c:	e3400666 	movt	r0, #1638	; 0x666
 230:	e12fff33 	blx	r3
 234:	e2544001 	subs	r4, r4, #1
 238:	1afffff9 	bne	224 <BCD_decodeRead+0x114>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:127
    res = gpio_get_value(pgB_decode->BCD_pinNum);
 23c:	e5973008 	ldr	r3, [r7, #8]
__gpio_get_value():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/asm-generic/gpio.h:95
 * the GPIO is constant and refers to some always-present controller,
 * giving direct access to chip registers and tight bitbanging loops.
 */
static inline int __gpio_get_value(unsigned gpio)
{
	return gpiod_get_raw_value(gpio_to_desc(gpio));
 240:	e593003c 	ldr	r0, [r3, #60]	; 0x3c
 244:	ebfffffe 	bl	0 <gpio_to_desc>
 248:	ebfffffe 	bl	0 <gpiod_get_raw_value>
 24c:	e1a01000 	mov	r1, r0
BCD_decodeRead():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:128
    printk("0set value : %x\n",res);
 250:	e59f0028 	ldr	r0, [pc, #40]	; 280 <BCD_decodeRead+0x170>
 254:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:130

    have_data = 0;
 258:	e5874014 	str	r4, [r7, #20]
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:132
    return len;
}
 25c:	e1a00008 	mov	r0, r8
 260:	e28dd018 	add	sp, sp, #24
 264:	e8bd81f0 	pop	{r4, r5, r6, r7, r8, pc}
 268:	00000000 	.word	0x00000000
 26c:	00000018 	.word	0x00000018
 270:	00000030 	.word	0x00000030
 274:	00000048 	.word	0x00000048
 278:	00000000 	.word	0x00000000
 27c:	00000060 	.word	0x00000060
 280:	00000074 	.word	0x00000074

00000284 <BCD_decodeProbe>:
BCD_decodeProbe():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:206
    }
    else if (time_cnt >= 7 && time_cnt <=9)
    {
        BCD_data[count] = 2;
        time_cnt = 0;
        count++;
 284:	e92d45f0 	push	{r4, r5, r6, r7, r8, sl, lr}
 288:	e1a07000 	mov	r7, r0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:209
        printk("BCD_data[%d]:%d\n",count,BCD_data[count]);
    }
#endif
 28c:	e59f4348 	ldr	r4, [pc, #840]	; 5dc <BCD_decodeProbe+0x358>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:206
    }
    else if (time_cnt >= 7 && time_cnt <=9)
    {
        BCD_data[count] = 2;
        time_cnt = 0;
        count++;
 290:	e24dd00c 	sub	sp, sp, #12
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:209
        printk("BCD_data[%d]:%d\n",count,BCD_data[count]);
    }
#endif
 294:	e59f1344 	ldr	r1, [pc, #836]	; 5e0 <BCD_decodeProbe+0x35c>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:208
    {
        BCD_data[count] = 2;
        time_cnt = 0;
        count++;
        printk("BCD_data[%d]:%d\n",count,BCD_data[count]);
    }
 298:	e5908140 	ldr	r8, [r0, #320]	; 0x140
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:209
#endif
 29c:	e2842024 	add	r2, r4, #36	; 0x24
 2a0:	e2840018 	add	r0, r4, #24
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:212
}


 2a4:	e59f5338 	ldr	r5, [pc, #824]	; 5e4 <BCD_decodeProbe+0x360>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:209
        BCD_data[count] = 2;
        time_cnt = 0;
        count++;
        printk("BCD_data[%d]:%d\n",count,BCD_data[count]);
    }
#endif
 2a8:	ebfffffe 	bl	0 <__init_waitqueue_head>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:211
}

 2ac:	e59f0334 	ldr	r0, [pc, #820]	; 5e8 <BCD_decodeProbe+0x364>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:214



 2b0:	e3a01000 	mov	r1, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:211
        count++;
        printk("BCD_data[%d]:%d\n",count,BCD_data[count]);
    }
#endif
}

 2b4:	e594c008 	ldr	ip, [r4, #8]
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:214



 2b8:	e1a03001 	mov	r3, r1
 2bc:	e1a02001 	mov	r2, r1
register_chrdev():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:247
    gpio_base = ioremap(MEM_res->start, (MEM_res->end - MEM_res->start));
    printk("test:gpio_base = %p\n", (int *)gpio_base);
    printk("test:gpio_base = %d\n", *(int *)gpio_base);
    printk("[BCD PROBE ##] (GPIOMEM_SIZE:%#x)\n", (unsigned int)(MEM_res->end - MEM_res->start));
    */

 2c0:	e59f6324 	ldr	r6, [pc, #804]	; 5ec <BCD_decodeProbe+0x368>
BCD_decodeProbe():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:211
        count++;
        printk("BCD_data[%d]:%d\n",count,BCD_data[count]);
    }
#endif
}

 2c4:	e590e000 	ldr	lr, [r0]
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:213


 2c8:	e58cc06c 	str	ip, [ip, #108]	; 0x6c
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:214

 2cc:	e28c0058 	add	r0, ip, #88	; 0x58
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:212
        printk("BCD_data[%d]:%d\n",count,BCD_data[count]);
    }
#endif
}


 2d0:	e58c5068 	str	r5, [ip, #104]	; 0x68
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:211
        count++;
        printk("BCD_data[%d]:%d\n",count,BCD_data[count]);
    }
#endif
}

 2d4:	e28ee001 	add	lr, lr, #1
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:257
        */



    /* create device */
    if ((major = register_chrdev(0, "bcd_decode_device_name", &BCD_decodeOps)) < 0)
 2d8:	e59fa310 	ldr	sl, [pc, #784]	; 5f0 <BCD_decodeProbe+0x36c>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:211
        count++;
        printk("BCD_data[%d]:%d\n",count,BCD_data[count]);
    }
#endif
}

 2dc:	e58ce060 	str	lr, [ip, #96]	; 0x60
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:214



 2e0:	ebfffffe 	bl	0 <init_timer_key>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:215
static int BCD_decodeProbe(struct platform_device *pdev)
 2e4:	e5940008 	ldr	r0, [r4, #8]
 2e8:	e2800058 	add	r0, r0, #88	; 0x58
 2ec:	ebfffffe 	bl	0 <add_timer>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:218
{
    struct device_node *np = NULL;
    np = pdev->dev.of_node;
 2f0:	e3a020da 	mov	r2, #218	; 0xda
 2f4:	e59f12f8 	ldr	r1, [pc, #760]	; 5f4 <BCD_decodeProbe+0x370>
 2f8:	e59f02f8 	ldr	r0, [pc, #760]	; 5f8 <BCD_decodeProbe+0x374>
 2fc:	ebfffffe 	bl	0 <printk>
register_chrdev():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/fs.h:2322
extern void chrdev_show(struct seq_file *,off_t);

static inline int register_chrdev(unsigned int major, const char *name,
				  const struct file_operations *fops)
{
	return __register_chrdev(major, 0, 256, name, fops);
 300:	e3a00000 	mov	r0, #0
 304:	e3a02c01 	mov	r2, #256	; 0x100
 308:	e1a01000 	mov	r1, r0
 30c:	e59f32e8 	ldr	r3, [pc, #744]	; 5fc <BCD_decodeProbe+0x378>
 310:	e58d6000 	str	r6, [sp]
 314:	ebfffffe 	bl	0 <__register_chrdev>
 318:	e1a03000 	mov	r3, r0
BCD_decodeProbe():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:254
        gpio_base = ioremap(TEST_ADD,0x100);
        printk("test:gpio_base = %p\n",(int *)gpio_base);
        printk("test:gpio_base = %d\n",*(int *)gpio_base);
        */


 31c:	e59f02dc 	ldr	r0, [pc, #732]	; 600 <BCD_decodeProbe+0x37c>
 320:	e1a01003 	mov	r1, r3
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:247
    gpio_base = ioremap(MEM_res->start, (MEM_res->end - MEM_res->start));
    printk("test:gpio_base = %p\n", (int *)gpio_base);
    printk("test:gpio_base = %d\n", *(int *)gpio_base);
    printk("[BCD PROBE ##] (GPIOMEM_SIZE:%#x)\n", (unsigned int)(MEM_res->end - MEM_res->start));
    */

 324:	e584300c 	str	r3, [r4, #12]
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:254
        gpio_base = ioremap(TEST_ADD,0x100);
        printk("test:gpio_base = %p\n",(int *)gpio_base);
        printk("test:gpio_base = %d\n",*(int *)gpio_base);
        */


 328:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:257

    /* create device */
    if ((major = register_chrdev(0, "bcd_decode_device_name", &BCD_decodeOps)) < 0)
 32c:	e2842024 	add	r2, r4, #36	; 0x24
 330:	e1a0000a 	mov	r0, sl
 334:	e59f12c8 	ldr	r1, [pc, #712]	; 604 <BCD_decodeProbe+0x380>
 338:	ebfffffe 	bl	0 <__class_create>
 33c:	e3500000 	cmp	r0, #0
 340:	e5840010 	str	r0, [r4, #16]
 344:	0a000091 	beq	590 <BCD_decodeProbe+0x30c>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:264
        printk("[BCD PROBE ##] (REGISTER FAILED) --->>> (major[%d]) <<<---\n", major);
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (REGISTER SUCCESS) --->>> (major[%d]) <<<---\n", major);
 348:	e59f02b8 	ldr	r0, [pc, #696]	; 608 <BCD_decodeProbe+0x384>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:267
    }

    if (NULL == (cls = class_create(THIS_MODULE, DRIVER_NAME)))
 34c:	e3a05000 	mov	r5, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:264
        printk("[BCD PROBE ##] (REGISTER FAILED) --->>> (major[%d]) <<<---\n", major);
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (REGISTER SUCCESS) --->>> (major[%d]) <<<---\n", major);
 350:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:267
    }

    if (NULL == (cls = class_create(THIS_MODULE, DRIVER_NAME)))
 354:	e594200c 	ldr	r2, [r4, #12]
 358:	e1a01005 	mov	r1, r5
 35c:	e59fc2a8 	ldr	ip, [pc, #680]	; 60c <BCD_decodeProbe+0x388>
 360:	e1a03005 	mov	r3, r5
 364:	e5940010 	ldr	r0, [r4, #16]
 368:	e58d5004 	str	r5, [sp, #4]
 36c:	e58dc000 	str	ip, [sp]
 370:	e1a02a02 	lsl	r2, r2, #20
 374:	ebfffffe 	bl	0 <device_create>
 378:	e1500005 	cmp	r0, r5
 37c:	e5840024 	str	r0, [r4, #36]	; 0x24
 380:	0a000087 	beq	5a4 <BCD_decodeProbe+0x320>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:274
        printk("[BCD PROBE ##] (CLASS CREATE FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (CLASS CREATE SUCCESS) --->>> ./sys/class/bcdDecodeDriver\n");
 384:	e59f0284 	ldr	r0, [pc, #644]	; 610 <BCD_decodeProbe+0x38c>
 388:	ebfffffe 	bl	0 <printk>
kmalloc():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/slab.h:430
			int index = kmalloc_index(size);

			if (!index)
				return ZERO_SIZE_PTR;

			return kmem_cache_alloc_trace(kmalloc_caches[index],
 38c:	e59f3280 	ldr	r3, [pc, #640]	; 614 <BCD_decodeProbe+0x390>
kmem_cache_alloc_trace():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/slab.h:329

#else /* CONFIG_TRACING */
static __always_inline void *kmem_cache_alloc_trace(struct kmem_cache *s,
		gfp_t flags, size_t size)
{
	void *ret = kmem_cache_alloc(s, flags);
 390:	e3a010d0 	mov	r1, #208	; 0xd0
 394:	e593001c 	ldr	r0, [r3, #28]
 398:	ebfffffe 	bl	0 <kmem_cache_alloc>
BCD_decodeProbe():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:278
    }

    if (NULL == (dev = device_create(cls, NULL, MKDEV(major, minor), NULL, "bcdDecodeDriver%d", 0)))
    {
 39c:	e3500000 	cmp	r0, #0
 3a0:	e5840008 	str	r0, [r4, #8]
 3a4:	0a000083 	beq	5b8 <BCD_decodeProbe+0x334>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:285
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (DEVICE CREATE SUCCESS) --->>> ./sys/class/bcdDecodeDriver/bcdDecodeDriver0\n");
    }
 3a8:	e1a01000 	mov	r1, r0
 3ac:	e59f0264 	ldr	r0, [pc, #612]	; 618 <BCD_decodeProbe+0x394>
 3b0:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:287

    /* kmalloc */
 3b4:	e5940008 	ldr	r0, [r4, #8]
 3b8:	e3a01074 	mov	r1, #116	; 0x74
 3bc:	ebfffffe 	bl	0 <__memzero>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:289
    if (NULL == (pgB_decode = (struct BCD_decodeInf *)kmalloc(sizeof(struct BCD_decodeInf), GFP_KERNEL)))
    {
 3c0:	e1a01006 	mov	r1, r6
 3c4:	e5940008 	ldr	r0, [r4, #8]
 3c8:	ebfffffe 	bl	0 <cdev_init>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:290
        printk("[BCD PROBE ##] (KMALLOC FAILED) --->>> Line[%d] <<<---\n", __LINE__);
 3cc:	e594100c 	ldr	r1, [r4, #12]
 3d0:	e3a02001 	mov	r2, #1
 3d4:	e5940008 	ldr	r0, [r4, #8]
 3d8:	e1a01a01 	lsl	r1, r1, #20
 3dc:	ebfffffe 	bl	0 <cdev_add>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:291
        return -1;
 3e0:	e5946008 	ldr	r6, [r4, #8]
of_get_named_gpio():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/of_gpio.h:138
 * value on the error condition.
 */
static inline int of_get_named_gpio(struct device_node *np,
                                   const char *propname, int index)
{
	return of_get_named_gpio_flags(np, propname, index, NULL);
 3e4:	e1a00008 	mov	r0, r8
 3e8:	e59f122c 	ldr	r1, [pc, #556]	; 61c <BCD_decodeProbe+0x398>
 3ec:	e1a02005 	mov	r2, r5
 3f0:	e1a03005 	mov	r3, r5
BCD_decodeProbe():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:291
 3f4:	e586a024 	str	sl, [r6, #36]	; 0x24
of_get_named_gpio():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/of_gpio.h:138
 3f8:	ebfffffe 	bl	0 <of_get_named_gpio_flags>
BCD_decodeProbe():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:294
    }
    else
    {
 3fc:	e3700026 	cmn	r0, #38	; 0x26
 400:	e586003c 	str	r0, [r6, #60]	; 0x3c
 404:	0a000051 	beq	550 <BCD_decodeProbe+0x2cc>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:301
    }
    memset(pgB_decode, 0, sizeof(struct BCD_decodeInf));

    cdev_init(&pgB_decode->BCD_decodeDev, &BCD_decodeOps);
    cdev_add(&pgB_decode->BCD_decodeDev, MKDEV(major, minor), 1);
    pgB_decode->BCD_decodeDev.owner = THIS_MODULE;
 408:	e5943008 	ldr	r3, [r4, #8]
 40c:	e59f020c 	ldr	r0, [pc, #524]	; 620 <BCD_decodeProbe+0x39c>
 410:	e593103c 	ldr	r1, [r3, #60]	; 0x3c
 414:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:304

    /* gpio */
    if ((-ENOSYS) == (pgB_decode->BCD_pinNum = of_get_named_gpio(np, "bcd-decode-gpios", 0)))
 418:	e5943008 	ldr	r3, [r4, #8]
 41c:	e593103c 	ldr	r1, [r3, #60]	; 0x3c
 420:	e3510c02 	cmp	r1, #512	; 0x200
 424:	2a000033 	bcs	4f8 <BCD_decodeProbe+0x274>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:311
        printk("[BCD PROBE ##] (OF_GET_NAMED_GPIO FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (OF_GET_NAMED_GPIO SUCCESS) --->>> Pin[<%d>]\n", pgB_decode->BCD_pinNum);
 428:	e59f01f4 	ldr	r0, [pc, #500]	; 624 <BCD_decodeProbe+0x3a0>
 42c:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:314
    }

    if (!gpio_is_valid(pgB_decode->BCD_pinNum))
 430:	e5943008 	ldr	r3, [r4, #8]
 434:	e59f11ec 	ldr	r1, [pc, #492]	; 628 <BCD_decodeProbe+0x3a4>
 438:	e593003c 	ldr	r0, [r3, #60]	; 0x3c
 43c:	ebfffffe 	bl	0 <gpio_request>
 440:	e3700026 	cmn	r0, #38	; 0x26
 444:	0a000045 	beq	560 <BCD_decodeProbe+0x2dc>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:321
        printk("[BCD PROBE ##] (GPIO IS NOT VALID) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (GPIO IS VALID) --->>> Pin[<%d>]\n", pgB_decode->BCD_pinNum);
 448:	e5943008 	ldr	r3, [r4, #8]
 44c:	e59f01d8 	ldr	r0, [pc, #472]	; 62c <BCD_decodeProbe+0x3a8>
 450:	e593103c 	ldr	r1, [r3, #60]	; 0x3c
 454:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:324
    }

    if ((-ENOSYS) == gpio_request(pgB_decode->BCD_pinNum, "bcdDecodeGPIO"))
 458:	e5943008 	ldr	r3, [r4, #8]
gpio_direction_input():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/asm-generic/gpio.h:67
extern int gpio_request(unsigned gpio, const char *label);
extern void gpio_free(unsigned gpio);

static inline int gpio_direction_input(unsigned gpio)
{
	return gpiod_direction_input(gpio_to_desc(gpio));
 45c:	e593003c 	ldr	r0, [r3, #60]	; 0x3c
 460:	ebfffffe 	bl	0 <gpio_to_desc>
 464:	ebfffffe 	bl	0 <gpiod_direction_input>
BCD_decodeProbe():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:324
 468:	e3700026 	cmn	r0, #38	; 0x26
 46c:	0a00003f 	beq	570 <BCD_decodeProbe+0x2ec>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:331
        printk("[BCD PROBE ##] (GPIO REQUEST FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (GPIO REQUEST SUCCESS) --->>> Pin[<%d>]\n", pgB_decode->BCD_pinNum);
 470:	e5943008 	ldr	r3, [r4, #8]
 474:	e59f01b4 	ldr	r0, [pc, #436]	; 630 <BCD_decodeProbe+0x3ac>
 478:	e593103c 	ldr	r1, [r3, #60]	; 0x3c
 47c:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:335
    }

    if ((-ENOSYS) == gpio_direction_input(pgB_decode->BCD_pinNum))
    {
 480:	e1a00007 	mov	r0, r7
 484:	e3a01b01 	mov	r1, #1024	; 0x400
 488:	e1a02005 	mov	r2, r5
 48c:	ebfffffe 	bl	0 <platform_get_resource>
 490:	e3500000 	cmp	r0, #0
 494:	e5840000 	str	r0, [r4]
 498:	0a00004b 	beq	5cc <BCD_decodeProbe+0x348>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:342
        goto err_exit;
    }
    else
    {
        printk("[BCD PROBE ##] (GPIO DIRECTION INPUT SUCCESS) --->>> Pin[<%d>]\n", pgB_decode->BCD_pinNum);
    }
 49c:	e59f0190 	ldr	r0, [pc, #400]	; 634 <BCD_decodeProbe+0x3b0>
 4a0:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:345

    /* interrupt */
    if (NULL == (IRQ_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0)))
 4a4:	e5942008 	ldr	r2, [r4, #8]
 4a8:	e59f1188 	ldr	r1, [pc, #392]	; 638 <BCD_decodeProbe+0x3b4>
 4ac:	e2820044 	add	r0, r2, #68	; 0x44
 4b0:	ebfffffe 	bl	0 <tasklet_init>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:347
    {
        printk("[BCD PROBE ##] (GET RESOURCE FAILED)(check decive tree) --->>> (Line[%d]) <<<---\n", __LINE__);
 4b4:	e5941000 	ldr	r1, [r4]
request_irq():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/interrupt.h:135

static inline int __must_check
request_irq(unsigned int irq, irq_handler_t handler, unsigned long flags,
	    const char *name, void *dev)
{
	return request_threaded_irq(irq, handler, NULL, flags, name, dev);
 4b8:	e1a02005 	mov	r2, r5
 4bc:	e59fe178 	ldr	lr, [pc, #376]	; 63c <BCD_decodeProbe+0x3b8>
 4c0:	e3a03001 	mov	r3, #1
 4c4:	e594c008 	ldr	ip, [r4, #8]
 4c8:	e5910000 	ldr	r0, [r1]
 4cc:	e59f116c 	ldr	r1, [pc, #364]	; 640 <BCD_decodeProbe+0x3bc>
 4d0:	e58de000 	str	lr, [sp]
 4d4:	e58dc004 	str	ip, [sp, #4]
 4d8:	ebfffffe 	bl	0 <request_threaded_irq>
BCD_decodeProbe():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:347
 4dc:	e3700001 	cmn	r0, #1
 4e0:	0a000026 	beq	580 <BCD_decodeProbe+0x2fc>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:354
    }
    else
    {
        printk("[BCD PROBE ##] (GET RESOURCE SUCCESS)\n");
    }

 4e4:	e59f0158 	ldr	r0, [pc, #344]	; 644 <BCD_decodeProbe+0x3c0>
 4e8:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:357
    tasklet_init(&pgB_decode->tsk,BCDdecode_func,(unsigned long)pgB_decode);

    if (-1 == request_irq(IRQ_res->start, BCD_decodeHandler, IRQF_TRIGGER_RISING, "BCD_decodeIRQ", pgB_decode))
 4ec:	e1a00005 	mov	r0, r5
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:367
    else
    {
        printk("[BCD PROBE ##] (IRQ REQUEST SUCCESS) --->>> cat /proc/interrupts\n");
    }

    return 0;
 4f0:	e28dd00c 	add	sp, sp, #12
 4f4:	e8bd85f0 	pop	{r4, r5, r6, r7, r8, sl, pc}
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:306
    pgB_decode->BCD_decodeDev.owner = THIS_MODULE;

    /* gpio */
    if ((-ENOSYS) == (pgB_decode->BCD_pinNum = of_get_named_gpio(np, "bcd-decode-gpios", 0)))
    {
        printk("[BCD PROBE ##] (OF_GET_NAMED_GPIO FAILED) --->>> Line[%d] <<<---\n", __LINE__);
 4f8:	e59f0148 	ldr	r0, [pc, #328]	; 648 <BCD_decodeProbe+0x3c4>
 4fc:	e3001132 	movw	r1, #306	; 0x132
 500:	ebfffffe 	bl	0 <printk>
unregister_chrdev():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/fs.h:2327
}

static inline void unregister_chrdev(unsigned int major, const char *name)
{
	__unregister_chrdev(major, 0, 256, name);
 504:	e3a02c01 	mov	r2, #256	; 0x100
 508:	e59f30f4 	ldr	r3, [pc, #244]	; 604 <BCD_decodeProbe+0x380>
 50c:	e594000c 	ldr	r0, [r4, #12]
 510:	e3a01000 	mov	r1, #0
 514:	ebfffffe 	bl	0 <__unregister_chrdev>
BCD_decodeProbe():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:362
    if (-1 == request_irq(IRQ_res->start, BCD_decodeHandler, IRQF_TRIGGER_RISING, "BCD_decodeIRQ", pgB_decode))
    {
        printk("[BCD PROBE ##] (IRQ REQUEST FAILED)(check decive tree) --->>> (Line[%d]) <<<---\n", __LINE__);
        goto err_exit;
    }
    else
 518:	e594100c 	ldr	r1, [r4, #12]
 51c:	e5940010 	ldr	r0, [r4, #16]
 520:	e1a01a01 	lsl	r1, r1, #20
 524:	ebfffffe 	bl	0 <device_destroy>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:363
    {
 528:	e5940010 	ldr	r0, [r4, #16]
 52c:	ebfffffe 	bl	0 <class_destroy>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:364
        printk("[BCD PROBE ##] (IRQ REQUEST SUCCESS) --->>> cat /proc/interrupts\n");
 530:	e5940008 	ldr	r0, [r4, #8]
 534:	ebfffffe 	bl	0 <kfree>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:365
    }
 538:	e5943000 	ldr	r3, [r4]
 53c:	e3a01000 	mov	r1, #0
 540:	e5930000 	ldr	r0, [r3]
 544:	ebfffffe 	bl	0 <free_irq>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:366

 548:	e3e00000 	mvn	r0, #0
 54c:	eaffffe7 	b	4f0 <BCD_decodeProbe+0x26c>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:296
        return -1;
    }
    else
    {
        printk("[BCD PROBE ##] (KMALLOC SUCCESS) --->>> [<%p>]\n", pgB_decode);
    }
 550:	e3a01f4a 	mov	r1, #296	; 0x128
 554:	e59f00f0 	ldr	r0, [pc, #240]	; 64c <BCD_decodeProbe+0x3c8>
 558:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:297
    memset(pgB_decode, 0, sizeof(struct BCD_decodeInf));
 55c:	eaffffe8 	b	504 <BCD_decodeProbe+0x280>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:316
        printk("[BCD PROBE ##] (OF_GET_NAMED_GPIO SUCCESS) --->>> Pin[<%d>]\n", pgB_decode->BCD_pinNum);
    }

    if (!gpio_is_valid(pgB_decode->BCD_pinNum))
    {
        printk("[BCD PROBE ##] (GPIO IS NOT VALID) --->>> Line[%d] <<<---\n", __LINE__);
 560:	e3a01f4f 	mov	r1, #316	; 0x13c
 564:	e59f00e4 	ldr	r0, [pc, #228]	; 650 <BCD_decodeProbe+0x3cc>
 568:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:317
        goto err_exit;
 56c:	eaffffe4 	b	504 <BCD_decodeProbe+0x280>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:326
        printk("[BCD PROBE ##] (GPIO IS VALID) --->>> Pin[<%d>]\n", pgB_decode->BCD_pinNum);
    }

    if ((-ENOSYS) == gpio_request(pgB_decode->BCD_pinNum, "bcdDecodeGPIO"))
    {
        printk("[BCD PROBE ##] (GPIO REQUEST FAILED) --->>> Line[%d] <<<---\n", __LINE__);
 570:	e3001146 	movw	r1, #326	; 0x146
 574:	e59f00d8 	ldr	r0, [pc, #216]	; 654 <BCD_decodeProbe+0x3d0>
 578:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:327
        goto err_exit;
 57c:	eaffffe0 	b	504 <BCD_decodeProbe+0x280>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:349
    /* interrupt */
    if (NULL == (IRQ_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0)))
    {
        printk("[BCD PROBE ##] (GET RESOURCE FAILED)(check decive tree) --->>> (Line[%d]) <<<---\n", __LINE__);
        goto err_exit;
    }
 580:	e300115d 	movw	r1, #349	; 0x15d
 584:	e59f00cc 	ldr	r0, [pc, #204]	; 658 <BCD_decodeProbe+0x3d4>
 588:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:350
    else
 58c:	eaffffdc 	b	504 <BCD_decodeProbe+0x280>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:259


    /* create device */
    if ((major = register_chrdev(0, "bcd_decode_device_name", &BCD_decodeOps)) < 0)
    {
        printk("[BCD PROBE ##] (REGISTER FAILED) --->>> (major[%d]) <<<---\n", major);
 590:	e59f00c4 	ldr	r0, [pc, #196]	; 65c <BCD_decodeProbe+0x3d8>
 594:	e3001103 	movw	r1, #259	; 0x103
 598:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:260
        return -1;
 59c:	e3e00000 	mvn	r0, #0
 5a0:	eaffffd2 	b	4f0 <BCD_decodeProbe+0x26c>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:269
        printk("[BCD PROBE ##] (REGISTER SUCCESS) --->>> (major[%d]) <<<---\n", major);
    }

    if (NULL == (cls = class_create(THIS_MODULE, DRIVER_NAME)))
    {
        printk("[BCD PROBE ##] (CLASS CREATE FAILED) --->>> Line[%d] <<<---\n", __LINE__);
 5a4:	e59f00b4 	ldr	r0, [pc, #180]	; 660 <BCD_decodeProbe+0x3dc>
 5a8:	e300110d 	movw	r1, #269	; 0x10d
 5ac:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:270
        return -1;
 5b0:	e3e00000 	mvn	r0, #0
 5b4:	eaffffcd 	b	4f0 <BCD_decodeProbe+0x26c>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:280
    }

    if (NULL == (dev = device_create(cls, NULL, MKDEV(major, minor), NULL, "bcdDecodeDriver%d", 0)))
    {
        printk("[BCD PROBE ##] (DEVICE CREATE FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        return -1;
 5b8:	e59f00a4 	ldr	r0, [pc, #164]	; 664 <BCD_decodeProbe+0x3e0>
 5bc:	e3a01f46 	mov	r1, #280	; 0x118
 5c0:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:281
    }
 5c4:	e3e00000 	mvn	r0, #0
 5c8:	eaffffc8 	b	4f0 <BCD_decodeProbe+0x26c>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:337
    }

    if ((-ENOSYS) == gpio_direction_input(pgB_decode->BCD_pinNum))
    {
        printk("[BCD PROBE ##] (GPIO DIRECTION INPUT FAILED) --->>> Line[%d] <<<---\n", __LINE__);
        goto err_exit;
 5cc:	e3001151 	movw	r1, #337	; 0x151
 5d0:	e59f0090 	ldr	r0, [pc, #144]	; 668 <BCD_decodeProbe+0x3e4>
 5d4:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:338
    }
 5d8:	eaffffc9 	b	504 <BCD_decodeProbe+0x280>
 5dc:	00000000 	.word	0x00000000
 5e0:	00000088 	.word	0x00000088
	...
 5f4:	000001c4 	.word	0x000001c4
 5f8:	00000000 	.word	0x00000000
 5fc:	0000008c 	.word	0x0000008c
 600:	000000a4 	.word	0x000000a4
 604:	00000028 	.word	0x00000028
 608:	00000124 	.word	0x00000124
 60c:	00000170 	.word	0x00000170
 610:	000001c4 	.word	0x000001c4
 614:	00000000 	.word	0x00000000
 618:	00000258 	.word	0x00000258
 61c:	00000288 	.word	0x00000288
 620:	000002e0 	.word	0x000002e0
 624:	0000035c 	.word	0x0000035c
 628:	00000390 	.word	0x00000390
 62c:	000003e0 	.word	0x000003e0
 630:	00000460 	.word	0x00000460
 634:	000004f4 	.word	0x000004f4
 638:	00000000 	.word	0x00000000
 63c:	0000051c 	.word	0x0000051c
 640:	00000000 	.word	0x00000000
 644:	00000580 	.word	0x00000580
 648:	00000320 	.word	0x00000320
 64c:	0000029c 	.word	0x0000029c
 650:	000003a0 	.word	0x000003a0
 654:	00000418 	.word	0x00000418
 658:	0000052c 	.word	0x0000052c
 65c:	000000e4 	.word	0x000000e4
 660:	00000184 	.word	0x00000184
 664:	00000220 	.word	0x00000220
 668:	000004a0 	.word	0x000004a0

0000066c <BCD_decodeHandler>:
BCD_decodeHandler():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:152




void timer_function(unsigned long arg){
    struct BCD_decodeInf *pB_decode = (struct BCD_decodeInf *)arg;
 66c:	e92d4010 	push	{r4, lr}
 670:	e1a04001 	mov	r4, r1
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:154
    if(gpio_get_value(pB_decode->BCD_pinNum)){
        printk("gei 1\n");
 674:	e59f0024 	ldr	r0, [pc, #36]	; 6a0 <BCD_decodeHandler+0x34>
 678:	ebfffffe 	bl	0 <printk>
tasklet_schedule():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/interrupt.h:532

extern void __tasklet_schedule(struct tasklet_struct *t);

static inline void tasklet_schedule(struct tasklet_struct *t)
{
	if (!test_and_set_bit(TASKLET_STATE_SCHED, &t->state))
 67c:	e2841048 	add	r1, r4, #72	; 0x48
 680:	e3a00000 	mov	r0, #0
 684:	ebfffffe 	bl	0 <_test_and_set_bit>
 688:	e3500000 	cmp	r0, #0
 68c:	e2840044 	add	r0, r4, #68	; 0x44
 690:	1a000000 	bne	698 <BCD_decodeHandler+0x2c>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/include/linux/interrupt.h:533
		__tasklet_schedule(t);
 694:	ebfffffe 	bl	0 <__tasklet_schedule>
BCD_decodeHandler():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:157
    }else{
        printk("get 0\n");
    }
 698:	e3a00001 	mov	r0, #1
 69c:	e8bd8010 	pop	{r4, pc}
 6a0:	000005c4 	.word	0x000005c4

000006a4 <BCDdecode_func>:
BCDdecode_func():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:164
}

static irqreturn_t BCD_decodeHandler(int irqno, void *arg)
{
    struct BCD_decodeInf *pB_decode = (struct BCD_decodeInf *)arg;
    printk("interrupt test\n");
 6a4:	e3003000 	movw	r3, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:160
    }else{
        printk("get 0\n");
    }

}

 6a8:	e92d4070 	push	{r4, r5, r6, lr}
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:164
static irqreturn_t BCD_decodeHandler(int irqno, void *arg)
{
    struct BCD_decodeInf *pB_decode = (struct BCD_decodeInf *)arg;
    printk("interrupt test\n");
 6ac:	e3403000 	movt	r3, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:163

}

static irqreturn_t BCD_decodeHandler(int irqno, void *arg)
{
    struct BCD_decodeInf *pB_decode = (struct BCD_decodeInf *)arg;
 6b0:	e3a05001 	mov	r5, #1
 6b4:	e3004000 	movw	r4, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:164
    printk("interrupt test\n");
 6b8:	e2800058 	add	r0, r0, #88	; 0x58
 6bc:	e5931000 	ldr	r1, [r3]
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:163

}

static irqreturn_t BCD_decodeHandler(int irqno, void *arg)
{
    struct BCD_decodeInf *pB_decode = (struct BCD_decodeInf *)arg;
 6c0:	e3404000 	movt	r4, #0
 6c4:	e5845014 	str	r5, [r4, #20]
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:164
    printk("interrupt test\n");
 6c8:	e0811005 	add	r1, r1, r5
 6cc:	ebfffffe 	bl	0 <mod_timer>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:166
    tasklet_schedule(&pB_decode->tsk);
    return IRQ_HANDLED;
 6d0:	e3000000 	movw	r0, #0
 6d4:	e3400000 	movt	r0, #0
 6d8:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:168
}

 6dc:	e1a01005 	mov	r1, r5
 6e0:	e2840018 	add	r0, r4, #24
 6e4:	e1a02005 	mov	r2, r5
 6e8:	e3a03000 	mov	r3, #0
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:200
    else if (time_cnt >= 4 && time_cnt <= 6)
    {
        BCD_data[count] = 1;
        time_cnt = 0;
        count++;
        printk("BCD_data[%d]:%d\n",count,BCD_data[count]);
 6ec:	e8bd4070 	pop	{r4, r5, r6, lr}
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:168
    struct BCD_decodeInf *pB_decode = (struct BCD_decodeInf *)arg;
    printk("interrupt test\n");
    tasklet_schedule(&pB_decode->tsk);
    return IRQ_HANDLED;
}

 6f0:	eafffffe 	b	0 <__wake_up>

Disassembly of section .init.text:

00000000 <init_module>:
BCD_decodeInit():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:400
        .compatible = "fsl,imx6q-qiyang-bcd-decode",
    },
    {/*sentinel*/}};

static struct platform_driver BCD_decodeDriver = {
    .probe = BCD_decodeProbe,
   0:	e92d4008 	.word	0xe92d4008
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:401
    .remove = BCD_decodeRemove,
   4:	e3002191 	movw	r2, #401	; 0x191
   8:	e59f1014 	ldr	r1, [pc, #20]	; 24 <init_module+0x24>
   c:	e59f0014 	ldr	r0, [pc, #20]	; 28 <init_module+0x28>
  10:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:403
    .driver = {
        .name = DRIVER_NAME,
  14:	e59f0010 	ldr	r0, [pc, #16]	; 2c <init_module+0x2c>
  18:	e59f1010 	ldr	r1, [pc, #16]	; 30 <init_module+0x30>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:404
        .owner = THIS_MODULE,
  1c:	e8bd4008 	pop	{r3, lr}
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:403

static struct platform_driver BCD_decodeDriver = {
    .probe = BCD_decodeProbe,
    .remove = BCD_decodeRemove,
    .driver = {
        .name = DRIVER_NAME,
  20:	eafffffe 	b	0 <__platform_driver_register>
  24:	000001d4 	.word	0x000001d4
  28:	00000000 	.word	0x00000000
  2c:	00000070 	.word	0x00000070
  30:	00000000 	.word	0x00000000

Disassembly of section .exit.text:

00000000 <cleanup_module>:
BCD_decodeExit():
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:407
        .owner = THIS_MODULE,
        .of_match_table = of_match_ptr(BCD_decodeDts),
    },
};
   0:	e92d4008 	.word	0xe92d4008
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:408

   4:	e3a02f66 	mov	r2, #408	; 0x198
   8:	e59f1010 	ldr	r1, [pc, #16]	; 20 <cleanup_module+0x20>
   c:	e59f0010 	ldr	r0, [pc, #16]	; 24 <cleanup_module+0x24>
  10:	ebfffffe 	bl	0 <printk>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:410
static int __init BCD_decodeInit(void)
{
  14:	e59f000c 	ldr	r0, [pc, #12]	; 28 <cleanup_module+0x28>
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:411
    printk("[BCD ###] (------->>>%s  ------->>>%d)\n", __FUNCTION__, __LINE__);
  18:	e8bd4008 	pop	{r3, lr}
/home2/xuanyf/linux/IMX6/IAC-IMX6ULL-MB-V2.00/kernel/drivers/mydriver/bcd_decode.c:410
        .of_match_table = of_match_ptr(BCD_decodeDts),
    },
};

static int __init BCD_decodeInit(void)
{
  1c:	eafffffe 	b	0 <platform_driver_unregister>
  20:	000001e4 	.word	0x000001e4
  24:	00000000 	.word	0x00000000
  28:	00000070 	.word	0x00000070
