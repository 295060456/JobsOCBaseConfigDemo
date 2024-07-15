//
//  NSAttributedString+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// NSAttributedString 用于设置段落样式，包括行间距、段间距、对齐方式等
@interface NSAttributedString (Extra)
/// 获取 NSAttributedString.文本字体
-(UIFont *)attributedStringFont;
/// 获取 NSAttributedString.文本颜色
-(UIFont *)attributedStringTextCor;
/// 获取 NSAttributedString.段落信息
-(NSParagraphStyle *)attributedStringParagraphStyle;

@end

NS_ASSUME_NONNULL_END
