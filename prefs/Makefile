ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = YoutubeRebornPreferences

YoutubeRebornPreferences_FILES = YRPRootListController.m
YoutubeRebornPreferences_FRAMEWORKS = UIKit
YoutubeRebornPreferences_PRIVATE_FRAMEWORKS = Preferences
YoutubeRebornPreferences_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
YoutubeRebornPreferences_INSTALL_PATH = /Library/PreferenceBundles
YoutubeRebornPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
