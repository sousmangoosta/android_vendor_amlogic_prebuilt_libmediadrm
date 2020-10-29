LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := secmem_test
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_32_BIT_ONLY := true
LOCAL_SHARED_LIBRARIES := libamavutils libc++ libc libcutils libdl liblog libm libsecmem libteec \
	libutils
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := oemcrypto_test_aml
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/bin
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_32_BIT_ONLY := true
LOCAL_SHARED_LIBRARIES := libc++ libc libcutils libdl liblog libm libmedia_omx \
	libstagefright_foundation libutils libz
include $(BUILD_PREBUILT)

