//
//  AppDelegate+UIApplicationDelegate.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "AppDelegate+UIApplicationDelegate.h"
//#import "AppDelegate+UISceneSessionLifeCycle.h"

@implementation AppDelegate (UIApplicationDelegate)
#pragma mark —— UIApplicationDelegate
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
    JobsAppTool.currentDeviceOrientation = UIDeviceOrientationLandscapeLeft | UIDeviceOrientationLandscapeRight;
    JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskLandscape;
    
//    JobsAppTool.jobsDeviceOrientation = DeviceOrientationLandscape;
    
    [self localNotifications];
    [self launchFunc2];
    [AppDelegate launchFunc1];

    self.window = JobsAppTools.sharedManager.makeAppDelegateWindow;
    self.window.rootViewController = RootViewController;
    AppDelegate.tabBarVC.ppBadge(YES);
    [self.window makeKeyAndVisible];

    return YES;
}
/// 一进入App就横屏 【此方法会执行多次】
- (UIInterfaceOrientationMask)application:(UIApplication *)application
  supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape ? JobsAppTool.currentInterfaceOrientationMask : UIInterfaceOrientationMaskPortrait;
}
/// 系统版本低于iOS13.0的设备
-(void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"---applicationDidEnterBackground----");//进入后台
    JobsPostNotification(JobsEnterBackgroundStopPlayer, nil);
}
/// 系统版本低于iOS13.0的设备
-(void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"---applicationDidBecomeActive----");//进入前台
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error {
    NSLog(@"Fail to register for remote notifications. error:%@",error);
}

@end
