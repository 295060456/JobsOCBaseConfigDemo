//
//  UIButton+SimplyMake.h
//  FM
//
//  Created by User on 9/9/24.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "JobsMakes.h"
#import "DefineProperty.h"
#import "BaseProtocol.h"
#import "UIButton+UI.h"

NS_ASSUME_NONNULL_BEGIN
/// 对按钮创建方法的二次封装
@interface UIButton (SimplyMake)<BaseProtocol>
Prop_copy(nullable)jobsByTimerManagerBlock heartBeatBlock;/// 用于计时器
Prop_copy(nullable)jobsByBtnBlock clickBlock;
Prop_copy(nullable)jobsByBtnBlock longPressGestureBlock;
#pragma mark —— 对老Api进行二次封装
+(JobsRetBtnByNSIntegerBlock _Nonnull)initByType;
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
+(JobsRetBtnByStringBlock _Nonnull)initByTitle;
/// 仅仅依靠主标题富文本内容进行创建
+(JobsRetBtnByAttributedStringBlock _Nonnull)initByAttributedString;
/// 仅仅靠按钮图片进行创建
+(JobsRetBtnByImageBlock _Nonnull)initByNormalImage;
/// 仅仅依靠按钮背景图进行创建
+(JobsRetBtnByImageBlock _Nonnull)initByBackgroundImage;
#pragma mark —— 对副标题进行创建
/// 仅仅依靠（主/副）标题内容（普通文本）进行创建
+(JobsRetBtnByTitlesBlock _Nonnull)initByTitles;
/// 仅仅依靠（主标题+副标题）富文本内容进行创建
+(JobsRetBtnByAttributedStringsBlock _Nonnull)initByAttributedStrings;
#pragma mark —— 依靠多数据进行较为复杂的创建
/// 依靠标题内容和字体大小进行创建
+(JobsRetBtnByStyle1Block _Nonnull)initByTitle_font;
/// 依靠标题内容（普通文本）、字体大小、文字颜色进行创建
+(JobsRetBtnByStyle2Block _Nonnull)initByStyle1;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮图片进行创建
+(JobsRetBtnByStyle3Block _Nonnull)initByStyle2;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮背景图片进行创建
+(JobsRetBtnByStyle4Block _Nonnull)initByStyle3;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮图片、按钮背景图片进行创建
+(JobsRetBtnByStyle5Block _Nonnull)initByStyle4;
/// 依靠文字内容、字体大小、文字颜色、按钮图片、图文距离进行创建
+(JobsRetBtnByStyle3Block _Nonnull)initByStyle5;
/// 图文混排（图片在上边 ）
+(JobsRetBtnByStyle7Block _Nonnull)initByStyleTop;
/// 图文混排（图片在左边 ）
+(JobsRetBtnByStyle7Block _Nonnull)initByStyleLeft;
/// 图文混排（图片在下边 ）
+(JobsRetBtnByStyle7Block _Nonnull)initByStyleBottom;
/// 图文混排（图片在右边 ）
+(JobsRetBtnByStyle7Block _Nonnull)initByStyleRight;
#pragma mark —— 依靠数据束进行创建
+(JobsRetBtnByVoidBlock _Nonnull)jobsInit;
/// 依靠UIViewModel进行创建
+(JobsReturnButtonByViewModelBlock _Nonnull)initByViewModel;
/// 依靠UIButtonModel进行创建
+(JobsReturnButtonByButtonModelBlock _Nonnull)initByButtonModel;
/// 依靠UITextModel进行创建
+(JobsReturnButtonByTextModelBlock _Nonnull)initByTextModel;
#pragma mark —— 一些公有方法
-(JobsReturnButtonByClickBlocks _Nonnull)onClickBy;
-(JobsReturnButtonByClickBlocks _Nonnull)onLongPressGestureBy;
-(JobsReturnButtonByTimerManagerBlocks _Nonnull)heartBeatBy;
-(JobsRetBtnByCorBlock _Nonnull)bgColorBy;
-(JobsRetBtnByCGFloatBlock _Nonnull)cornerRadiusValueBy;
#pragma mark —— 依据数据源进行按钮的统一重设
-(JobsReturnButtonByViewModelAndBOOLBlock _Nonnull)resetByViewModel;
-(JobsReturnButtonByButtonModelAndBOOLBlock _Nonnull)resetByButtonModel;

@end

