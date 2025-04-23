//
//  JobsRichTextConfig.h
//  FM
//
//  Created by User on 7/24/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// 富文本4要素：文字信息、文字颜色、段落、字体
@interface JobsRichTextConfig : NSObject

Prop_copy()NSString *targetString;/// 作用文字
Prop_strong()UIFont *font;/// 添加字体
Prop_strong()UIColor *textCor;/// 添加文字颜色
Prop_strong()UIColor *textBgCor;/// 添加文字背景颜色
Prop_assign()NSUnderlineStyle underlineStyle;/// 添加下划线
Prop_strong()UIColor *underlineCor;/// 添加下划线的颜色
Prop_strong(null_resettable)NSMutableParagraphStyle *paragraphStyle;/// 添加段落样式
Prop_copy()NSString *urlStr;/// 添加链接可点击
Prop_assign()NSRange range;/// 设置作用域

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsRichTextConfig *_Nonnull jobsMakeRichTextConfig(jobsByRichTextConfigBlock _Nonnull block){
    JobsRichTextConfig *data = JobsRichTextConfig.alloc.init;
    if (block) block(data);
    return data;
}

/**
 /// 默认文本段落样式
 -(NSMutableParagraphStyle *)defaultParagraphStyle{
     return jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
         data.alignment = NSTextAlignmentJustified;
         data.paragraphSpacing = 0;/// 段距，取值 float
         data.paragraphSpacingBefore = 0;/// 段首空间，取值 float
         data.firstLineHeadIndent = 0.0;/// 首行缩进，取值 float
         data.headIndent = 0.0;/// 整体缩进(首行除外)，取值 float
         data.lineSpacing = 0;/// 行距，取值 float
     });
 }
 
 @synthesize attributedTitle = _attributedTitle;
 -(NSAttributedString *)attributedTitle{
     if (!_attributedTitle) {
         @jobs_weakify(self)
         _attributedTitle = self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(JobsWidth(12));
                 data1.textCor = JobsBlueColor;
                 data1.targetString = JobsInternationalization(@"编译器自动管理内存地址").add(JobsNewline);
                 data1.textBgCor = JobsBrownColor;
                 data1.paragraphStyle = self.defaultParagraphStyle;
             }))
             .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 data1.font = UIFontWeightSemiboldSize(JobsWidth(13));
                 data1.textCor = JobsWhiteColor;
                 data1.targetString = JobsInternationalization(@"让程序员更加专注于").add(JobsNewline);
                 data1.textBgCor = JobsBrownColor;
                 data1.paragraphStyle = self.defaultParagraphStyle;
             }))
             .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightUltraLightSize(JobsWidth(14));
                 data1.textCor = JobsGreenColor;
                 data1.targetString = JobsInternationalization(@"APP的业务。");
                 data1.textBgCor = JobsBrownColor;
                 data1.paragraphStyle = self.defaultParagraphStyle;
             }));
         }));
     }return _attributedTitle;
 }
 */
