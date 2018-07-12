LOCAL_PATH := $(call my-dir)

LOCAL_SANITIZE:=address
LOCAL_CFLAGS +=-fno-omit-frame-pointer -std=c99
LOCAL_ARM_MODE:=arm

include $(CLEAR_VARS)
LOCAL_MODULE := ijkffmpeg
LOCAL_SRC_FILES := $(MY_APP_FFMPEG_OUTPUT_PATH)/libijkffmpeg.so
include $(PREBUILT_SHARED_LIBRARY)
