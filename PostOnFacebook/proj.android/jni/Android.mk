LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dcpp_shared

LOCAL_MODULE_FILENAME := libcocos2dcpp

HELLOCPP_FILES  := $(wildcard $(LOCAL_PATH)/hellocpp/*.cpp)
HELLOCPP_FILES  := $(HELLOCPP_FILES:$(LOCAL_PATH)/%=%)

CLASSES_FILES   := $(wildcard $(LOCAL_PATH)/../../Classes/*.cpp)
CLASSES_FILES   := $(CLASSES_FILES:$(LOCAL_PATH)/%=%)

LOCAL_SRC_FILES := $(HELLOCPP_FILES)
LOCAL_SRC_FILES += $(CLASSES_FILES)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../cocos2d
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../cocos2d/cocos
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../cocos2d/cocos/editor-support
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../cocos2d/cocos/editor-support/cocostudio
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../cocos2d/external
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../cocos2d/network

LOCAL_WHOLE_STATIC_LIBRARIES := cocos2dx_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocosdenshion_static
LOCAL_WHOLE_STATIC_LIBRARIES += box2d_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocos_extension_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocostudio_static
LOCAL_WHOLE_STATIC_LIBRARIES += protocols

include $(BUILD_SHARED_LIBRARY)

$(call import-module,2d)
$(call import-module,audio/android)
$(call import-module,Box2D)
$(call import-module,editor-support/cocostudio)
$(call import-module,ui)
$(call import-module,extensions)