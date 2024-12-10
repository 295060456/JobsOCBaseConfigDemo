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
/// 对系统方法 initWithString 的二次封装
+(JobsReturnAttributedStringByStringBlock _Nonnull)initByString;
/// 获取 NSAttributedString.文本字体
-(JobsReturnFontByVoidBlock _Nonnull)attributedStringFont;
/// 获取 NSAttributedString.文本颜色
-(JobsReturnFontByVoidBlock _Nonnull)attributedStringTextCor;
/// 获取 NSAttributedString.段落信息
-(JobsReturnParagraphStyleByVoidBlock _Nonnull)attributedStringParagraphStyle;
/// 将富文本的颜色统一进行设置
-(JobsReturnAttributedStringByColorBlock _Nonnull)changeTextColorBy;
/// 移除超链接属性
-(NSAttributedString *_Nonnull)removeHyperlinks;

@end

NS_ASSUME_NONNULL_END
