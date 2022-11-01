#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

MODULE_INFO(intree, "Y");

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xfa985410, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0x51204841, __VMLINUX_SYMBOL_STR(platform_driver_unregister) },
	{ 0xda113ac9, __VMLINUX_SYMBOL_STR(__platform_driver_register) },
	{ 0x83f62a58, __VMLINUX_SYMBOL_STR(gpiod_get_raw_value) },
	{ 0xd85cd67e, __VMLINUX_SYMBOL_STR(__wake_up) },
	{ 0xc8fd727e, __VMLINUX_SYMBOL_STR(mod_timer) },
	{ 0xfaef0ed, __VMLINUX_SYMBOL_STR(__tasklet_schedule) },
	{ 0xca54fee, __VMLINUX_SYMBOL_STR(_test_and_set_bit) },
	{ 0x7d11c268, __VMLINUX_SYMBOL_STR(jiffies) },
	{ 0x208614a6, __VMLINUX_SYMBOL_STR(kmalloc_caches) },
	{ 0xd6b8e852, __VMLINUX_SYMBOL_STR(request_threaded_irq) },
	{ 0x9545af6d, __VMLINUX_SYMBOL_STR(tasklet_init) },
	{ 0x42ed5ca, __VMLINUX_SYMBOL_STR(platform_get_resource) },
	{ 0xd9605d4c, __VMLINUX_SYMBOL_STR(add_timer) },
	{ 0xfa2bcf10, __VMLINUX_SYMBOL_STR(init_timer_key) },
	{ 0xb7cfa4a8, __VMLINUX_SYMBOL_STR(gpiod_direction_input) },
	{ 0x3089e8ae, __VMLINUX_SYMBOL_STR(gpio_to_desc) },
	{ 0x47229b5c, __VMLINUX_SYMBOL_STR(gpio_request) },
	{ 0xde6fb46c, __VMLINUX_SYMBOL_STR(of_get_named_gpio_flags) },
	{ 0xfeb25d8b, __VMLINUX_SYMBOL_STR(cdev_add) },
	{ 0xb6828306, __VMLINUX_SYMBOL_STR(cdev_init) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0xcca6874c, __VMLINUX_SYMBOL_STR(kmem_cache_alloc) },
	{ 0x720d9697, __VMLINUX_SYMBOL_STR(device_create) },
	{ 0x3c8c7d13, __VMLINUX_SYMBOL_STR(__class_create) },
	{ 0x34fbc3de, __VMLINUX_SYMBOL_STR(__register_chrdev) },
	{ 0x275ef902, __VMLINUX_SYMBOL_STR(__init_waitqueue_head) },
	{ 0x67c2fa54, __VMLINUX_SYMBOL_STR(__copy_to_user) },
	{ 0x1cfb04fa, __VMLINUX_SYMBOL_STR(finish_wait) },
	{ 0x344b7739, __VMLINUX_SYMBOL_STR(prepare_to_wait_event) },
	{ 0x1000e51, __VMLINUX_SYMBOL_STR(schedule) },
	{ 0x37a0cba, __VMLINUX_SYMBOL_STR(kfree) },
	{ 0x495be299, __VMLINUX_SYMBOL_STR(class_destroy) },
	{ 0xf31d0d2f, __VMLINUX_SYMBOL_STR(device_destroy) },
	{ 0x6bc3fbc0, __VMLINUX_SYMBOL_STR(__unregister_chrdev) },
	{ 0xfe990052, __VMLINUX_SYMBOL_STR(gpio_free) },
	{ 0xf20dabd8, __VMLINUX_SYMBOL_STR(free_irq) },
	{ 0x2e5810c6, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr1) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0x9d669763, __VMLINUX_SYMBOL_STR(memcpy) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";


MODULE_INFO(srcversion, "FC60E72F0753CC0083BAAA1");
