//
//  AppDelegate+UIApplicationDelegate.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "AppDelegate+UIApplicationDelegate.h"
#import "AppDelegate+XHLaunchAdDelegate.h"
#import "AppDelegate+Func.h"

@implementation AppDelegate (UIApplicationDelegate)

#pragma mark —— UIApplicationDelegate
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self launchFunc2];
    if (HDDeviceSystemVersion.floatValue < 13.0) {
        self.window.alpha = 1;
        [AppDelegate launchFunc1];
    }return YES;
}
/// 系统版本低于iOS13.0的设备
-(void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"---applicationDidEnterBackground----");//进入后台
    [NSNotificationCenter.defaultCenter postNotificationName:UBLEnterBackgroundStopPlayer object:nil];
}
/// 系统版本低于iOS13.0的设备
-(void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"---applicationDidBecomeActive----");//进入前台
}
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wmethod-signatures"
//- (UIInterfaceOrientationMask)application:(UIApplication *)application
//  supportedInterfaceOrientationsForWindow:(UIWindow *)window {
//    //设置强制旋转屏幕
//    if (self.cyl_isForceLandscape) {
//        //只支持横屏
//        return UIInterfaceOrientationMaskLandscape;
//    } else {
//        //只支持竖屏
//        return UIInterfaceOrientationMaskPortrait;
//    }
//}
//#pragma clang diagnostic pop

/// UISceneSession lifecycle
- (UISceneConfiguration *)application:(UIApplication *)application
configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession
                              options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [UISceneConfiguration.alloc initWithName:@"Default Configuration"
                                        sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application
didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error {
    NSLog(@"Fail to register for remote notifications. error:%@",error);
}

@end
