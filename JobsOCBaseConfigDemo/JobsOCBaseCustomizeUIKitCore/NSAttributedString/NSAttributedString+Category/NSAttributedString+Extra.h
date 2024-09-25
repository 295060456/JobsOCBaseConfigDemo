//
//  NSAttributedString+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// NSAttributedString 用于设置段落样式，包括行间距、段间距、对齐方式等
@interface NSAttributedString (Extra)
/// 获取 NSAttributedString.文本字体
-(JobsReturnFontByVoidBlock _Nonnull)attributedStringFont;
/// 获取 NSAttributedString.文本颜色
-(JobsReturnFontByVoidBlock _Nonnull)attributedStringTextCor;
/// 获取 NSAttributedString.段落信息
-(JobsReturnParagraphStyleByVoidBlock _Nonnull)attributedStringParagraphStyle;

@end

NS_ASSUME_NONNULL_END
