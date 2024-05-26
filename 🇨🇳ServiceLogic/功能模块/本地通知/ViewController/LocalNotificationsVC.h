//
//  LocalNotificationsVC.h
//  JobsOCBaseConfig
//
//  Created by admin on 5/26/24.
//

#import "BaseViewController.h"
#import "JobsMakeLocalNotification.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocalNotificationsVC : BaseViewController

@end

NS_ASSUME_NONNULL_END
/**
 额外的，还需要配置 AppDelegate
 
 #import "AppDelegate.h"
 @import UserNotifications;

 @interface AppDelegate () <UNUserNotificationCenterDelegate>
 @end

 @implementation AppDelegate

 - (BOOL)application:(NSApplication *)application didFinishLaunchingWithOptions:(NSDictionary<NSApplicationLaunchOptionsKey, id> *)launchOptions {
     UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
     center.delegate = self;
     [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound + UNAuthorizationOptionBadge)
                           completionHandler:^(BOOL granted, NSError * _Nullable error) {
         if (granted) {
             NSLog(@"Notification permission granted.");
         } else {
             NSLog(@"Notification permission denied.");
         }
     }];
     
     return YES;
 }

 // Handle notification when app is running
 - (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
     completionHandler(UNAuthorizationOptionAlert + UNAuthorizationOptionSound);
 }

 @end

 */
