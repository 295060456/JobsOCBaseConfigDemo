//
//  TKPermissionBluetooth.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionBluetooth.h"

@interface TKPermissionBluetooth ()

@property(nonatomic,strong)CBPeripheralManager *peripheralManager;
@property(nonatomic,copy)TKPermissionBlock block;
@property(nonatomic,assign)BOOL isAlert;
@property(class,nonatomic,strong,readonly) TKPermissionBluetooth *shared;

@end

@implementation TKPermissionBluetooth
static bool safeLock = NO;/// 防止连续请求lock
#pragma mark CBPeripheralManagerDelegate
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral{
    [self returnBlock:self.class.checkAuth];
    if (self.isAlert && self.class.authorizationCode == 2) { // 2: CBManagerAuthorizationDenied || CBPeripheralManagerAuthorizationStatusDenied
        [self jumpSetting];
    }
    //cancel
//    self.peripheralManager = nil;
    [self invalid];
}
#pragma mark —— 一些公有方法
static TKPermissionBluetooth * _shared = nil;
+(TKPermissionBluetooth *)shared{
    if (!_shared) {
        _shared = TKPermissionBluetooth.new;
    }return _shared;
}
/// 查询是否获取了蓝牙权限
+(BOOL)checkAuth{
    return [self authorizationCode] == 3?YES:NO; // CBManagerAuthorizationAllowedAlways || CBPeripheralManagerAuthorizationStatusAuthorized
}
/// 请求蓝牙权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
           completion:(void(^)(BOOL isAuth))completion{
    if (safeLock) return;
    safeLock = YES;
    TKPermissionBluetooth *obj = self.shared;
    obj.block = completion;
    obj.isAlert = isAlert;
    obj.peripheralManager = [CBPeripheralManager.alloc initWithDelegate:obj
                                                                  queue:dispatch_get_global_queue(0, 0)
                                                                options:nil];
}
#pragma mark —— 一些私有方法
/**
 查询蓝牙授权状态，统一转换成NSInterger类型
 code = 3 表示授权成功
 0 : CBManagerAuthorizationNotDetermined || CBPeripheralManagerAuthorizationStatusNotDetermined
 1 : CBManagerAuthorizationRestricted || CBPeripheralManagerAuthorizationStatusRestricted
 2 : CBManagerAuthorizationDenied || CBPeripheralManagerAuthorizationStatusDenied
 3 : CBManagerAuthorizationAllowedAlways || CBPeripheralManagerAuthorizationStatusAuthorized
 */
+(NSInteger)authorizationCode{
    NSInteger code = 0;
    if (@available(iOS 13.1, *)) {
        code = CBManager.authorization;
    } else {
        SuppressWdeprecatedDeclarationsWarning(code = CBPeripheralManager.authorizationStatus;);
    }return code;
}

-(void)returnBlock:(BOOL)isAuth{
    @jobs_weakify(self);
    dispatch_async(dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        self.block(isAuth);
        safeLock = NO;
    });
}

-(void)invalid{
    [self.peripheralManager stopAdvertising];
    //这句会出现:[CoreBluetooth] XPC connection invalid
    self.peripheralManager = nil;
}

- (void)jumpSetting{
    [TKPermissionPublic alertPromptTips:JobsInternationalization(@"访问蓝牙时需要您提供权限，去设置！")];
}

@end
