//
//  UIButton+SimplyMake.h
//  FM
//
//  Created by User on 9/9/24.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "UIButton+UI.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 对按钮创建方法的二次封装
@interface UIButton (SimplyMake)

@property(nonatomic,copy)jobsByTimerManagerBlock heartBeatBlock;/// 用于计时器
@property(nonatomic,copy)jobsByBtnBlock clickBlock;
@property(nonatomic,copy)jobsByBtnBlock longPressGestureBlock;
#pragma mark —— 对老Api进行二次封装
+(JobsReturnButtonByNSIntegerBlock _Nonnull)initByType;
+(__kindof UIButton *)initByCustomType;
+(__kindof UIButton *)initBySysType API_AVAILABLE(ios(7.0));
+(__kindof UIButton *)initByDetailDisclosureType;
+(__kindof UIButton *)initByInfoLightType;
+(__kindof UIButton *)initByInfoDarkType;
+(__kindof UIButton *)initByContactAddType;
+(__kindof UIButton *)initByPlainType API_AVAILABLE(tvos(11.0)) API_UNAVAILABLE(ios, watchos);
+(__kindof UIButton *)initByCloseType API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(tvos, watchos);
#pragma mark —— 依靠单一数据进行简单创建
/// 仅仅依靠主标题内容（普通文本）进行创建
+(JobsReturnButtonByStringBlock _Nonnull)initByTitle;
/// 仅仅依靠主标题富文本内容进行创建
+(JobsReturnButtonByAttributedStringBlock _Nonnull)initByAttributedString;
/// 仅仅靠按钮图片进行创建
+(JobsReturnButtonByImageBlock _Nonnull)initByNormalImage;
/// 仅仅依靠按钮背景图进行创建
+(JobsReturnButtonByImageBlock _Nonnull)initByBackgroundImage;
#pragma mark —— 对副标题进行创建
/// 仅仅依靠（主/副）标题内容（普通文本）进行创建
+(JobsReturnButtonByTitlesBlock _Nonnull)initByTitles;
/// 仅仅依靠（主标题+副标题）富文本内容进行创建
+(JobsReturnButtonByAttributedStringsBlock _Nonnull)initByAttributedStrings;
#pragma mark —— 依靠多数据进行较为复杂的创建
/// 依靠标题内容和字体大小进行创建
+(JobsReturnButtonByStyle1Block _Nonnull)initByTitle_font;
/// 依靠标题内容（普通文本）、字体大小、文字颜色进行创建
+(JobsReturnButtonByStyle2Block _Nonnull)initByStyle1;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮图片进行创建
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyle2;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮背景图片进行创建
+(JobsReturnButtonByStyle4Block _Nonnull)initByStyle3;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮图片、按钮背景图片进行创建
+(JobsReturnButtonByStyle5Block _Nonnull)initByStyle4;

/// 依靠文字内容、字体大小、文字颜色、按钮图片、图文距离进行创建
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyle5;
/// 图文混排（图片在上边 ）
+(JobsReturnButtonByStyle3_1Block _Nonnull)initByStyleTop;
/// 图文混排（图片在左边 ）
+(JobsReturnButtonByStyle3_1Block _Nonnull)initByStyleLeft;
/// 图文混排（图片在下边 ）
+(JobsReturnButtonByStyle3_1Block _Nonnull)initByStyleBottom;
/// 图文混排（图片在右边 ）
+(JobsReturnButtonByStyle3_1Block _Nonnull)initByStyleRight;
#pragma mark —— 依靠数据束进行创建
+(JobsReturnButtonByVoidBlock _Nonnull)jobsInit;
/// 依靠UIViewModel进行创建
+(JobsReturnButtonByViewModelBlock _Nonnull)initByViewModel;
/// 依靠UIButtonModel进行创建
+(JobsReturnButtonByButtonModelBlock _Nonnull)initByButtonModel;
/// 依靠UITextModel进行创建
+(JobsReturnButtonByTextModelBlock _Nonnull)initByTextModel;
#pragma mark —— 一些公有方法
-(JobsReturnButtonByClickBlock _Nonnull)onClickBy;
-(JobsReturnButtonByClickBlock _Nonnull)onLongPressGestureBy;
-(JobsReturnButtonByTimerManagerBlock _Nonnull)heartBeatBy;
-(JobsReturnButtonByColorBlock _Nonnull)bgColorBy;
-(JobsReturnButtonByCGFloatBlock _Nonnull)cornerRadiusValueBy;

@end

