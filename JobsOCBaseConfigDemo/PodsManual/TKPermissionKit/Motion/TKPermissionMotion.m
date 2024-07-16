//
//  TKPermissionMotion.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionMotion.h"

@interface TKPermissionMotion ()

@property(nonatomic,strong)CMMotionActivityManager *cmManager; /// 运动
@property(nonatomic,strong)NSOperationQueue *motionActivityQueue; /// 运动
@property(nonatomic,copy)TKPermissionBlock block;
@property(nonatomic,assign)BOOL isAlert;
@property(class,nonatomic,strong,readonly)TKPermissionMotion *shared;

@end

@implementation TKPermissionMotion
#pragma mark —— 一些公有方法
static TKPermissionMotion * _shared = nil;
+(TKPermissionMotion *)shared{
    if (!_shared) {
        _shared = TKPermissionMotion.new;
    }return _shared;
}
///   请求运动与健身权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(void(^)(BOOL isAuth))completion{
    TKPermissionMotion *obj = self.shared;
    obj.block = completion;
    obj.isAlert = isAlert;
    if (CMMotionActivityManager.isActivityAvailable) {
        if (@available(iOS 11.0, *)) {
            NSInteger status = CMMotionActivityManager.authorizationStatus;
            if (status == CMAuthorizationStatusAuthorized) {
                [obj returnBlock:YES];
            }else if (status == CMAuthorizationStatusDenied){
                if (isAlert) {
                    [obj jumpSetting];
                }
                [obj returnBlock:NO];
            }else{//申请权限
                [obj queryActivityStarting];
            }
        } else {
            [obj queryActivityStarting];
        }
    }else{
        [obj alertAction];
        [obj returnBlock:NO];
    }
}
#pragma mark —— 一些私有方法
/// 通过查询CMMotionActivityManager来请求，获取权限
-(void)queryActivityStarting{
    self.cmManager = CMMotionActivityManager.new;
    self.motionActivityQueue = NSOperationQueue.new;
    NSDate *beginDate = NSDate.date;
    NSDate *endDate = [beginDate dateByAddingTimeInterval:3600];
    [self.cmManager queryActivityStartingFromDate:beginDate
                                           toDate:endDate
                                          toQueue:self.motionActivityQueue
                                      withHandler:^(NSArray<CMMotionActivity *> * _Nullable activities,
                                                    NSError * _Nullable error) {
        if (error) {
            if (self.isAlert) {
                [self jumpSetting];
            }
            [self returnBlock:NO];
        }else{
            [self returnBlock:YES];
        }
        [self.motionActivityQueue cancelAllOperations];
        self.motionActivityQueue = nil;
        [self.cmManager stopActivityUpdates];
        self.cmManager = nil;
    }];
}

-(void)returnBlock:(BOOL)isAuth{
    @jobs_weakify(self)
    dispatch_async(dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        self.block(isAuth);
    });
}

-(void)jumpSetting{
    [TKPermissionPublic alertPromptTips:JobsInternationalization(@"访问运动与健身时需要您提供权限，去设置！")];
}

-(void)alertAction{
    [TKPermissionPublic alertTips:JobsInternationalization(@"当前设备不支持运动与健身！")];
}

@end
