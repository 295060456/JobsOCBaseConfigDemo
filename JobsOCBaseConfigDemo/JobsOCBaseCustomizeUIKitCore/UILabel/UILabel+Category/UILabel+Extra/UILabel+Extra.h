//
//  UILabel+Extra.h
//  Casino
//
//  Created by Jobs on 2021/12/27.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
#import "UIView+Masonry.h"
#import "UIView+AutoSelfAdaptionSize.h"
#import "UIBezierPath+Extras.h"
#import "CALayer+Extra.h"
#import "NSObject+Extras.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Extra)

Prop_assign()UILabelShowingType labelShowingType;
/// for JobsAnimationLabel
Prop_assign()CGFloat value;
Prop_assign()CGFloat lastValue;
Prop_strong()CAShapeLayer *shapeLayer;
Prop_assign()TransformLayerDirectionType transformLayerDirectionType;
#pragma mark —— 一些公共方法
/// UILabel文字旋转
-(JobsReturnLabelByNSUIntegerBlock _Nonnull)transformLayer;
/// 通过传入的(UIImage *)bgImage 来设置背景颜色
-(JobsReturnLabelByImage _Nonnull)bgImage;
/// 设置UILabel的显示样式 【在Masonry以后拿到了frame】
-(JobsReturnLabelByNSUIntegerBlock _Nonnull)makeLabelByShowingType;
#pragma mark —— 系统方法链式语法封装
-(JobsReturnLabelByAttributedString _Nonnull)byAttributedString;
-(JobsReturnLabelByText _Nonnull)byText;
-(JobsReturnLabelByCor _Nonnull)byTextCor;
-(JobsReturnLabelByFont _Nonnull)byFont;
-(JobsReturnLabelByTextAlignment _Nonnull)byTextAlignment;

@end

NS_ASSUME_NONNULL_END
