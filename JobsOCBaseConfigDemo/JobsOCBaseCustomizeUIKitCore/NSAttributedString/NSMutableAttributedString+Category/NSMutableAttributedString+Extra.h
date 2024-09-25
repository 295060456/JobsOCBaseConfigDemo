//
//  NSMutableAttributedString+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsModel.h"

NS_ASSUME_NONNULL_BEGIN
/// NSMutableAttributedString 用于设置段落样式，包括行间距、段间距、对齐方式等
@interface NSMutableAttributedString (Extra)
/// OC富文本字符串拼接
-(JobsReturnAttributedStringByAttributedStringBlock _Nonnull)add;
/// 段落
-(jobsByParagraphStyleModelBlock _Nonnull)addAttributeNameByParagraphStyleModel;
/// 颜色
-(jobsByParagraphStyleModelBlock _Nonnull)addForegroundColorAttributeNameByParagraphStyleModel;
/// 字体
-(jobsByParagraphStyleModelBlock _Nonnull)addFontAttributeNameByParagraphStyleModel;
/// 下划线
-(jobsByParagraphStyleModelBlock _Nonnull)addUnderlineStyleAttributeNameByParagraphStyleModel;
/// 超链接
-(jobsByParagraphStyleModelBlock _Nonnull)addLinkAttributeNameByParagraphStyleModel;
///
-(jobsByParagraphStyleModelBlock _Nonnull)addkCTKernAttributeNameByParagraphStyleModel;

@end

NS_ASSUME_NONNULL_END
