ifeq ($(BUILD_WITH_WIDEVINECAS),true)
LOCAL_PATH:= $(call my-dir)
WVCAS_PATH_32 := $(TARGET_OUT)/lib/
#####################################################################
# liboemcrypto_cas.so
include $(CLEAR_VARS)
LOCAL_MODULE := liboemcrypto_cas
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(WVCAS_PATH_32)
LOCAL_SRC_FILES_arm := $(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SHARED_LIBRARIES := libc++ libc libcrypto libcutils libdl liblog libm libteec_sys libutils \
	libz
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

#####################################################################

#####################################################################
# libwvmediacas.so
include $(CLEAR_VARS)
LOCAL_MODULE := libwvmediacas
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(WVCAS_PATH_32)
LOCAL_SRC_FILES_arm := $(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SHARED_LIBRARIES := libc++ libc libdl liblog libm liboemcrypto_cas libprotobuf-cpp-full \
	libutils
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
include $(BUILD_PREBUILT)

#####################################################################

#####################################################################
# libdec_ca_wvcas.so
ifeq (,$(wildcard vendor/amlogic/common/frameworks/av/drmplayer))
include $(CLEAR_VARS)
LOCAL_MODULE := libdec_ca_wvcas
LOCAL_MULTILIB := both
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH_32 := $(WVCAS_PATH_32)
LOCAL_SRC_FILES_arm := $(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
LOCAL_SHARED_LIBRARIES := libam_adp_adec libc++ libc libcrypto libcutils libdl liblog libm \
	liboemcrypto_cas libssl libutils libwvmediacas libz
include $(BUILD_PREBUILT)
endif
#####################################################################

#####################################################################
include $(CLEAR_VARS)
LOCAL_MODULE := e043cde0-61d0-11e5-9c260002a5d5c5ca
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_SUFFIX := .ta
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/lib/teetz
ifeq ($(TARGET_ENABLE_TA_SIGN), true)
$(info $(shell mkdir -p $(shell pwd)/$(PRODUCT_OUT)/signed/libmediawvcas))
$(info $(shell $(shell pwd)/$(BOARD_AML_VENDOR_PATH)/tdk/ta_export/scripts/sign_ta_auto.py \
		--in=$(shell pwd)/$(LOCAL_PATH)/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX) \
		--out=$(shell pwd)/$(PRODUCT_OUT)/signed/libmediawvcas/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX) \
		--keydir=$(shell pwd)/$(BOARD_AML_TDK_KEY_PATH)))
LOCAL_SRC_FILES := ../../../../../../$(PRODUCT_OUT)/signed/libmediawvcas/$(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
else
LOCAL_SRC_FILES := $(LOCAL_MODULE)$(LOCAL_MODULE_SUFFIX)
endif
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_32_BIT_ONLY := true
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)
#####################################################################

endif
