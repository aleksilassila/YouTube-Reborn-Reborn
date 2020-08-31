TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = YouTube


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YoutubeReborn

YoutubeReborn_FILES = Tweak.xm
YoutubeReborn_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
