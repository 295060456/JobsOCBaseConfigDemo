//
//  CALayer+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/5/9.
//

#import <QuartzCore/QuartzCore.h>
#import "NSString+Others.h"
#import "JobsBlock.h"
#import "CALayerDef.h"

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (Extra)
/// 适用于通过字符串来创建对象动画的场景
-(JobsReturnCALayerByCAPropertyAnimationBlock _Nonnull)addAnimationBy;
-(JobsReturnCALayerByCAPropertyAnimationBlock _Nonnull)removeAnimationBy;
-(JobsReturnCAPropertyAnimationByCAPropertyAnimationBlock _Nonnull)addAnimation;
-(JobsReturnCAPropertyAnimationByCAPropertyAnimationBlock _Nonnull)removeAnimation;

-(CAAnimation *)anim_shake:(NSArray *)rotations
                  duration:(NSTimeInterval)duration
               repeatCount:(NSUInteger)repeatCount;
-(CAAnimation *)anim_revers:(AnimReverDirection)direction
                   duration:(NSTimeInterval)duration
                  isReverse:(BOOL)isReverse
                repeatCount:(NSUInteger)repeatCount
             timingFuncName:(NSString *)timingFuncName;
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
/// 添加Layer
-(JobsReturnCALayerByCALayerBlock _Nonnull)addSublayer;
/// 删除Layer
-(jobsByVoidBlock _Nonnull)remove;
/// 统一从数据返回对象
-(id _Nullable)objFromArray:(NSArray *_Nullable)array
                      index:(NSUInteger)index
                   isRamdom:(BOOL)isRamdom;
#pragma mark —— 迎合链式语法而做的封装
-(JobsReturnCALayerByCGFloatBlock _Nonnull)cornerRadiusBy;
-(JobsReturnCALayerByCGFloatBlock _Nonnull)borderWidthBy;
-(JobsReturnCALayerByCorBlock _Nonnull)borderColorBy;
-(JobsReturnCALayerByBOOLBlock _Nonnull)masksToBoundsBy;

@end

NS_ASSUME_NONNULL_END
