//
//  UIButtonConfiguration+Extra.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 10/9/25.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButtonConfiguration (Extra)
/// 从另一份 UIButtonConfiguration 复制属性到当前对象
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByButtonConfigurationBlock byButtonConfiguration;
/// 背景
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByBackgroundBlock byBackground API_AVAILABLE(ios(16.0));
/// 圆角解释风格
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByCornerStyleBlock byCornerStyle API_AVAILABLE(ios(16.0));
/// 按钮尺寸
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationBySizeBlock byButtonSize API_AVAILABLE(ios(16.0));
/// Mac idiom 样式
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByMacIdiomStyleBlock byMacIdiomStyle API_AVAILABLE(ios(16.0));
/// 前景色基色
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByBaseForegroundColorBlock byBaseForegroundColor API_AVAILABLE(ios(16.0));
/// 背景基色
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByBaseBackgroundColorBlock byBaseBackgroundColor API_AVAILABLE(ios(16.0));
/// 图片
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByImageBlock byImage API_AVAILABLE(ios(16.0));
/// 图片颜色变换器
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByImageColorTransformerBlock byImageColorTransformer API_AVAILABLE(ios(16.0));
/// 图片符号配置
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByPreferredSymbolConfigurationForImageBlock byPreferredSymbolConfigurationForImage API_AVAILABLE(ios(16.0));
/// 是否显示菊花
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByShowsActivityIndicatorBlock byShowsActivityIndicator API_AVAILABLE(ios(16.0));
/// 菊花颜色变换器
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByActivityIndicatorColorTransformerBlock byActivityIndicatorColorTransformer API_AVAILABLE(ios(16.0));
/// 标题
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByTitleBlock byTitle API_AVAILABLE(ios(16.0));
/// 富文本标题
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByAttributedTitleBlock byAttributedTitle API_AVAILABLE(ios(16.0));
/// 标题属性变换器
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByTitleTextAttributesTransformerBlock byTitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
/// 标题换行策略
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByTitleLineBreakModeBlock byTitleLineBreakMode API_AVAILABLE(ios(16.0));
/// 副标题
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationBySubtitleBlock bySubtitle API_AVAILABLE(ios(16.0));
/// 富文本副标题
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByAttributedSubtitleBlock byAttributedSubtitle API_AVAILABLE(ios(16.0));
/// 副标题属性变换器
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationBySubtitleTextAttributesTransformerBlock bySubtitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
/// 副标题换行策略
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationBySubtitleLineBreakModeBlock bySubtitleLineBreakMode API_AVAILABLE(ios(16.0));
/// 指示器类型
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByIndicatorBlock byIndicator API_AVAILABLE(ios(16.0));
/// 指示器颜色变换器
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByIndicatorColorTransformerBlock byIndicatorColorTransformer API_AVAILABLE(ios(16.0));
/// 内容内边距
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByContentInsetsBlock byContentInsets API_AVAILABLE(ios(16.0));
/// 图片位置
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByImagePlacementBlock byImagePlacement API_AVAILABLE(ios(16.0));
/// 图文间距
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByImagePaddingBlock byImagePadding API_AVAILABLE(ios(16.0));
/// 标题与副标题间距
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByTitlePaddingBlock byTitlePadding API_AVAILABLE(ios(16.0));
/// 标题/副标题对齐
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByTitleAlignmentBlock byTitleAlignment API_AVAILABLE(ios(16.0));
/// 是否自动跟随 selected 更新样式
Prop_copy(readonly,nonnull) JobsReturnButtonConfigurationByAutomaticallyUpdateForSelectionBlock byAutomaticallyUpdateForSelection API_AVAILABLE(ios(16.0));

@end

NS_ASSUME_NONNULL_END
