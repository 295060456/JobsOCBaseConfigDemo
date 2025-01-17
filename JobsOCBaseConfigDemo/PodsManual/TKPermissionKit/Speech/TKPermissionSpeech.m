//
//  TKPermissionSpeech.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionSpeech.h"

@implementation TKPermissionSpeech
static bool safeLock = NO;//防止连续请求lock
#pragma mark —— 一些公有方法
///   请求Speech 语音识别 权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(void(^)(BOOL isAuth))completion{
    if (safeLock) return;
    safeLock = YES;
    if (@available(iOS 10.0, *)) {
        [SFSpeechRecognizer requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == SFSpeechRecognizerAuthorizationStatusAuthorized) {
                    completion(YES);
                }else{
                    if (status == SFSpeechRecognizerAuthorizationStatusDenied && isAlert) {
                        [self jumpSetting];
                    }completion(NO);
                }safeLock = NO;
            });
        }];
    } else {
        [self alertAction];
        completion(NO);
        safeLock = NO;
    }
}
/// 查询是否获取了Speech 语音识别 权限
+(BOOL)checkAuth{
    BOOL isAuth = NO;
    if (@available(iOS 10.0, *)) {
        if (SFSpeechRecognizer.authorizationStatus == SFSpeechRecognizerAuthorizationStatusAuthorized) {
            isAuth = YES;
        }
    } else {
        isAuth = NO;
        JobsLog(@"⚠️⚠️⚠️要使用语音识别功能，系统版本需要iOS10及以上！");
    }return isAuth;
}
#pragma mark —— 一些私有方法
+(void)jumpSetting{
    [TKPermissionPublic alertPromptTips:JobsInternationalization(@"使用语音识别功能时需要您提供权限，去设置!")];
}

+(void)alertAction{
    [TKPermissionPublic alertTips:JobsInternationalization(@"要使用语音识别功能，系统版本需要iOS10及以上！")];
}

@end
