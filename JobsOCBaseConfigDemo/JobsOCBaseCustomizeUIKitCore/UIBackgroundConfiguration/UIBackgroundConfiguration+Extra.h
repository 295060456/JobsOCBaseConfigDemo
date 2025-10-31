//
//  UIBackgroundConfiguration+Extra.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 10/9/25.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
API_AVAILABLE(ios(14.0))
@interface UIBackgroundConfiguration (Extra)
/// 背景色
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByColorBlock byBackgroundColor;
/// 圆角
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByCGFloatBlock byCornerRadius;
/// 背景 Insets
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByInsetsBlock byBackgroundInsets;
/// 自定义 View
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByViewBlock byCustomView;
/// 阴影（iOS18+）
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByCGFloatBlock byShadowOpacity API_AVAILABLE(ios(18.0));
/// 边框颜色
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByColorBlock byStrokeColor;
/// 边框宽度
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByCGFloatBlock byStrokeWidth;
/// 背景图
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByImageBlock byImage;
/// 背景图模式
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByContentModeBlock byImageContentMode;
/// 模糊效果
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByVisualEffectBlock byVisualEffect;
/// layoutMargins 叠加到 backgroundInsets 的边
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByRectEdgeBlock byEdgesAddingLayoutMarginsToBackgroundInsets;
/// 描边的外扩/内缩（相对 background），正为外扩、负为内缩
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByCGFloatBlock byStrokeOutset;
/// 背景色转换器（Dark Mode 等动态变换）
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByColorTransformerBlock byBackgroundColorTransformer;
/// 描边色转换器（Dark Mode 等动态变换）
Prop_copy(readonly,nonnull)JobsReturnBackgroundConfigurationByColorTransformerBlock byStrokeColorTransformer;

@end

NS_ASSUME_NONNULL_END
