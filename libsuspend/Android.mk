# Copyright 2012 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)

libsuspend_src_files := \
	autosuspend.c \
	autosuspend_autosleep.c \
	autosuspend_earlysuspend.c \
	autosuspend_wakeup_count.c \

libsuspend_libraries := \
	liblog libcutils

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(libsuspend_src_files)
LOCAL_MODULE := libsuspend
LOCAL_MODULE_TAGS := optional
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_SHARED_LIBRARIES := $(libsuspend_libraries)
LOCAL_CFLAGS := -Werror
ifeq ($(TARGET_NO_USE_SUSPEND),true)
LOCAL_CFLAGS += -DNO_USE_SUSPEND=1
endif
#LOCAL_CFLAGS += -DLOG_NDEBUG=0
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(libsuspend_src_files)
LOCAL_MODULE := libsuspend
LOCAL_MODULE_TAGS := optional
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_CFLAGS := -Werror
ifeq ($(TARGET_NO_USE_SUSPEND),true)
LOCAL_CFLAGS += -DNO_USE_SUSPEND=1
endif
#LOCAL_CFLAGS += -DLOG_NDEBUG=0
include $(BUILD_STATIC_LIBRARY)
