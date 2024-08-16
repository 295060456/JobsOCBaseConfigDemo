//
//  NSMutableAttributedString+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// NSMutableAttributedString 用于设置段落样式，包括行间距、段间距、对齐方式等
@interface NSMutableAttributedString (Extra)
/// OC富文本字符串拼接
-(JobsReturnMutAttributedStringByAttributedStringBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END
