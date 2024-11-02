//
//  UILabel+Extra.h
//  Casino
//
//  Created by Jobs on 2021/12/27.
//

#import <UIKit/UIKit.h>
#import "JobsLabelDef.h"
#import "JobsDefineAllEnumHeader.h"
#import "UIView+Masonry.h"
#import "UIView+AutoSelfAdaptionSize.h"
#import "UIBezierPath+Extras.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Extra)

@property(nonatomic,assign)UILabelShowingType labelShowingType;
/// for JobsAnimationLabel
@property(nonatomic,assign)CGFloat value;
@property(nonatomic,assign)CGFloat lastValue;

@property(nonatomic,strong)CAShapeLayer *shapeLayer;
@property(nonatomic,assign)TransformLayerDirectionType transformLayerDirectionType;
#pragma mark —— 一些公共方法
/// UILabel文字旋转
-(jobsByNSUIntegerBlock _Nonnull)transformLayer;
/// 通过传入的(UIImage *)bgImage 来设置背景颜色
-(jobsByImageBlock _Nonnull)lbBackgroundImage;
/// 设置UILabel的显示样式 【在Masonry以后拿到了frame】
-(jobsByNSIntegerBlock _Nonnull)makeLabelByShowingType;

@end

NS_ASSUME_NONNULL_END
