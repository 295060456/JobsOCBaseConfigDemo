//
//  TKPermissionHome.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionHome.h"

@interface TKPermissionHome ()

@property(nonatomic,strong)HMHomeManager *homeManager;
@property(nonatomic,copy)TKPermissionBlock block;
@property(nonatomic,assign)BOOL isAlert;
@property(class,nonatomic,strong,readonly)TKPermissionHome *shared;

@end

@implementation TKPermissionHome
#pragma mark —— HMHomeManagerDelegate
- (void)homeManagerDidUpdateHomes:(HMHomeManager *)manager{
    if (@available(iOS 13.0, *)) {

    }else{
        [self checkAuthOldWithManager:manager];
    }
}

-(void)homeManager:(HMHomeManager *)manager
didUpdateAuthorizationStatus:(HMHomeManagerAuthorizationStatus)status
API_AVAILABLE(ios(13.0)){
    if (status == HMHomeManagerAuthorizationStatusDetermined) {//1-不允许
        if (self.isAlert) {
            [self jumpSetting];
        }[self returnBlock:NO];
    }else if(status == HMHomeManagerAuthorizationStatusAuthorized){
        [self returnBlock:YES];
    }else{
        [self returnBlock:YES];
    }
}
#pragma mark —— 一些公有方法
static TKPermissionHome * _shared = nil;
+(TKPermissionHome *)shared{
    if (!_shared) {
        _shared = TKPermissionHome.new;
    }return _shared;
}
///  请求HomeKit住宅数据权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
           completion:(void(^)(BOOL isAuth))completion{
    TKPermissionHome *obj = self.shared;
    obj.block = completion;
    obj.isAlert = isAlert;
    obj.homeManager.delegate = obj;
    if (@available(iOS 13.0, *)) {/// 低于iOS13是在Delegate中获取权限状态的
        [obj checkAuth];
    }
}
#pragma mark —— 一些私有方法
-(void)jumpSetting{
    [TKPermissionPublic alertPromptTips:JobsInternationalization(@"访问住宅数据时需要您提供权限，去设置！")];
}

-(void)returnBlock:(BOOL)isAuth{
    @jobs_weakify(self)
    dispatch_async(dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        self.block(isAuth);
    });
}
/// iOS 13+ 直接检查权限状态
-(void)checkAuth API_AVAILABLE(ios(13.0)){
    HMHomeManagerAuthorizationStatus status = self.homeManager.authorizationStatus;
    if (status) {
        if (status == 5) {
            [self returnBlock:YES];
        }else if (status == 1){
            if (self.isAlert) {
                [self jumpSetting];
            }[self returnBlock:NO];
        }
    }
}
/// iOS 13以下可以通过该方法，弹出授权框
-(void)checkAuthOldWithManager:(HMHomeManager *)manager{
    if (manager.homes.count > 0) {
        [self returnBlock:YES];
        self.homeManager.delegate = nil;
    }else{
        @jobs_weakify(manager)
        [manager addHomeWithName:self.name
               completionHandler:^(HMHome * _Nullable home, 
                                   NSError * _Nullable error) {
            if (!error) {
                [self returnBlock:YES];
                self.homeManager.delegate = nil;
            } else {
                // tips：出现错误，错误类型参考 HMError.h
                if (error.code == HMErrorCodeHomeAccessNotAuthorized) {
                    if (self.isAlert) {
                        [self jumpSetting];
                    }
                    [self returnBlock:NO];
                    self.homeManager.delegate = nil;
                    return ;
                } else {
                    [self returnBlock:YES];
                    self.homeManager.delegate = nil;
                }
            }
            if (home) {
                @jobs_strongify(manager)
                [manager removeHome:home
                  completionHandler:^(NSError * _Nullable error) {

                }];
            }
        }];
    }
}
#pragma mark —— lazyLoad
-(NSString *)name{
    NSString *name = [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleDisplayName"];
    if (!name) {
        name = [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleName"];
    }return name;
}

-(HMHomeManager *)homeManager{
    if (!_homeManager) {
        _homeManager = HMHomeManager.new;
    }return _homeManager;
}

@end
