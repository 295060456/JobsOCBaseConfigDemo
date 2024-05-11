//
//  TKPermissionLocationWhen.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionLocationWhen.h"

@interface TKPermissionLocationWhen ()

@property(nonatomic,strong)CLLocationManager  *locationManager;
@property(nonatomic,copy)TKPermissionBlock block;
@property(nonatomic,assign)BOOL isAlert;
@property(class,nonatomic,strong,readonly)TKPermissionLocationWhen *shared;

@end

@implementation TKPermissionLocationWhen
static bool safeLock = NO;/// 防止连续请求lock
#pragma mark —— CLLocationManagerDelegate: 获取权限状态
_Pragma("clang diagnostic push")
_Pragma("clang diagnostic ignored \"-Wdeprecated-implementations\"")
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    [self handleStatus:status];
}
_Pragma("clang diagnostic pop")

- (void)locationManagerDidChangeAuthorization:(CLLocationManager *)manager API_AVAILABLE(ios(14.0), macos(11.0), watchos(7.0), tvos(14.0)){
    CLAuthorizationStatus status = manager.authorizationStatus;
    [self handleStatus:status];
}
#pragma mark —— 一些公有方法
static TKPermissionLocationWhen * _shared = nil;
+(TKPermissionLocationWhen *)shared{
    if (!_shared) {
        _shared = TKPermissionLocationWhen.new;
    }return _shared;
}
/// 查询是否获取了仅在使用应用期间位置权限
+(BOOL)checkAuth{
    BOOL isAuth = NO;
    if (CLLocationManager.locationServicesEnabled) {
        CLAuthorizationStatus status = kCLAuthorizationStatusNotDetermined;
        if (@available(iOS 14.0, *)) {
            CLLocationManager *manager = CLLocationManager.new;
            status = manager.authorizationStatus;
        }else{
            SuppressWdeprecatedDeclarationsWarning(status = CLLocationManager.authorizationStatus;);
        }
        if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
            isAuth = YES;
        }
    }return isAuth;
}
///   请求仅在使用应用期间位置权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(void(^)(BOOL isAuth))completion{
    if (safeLock) return;
    safeLock = YES;

    TKPermissionLocationWhen *obj = self.shared;
    obj.block = completion;
    obj.isAlert = isAlert;
    if (CLLocationManager.locationServicesEnabled) {
        obj.locationManager = CLLocationManager.new;
        obj.locationManager.delegate = obj;
        [obj.locationManager requestWhenInUseAuthorization];
    }else{
        [obj alertAction];
        [obj returnBlock:NO];
    }
}
#pragma mark —— 一些私有方法
- (void)handleStatus:(CLAuthorizationStatus)status{
    if (status == kCLAuthorizationStatusNotDetermined) {//第一次弹出授权页面，不处理

    }else{
        if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
            [self returnBlock:YES];
        }else{
            if (self.isAlert && status == kCLAuthorizationStatusDenied) {
                [self jumpSetting];
            }[self returnBlock:NO];
        }
    }
}

-(void)returnBlock:(BOOL)isAuth{
    @jobs_weakify(self)
    dispatch_async(dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        self.block(isAuth);
        safeLock = NO;
    });
    self.locationManager.delegate = nil;
    self.locationManager = nil;
}

-(void)jumpSetting{
     [TKPermissionPublic alertPromptTips:Internationalization(@"访问位置时需要您提供权限，去设置！")];
}

-(void)alertAction{
    [TKPermissionPublic alertTips:Internationalization(@"请先到\"隐私\"中，开启定位服务！")];
}

@end
