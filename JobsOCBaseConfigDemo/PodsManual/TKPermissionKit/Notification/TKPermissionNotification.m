//
//  TKPermissionNotification.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionNotification.h"

@implementation TKPermissionNotification
static bool safeLock = NO;/// 防止连续请求lock
static TKPermissionUNAuthorizationOptions _options;
static bool isOptions = NO;
#pragma mark —— 一些公有方法
/// 自定义UNAuthorizationOptions选项；
/// 如果不设置则使用:UNAuthorizationOptionBadge|UNAuthorizationOptionAlert|UNAuthorizationOptionSound
/// 注意:需要在authWithAlert:completion:方法之前设置才有效。
+(void)setAuthorizationOptions:(TKPermissionUNAuthorizationOptions)options{
    isOptions = YES;
    _options = options;
}
///   请求推送通知权限
///   注意：如果是远程推送则需要执行[UIAppliection registerForRemoteNotifications]获取推送需要的deviceToken。
///   application:didRegisterForRemoteNotificationsWithDeviceToken: 成功获取设备token，或者失败application:didFailToRegisterForRemoteNotificationsWithError：
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(void(^)(BOOL isAuth))completion{
    if (safeLock) return;
    safeLock = YES;

    UIApplication *application = UIApplication.sharedApplication;
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = UNUserNotificationCenter.currentNotificationCenter;
        UNAuthorizationOptions types = UNAuthorizationOptionBadge | UNAuthorizationOptionAlert | UNAuthorizationOptionSound;
        if(isOptions) types = (UNAuthorizationOptions)_options;
        [center requestAuthorizationWithOptions:types
                              completionHandler:^(BOOL granted,
                                                  NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (granted) {
                    completion(YES);
                } else {
                    if (isAlert) {
                        [self jumpSetting];
                    }
                    completion(NO);
                }
                safeLock = NO;
            });
        }];
    } else

    SuppressWdeprecatedDeclarationsWarning(UIUserNotificationType types = UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge;
                                           if(isOptions) types = (UIUserNotificationType)_options;
                                           UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
                                           [application registerUserNotificationSettings:settings];
                                           [application registerForRemoteNotifications];
                                           completion(YES);
                                           safeLock = NO;);
}
#pragma mark —— 一些私有方法
+(void)jumpSetting{
    [TKPermissionPublic alertPromptTips:JobsInternationalization(@"使用通知时需要您提供权限，去设置！")];
}

@end
