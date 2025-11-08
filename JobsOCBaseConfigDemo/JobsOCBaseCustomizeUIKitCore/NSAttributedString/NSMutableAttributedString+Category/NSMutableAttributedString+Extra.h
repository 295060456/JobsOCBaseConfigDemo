//
//  NSMutableAttributedString+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import "JobsBlock.h"
#import "JobsModel.h"

NS_ASSUME_NONNULL_BEGIN
/// NSMutableAttributedString 用于设置段落样式，包括行间距、段间距、对齐方式等
@interface NSMutableAttributedString (Extra)
/// 对系统方法 initWithAttributedString 的二次封装
+(JobsRetMutableAttributedStringByAttributedStringBlock _Nonnull)initByAttributedString;
/// 对系统方法 initWithString 的二次封装
+(JobsRetMutableAttributedStringByStringBlock _Nonnull)initByString;
/// OC富文本字符串拼接
-(JobsRetAttributedStringByAttributedStringBlock _Nonnull)add;
/// 段落
-(JobsReturnMutAttributedStringByParagraphStyleModelBlock _Nonnull)addAttributeNameByParagraphStyleModel;
/// 颜色
-(JobsReturnMutAttributedStringByParagraphStyleModelBlock _Nonnull)addForegroundColorAttributeNameByParagraphStyleModel;
/// 字体
-(JobsReturnMutAttributedStringByParagraphStyleModelBlock _Nonnull)addFontAttributeNameByParagraphStyleModel;
/// 设置下划线
-(JobsReturnMutAttributedStringByParagraphStyleModelBlock _Nonnull)addUnderlineStyleAttributeNameByParagraphStyleModel;
/// 设置下划线的颜色
-(JobsReturnMutAttributedStringByParagraphStyleModelBlock _Nonnull)addUnderlineColorAttributeNameByParagraphStyleModel;
/// 超链接
-(JobsReturnMutAttributedStringByParagraphStyleModelBlock _Nonnull)addLinkAttributeNameByParagraphStyleModel;
/// 设置富文本的字符间距
-(JobsReturnMutAttributedStringByParagraphStyleModelBlock _Nonnull)addkCTKernAttributeNameByParagraphStyleModel;

@end

NS_ASSUME_NONNULL_END
/**
 
 #import <CoreText/CoreText.h>
 
 kCTFontAttributeName    设置字体 (CTFontRef)
 kCTForegroundColorAttributeName    设置字体颜色 (CGColorRef)
 kCTKernAttributeName    设置字符间距
 kCTParagraphStyleAttributeName    设置段落样式 (CTParagraphStyleRef)
 kCTUnderlineStyleAttributeName    设置下划线样式
 
 Core Text 属性通常是 C 类型（CFTypeRef），需要桥接到 Objective-C 的 NSString 或 NSObject 类型才能与 NSAttributedString 一起使用。
 Core Text 是纯绘图框架，不会自动管理交互（如文本选择、光标移动）。如果需要交互功能，建议结合 UITextView 使用。
 使用 Core Text 时，要手动管理内存，注意释放 CF 类型对象。
 
1、创建富文本属性
 
 NSDictionary *attributes = @{
     (__bridge NSString *)kCTFontAttributeName: (__bridge id)CTFontCreateWithName(CFSTR("Helvetica"), 16, NULL),
     (__bridge NSString *)kCTForegroundColorAttributeName: [UIColor redColor].CGColor,
     (__bridge NSString *)kCTKernAttributeName: @2
 };
 NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"测试文本" attributes:attributes];

 2、绘制文本
 // 创建 CTFramesetter
 CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attrString);

 // 创建路径
 CGMutablePathRef path = CGPathCreateMutable();
 CGPathAddRect(path, NULL, CGRectMake(10, 10, 300, 200));

 // 创建 Frame
 CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrString.length), path, NULL);

 // 获取上下文
 CGContextRef context = UIGraphicsGetCurrentContext();
 CGContextSetTextMatrix(context, CGAffineTransformIdentity);
 CGContextTranslateCTM(context, 0, 200);
 CGContextScaleCTM(context, 1.0, -1.0);

 // 绘制 Frame
 CTFrameDraw(frame, context);

 // 释放资源
 CFRelease(frame);
 CFRelease(path);
 CFRelease(framesetter);

 */
