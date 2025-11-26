//
//  BaseTextView.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/27.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "NSObject+AttributedStr.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTextView : UITextView

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BaseTextView *_Nonnull jobsMakeBaseTextView(jobsByBaseTextViewBlock _Nonnull block){
    BaseTextView *data = BaseTextView.alloc.init;
    data.linkTextAttributes = NSObject.linkTextAttributes;
    if (block) block(data);
    return data;
}
/**
 -(BaseTextView *)tipsTextView{
     if (!_tipsTextView) {
         @jobs_weakify(self)
         _tipsTextView = jobsMakeBaseTextView(^(__kindof BaseTextView * _Nullable textView) {
             @jobs_strongify(self)
             textView.byDelegate(self)
             .byEditable(NO)
             .byLinkTextAttributes(@{NSForegroundColorAttributeName:HEXCOLOR(0xCCB17E)})
             .byUserInteractionEnabled(YES)
             .byAttributedText(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
                 data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable config) {
                     config.font = UIFontWeightRegularSize(JobsWidth(12));
                     config.textCor = JobsWhiteColor;
                     config.targetString = @"Already have account?".tr;
             //        config.textBgCor = UIColor.clearColor;
                     config.paragraphStyle = self.defaultParagraphStyle;
                 }));
                 data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable config) {
                     config.font = UIFontWeightRegularSize(JobsWidth(12));
                     config.textCor = JobsCor(@"#FFC700");
                     config.targetString = @" ".add(@"Login Here".tr);
             //        config.textBgCor = UIColor.clearColor;
                     config.paragraphStyle = self.defaultParagraphStyle;
                     config.urlStr = @"www.google.com";
                 }));
             }))).byBgCor(JobsClearColor);
             
             textView.textContainer.lineFragmentPadding = 0;
             textView.layoutManager.allowsNonContiguousLayout = YES;

             [self.addSubview(textView) mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.centerX.equalTo(self);
                 make.top.equalTo(self.sign_up_btn.mas_bottom).offset(JobsWidth(5));
                 make.height.mas_equalTo(JobsWidth(25));
                 make.width.mas_equalTo(JobsWidth(233));
             }];
         });
     }return _tipsTextView;
 }
 */
