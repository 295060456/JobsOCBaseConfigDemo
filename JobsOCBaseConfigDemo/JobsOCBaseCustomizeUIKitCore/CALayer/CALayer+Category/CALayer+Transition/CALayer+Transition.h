//
//  CALayer+Transition.h
//  Carpenter
//
//  Created by 冯成林 on 15/4/23.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "JobsBlock.h"
/// 动画类型
typedef NS_ENUM(NSInteger, TransitionAnimType) {
    TransitionAnimTypeRippleEffect = 0,   /// 水波
    TransitionAnimTypeSuckEffect,         /// 吸走
    TransitionAnimTypePageCurl,           /// 翻开书本
    TransitionAnimTypeOglFlip,            /// 正反翻转
    TransitionAnimTypeCube,               /// 正方体
    TransitionAnimTypeReveal,             /// push推开
    TransitionAnimTypePageUnCurl,         /// 合上书本
    TransitionAnimTypeRandom              /// 随机
};
/// 动画方向
typedef NS_ENUM(NSInteger, TransitionSubType) {
    TransitionSubtypesFromTop = 0,        /// 从上
    TransitionSubtypesFromLeft,           /// 从左
    TransitionSubtypesFromBottom,         /// 从下
    TransitionSubtypesFromRight,          /// 从右
    TransitionSubtypesFromRandom          /// 随机
};
/// 动画曲线
typedef NS_ENUM(NSInteger, TransitionCurve) {
    TransitionCurveDefault = 0,           /// 默认
    TransitionCurveEaseIn,                /// 缓进
    TransitionCurveEaseOut,               /// 缓出
    TransitionCurveEaseInEaseOut,         /// 缓进缓出
    TransitionCurveLinear,                /// 线性
    TransitionCurveRandom                 /// 随机
};

@interface CALayer (Transition)
/// 转场动画实例
/// - Parameters:
///   - animType: 转场动画类型
///   - subType: 转动动画方向
///   - curve:  转动动画曲线
///   - duration: 转动动画时长
-(CATransition *_Nullable)transitionWithAnimType:(TransitionAnimType)animType
                                         subType:(TransitionSubType)subType
                                           curve:(TransitionCurve)curve
                                        duration:(CGFloat)duration;
/// 返回动画曲线
-(JobsReturnStringByIntegerBlock _Nonnull)curve;
/// 返回动画方向
-(JobsReturnStringByIntegerBlock _Nonnull)animaSubtype;
/// 返回动画类型
-(JobsReturnStringByIntegerBlock _Nonnull)animaTypeWithTransitionType;

-(JobsReturnCALayerByCALayerBlock _Nonnull)add;
/// 统一从数据返回对象
-(id _Nullable)objFromArray:(NSArray *_Nullable)array
                      index:(NSUInteger)index
                   isRamdom:(BOOL)isRamdom;

@end
