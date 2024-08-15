//
//  NSMutableAttributedString+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
/// 创建富文本
static inline NSAttributedString * _Nonnull JobsAttributedString(NSString * _Nonnull data) {
    if (!data) data = @"";
    return [[NSAttributedString alloc] initWithString:data];
}
NS_ASSUME_NONNULL_BEGIN
@interface NSMutableAttributedString (Extra)
/// OC富文本字符串拼接
-(JobsReturnMutAttributedStringByAttributedStringBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END
