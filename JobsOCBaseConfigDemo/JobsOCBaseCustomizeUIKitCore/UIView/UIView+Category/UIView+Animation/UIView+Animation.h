//
//  UIView+Animation.h
//  Shooting
//
//  Created by Jobs on 2020/9/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>
#import "JobsBlock.h"

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Animation)

@property(nonatomic,assign)CGFloat __block rotateChangeAngle;
@property(nonatomic,assign)CGFloat __block currentAngle;
@property(nonatomic,assign)CGFloat __block durationTime;
@property(nonatomic,assign)CGFloat __block delayTime;
@property(nonatomic,assign)BOOL __block isStopRotateAnimation;//默认值为NO（一直旋转）
@property(nonatomic,strong)CAKeyframeAnimation *__block shakeAnim;
#pragma mark —— 一些功能方法
-(jobsByBOOLBlock)抖动动画;
-(jobsByBOOLBlock)旋转动画;
-(jobsByVoidBlock)图片从小放大;
-(jobsByVoidBlock)视图上下一直来回跳动的动画;
/// 点击放大再缩小
-(void)addViewAnimationWithCompletionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// 逐渐显示
-(void)graduallyShowWithAnimationBlock:(jobsByIDBlock _Nullable)animationBlock
                       completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// 逐渐消退
-(void)graduallyDisappearWithAnimationBlock:(jobsByIDBlock _Nullable)animationBlock
                            completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// 重力弹跳动画效果
-(void)shakerAnimationWithDuration:(NSTimeInterval)duration
                            height:(float)height;

@end

NS_ASSUME_NONNULL_END
