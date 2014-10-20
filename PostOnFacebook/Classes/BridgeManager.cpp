//
//  BridgeManager.cpp
//  PostOnFacebook
//
//  Created by Đoàn Minh Quân on 8/27/14.
//
//

#include "BridgeManager.h"

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
#include "ObjCCalls.h"
#endif

#if (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
#include "AndroidCalls.h"
#endif

void BridgeManager::postOnFacebook()
{
#if (CC_TARGET_PLATFORM == CC_TARGET_OS_IPHONE)
    ObjCCalls::postOnFacebook();
#endif
#if (CC_TARGET_PLATFORM == CC_PLATFORM_ANDROID)
    AndroidCalls::postOnFacebook();
#endif
}
