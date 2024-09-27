//
//  UIView+Animation.m
//  Shooting
//
//  Created by Jobs on 2020/9/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)
#pragma mark —— 一些功能方法
-(JobsReturnViewByBOOLBlock _Nonnull)抖动动画{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL open) {
        @jobs_strongify(self)
        open ? [self.layer addAnimation:self.shakeAnim forKey:@"shake"] : [self.layer removeAnimationForKey:@"shake"];
        return self;
    };
}

-(JobsReturnViewByBOOLBlock _Nonnull)旋转动画{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL start) {
        @jobs_strongify(self)
        if (start) {
            // 获取结束时的角度
            CGAffineTransform endAngle = CGAffineTransformMakeRotation(self.currentAngle * (M_PI / 180.0f));
            // 动画部分
            [UIView animateWithDuration:self.durationTime
                                  delay:self.delayTime
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                @jobs_strongify(self)
                self.transform = endAngle;
            } completion:^(BOOL finished) {
                @jobs_strongify(self)
                // 增加角度
                self.currentAngle += self.rotateChangeAngle;
                // 判断是否继续旋转
                if (!self.isStopRotateAnimation) {
                    // 递归调用旋转动画
                    self.旋转动画(YES);
                }
            }];
        } else {
            // 停止旋转
            self.isStopRotateAnimation = !self.isStopRotateAnimation;
        }return self;
    };
}
-(JobsReturnViewByVoidBlock _Nonnull)图片从小放大{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        popAnimation.duration = 1;
        popAnimation.values = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add([NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f,
                                                                            0.01f,
                                                                            1.0f)]);
            data.add([NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f,
                                                                            1.1f,
                                                                            1.0f)]);
            data.add([NSValue valueWithCATransform3D:CATransform3DIdentity]);
        });
        popAnimation.keyTimes = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(@0.0f);
            data.add(@0.5f);
            data.add(@0.75f);
            data.add(@1.0f);
        });
        popAnimation.timingFunctions = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add([CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
            data.add([CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
            data.add([CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
        });
        [self.layer addAnimation:popAnimation forKey:nil];
        return self;
    };
}

-(JobsReturnViewByVoidBlock _Nonnull)视图上下一直来回跳动的动画{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        CABasicAnimation *hover = [CABasicAnimation animationWithKeyPath:@"position"];
        hover.additive = YES; // fromValue and toValue will be relative instead of absolute values
        hover.fromValue = [NSValue valueWithCGPoint:CGPointZero];
        hover.toValue = [NSValue valueWithCGPoint:CGPointMake(0.0, -10.0)]; // y increases downwards on iOS
        hover.autoreverses = YES; // Animate back to normal afterwards
        hover.duration = 0.5; // The duration for one part of the animation (0.2 up and 0.2 down)
        hover.repeatCount = INFINITY; // The number of times the animation should repeat
        hover.removedOnCompletion = NO;//锁屏进入继续动画
        [self.layer addAnimation:hover forKey:@"myHoverAnimation"];
        return self;
    };
}
/// 点击放大再缩小
-(void)addViewAnimationWithCompletionBlock:(jobsByIDBlock _Nullable)completionBlock{
    self.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:0.5
                                   delay:0
                                 options:0
                              animations:^{
        @jobs_weakify(self)
        [UIView addKeyframeWithRelativeStartTime:0
                                relativeDuration:1 / 3.0
                                      animations:^{
            @jobs_strongify(self)
            self.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0
                                relativeDuration:1/3.0
                                      animations:^{
            @jobs_strongify(self)
            self.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0
                                relativeDuration:1/3.0
                                      animations:^{
            @jobs_strongify(self)
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:^(BOOL finished) {
        if (completionBlock) completionBlock(@1);
    }];
}
/// 逐渐显示
-(void)graduallyShowWithAnimationBlock:(jobsByIDBlock _Nullable)animationBlock
                       completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    self.alpha = 0.0;
    @jobs_weakify(self)
    [UIView animateWithDuration:0.3
                          delay:0.05
                        options:0
                     animations:^{
        @jobs_strongify(self)
        self.alpha = 1.0;
        if (animationBlock) animationBlock(@(1));
    } completion:^(BOOL finished) {
        if (completionBlock) completionBlock(@(1));
    }];
}
/// 逐渐消退
-(void)graduallyDisappearWithAnimationBlock:(jobsByIDBlock _Nullable)animationBlock
                            completionBlock:(jobsByIDBlock _Nullable)completionBlock{
    @jobs_weakify(self)
    [UIView animateWithDuration:0.3
                          delay:0.05
                        options:0
                     animations:^{
        @jobs_strongify(self)
        self.alpha = 0.0;
        if (animationBlock) animationBlock(@(1));
    } completion:^(BOOL finished) {
        if (completionBlock) completionBlock(@(1));
    }];
}
/// 重力弹跳动画效果
-(void)shakerAnimationWithDuration:(NSTimeInterval)duration
                            height:(float)height{
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    CGFloat currentTx = self.transform.ty;
    animation.duration = duration;
    animation.values = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data.add(@(currentTx));
        data.add(@(currentTx + height));
        data.add(@(currentTx - height / 3 * 2));
        data.add(@(currentTx + height / 3 * 2));
        data.add(@(currentTx - height / 3));
        data.add(@(currentTx + height / 3));
        data.add(@(currentTx));
    });
    animation.keyTimes = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data.add(@(0));
        data.add(@(0.225));
        data.add(@(0.425));
        data.add(@(0.6));
        data.add(@(0.75));
        data.add(@(0.875));
        data.add(@(1));
    });
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:animation forKey:@"kViewShakerAnimationKey"];
}
#pragma mark —— @property(nonatomic,assign)CGFloat rotateChangeAngle;
JobsKey(_rotateChangeAngle)
@dynamic rotateChangeAngle;
-(CGFloat)rotateChangeAngle{
    CGFloat RotateChangeAngle = [Jobs_getAssociatedObject(_rotateChangeAngle) floatValue];
    if (RotateChangeAngle == 0) {
        RotateChangeAngle = 20;
        Jobs_setAssociatedRETAIN_NONATOMIC(_rotateChangeAngle, @(RotateChangeAngle))
    }return RotateChangeAngle;
}

