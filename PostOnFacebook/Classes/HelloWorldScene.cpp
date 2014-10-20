#include "HelloWorldScene.h"

USING_NS_CC;

Scene* HelloWorld::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }
    
    Size visibleSize = Director::getInstance()->getVisibleSize();
//    Point origin = Director::getInstance()->getVisibleOrigin();

    Sprite *background = Sprite::create("background.png");
    background->setPosition(visibleSize.width/2, visibleSize.height/2);
    addChild(background);
    
    Button *shareFBButton = Button::create("facebook.png");
    shareFBButton->setPosition(Point(100, 100));
    shareFBButton->addTouchEventListener(this, toucheventselector(HelloWorld::clickShareFacebook));
    addChild(shareFBButton);

    return true;
}
void HelloWorld::captureScreen()
{
    Size screen = Director::getInstance()->getWinSize();
    RenderTexture *texture = RenderTexture::create(screen.width, screen.height);
    texture->setPosition(screen.width/2, screen.height/2);
    
    texture->begin();
    Director::getInstance()->getRunningScene()->visit();
    texture->end();
    texture->saveToFile("screenshot.png", Image::Format::PNG);
    
//    std::stringstream path;
//    path << FileUtils::getInstance()->getWritablePath();
//    CCLOG("%s", path.str().c_str());
    
}
void HelloWorld::clickShareFacebook(cocos2d::Ref *target, TouchEventType type)
{
    if (type == TOUCH_EVENT_ENDED) {
        captureScreen();
        
        CallFunc *call = CallFunc::create([=]{
            BridgeManager::postOnFacebook();
        });
        // wait 0.5s before post
        runAction(Sequence::create(DelayTime::create(0.5f), call, NULL));
    }

}
