//
//  UIButton+UIButtonConfiguration.h
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
UIKIT_EXTERN API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos) NS_SWIFT_UI_ACTOR
@interface UIButton (UIButtonConfiguration)
/// UIButtonConfiguration 创建的UIbutton修改字体以及颜色的方法
/// 注意⚠️因为UIConfigurationTextAttributesTransformer是没有办法直接获取到里面的字体的，只能从外面生成以后直接赋值，也就是每次修改需要给一个完整的UIConfigurationTextAttributesTransformer对象进UIButtonConfiguration
-(void)jobsSetBtnTitleFont:(UIFont *_Nullable)titleFont
               btnTitleCor:(UIColor *_Nullable)titleCor;

-(void)jobsSetBtnSubTitleFont:(UIFont *_Nullable)subTitleFont
               btnSubTitleCor:(UIColor *_Nullable)subTitleCor;
/// 重设UIButtonConfiguration并使之生效  JobsReturnButtonConfigurationByButtonConfigurationBlock
-(__kindof UIButton *)jobsUpdateButtonConfiguration:(jobsByButtonConfigurationBlock _Nullable)configurationBlock;

-(UIButtonConfiguration *)JobsUpdateButtonConfiguration:(jobsByButtonConfigurationBlock _Nullable)configurationBlock;
///【最新的Api】修改主标题的对齐方式
-(JobsReturnButtonByTextAlignmentBlock _Nonnull)_jobsResetTitleTextAlignment API_AVAILABLE(ios(16.0));
///【最新的Api】修改副标题的对齐方式
-(JobsReturnButtonByTextAlignmentBlock _Nonnull)jobsResetSubTitleTextAlignment API_AVAILABLE(ios(16.0));
///【最新的Api】重设Btn的图文相对位置
-(JobsReturnButtonByImagePlacementBlock _Nonnull)jobsResetImagePlacement API_AVAILABLE(ios(16.0));
///【最新的Api】重设Btn的图文间距
-(JobsReturnButtonByCGFloatBlock _Nonnull)jobsResetImagePadding API_AVAILABLE(ios(16.0));
///【最新的Api】重设Btn主标题与副标题之间的距离
-(JobsReturnButtonByCGFloatBlock _Nonnull)jobsResetTitlePadding API_AVAILABLE(ios(16.0));
/**
 1、一一对应UIButtonConfiguration.h文件里面的属性
 2、只有通过UIButtonConfiguration创建的UIButton，这个UIbutton的configuration属性才不为空
 3、要修改通过UIButtonConfiguration创建的UIButton的各属性值，只有通过下列方式方可以
 */
#pragma mark —— 【最新的Api】UIButton.configuration的各项属性值的修改
-(JobsReturnButtonByTitleAlignmentBlock _Nonnull)jobsResetTitleAlignment API_AVAILABLE(ios(16.0));
-(JobsReturnButtonByBOOLBlock _Nonnull)jobsResetAutomaticallyUpdateForSelection API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByBackgroundBlock _Nonnull)jobsResetBackground API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByImageBlock _Nonnull)jobsResetBackgroundImage API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByCornerStyleBlock _Nonnull)jobsResetCornerStyle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationBySizeBlock _Nonnull)jobsResetButtonSize API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByMacIdiomStyleBlock _Nonnull)jobsResetMacIdiomStyle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByBaseBackgroundColorBlock _Nonnull)jobsResetBaseBackgroundColor API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByImageBlock _Nonnull)jobsResetImage API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByImageColorTransformerBlock _Nonnull)jobsResetImageColorTransformer API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByPreferredSymbolConfigurationForImageBlock _Nonnull)jobsResetPreferredSymbolConfigurationForImage API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByShowsActivityIndicatorBlock _Nonnull)jobsResetShowsActivityIndicator API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByActivityIndicatorColorTransformerBlock _Nonnull)jobsResetActivityIndicatorColorTransformer API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByTitleBlock _Nonnull)jobsResetTitle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByTitleBlock _Nonnull)jobsResetSubTitle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByAttributedTitleBlock _Nonnull)jobsResetAttributedTitle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByTitleTextAttributesTransformerBlock _Nonnull)jobsResetTitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByTitleLineBreakModeBlock _Nonnull)jobsResetTitleLineBreakMode API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByTitleLineBreakModeBlock _Nonnull)jobsResetSubTitleLineBreakMode API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationBySubtitleBlock _Nonnull)jobsResetSubtitle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByAttributedSubtitleBlock _Nonnull)jobsResetAttributedSubtitle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationBySubtitleTextAttributesTransformerBlock _Nonnull)jobsResetSubtitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationBySubtitleLineBreakModeBlock _Nonnull)jobsResetSubtitleLineBreakMode API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByIndicatorBlock _Nonnull)jobsResetIndicator API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByIndicatorColorTransformerBlock _Nonnull)jobsResetIndicatorColorTransformer API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByContentInsetsBlock _Nonnull)jobsResetContentInsets API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByBaseForegroundColorBlock _Nonnull)jobsResetTitleBaseForegroundColor API_AVAILABLE(ios(16.0));
/// UIButtonConfiguration 没有对subTitle字体颜色的描述
-(JobsReturnButtonConfigurationByBaseForegroundColorBlock _Nonnull)jobsResetSubTitleBaseForegroundColor API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByFontBlock _Nonnull)jobsResetTitleFont API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByFontBlock _Nonnull)jobsResetSubTitleFont API_AVAILABLE(ios(16.0));

@end

NS_ASSUME_NONNULL_END