NS_ASSUME_NONNULL_END
#pragma mark —— UIButton
NS_INLINE __kindof UIButton *_Nonnull jobsMakeButton(jobsByBtnBlock _Nonnull block){
    UIButton *data = UIButton.jobsInit();
    if (block) block(data);
    return data;
}
/**
 
 -(UIButton *)mailBtn{
     if(!_mailBtn){
         @jobs_weakify(self)
         _mailBtn = BaseButton.jobsInit()
             .imageURL(@"".jobsUrl)
             .placeholderImage(@"用户默认头像".img)
             .options(SDWebImageRefreshCached)/// 强制刷新缓存
             .completed(^(UIImage * _Nullable image,
                          NSError * _Nullable error,
                          SDImageCacheType cacheType,
                          NSURL * _Nullable imageURL) {
                 if (error) {
                     JobsLog(@"图片加载失败: %@-%@", error,imageURL);
                 } else {
                     JobsLog(@"图片加载成功");
                 }
             }).onClickBy(^(UIButton *x){
                 @jobs_strongify(self)
                 if (self.objBlock) self.objBlock(x);
             }).onLongPressGestureBy(^(id data){
             JobsLog(@"");
         }).bgNormalLoad();
     }return _mailBtn;
 }
 
 -(UIButton *)valueBtn{
     if(!_valueBtn){
         @jobs_weakify(self)
         _valueBtn = BaseButton.jobsInit()
                          .bgColorBy(JobsWhiteColor)
                          .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                          .jobsResetImagePadding(1)
                          .jobsResetBtnImage(@"APPLY NOW".img)
                          .jobsResetBtnBgImage(@"APPLY NOW".img)
                          .jobsResetBtnTitleCor(JobsWhiteColor)
                          .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                          .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
                          .onClickBy(^(UIButton *x){
                              JobsLog(@"");
                          }).onLongPressGestureBy(^(id data){
                              JobsLog(@"");
                          });
     }return _valueBtn;
 }
 
 -(UIButton *)usrNameBtn{
     if(!_usrNameBtn){
         @jobs_weakify(self)
         _usrNameBtn = self.byAdd(UIButton.jobsInit()
                                       .bgColorBy(JobsWhiteColor)
                                       .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                                       .jobsResetImagePadding(1)
                                       .jobsResetBtnImage(@"APPLY NOW".img)
                                       .jobsResetBtnBgImage(@"APPLY NOW".img)
                                       .jobsResetBtnTitleCor(JobsWhiteColor)
                                       .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                                       .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
                                       .onClickBy(^(UIButton *x){
                                           JobsLog(@"");
                                       }).onLongPressGestureBy(^(id data){
                                           JobsLog(@"");
                                       }),^(MASConstraintMaker *_Nonnull make){
             @jobs_strongify(self)
             make.top.equalTo(self.headIMGV);
             make.left.equalTo(self.headIMGV.mas_right).offset(JobsWidth(10));
             make.height.mas_equalTo(JobsWidth(16));
         });
         _usrNameBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
     }return _usrNameBtn;
 }
 
 -(BaseButton *)applyNowBtn{
     if(!_applyNowBtn){
         @jobs_weakify(self)
         _applyNowBtn = BaseButton.initByAttributedString(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof JobsRichTextConfig *>* _Nullable data) {
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#666666");
                 data1.targetString = self.richTextMutArr[0];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }))
             .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#BA9B77");
                 data1.targetString = self.richTextMutArr[1];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }))
             .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#666666");
                 data1.targetString = self.richTextMutArr[2];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
         }))).bgColorBy(JobsWhiteColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(@"APPLY NOW".img)
             .jobsResetBtnBgImage(@"APPLY NOW".img))
             .jobsResetBtnTitleCor(JobsWhiteColor)
             .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
             .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
             .onClickBy(^(UIButton *x){
                 @jobs_strongify(self)
                 x.selected = !x.selected;
                 if (self.objBlock) self.objBlock(x);
             }).onLongPressGestureBy(^(id data){
                 JobsLog(@"");
             });
     }return _applyNowBtn;
 }
 
 -(BaseButton *)registerBtn{
     if(!_registerBtn){
         _registerBtn = BaseButton.initByTextModel(jobsMakeTextModel(^(__kindof UITextModel * _Nullable data) {
             data.text = JobsInternationalization(@"REGISTER");
             data.textCor = JobsCor(@"#C90000");
             data.font = bayonRegular(JobsWidth(15));
         }))
         .bgColorBy(JobsWhiteColor)
         .onClickBy(^(UIButton *x){
             JobsLog(@"");
         }).onLongPressGestureBy(^(id data){
             JobsLog(@"");
         }).setLayerBy((jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
             data.layerCor = JobsCor(@"#C90000");
             data.jobsWidth = 1;
             data.cornerRadiusValue = JobsWidth(8);
         })));
     }return _registerBtn;
 }
 
 */
