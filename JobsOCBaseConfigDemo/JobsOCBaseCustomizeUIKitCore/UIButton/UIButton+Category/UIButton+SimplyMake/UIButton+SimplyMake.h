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

@property(nonatomic,copy)jobsByBtnBlock clickBlock;
@property(nonatomic,copy)jobsByBtnBlock longPressGestureBlock;
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
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyleTop;
/// 图文混排（图片在左边 ）
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyleLeft;
/// 图文混排（图片在下边 ）
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyleBottom;
/// 图文混排（图片在右边 ）
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyleRight;
#pragma mark —— 依靠数据束进行创建
+(JobsReturnButtonByVoidBlock _Nonnull)jobsInit;
/// 依靠UIViewModel进行创建
+(JobsReturnButtonByViewModelBlock _Nonnull)initByViewModel;
/// 依靠UIButtonModel进行创建
+(JobsReturnButtonByButtonModelBlock _Nonnull)initByButtonModel;
/// 依靠UITextModel进行创建
+(JobsReturnButtonByTextModelBlock _Nonnull)initByTextModel;
#pragma mark —— 一些公有方法
-(JobsReturnButtonByClickBlock _Nonnull)onClick;
-(JobsReturnButtonByClickBlock _Nonnull)onLongPressGesture;
-(JobsReturnButtonByColorBlock _Nonnull)bgColor;
-(JobsReturnButtonByCGFloatBlock _Nonnull)cornerRadiusValue;

@end

NS_ASSUME_NONNULL_END
/**
 -(BaseButton *)applyNowBtn{
     if(!_applyNowBtn){
         _applyNowBtn = BaseButton.jobsInit()
             .bgColor(JobsWhiteColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnTitleCor(JobsWhiteColor)
             .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
             .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
             .onClick(^(UIButton *x){
                 NSLog(@"");
             }).onLongPressGesture(^(id data){
                 NSLog(@"");
             });
         [self.bgImageView addSubview:_applyNowBtn];
         [_applyNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(JobsWidth(99), JobsWidth(29)));
             make.right.equalTo(self.view).offset(JobsWidth(-166));
             make.bottom.equalTo(self.view).offset(JobsWidth(-127));
         }];
     }return _applyNowBtn;
 }
 
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
         }))).bgColor(JobsWhiteColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnTitleCor(JobsWhiteColor)
             .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
             .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
             .onClick(^(UIButton *x){
                 @jobs_strongify(self)
                 x.selected = !x.selected;
                 if (self.objectBlock) self.objectBlock(x);
             }).onLongPressGesture(^(id data){
                 NSLog(@"");
             });
     }return _applyNowBtn;
 }
 
 */
