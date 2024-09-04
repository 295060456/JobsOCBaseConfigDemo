//
//  UIViewController+Shake.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/8/21.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "UIViewController+Shake.h"

@implementation UIViewController (Shake)

#pragma mark —— 一些公有方法

#pragma mark —— 系统方法
-(void)invokeWhenViewDidLoadUsingSysFunc{
    //设置允许摇一摇功能
    UIApplication.sharedApplication.applicationSupportsShakeToEdit = YES;
    [self becomeFirstResponder];
}
/// 摇一摇开始摇动
- (void)motionBegan:(UIEventSubtype)motion
          withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {// 判断是否是摇动事件
        if (self.objectBlock) self.objectBlock(@(motion));
    }
}
/// 摇一摇摇动结束
- (void)motionEnded:(UIEventSubtype)motion
          withEvent:(UIEvent *)event {
    // 判断是否是摇动事件
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"摇一摇结束~~~~~");
        //摇动结束添加事件
        if (self.objectBlock) self.objectBlock(@(UIViewControllerShakeEndType));
    }
}
/// 摇一摇取消摇动
- (void)motionCancelled:(UIEventSubtype)motion
              withEvent:(UIEvent *)event {
    if (self.objectBlock) self.objectBlock(@(UIViewControllerShakeCancelType));
}
#pragma mark —— 加速仪
-(void)invokeWhenViewDidAppearUsingCMMotionManager{
    @jobs_weakify(self)
    [JobsNotificationCenter addObserverForName:UIApplicationDidEnterBackgroundNotification
                                        object:nil
                                         queue:nil
                                    usingBlock:^(NSNotification * _Nonnull notification) {
        @jobs_strongify(self)
//        NSString *notificationName = notification.name;
        if (notification.name.isEqualToString(UIApplicationDidEnterBackgroundNotification)){
            [self.motionManager stopAccelerometerUpdates];
        }else{
            [self startAccelerometer];
        }
    }];
    
    [JobsNotificationCenter addObserverForName:UIApplicationWillEnterForegroundNotification
                                        object:nil
                                         queue:nil
                                    usingBlock:^(NSNotification * _Nonnull notification) {
        @jobs_strongify(self)
//        NSString *notificationName = notification.name;
        if (notification.name.isEqualToString(UIApplicationDidEnterBackgroundNotification)){
            [self.motionManager stopAccelerometerUpdates];
        }else{
            [self startAccelerometer];
        }
    }];
}

-(void)startAccelerometer{
    //以push的方式更新并在block中接收加速度
    @jobs_weakify(self)
    [self.motionManager startAccelerometerUpdatesToQueue:NSOperationQueue.new
                                             withHandler:^(CMAccelerometerData *accelerometerData,
                                                           NSError *error) {
        @jobs_strongify(self)
        [self outputAccelertionData:accelerometerData.acceleration];
        if (error) {
            NSLog(@"motion error:%@",error);
        }
    }];
}

-(void)stopAccelerometerWhenViewDidDisappear{
    [self.motionManager stopAccelerometerUpdates];
    JobsNotificationCenter.Remove(UIApplicationDidEnterBackgroundNotification,self);
    JobsNotificationCenter.Remove(UIApplicationWillEnterForegroundNotification,self);
}

-(void)outputAccelertionData:(CMAcceleration)acceleration{
    //综合3个方向的加速度
    double accelerameter = sqrt(pow( acceleration.x , 2 ) + pow( acceleration.y , 2 ) + pow( acceleration.z , 2));
    //当综合加速度大于2.3时，就激活效果（此数值根据需求可以调整，数据越小，用户摇动的动作就越小，越容易激活，反之加大难度，但不容易误触发）
    if (accelerameter > 1.5f) {
        //立即停止更新加速仪（很重要！）
        [self.motionManager stopAccelerometerUpdates];
        @jobs_weakify(self)
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            //UI线程必须在此block内执行，例如摇一摇动画、UIAlertView之类
            //设置开始摇晃时震动
            [NSObject shake];
            //加载动画
            if (self.objectBlock) self.objectBlock(@(UIViewControllerShakeBeganType));
        });
    }
}
#pragma mark —— @property(nonatomic,strong)CMMotionManager *motionManager;
JobsKey(_motionManager)
@dynamic motionManager;
-(CMMotionManager *)motionManager{
    CMMotionManager *MotionManager = Jobs_getAssociatedObject(_motionManager);
    if (!MotionManager) {
        MotionManager = CMMotionManager.new;
        MotionManager.accelerometerUpdateInterval = 0.5;//加速仪更新频率，以秒为单位
        Jobs_setAssociatedRETAIN_NONATOMIC(_motionManager, MotionManager)
    }return MotionManager;
}

-(void)setMotionManager:(CMMotionManager *)motionManager{
    Jobs_setAssociatedRETAIN_NONATOMIC(_motionManager, motionManager)
}

@end
