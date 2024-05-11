//
//  UILabel+RichText.m
//  UBallLive
//
//  Created by Jobs on 2020/11/4.
//

#import "NSObject+RichText.h"

@implementation RichTextConfig
#pragma mark —— default
-(NSMutableParagraphStyle *)paragraphStyle{
    if (!_paragraphStyle) {
        _paragraphStyle = NSMutableParagraphStyle.new;
        /// 行间距
        _paragraphStyle.lineSpacing = JobsWidth(10);
        /// 段落间距
        _paragraphStyle.paragraphSpacing = JobsWidth(20);
        /// 对齐方式
        _paragraphStyle.alignment = NSTextAlignmentLeft;
        /// 指定段落开始的缩进像素
        _paragraphStyle.firstLineHeadIndent = JobsWidth(30);
        /// 调整全部文字的缩进像素
        _paragraphStyle.headIndent = JobsWidth(10);
    }return _paragraphStyle;
}

-(NSString *)urlStr{
    if (!_urlStr) {
//        _urlStr = @"www.google.com";
    }return _urlStr;
}

@end

@implementation NSObject (RichText)
/// 调用示例：对外输出 NSMutableArray <RichTextConfig *>*
-(NSMutableArray <RichTextConfig *>*)makeRichTextConfigMutArr{
    UIColor *color = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[RGB_COLOR(247, 131, 97),RGB_COLOR(245, 75, 100)]]
                                         startPoint:CGPointZero
                                           endPoint:CGPointZero
                                             opaque:NO
                                     targetViewRect:CGRectMake(0,
                                                               0,
                                                               JobsWidth(400),
                                                               JobsWidth(1))];
    RichTextConfig *config_01 = RichTextConfig.new;
    config_01.font = UIFontWeightRegularSize(10.6);
    config_01.textCor = RGB_SAMECOLOR(115);
    config_01.targetString = Internationalization(@"我是第一段文字");

    RichTextConfig *config_02 = RichTextConfig.new;
    config_02.font = UIFontWeightRegularSize(10.6);;
    config_02.textCor = color;
    config_02.targetString = Internationalization(@"我是第二段文字");
    
    NSMutableArray *dataMutArr = NSMutableArray.array;
    [dataMutArr addObject:config_01];
    [dataMutArr addObject:config_02];
    
    return dataMutArr;
}
/// 整合输出富文本，作用于lable.attributedText
/// @param richTextDataConfigMutArr 富文本的配置集合,对该纯文本字符串的释义
/// @param paragraphStyle 段落样式
-(NSMutableAttributedString *_Nullable)richTextWithDataConfigMutArr:(NSArray <RichTextConfig *>*_Nonnull)richTextDataConfigMutArr
                                                     paragraphStyle:(NSMutableParagraphStyle *_Nullable)paragraphStyle{
    
    if (!paragraphStyle) {
        paragraphStyle = NSMutableParagraphStyle.new;
        paragraphStyle.alignment = NSTextAlignmentLeft;//❤️文本对齐方式 左右对齐（两边对齐）,textAlignment属性失效❤️
    }
    /// 设置段落样式
    NSMutableAttributedString *attributedString = [self richTextWithDataConfigMutArr:richTextDataConfigMutArr];
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, attributedString.string.length)];
//    [attributedString endEditing];
    return attributedString;
}
/// 利用 NSArray <RichTextConfig *>* 形成富文本
/// @param richTextDataConfigMutArr 富文本的配置集合,对该纯文本字符串的释义
-(NSMutableAttributedString *_Nullable)richTextWithDataConfigMutArr:(NSArray <RichTextConfig *>*_Nonnull)richTextDataConfigMutArr{
    NSString *resultString = @"";
    /// 先拼接字符串
    for (RichTextConfig *config in richTextDataConfigMutArr) {
        if (config.targetString) {
            resultString = [resultString stringByAppendingString:config.targetString];
            NSLog(@"resultString = %@",resultString);
        }
    }
    
    NSLog(@"resultString = %@",resultString);
    NSMutableAttributedString *attrString = [NSMutableAttributedString.alloc initWithString:resultString];
    ///  因为NSArray <RichTextConfig *>* 是动态。进方法以后为固定，那么以此计算真正的range
    NSUInteger currentFrontLocation = 0;//当前位置（前）
    for (RichTextConfig *config in richTextDataConfigMutArr) {
        config.range = NSMakeRange(currentFrontLocation, config.targetString.length);
        currentFrontLocation  += config.targetString.length;
    }
    
    for (RichTextConfig *config in richTextDataConfigMutArr){
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
}
/// 字符串中划线
-(JobsReturnAttributedStringByStringBlock _Nonnull)jobsHorizontalCentralLineation{
    @jobs_weakify(self)
    return ^(NSString *data) {
        @jobs_strongify(self)
        return [NSMutableAttributedString.alloc initWithString:data
                                                    attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
    };
}
/// 字符串下划线
-(JobsReturnAttributedStringByStringBlock _Nonnull)jobsHorizontalBottomLineation{
    @jobs_weakify(self)
    return ^(NSString *data) {
        @jobs_strongify(self)
        return [NSMutableAttributedString.alloc initWithString:data
                                                    attributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
    };
}

@end
