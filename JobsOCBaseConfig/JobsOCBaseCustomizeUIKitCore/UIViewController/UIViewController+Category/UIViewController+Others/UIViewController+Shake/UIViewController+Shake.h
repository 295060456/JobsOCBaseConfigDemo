//
//  UIViewController+Shake.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/8/21.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreMotion/CoreMotion.h>

#import "JobsBlock.h"
#import "NSObject+Shake.h"

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

typedef NS_ENUM(NSInteger, UIViewControllerShakeType) {
    UIViewControllerShakeNone,
    UIViewControllerShakeBeganType,
    UIViewControllerShakeCancelType,
    UIViewControllerShakeEndType,
};

@interface UIViewController (Shake)

@property(nonatomic,strong)CMMotionManager *motionManager;

-(void)invokeWhenViewDidLoadUsingSysFunc;
-(void)invokeWhenViewDidAppearUsingCMMotionManager;

@end

NS_ASSUME_NONNULL_END
