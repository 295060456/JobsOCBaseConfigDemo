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
///   - subType:  转动动画方向
///   - curve:    转动动画曲线
///   - duration: 转动动画时长
-(CATransition *_Nullable)transitionWithAnimType:(TransitionAnimType)animType
                                         subType:(TransitionSubType)subType
                                           curve:(TransitionCurve)curve
                                        duration:(CGFloat)duration{
    NSString *key = @"transition";
    if([self animationForKey:key]) [self removeAnimationForKey:key];
    CATransition *transition = CATransition.animation;
    transition.duration = duration;/// 动画时长
    transition.type = self.animaTypeWithTransitionType(animType);/// 动画类型
    transition.subtype = self.animaSubtype(subType);/// 动画方向
    transition.timingFunction = [CAMediaTimingFunction functionWithName:self.curve(curve)];/// 缓动函数
    transition.removedOnCompletion = YES;/// 完成动画删除
    [self addAnimation:transition
                forKey:key];
    return transition;
}
/// 返回动画曲线
-(JobsReturnStringByIntegerBlock _Nonnull)curve{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(TransitionCurve curve){
        /// 曲线数组
        @jobs_strongify(self)
        return (NSString *)[self objFromArray:jobsMakeMutArr(^(NSMutableArray <CAMediaTimingFunctionName>*_Nullable data) {
            data.add(kCAMediaTimingFunctionDefault);
            data.add(kCAMediaTimingFunctionEaseIn);
            data.add(kCAMediaTimingFunctionEaseInEaseOut);
            data.add(kCAMediaTimingFunctionEaseOut);
            data.add(kCAMediaTimingFunctionLinear);
        })index:curve isRamdom:(TransitionCurveRandom == curve)];
    };
}
/// 返回动画方向
-(JobsReturnStringByIntegerBlock _Nonnull)animaSubtype{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(TransitionCurve subType){
        /// 设置转场动画的方向
        @jobs_strongify(self)
        return (NSString *)[self objFromArray:jobsMakeMutArr(^(NSMutableArray <CATransitionSubtype>*_Nullable data) {
            data.add(kCATransitionFromTop);
            data.add(kCATransitionFromLeft);
            data.add(kCATransitionFromBottom);
            data.add(kCATransitionFromRight);
        }) index:subType isRamdom:(TransitionSubtypesFromRandom == subType)];
    };
}
/// 返回动画类型
-(JobsReturnStringByIntegerBlock _Nonnull)animaTypeWithTransitionType{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(TransitionCurve type){
        /// 设置转场动画的类型
        @jobs_strongify(self)
        return [self objFromArray:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(@"rippleEffect");
            data.add(@"suckEffect");
            data.add(@"pageCurl");
            data.add(@"oglFlip");
            data.add(@"cube");
            data.add(@"reveal");
            data.add(@"pageUnCurl");
        })index:type isRamdom:(TransitionAnimTypeRandom == type)];
    };
}

-(JobsReturnCALayerByCALayerBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CALayer *_Nullable data){
        @jobs_strongify(self)
        [self addSublayer:data];
        return self;
    };
}
/// 统一从数据返回对象
-(id _Nullable)objFromArray:(NSArray *_Nullable)array
                      index:(NSUInteger)index
                   isRamdom:(BOOL)isRamdom{
    NSUInteger count = array.count;
    NSUInteger i = isRamdom?arc4random_uniform((u_int32_t)count) : index;
    return array[i];
}

@end
