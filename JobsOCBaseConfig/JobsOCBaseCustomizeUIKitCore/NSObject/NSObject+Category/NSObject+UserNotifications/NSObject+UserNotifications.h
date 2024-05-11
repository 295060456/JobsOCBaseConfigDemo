//
//  NSObject+UserNotifications.h
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import <UniformTypeIdentifiers/UTCoreTypes.h>
#import "NSObject+UNUserNotificationCenterDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UserNotifications)
/// 用户通知中心
-(UNUserNotificationCenter *)notificationCenter;
/// 获取通知授权和设置
-(void)userNotificationCenter:(UNUserNotificationCenter *_Nonnull)userNotificationCenter
     authorizationStatusBlock:(jobsByIDBlock _Nullable)authorizationStatusBlock;
/// 初始化一个本地通知
-(UNMutableNotificationContent *)userNotificationInit;
/// 设置通知附件内容
/// 注意：URL必须是一个有效的文件路径，不然会报错
-(UNNotificationAttachment *)notificationAttachmentInitByPath:(NSString *)path;
/// 触发模式
-(UNTimeIntervalNotificationTrigger *)notificationTriggerWithTimeInterval:(NSTimeInterval)timeInterval
                                                                  repeats:(BOOL)repeats;
/// 创建一个发送请求
-(UNNotificationRequest *)notificationRequestInitWithIdentifier:(NSString *_Nullable)identifier
                                                        content:(UNMutableNotificationContent *_Nullable)notificationContent
                                                        trigger:(UNTimeIntervalNotificationTrigger *_Nullable)notificationTrigger;
/// 将通知请求添加到通知中心
-(void)notificationCenter:(UNUserNotificationCenter *_Nullable)notificationCenter
   addNotificationRequest:(UNNotificationRequest *_Nullable)notificationRequest
           withIdentifier:(NSString *_Nullable)identifier;
/// 本地通知的相关管理
-(void)userNotificationManager:(UNUserNotificationCenter *_Nullable)userNotificationCenter;

@end

NS_ASSUME_NONNULL_END
/**
 调用方式：[self notificationCenter:nil addNotificationRequest:nil withIdentifier:nil];
 */
