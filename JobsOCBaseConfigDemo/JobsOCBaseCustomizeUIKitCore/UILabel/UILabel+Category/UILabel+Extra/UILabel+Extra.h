//
//  UILabel+Extra.h
//  Casino
//
//  Created by Jobs on 2021/12/27.
//

#import <UIKit/UIKit.h>
#import "JobsLabelDef.h"
#import "UIView+Masonry.h"
#import "UIView+AutoSelfAdaptionSize.h"
#import "UIBezierPath+TextPath.h"

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
-(void)transformLayer:(TransformLayerDirectionType)directionType;
/// 通过传入的(UIImage *)bgImage 来设置背景颜色
-(void)lbBackgroundImage:(UIImage *)bgImage;
/// 设置UILabel的显示样式 【在Masonry以后拿到了frame】
-(void)makeLabelByShowingType:(UILabelShowingType)labelShowingType;

@end

NS_ASSUME_NONNULL_END
