//
//  CALayerDef.h
//  FMNormal
//
//  Created by Jobs on 2025/5/9.
//

#ifndef CALayerDef_h
#define CALayerDef_h
/// 反转方向
#ifndef AnimReverDirection_h
#define AnimReverDirection_h
typedef NS_ENUM(NSUInteger, AnimReverDirection) {
    AnimReverDirectionX = 0,    /// X轴反转
    AnimReverDirectionY,        /// Y轴反转
    AnimReverDirectionZ         /// Z轴反转
};
#endif
/// 动画类型
#ifndef TransitionAnimType_h
#define TransitionAnimType_h
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
#endif
/// 动画方向
#ifndef TransitionSubType_h
#define TransitionSubType_h
typedef NS_ENUM(NSInteger, TransitionSubType) {
    TransitionSubtypesFromTop = 0,        /// 从上
    TransitionSubtypesFromLeft,           /// 从左
    TransitionSubtypesFromBottom,         /// 从下
    TransitionSubtypesFromRight,          /// 从右
    TransitionSubtypesFromRandom          /// 随机
};
#endif
/// 动画曲线
#ifndef TransitionCurve_h
#define TransitionCurve_h
typedef NS_ENUM(NSInteger, TransitionCurve) {
    TransitionCurveDefault = 0,           /// 默认
    TransitionCurveEaseIn,                /// 缓进
    TransitionCurveEaseOut,               /// 缓出
    TransitionCurveEaseInEaseOut,         /// 缓进缓出
    TransitionCurveLinear,                /// 线性
    TransitionCurveRandom                 /// 随机
};
#endif

#endif /* CALayerDef_h */
