#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/of.h>
#include <sound/soc.h>



static int imx_tlv320aic3x_probe(struct platform_device *pdev){

    return 0;
}


static int imx_tlv320aic3x_remove(struct platform_device *pdev){

    return 0;
}



static const struct of_device_id imx_tlv320aic3x_dt_ids[] = {
    {.compatible = "fsl,imx_audio_tlv320aic3x",},
    {}
};

MODULE_DEVICE_TABLE(of,imx_tlv320aic3x_dt_ids);

static struct platform_driver imx_tlv320aic3x_driver = {
    .probe = imx_tlv320aic3x_probe,
    .remove = imx_tlv320aic3x_remove,
    .driver = {
        .name = "my_tlv320aic3x",
        .owner = THIS_MODULE,
        .pm = &snd_soc_pm_ops,
        .of_match_table = imx_tlv320aic3x_dt_ids,
    },
};

module_platform_driver(imx_tlv320aic3x_driver);

MODULE_LICENSE("GPL v2");
MODULE_ALIAS("platform:imx-tlv320aic3x");
MODULE_AUTHOR("xue yi feng");
MODULE_DESCRIPTION("audio test");





