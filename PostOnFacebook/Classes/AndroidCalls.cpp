//
//  AndroidCalls.cpp
//  FishingJoy
//
//  Created by Đoàn Minh Quân on 8/18/14.
//
//

#include "AndroidCalls.h"

#if (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
#include "platform/android/jni/JniHelper.h"
#include <jni.h>
const char* AppActivityClassName = "org/cocos2dx/cpp/AppActivity";

void AndroidCalls::postOnFacebook()
{
    cocos2d::JniMethodInfo t;
	if (cocos2d::JniHelper::getStaticMethodInfo(t, AppActivityClassName, "postOnFacebook", "()V"))
	{
        
		t.env->CallStaticVoidMethod(t.classID, t.methodID);
		t.env->DeleteLocalRef(t.classID);
	}
}
#endif