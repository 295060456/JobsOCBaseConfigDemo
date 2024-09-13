//
//  UILabel+RichText.m
//  UBallLive
//
//  Created by Jobs on 2020/11/4.
//

#import "NSObject+RichText.h"

@implementation NSObject (RichText)
/// 调用示例：对外输出 NSMutableArray <JobsRichTextConfig *>*
-(NSMutableArray <JobsRichTextConfig *>*)makeRichTextConfigMutArr{
    UIColor *color = [UIColor gradientCorDataMutArr:jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        data.add(RGB_COLOR(247, 131, 97));
        data.add(RGB_COLOR(245, 75, 100));
    })
                                         startPoint:CGPointZero
                                           endPoint:CGPointZero
                                             opaque:NO
                                     targetViewRect:CGRectMake(0,
                                                               0,
                                                               JobsWidth(400),
                                                               JobsWidth(1))];
    JobsRichTextConfig *config_01 = JobsRichTextConfig.new;
    config_01.font = UIFontWeightRegularSize(10.6);
    config_01.textCor = RGB_SAMECOLOR(115);
    config_01.targetString = JobsInternationalization(@"我是第一段文字");

    JobsRichTextConfig *config_02 = JobsRichTextConfig.new;
    config_02.font = UIFontWeightRegularSize(10.6);;
    config_02.textCor = color;
    config_02.targetString = JobsInternationalization(@"我是第二段文字");
    
    NSMutableArray *dataMutArr = NSMutableArray.array;
    [dataMutArr addObject:config_01];
    [dataMutArr addObject:config_02];
    
    return dataMutArr;
}
/// 整合输出富文本，作用于lable.attributedText
/// @param richTextDataConfigMutArr 富文本的配置集合,对该纯文本字符串的释义
/// @param paragraphStyle 段落样式
-(NSMutableAttributedString *_Nullable)richTextWithDataConfigMutArr:(NSArray <JobsRichTextConfig *>*_Nonnull)richTextDataConfigMutArr
                                                     paragraphStyle:(NSMutableParagraphStyle *_Nullable)paragraphStyle{
    
    if (!paragraphStyle) {
        paragraphStyle = NSMutableParagraphStyle.new;
        paragraphStyle.alignment = NSTextAlignmentLeft;//❤️文本对齐方式 左右对齐（两边对齐）,textAlignment属性失效❤️
    }
    /// 设置段落样式
    NSMutableAttributedString *attributedString = self.richTextWithDataConfigMutArr(richTextDataConfigMutArr);
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, attributedString.string.length)];
//    [attributedString endEditing];
    return attributedString;
}
/// 利用 NSArray <JobsRichTextConfig *>* 形成富文本
-(JobsReturnAttributedStringByRichTextConfigArrayBlock _Nonnull)richTextWithDataConfigMutArr{
    /// richTextDataConfigMutArr 富文本的配置集合,对该纯文本字符串的释义
    /// JobsRichTextConfig：富文本里面单个字符单元的配置
    return ^(NSArray <JobsRichTextConfig *>*_Nullable richTextDataConfigMutArr) {
        NSString *resultString = @"";
        /// 先拼接字符串
        for (JobsRichTextConfig *config in richTextDataConfigMutArr) {
            if (config.targetString) {
                resultString = resultString.add(config.targetString);
                NSLog(@"resultString = %@",resultString);
            }
        }
        NSLog(@"resultString = %@",resultString);
        NSMutableAttributedString *attrString = JobsMutAttributedString(resultString);
        if (!richTextDataConfigMutArr || !richTextDataConfigMutArr.count) return attrString;
        ///  因为NSArray <JobsRichTextConfig *>* 是动态。进方法以后为固定，那么以此计算真正的range
        NSUInteger currentFrontLocation = 0;//当前位置（前）
        for (JobsRichTextConfig *config in richTextDataConfigMutArr) {
            config.range = NSMakeRange(currentFrontLocation, config.targetString.length);
            currentFrontLocation  += config.targetString.length;
        }
        for (JobsRichTextConfig *config in richTextDataConfigMutArr){
            /// 添加字体 & 设置作用域
            if (config.font) {
                [attrString addAttribute:NSFontAttributeName
                                   value:config.font
                                   range:config.range];
            }
            /// 添加文字颜色 & 设置作用域
            if (config.textCor) {
                [attrString addAttribute:NSForegroundColorAttributeName
                                   value:config.textCor
                                   range:config.range];
            }
            /// 添加下划线 & 设置作用域
            if (config.underlineStyle) {
                [attrString addAttribute:NSUnderlineStyleAttributeName
                                   value:[NSNumber numberWithInteger:config.underlineStyle]
                                   range:config.range];
            }
            /// 添加段落样式 & 设置作用域
            if (config.paragraphStyle) {
                [attrString addAttribute:NSParagraphStyleAttributeName
                                   value:config.paragraphStyle
                                   range:config.range];
            }
            /// 添加链接 & 设置作用域
            if (config.urlStr) {
                [attrString addAttribute:NSLinkAttributeName
                                   value:config.urlStr
                                   range:config.range];
            }
        }return attrString;
    };
}
/// 字符串中划线
-(JobsReturnAttributedStringByStringBlock _Nonnull)jobsHorizontalCentralLineation{
    return ^NSMutableAttributedString *(NSString *data) {
        return JobsMutAttributedStringByAttributes(data,
                                             @{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]});
    };
}
/// 字符串下划线
-(JobsReturnAttributedStringByStringBlock _Nonnull)jobsHorizontalBottomLineation{
    return ^NSMutableAttributedString *(NSString *data) {
        return JobsMutAttributedStringByAttributes(data,
                                                   @{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]});
    };
}

@end
