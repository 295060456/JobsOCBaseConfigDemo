//
//  UNUserNotificationCenter+Extra.h
//  FM
//
//  Created by Admin on 25/11/2024.
//
/// 用于处理通知（包括本地通知和远程推送通知）的功能。
/// 它引入了一套现代化的 API，用来替代较早的 UILocalNotification 和旧的远程推送通知机制。
#import <UserNotifications/UserNotifications.h>

NS_ASSUME_NONNULL_BEGIN

@interface UNUserNotificationCenter (Extra)

@end

NS_ASSUME_NONNULL_END
