//
//  AppDelegate+UIApplicationDelegate.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "AppDelegate+UIApplicationDelegate.h"

@implementation AppDelegate (UIApplicationDelegate)

#pragma mark —— UIApplicationDelegate
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self localNotifications];
    [self launchFunc2];
    if (HDDeviceSystemVersion.floatValue < 13.0) {
        self.window.alpha = 1;
        [AppDelegate launchFunc1];
    }return YES;
}
/// 系统版本低于iOS13.0的设备
-(void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"---applicationDidEnterBackground----");//进入后台
    [NSNotificationCenter.defaultCenter postNotificationName:JobsEnterBackgroundStopPlayer object:nil];
}
/// 系统版本低于iOS13.0的设备
-(void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"---applicationDidBecomeActive----");//进入前台
}
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
