//
//  Facebook.m
//  FishingJoy
//
//  Created by Đoàn Minh Quân on 8/18/14.
//
//

#import "Facebook.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
@implementation Facebook
+ (UIViewController *)getCurrentRootViewController {
    
    UIViewController *result = nil;
    
    // Try to find the root view controller programmically
    
    // Find the top window (that is not an alert view or other window)
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    if (topWindow.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(topWindow in windows)
        {
            if (topWindow.windowLevel == UIWindowLevelNormal)
                break;
        }
    }
    
    UIView *rootView = [[topWindow subviews] objectAtIndex:0];
    id nextResponder = [rootView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && topWindow.rootViewController != nil)
        result = topWindow.rootViewController;
    else
        NSAssert(NO, @"Could not find a root view controller.");
    
    return result;
}
+ (void) postOnFacebook{
    UIViewController *viewC = [self getCurrentRootViewController];
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [controller setInitialText:@"http://google.com\n"];
    
    //get image
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *destPath = [documentsDirectory stringByAppendingPathComponent:@"screenshot.png"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:destPath];

    [controller addImage:image];
  
    [viewC presentViewController:controller animated:YES completion:Nil];
}
@end
