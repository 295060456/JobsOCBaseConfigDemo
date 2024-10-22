//
//  CALayer+Transition.m
//  Carpenter
//
//  Created by 冯成林 on 15/4/23.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "CALayer+Transition.h"

@implementation CALayer (Transition)
/// 转场动画实例
/// - Parameters:
///   - animType: 转场动画类型
///   - subType: 转动动画方向
///   - curve:  转动动画曲线
///   - duration: 转动动画时长
-(CATransition *)transitionWithAnimType:(TransitionAnimType)animType
                                subType:(TransitionSubType)subType
                                  curve:(TransitionCurve)curve
                               duration:(CGFloat)duration{
    NSString *key = @"transition";
    if([self animationForKey:key]) [self removeAnimationForKey:key];
    CATransition *transition = CATransition.animation;
    transition.duration = duration;//动画时长
    transition.type = [self animaTypeWithTransitionType:animType];/// 动画类型
    transition.subtype = [self animaSubtype:subType];/// 动画方向
    transition.timingFunction = [CAMediaTimingFunction functionWithName:[self curve:curve]];/// 缓动函数
    transition.removedOnCompletion = YES;/// 完成动画删除
    [self addAnimation:transition
                forKey:key];
    return transition;
}
/// 返回动画曲线
-(NSString *)curve:(TransitionCurve)curve{
    /// 曲线数组
    NSArray *funcNames = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        data.add(kCAMediaTimingFunctionDefault);
        data.add(kCAMediaTimingFunctionEaseIn);
        data.add(kCAMediaTimingFunctionEaseInEaseOut);
        data.add(kCAMediaTimingFunctionEaseOut);
        data.add(kCAMediaTimingFunctionLinear);
    });
    return [self objFromArray:funcNames
                        index:curve
                     isRamdom:(TransitionCurveRamdom == curve)];
}
/// 返回动画方向
-(NSString *)animaSubtype:(TransitionSubType)subType{
    /// 设置转场动画的方向
    NSArray *subtypes = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        data.add(kCATransitionFromTop);
        data.add(kCATransitionFromLeft);
        data.add(kCATransitionFromBottom);
        data.add(kCATransitionFromRight);
    });
    return [self objFromArray:subtypes
                        index:subType
                     isRamdom:(TransitionSubtypesFromRamdom == subType)];
}
/// 返回动画类型
-(NSString *)animaTypeWithTransitionType:(TransitionAnimType)type{
    
    //设置转场动画的类型
    NSArray *animArray=@[@"rippleEffect",
                         @"suckEffect",
                         @"pageCurl",
                         @"oglFlip",
                         @"cube",
                         @"reveal",
                         @"pageUnCurl"];
    
    return [self objFromArray:animArray
                        index:type
                     isRamdom:(TransitionAnimTypeRamdom == type)];
}
/// 统一从数据返回对象
-(id)objFromArray:(NSArray *)array
            index:(NSUInteger)index
         isRamdom:(BOOL)isRamdom{
    NSUInteger count = array.count;
    NSUInteger i = isRamdom?arc4random_uniform((u_int32_t)count) : index;
    return array[i];
}

@end
