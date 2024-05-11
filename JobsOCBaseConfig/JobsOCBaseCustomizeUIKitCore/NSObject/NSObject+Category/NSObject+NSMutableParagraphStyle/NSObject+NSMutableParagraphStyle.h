//
//  NSObject+NSMutableParagraphStyle.h
//  MataShop
//
//  Created by Jobs Hi on 10/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NSMutableParagraphStyle)
/// 居左对齐
-(NSMutableParagraphStyle *)jobsParagraphStyleLeft;
/// 居中对齐
-(NSMutableParagraphStyle *)jobsParagraphStyleCenter;
/// 居右对齐
-(NSMutableParagraphStyle *)jobsParagraphStyleRight;
/// 文本两端对齐（文本自动填充到文本框的两侧，可以在每行的开头和结尾添加额外的空格或调整字母间距，以实现两端对齐效果）
-(NSMutableParagraphStyle *)jobsParagraphStyleJustified;
/// 主要用于支持多语言和本地化的应用，以确保文本对齐方式在不同语言环境下都是合适的。
-(NSMutableParagraphStyle *)jobsParagraphStyleNatural;
/// 通过NSTextAlignment映射NSParagraphStyle *
-(NSParagraphStyle *)jobsparagraphStyleByTextAlignment:(NSTextAlignment)textAlignment;


@end

NS_ASSUME_NONNULL_END