-(void)setRotateChangeAngle:(CGFloat)rotateChangeAngle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_rotateChangeAngle, @(rotateChangeAngle))
}
#pragma mark —— @property(nonatomic,assign)__block CGFloat currentAngle;
JobsKey(_currentAngle)
@dynamic currentAngle;
-(CGFloat)currentAngle{
    return [Jobs_getAssociatedObject(_currentAngle) floatValue];
}

-(void)setCurrentAngle:(CGFloat)currentAngle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_currentAngle, @(currentAngle))
}
#pragma mark —— @property(nonatomic,assign)CGFloat durationTime;
JobsKey(_durationTime)
@dynamic durationTime;
-(CGFloat)durationTime{
    CGFloat DurationTime = [Jobs_getAssociatedObject(_durationTime) floatValue];
    if (DurationTime == 0) {
        DurationTime = 0.1;//缺省值
    }return DurationTime;
}

-(void)setDurationTime:(CGFloat)durationTime{
    Jobs_setAssociatedRETAIN_NONATOMIC(_durationTime, @(durationTime))
}
#pragma mark —— @property(nonatomic,assign)CGFloat delayTime;
JobsKey(_delayTime)
@dynamic delayTime;
-(CGFloat)delayTime{
    CGFloat DelayTime = [Jobs_getAssociatedObject(_delayTime) floatValue];
    if (DelayTime == 0) {
        DelayTime = 0.01;//缺省值
        Jobs_setAssociatedRETAIN_NONATOMIC(_delayTime, @(DelayTime))
    }return DelayTime;
}

-(void)setDelayTime:(CGFloat)delayTime{
    Jobs_setAssociatedRETAIN_NONATOMIC(_delayTime, @(delayTime))
}
#pragma mark —— @property(nonatomic,assign)BOOL isStopRotateAnimation;//默认值为NO（一直旋转）
JobsKey(_isStopRotateAnimation)
@dynamic isStopRotateAnimation;
-(BOOL)isStopRotateAnimation{
    return [Jobs_getAssociatedObject(_isStopRotateAnimation) boolValue];
}

-(void)setIsStopRotateAnimation:(BOOL)isStopRotateAnimation{
    Jobs_setAssociatedRETAIN_NONATOMIC(_isStopRotateAnimation, @(isStopRotateAnimation))
}
#pragma mark —— @property(nonatomic,strong)CAKeyframeAnimation *shakeAnim;
JobsKey(_shakeAnim)
@dynamic shakeAnim;
-(CAKeyframeAnimation *)shakeAnim{
    CAKeyframeAnimation *ShakeAnim = Jobs_getAssociatedObject(_shakeAnim);
    if (!ShakeAnim) {
        #define Angle2Radian(angle) ((angle) / 180.0 * M_PI)
        ShakeAnim = CAKeyframeAnimation.animation;
        ShakeAnim.keyPath = @"transform.rotation";
        ShakeAnim.values = @[@(Angle2Radian(-baseRandomContainBorderValue(7))),
                             @(Angle2Radian(baseRandomContainBorderValue(7))),
                             @(Angle2Radian(-baseRandomContainBorderValue(7)))];
        ShakeAnim.duration = 0.25;
        ShakeAnim.repeatCount = MAXFLOAT;// 动画次数设置为最大
        ShakeAnim.removedOnCompletion = NO;// 保持动画执行完毕后的状态
        ShakeAnim.fillMode = kCAFillModeForwards;
        Jobs_setAssociatedRETAIN_NONATOMIC(_shakeAnim, ShakeAnim)
    }return ShakeAnim;
}

-(void)setShakeAnim:(CAKeyframeAnimation *)shakeAnim{
    Jobs_setAssociatedRETAIN_NONATOMIC(_shakeAnim, shakeAnim)
}

@end
