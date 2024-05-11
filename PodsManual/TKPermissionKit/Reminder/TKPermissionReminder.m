//
//  TKPermissionReminder.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionReminder.h"

@implementation TKPermissionReminder
static bool safeLock = NO;/// 防止连续请求lock
#pragma mark —— 一些公有方法
///   请求提醒事项权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
requestFullAccessToEventsWithCompletion:(JobsEKEventStoreRequestAccessCompletionHandler)requestFullAccessToEventsWithCompletion
requestWriteOnlyAccessToEventsWithCompletion:(JobsEKEventStoreRequestAccessCompletionHandler)requestWriteOnlyAccessToEventsWithCompletion
requestFullAccessToRemindersWithCompletion:(JobsEKEventStoreRequestAccessCompletionHandler)requestFullAccessToRemindersWithCompletion
           completion:(void(^ _Nullable)(BOOL isAuth))completion{
    if (safeLock) return;
    safeLock = YES;
    EKEventStore *eventStore = EKEventStore.new;
    if (@available(iOS 17.0, *)) {
        /// 完全的事件访问权限: 想要添加到你的日历
        [eventStore requestFullAccessToEventsWithCompletion:^(BOOL granted,
                                                              NSError * _Nullable error) {
            if(requestFullAccessToEventsWithCompletion) requestFullAccessToEventsWithCompletion(granted,eventStore,error);
        }];
        /// 请求写入权限而不需要读取权限的事件访问权限：想访问你的提醒事项
        [eventStore requestWriteOnlyAccessToEventsWithCompletion:^(BOOL granted, 
                                                                   NSError * _Nullable error) {
            if(requestWriteOnlyAccessToEventsWithCompletion) requestWriteOnlyAccessToEventsWithCompletion(granted,eventStore,error);
        }];
        /// 请求完全的提醒事项访问权限
        [eventStore requestFullAccessToRemindersWithCompletion:^(BOOL granted,
                                                                 NSError * _Nullable error) {
            if(requestFullAccessToRemindersWithCompletion) requestFullAccessToRemindersWithCompletion(granted,eventStore,error);
        }];
    } else {
        [eventStore requestAccessToEntityType:EKEntityTypeReminder 
                                   completion:^(BOOL granted, 
                                                NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (granted) {
                    completion(YES);
                } else {
                    if (isAlert) {
                        [self jumpSetting];
                    }completion(NO);
                }safeLock = NO;
            });
        }];
    }
}
/// 查询是否获取了提醒事项权限
+(BOOL)checkAuth{
    BOOL isAuth = NO;
    if ([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder] == EKAuthorizationStatusAuthorized) {
        isAuth = YES;
    }return isAuth;
}
#pragma mark —— 一些私有方法
+(void)jumpSetting{
   [TKPermissionPublic alertPromptTips:Internationalization(@"使用提醒事项时需要您提供权限，去设置!")];
}

@end
