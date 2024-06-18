//
//  TKPermissionMedia.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionMedia.h"

@implementation TKPermissionMedia
static bool safeLock = NO;//防止连续请求lock
#pragma mark —— 一些公有方法
///   请求媒体资料库权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(void(^)(BOOL isAuth))completion{
    if (safeLock) return;
    safeLock = YES;
    if (@available(iOS 9.3, *)) {
        [MPMediaLibrary requestAuthorization:^(MPMediaLibraryAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == MPMediaLibraryAuthorizationStatusAuthorized) {
                    completion(YES);
                } else{
                    if (isAlert) {
                        [self jumpSetting];
                    }
                    completion(NO);
                }safeLock = NO;
            });
        }];
    } else {
        NSLog(@"当前系统版本低于iOS9.3，直接返回获取到了权限（如果有问题请更改权限获取方式！）");
        completion(YES);
        safeLock = NO;
    }
}
/// 查询是否获取了媒体资料库权限
+(BOOL)checkAuth{
    BOOL isAuth = NO;
    if (@available(iOS 9.3, *)) {
        if ([MPMediaLibrary authorizationStatus] == MPMediaLibraryAuthorizationStatusAuthorized) {
            isAuth = YES;
        }
    } else {
        NSLog(@"当前系统版本低于iOS9.3，直接返回获取到了权限（如果有问题请更改权限获取方式！）");
        isAuth = YES;
    }return isAuth;
}
#pragma mark —— 一些私有方法
+(void)jumpSetting{
    [TKPermissionPublic alertPromptTips:JobsInternationalization(@"访问媒体与Apple Music时需要您提供权限，去设置!")];
}

@end