NS_ASSUME_NONNULL_END
#pragma mark —— UIButton
NS_INLINE __kindof UIButton *_Nonnull jobsMakeButton(jobsByBtnBlock _Nonnull block){
    UIButton *data = UIButton.jobsInit();
    if (block) block(data);
    return data;
}
#pragma mark —— UIButtonConfiguration
NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakePlainButtonConfiguration(jobsByButtonConfigurationBlock _Nonnull block){
    UIButtonConfiguration *data = UIButtonConfiguration.plainButtonConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeTintedButtonConfiguration(jobsByButtonConfigurationBlock _Nonnull block){
    UIButtonConfiguration *data = UIButtonConfiguration.tintedButtonConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeGrayButtonConfiguration(jobsByButtonConfigurationBlock _Nonnull block){
    UIButtonConfiguration *data = UIButtonConfiguration.grayButtonConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeFilledButtonConfiguration(jobsByButtonConfigurationBlock _Nonnull block){
    UIButtonConfiguration *data = UIButtonConfiguration.filledButtonConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeBorderlessButtonConfiguration(jobsByButtonConfigurationBlock _Nonnull block){
    UIButtonConfiguration *data = UIButtonConfiguration.borderlessButtonConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeBorderedButtonConfiguration(jobsByButtonConfigurationBlock _Nonnull block){
    UIButtonConfiguration *data = UIButtonConfiguration.borderedButtonConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeBorderedTintedButtonConfiguration(jobsByButtonConfigurationBlock _Nonnull block){
    UIButtonConfiguration *data = UIButtonConfiguration.borderedTintedButtonConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIButtonConfiguration *_Nonnull jobsMakeBorderedProminentButtonConfiguration(jobsByButtonConfigurationBlock _Nonnull block){
    UIButtonConfiguration *data = UIButtonConfiguration.borderedProminentButtonConfiguration;
    if (block) block(data);
    return data;
}
#pragma mark —— UIBackgroundConfiguration
NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull jobsMakeClearConfiguration(jobsByBackgroundConfigurationBlock _Nonnull block){
    UIBackgroundConfiguration *data = UIBackgroundConfiguration.clearConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull jobsMakeListCellConfiguration(jobsByBackgroundConfigurationBlock _Nonnull block) API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos){
    UIBackgroundConfiguration *data = UIBackgroundConfiguration.listCellConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull jobsMakeListHeaderConfiguration(jobsByBackgroundConfigurationBlock _Nonnull block) API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos){
    UIBackgroundConfiguration *data = UIBackgroundConfiguration.listHeaderConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull jobsMakeListFooterConfiguration(jobsByBackgroundConfigurationBlock _Nonnull block) API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos){
    UIBackgroundConfiguration *data = UIBackgroundConfiguration.listFooterConfiguration;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UIBackgroundConfiguration *_Nonnull jobsMakeListAccompaniedSidebarCellConfiguration(jobsByBackgroundConfigurationBlock _Nonnull block) API_UNAVAILABLE(tvos, watchos){
    UIBackgroundConfiguration *data = UIBackgroundConfiguration.listAccompaniedSidebarCellConfiguration;
    if (block) block(data);
    return data;
}

/**
 
 _headBtn = BaseButton.jobsInit()
     .imageURL(@"".jobsUrl)
     .placeholderImage(JobsIMG(@"小狮子"))
     .options(SDWebImageRefreshCached)/// 强制刷新缓存
     .completed(^(UIImage * _Nullable image,
                  NSError * _Nullable error,
                  SDImageCacheType cacheType,
                  NSURL * _Nullable imageURL) {
         if (error) {
             NSLog(@"图片加载失败: %@-%@", error,imageURL);
         } else {
             NSLog(@"图片加载成功");
         }
     }).onClickBy(^(UIButton *x){
         @jobs_strongify(self)
         if (self.objectBlock) self.objectBlock(x);
     }).onLongPressGestureBy(^(id data){
     NSLog(@"");
 }).bgNormalLoad();
 
 _applyNowBtn = BaseButton.jobsInit()
     .bgColorBy(JobsWhiteColor)
     .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
     .jobsResetImagePadding(1)
     .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
     .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
     .jobsResetBtnTitleCor(JobsWhiteColor)
     .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
     .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
     .onClickBy(^(UIButton *x){
         NSLog(@"");
     }).onLongPressGestureBy(^(id data){
         NSLog(@"");
     });
 
 -(BaseButton *)applyNowBtn{
     if(!_applyNowBtn){
         @jobs_weakify(self)
         _applyNowBtn = BaseButton.initByAttributedString(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#666666");
                 data1.targetString = self.richTextMutArr[0];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#BA9B77");
                 data1.targetString = self.richTextMutArr[1];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#666666");
                 data1.targetString = self.richTextMutArr[2];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
         }))).bgColorBy(JobsWhiteColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnTitleCor(JobsWhiteColor)
             .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
             .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
             .onClickBy(^(UIButton *x){
                 @jobs_strongify(self)
                 x.selected = !x.selected;
                 if (self.objectBlock) self.objectBlock(x);
             }).onLongPressGestureBy(^(id data){
                 NSLog(@"");
             });
     }return _applyNowBtn;
 }
 
 */
