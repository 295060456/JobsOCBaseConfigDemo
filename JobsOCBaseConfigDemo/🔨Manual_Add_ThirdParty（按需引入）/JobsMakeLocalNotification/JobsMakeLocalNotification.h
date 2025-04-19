//
//  JobsMakeLocalNotification.h
//  JobsOCBaseConfig
//
//  Created by admin on 5/26/24.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLocalNotificationModel : NSObject

Prop_copy()NSString *identifier;
Prop_copy()NSString *title;
Prop_copy()NSString *body;
Prop_strong()UNNotificationSound *sound API_UNAVAILABLE(tvos);
Prop_assign()NSTimeInterval triggerWithTimeInterval;// 时间间隔必须大于0，否则崩溃
Prop_assign()BOOL repeats;

@end

@interface JobsMakeLocalNotification : NSObject

- (void)triggerLocalNotification:(JobsLocalNotificationModel *)localNotificationModel;

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
             JobsLog(@"Notification permission granted.");
         } else {
             JobsLog(@"Notification permission denied.");
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
