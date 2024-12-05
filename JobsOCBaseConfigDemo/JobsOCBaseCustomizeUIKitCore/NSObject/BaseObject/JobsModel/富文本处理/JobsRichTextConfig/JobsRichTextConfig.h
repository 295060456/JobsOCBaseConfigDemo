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

@property(nonatomic,copy)NSString *targetString;/// 作用文字
@property(nonatomic,strong)UIFont *font;/// 添加字体
@property(nonatomic,strong)UIColor *textCor;/// 添加文字颜色
@property(nonatomic,strong)UIColor *textBgCor;/// 添加文字背景颜色
@property(nonatomic,assign)NSUnderlineStyle underlineStyle;/// 添加下划线
@property(nonatomic,strong,null_resettable)NSMutableParagraphStyle *paragraphStyle;/// 添加段落样式
@property(nonatomic,copy)NSString *urlStr;/// 添加链接可点击
@property(nonatomic,assign)NSRange range;/// 设置作用域

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsRichTextConfig *_Nonnull jobsMakeRichTextConfig(jobsByRichTextConfigBlock _Nonnull block){
    JobsRichTextConfig *data = JobsRichTextConfig.alloc.init;
    if (block) block(data);
    return data;
}

/**
 @synthesize attributedText = _attributedText;
 -(NSAttributedString *)attributedText{
     if (!_attributedText) {
         @jobs_weakify(self)
         _attributedText = self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <JobsRichTextConfig *>*_Nullable data) {
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(JobsWidth(12));
                 data1.textCor = JobsBlueColor;
                 data1.targetString = JobsInternationalization(@"编译器自动管理内存地址").add(@"\n");
                 data1.textBgCor = JobsBrownColor;
                 data1.paragraphStyle = self.paragtaphStyle;
             }));
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightSemiboldSize(JobsWidth(13));
                 data1.textCor = JobsWhiteColor;
                 data1.targetString = JobsInternationalization(@"让程序员更加专注于").add(@"\n");
                 data1.textBgCor = JobsBrownColor;
                 data1.paragraphStyle = self.paragtaphStyle;
             }));
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightUltraLightSize(JobsWidth(14));
                 data1.textCor = JobsGreenColor;
                 data1.targetString = JobsInternationalization(@"APP的业务。");
                 data1.textBgCor = JobsBrownColor;
                 data1.paragraphStyle = self.paragtaphStyle;
             }));
         }));
     }return _attributedText;
 }
 */
