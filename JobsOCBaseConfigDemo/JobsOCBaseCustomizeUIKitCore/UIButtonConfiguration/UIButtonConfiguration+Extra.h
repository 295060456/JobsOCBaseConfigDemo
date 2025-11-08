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
Prop_copy(readonly,nonnull) JobsRetBtnConfigByBtnConfigBlock byButtonConfiguration API_AVAILABLE(ios(16.0));
/// 背景
Prop_copy(readonly,nonnull) JobsRetBtnConfigByBackgroundBlock byBackground API_AVAILABLE(ios(16.0));
/// 圆角解释风格
Prop_copy(readonly,nonnull) JobsRetBtnConfigByCornerStyleBlock byCornerStyle API_AVAILABLE(ios(16.0));
/// 按钮尺寸
Prop_copy(readonly,nonnull) JobsRetBtnConfigBySizeBlock byButtonSize API_AVAILABLE(ios(16.0));
/// Mac idiom 样式
Prop_copy(readonly,nonnull) JobsRetBtnConfigByMacIdiomStyleBlock byMacIdiomStyle API_AVAILABLE(ios(16.0));
/// 前景色基色
Prop_copy(readonly,nonnull) JobsReBtnConfigByBaseForegroundCorBlock byBaseForegroundColor API_AVAILABLE(ios(16.0));
/// 背景基色
Prop_copy(readonly,nonnull) JobsRetBtnConfigByBaseBackgroundCorBlock byBaseBackgroundColor API_AVAILABLE(ios(16.0));
/// 图片
Prop_copy(readonly,nonnull) JobsRetBtnConfigByImageBlock byImage API_AVAILABLE(ios(16.0));
/// 图片颜色变换器
Prop_copy(readonly,nonnull) JobsRetBtnConfigByImageCorTransformerBlock byImageColorTransformer API_AVAILABLE(ios(16.0));
/// 图片符号配置
Prop_copy(readonly,nonnull) JobsRetBtnConfigByPreferredSymbolConfigForImageBlock byPreferredSymbolConfigurationForImage API_AVAILABLE(ios(16.0));
/// 是否显示菊花
Prop_copy(readonly,nonnull) JobsRetBtnConfigByShowsActivityIndicatorBlock byShowsActivityIndicator API_AVAILABLE(ios(16.0));
/// 菊花颜色变换器
Prop_copy(readonly,nonnull) JobsRetBtnConfigByActivityIndicatorCorTransformerBlock byActivityIndicatorColorTransformer API_AVAILABLE(ios(16.0));
/// 标题
Prop_copy(readonly,nonnull) JobsRetBtnConfigByStrBlock byTitle API_AVAILABLE(ios(16.0));
/// 富文本标题
Prop_copy(readonly,nonnull) JobsRetBtnConfigByAttributedStrBlock byAttributedTitle API_AVAILABLE(ios(16.0));
/// 标题属性变换器
Prop_copy(readonly,nonnull) JobsRetBtnConfigByTitleTextAttributesTransformerBlock byTitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
/// 标题换行策略
Prop_copy(readonly,nonnull) JobsRetBtnConfigByTitleLineBreakModeBlock byTitleLineBreakMode API_AVAILABLE(ios(16.0));
/// 副标题
Prop_copy(readonly,nonnull) JobsRetBtnConfigBySubtitleBlock bySubtitle API_AVAILABLE(ios(16.0));
/// 富文本副标题
Prop_copy(readonly,nonnull) JobsRetBtnConfigByAttributedSubtitleBlock byAttributedSubtitle API_AVAILABLE(ios(16.0));
/// 副标题属性变换器
Prop_copy(readonly,nonnull) JobsRetBtnConfigBySubtitleTextAttributesTransformerBlock bySubtitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
/// 副标题换行策略
Prop_copy(readonly,nonnull) JobsRetBtnConfigBySubtitleLineBreakModeBlock bySubtitleLineBreakMode API_AVAILABLE(ios(16.0));
/// 指示器类型
Prop_copy(readonly,nonnull) JobsRetBtnConfigByIndicatorBlock byIndicator API_AVAILABLE(ios(16.0));
/// 指示器颜色变换器
Prop_copy(readonly,nonnull) JobsRetBtnConfigByIndicatorColorTransformerBlock byIndicatorColorTransformer API_AVAILABLE(ios(16.0));
/// 内容内边距
Prop_copy(readonly,nonnull) JobsRetBtnConfigByContentInsetsBlock byContentInsets API_AVAILABLE(ios(16.0));
/// 图片位置
Prop_copy(readonly,nonnull) JobsRetBtnConfigByImagePlacementBlock byImagePlacement API_AVAILABLE(ios(16.0));
/// 图文间距
Prop_copy(readonly,nonnull) JobsRetBtnConfigByImagePaddingBlock byImagePadding API_AVAILABLE(ios(16.0));
/// 标题与副标题间距
Prop_copy(readonly,nonnull) JobsRetBtnConfigByTitlePaddingBlock byTitlePadding API_AVAILABLE(ios(16.0));
/// 标题/副标题对齐
Prop_copy(readonly,nonnull) JobsRetBtnConfigByTitleAlignmentBlock byTitleAlignment API_AVAILABLE(ios(16.0));
/// 是否自动跟随 selected 更新样式
Prop_copy(readonly,nonnull) JobsRetBtnConfigByAutomaticallyUpdateForSelectionBlock byAutomaticallyUpdateForSelection API_AVAILABLE(ios(16.0));

@end

NS_ASSUME_NONNULL_END
