//
//  NSString+Statistics.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "NSString+Others.h"

#ifndef StatisticsAlphabetNumberType_h
#define StatisticsAlphabetNumberType_h
typedef NS_ENUM(NSInteger, StatisticsAlphabetNumberType) {
    StatisticsAlphabetNumberType_Chinese = 0,  /// 统计汉字字数
    StatisticsAlphabetNumberType_English      /// 统计英文字母数字
};
#endif /* StatisticsAlphabetNumberType_h */

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Statistics)
#pragma mark —— 字符串的 统计 & 计算
/**
 NSStringDrawingUsesLineFragmentOrigin 是一个 NSStringDrawingOptions枚举值，用于指定字符串绘制时的绘制选项。
 这个选项主要用于计算字符串绘制的矩形框时，特别是在多行文本绘制中，以确定每行文本的起始点和高度。
 具体来说，它的作用是告诉绘制函数使用文本行片段的原点（origin）来确定每行的位置。

 在绘制多行文本时，每一行的高度可能不同，而且行与行之间可能有不同的行间距。
 NSStringDrawingUsesLineFragmentOrigin 选项会考虑这些因素，确保计算的矩形框正确地包含文本的每一行，并使用行片段的原点作为起始点。

 这个选项通常与 boundingRectWithSize:options:attributes:context: 方法一起使用，该方法用于计算字符串在给定约束大小下的绘制矩形框。
 如果不使用 NSStringDrawingUsesLineFragmentOrigin 选项，计算的矩形框可能会不准确，尤其是在包含多行文本和不同行间距的情况下。
 */
/// 求字符串所占用的控件的高度
/// - Parameters:
///   - font: 字符串的字体（不能为空）
///   - lineSpacing: 字符串的行间距
///   - controlWidth: 字符串所占用的承接的控件的宽度
-(UITextModel *_Nullable)jobsTextHeightWithFont:(UIFont *_Nonnull)font
                                     lineHeight:(CGFloat)lineSpacing
                                   controlWidth:(CGFloat)controlWidth;
/// 求字符串所占用的控件的宽度
/// - Parameters:
///   - font: 字符串的字体（不能为空）
///   - lineSpacing: 字符串的行间距
///   - controlHeight: 字符串所占用的承接的控件的高度
-(UITextModel *_Nullable)jobsTextWidthWithFont:(UIFont *_Nonnull)font
                                    lineHeight:(CGFloat)lineSpacing
                                 controlHeight:(CGFloat)controlHeight;
/// 获取一行字符串的高度
/// 这个方法仅计算文本本身的高度，不包括行间距等因素
-(JobsReturnCGFloatByFontBlock _Nonnull)widthBy;
/// 求一个字符串的长度
-(JobsReturnCGFloatByFontBlock _Nonnull)lenthByFont;
/**
 系统的length是不区分中文和英文的,中文一个字length也是1
 通过计算ASCII码来实现:
 循环遍历字符串长度，按照length来取值。判断这个值在不在ASCII的范围内，在的话就是1个字节，不在就是Unicode编码2个字节。
 */
-(NSUInteger)textLength;
/// 统计字符串中中英文的字数
-(JobsReturnByNSIntegerBlock _Nonnull)statisticsAlphabetNumberByType;

@end

NS_ASSUME_NONNULL_END
