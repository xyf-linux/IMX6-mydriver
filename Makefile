#
# Makefile for misc devices that really don't fit anywhere else.
#

obj-$(CONFIG_MyBuzzer_TEST)     		+= my_buzzer.o
obj-$(CONFIG_MyTlv320aic3x_TEST)		+= my_tlv320aic3x.o
obj-$(CONFIG_BCD_decodeSupport)		    += bcd_encode.o
obj-$(CONFIG_BCD_decodeSupport)	    	+= bcd_decode.o
