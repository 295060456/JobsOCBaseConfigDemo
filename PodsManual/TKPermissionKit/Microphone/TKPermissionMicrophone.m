//
//  TKPermissionMicrophone.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionMicrophone.h"

@implementation TKPermissionMicrophone
static bool safeLock = NO;/// 防止连续请求lock
#pragma mark —— 一些公有方法
///   请求麦克风权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(void(^)(BOOL isAuth))completion{
    if (safeLock) return;
    safeLock = YES;
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio 
                             completionHandler:^(BOOL granted) {
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
/// 查询是否获取了麦克风权限
+(BOOL)checkAuth{
    BOOL isAuth = NO;
    if ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio] == AVAuthorizationStatusAuthorized) {
        isAuth = YES;
    }return isAuth;
}
#pragma mark —— 一些私有方法
+(void)jumpSetting{
    [TKPermissionPublic alertPromptTips:Internationalization(@"访问麦克风时需要您提供权限，去设置!")];
}

@end
