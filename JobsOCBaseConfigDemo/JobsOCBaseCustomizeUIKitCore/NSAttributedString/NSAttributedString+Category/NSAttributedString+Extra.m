//
//  NSAttributedString+Extra.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "NSAttributedString+Extra.h"

@implementation NSAttributedString (Extra)
/// 获取 NSAttributedString.文本字体
-(UIFont *)attributedStringFont{
    return [self attribute:NSFontAttributeName atIndex:0 effectiveRange:NULL];
}
/// 获取 NSAttributedString.文本颜色
-(UIFont *)attributedStringTextCor{
    return [self attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:NULL];
}
/// 获取 NSAttributedString.段落信息
-(NSParagraphStyle *)attributedStringParagraphStyle{
    NSRange range = NSMakeRange(0, self.length);
    NSDictionary *attributes = [self attributesAtIndex:0 effectiveRange:&range];
    NSParagraphStyle *paragraphStyle = attributes[NSParagraphStyleAttributeName];
    return paragraphStyle;
}

@end
