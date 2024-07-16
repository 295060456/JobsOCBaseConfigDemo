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

@property(nonatomic,copy)NSString *identifier;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *body;
@property(nonatomic,strong)UNNotificationSound *sound API_UNAVAILABLE(tvos);
@property(nonatomic,assign)NSTimeInterval triggerWithTimeInterval;// 时间间隔必须大于0，否则崩溃
@property(nonatomic,assign)BOOL repeats;

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
