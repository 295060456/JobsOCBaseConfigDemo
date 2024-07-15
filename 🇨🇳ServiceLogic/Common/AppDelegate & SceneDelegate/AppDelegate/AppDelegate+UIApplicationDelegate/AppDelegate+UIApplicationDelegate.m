//
//  AppDelegate+UIApplicationDelegate.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "AppDelegate+UIApplicationDelegate.h"
#import "AppDelegate+UISceneSessionLifeCycle.h"

@implementation AppDelegate (UIApplicationDelegate)
#pragma mark —— UIApplicationDelegate
/// 一进入App就横屏
//- (UIInterfaceOrientationMask)application:(UIApplication *)application
//  supportedInterfaceOrientationsForWindow:(UIWindow *)window {
//    JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
//    JobsAppTool.currentDeviceOrientation = UIDeviceOrientationLandscapeLeft | UIDeviceOrientationLandscapeRight;
//    JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskLandscape;
//    return UIInterfaceOrientationMaskLandscape;
//}

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self localNotifications];
    [self launchFunc2];

    @jobs_weakify(self)
    [JobsAppTools.sharedManager appDelegateWindowBlock:^(UIWindow * _Nullable data) {
        @jobs_strongify(self)
        self.window = data;
        [AppDelegate launchFunc1];
    } sceneDelegateWindowBlock:nil];
    
//    self.window = JobsAppTools.sharedManager.makeAppDelegateWindow;
//    [AppDelegate launchFunc1];
    
    return YES;
}
/// 系统版本低于iOS13.0的设备
-(void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"---applicationDidEnterBackground----");//进入后台
    JobsPostNotification(JobsEnterBackgroundStopPlayer, nil);
    [NSNotificationCenter.defaultCenter postNotificationName:JobsEnterBackgroundStopPlayer object:nil];
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
