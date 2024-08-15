//
//  NSMutableAttributedString+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#pragma mark —— 创建不可变富文本
static inline NSAttributedString * _Nonnull JobsAttributedString(NSString * _Nonnull data) {
    if (!data) data = @"";
    return [NSAttributedString.alloc initWithString:data];
}

static inline NSAttributedString * _Nonnull JobsAttributedStringByTextAttachment(NSTextAttachment * _Nonnull data) {
    if (!data) data = NSTextAttachment.alloc.init;
    return [NSAttributedString attributedStringWithAttachment:data];
}
#pragma mark —— 创建可变富文本
static inline NSMutableAttributedString * _Nonnull toMutAttributedString(NSAttributedString * _Nonnull data) {
    if(!data) data = JobsAttributedString(@"");
    return [NSMutableAttributedString.alloc initWithAttributedString:data];
}

static inline NSMutableAttributedString * _Nonnull JobsMutAttributedString(NSString * _Nonnull data) {
    if (!data) data = @"";
    return toMutAttributedString(JobsAttributedString(data));
}

static inline NSMutableAttributedString * _Nonnull JobsMutAttributedStringByTextAttachment(NSTextAttachment * _Nonnull data) {
    if (!data) data = NSTextAttachment.alloc.init;
    return toMutAttributedString(JobsAttributedStringByTextAttachment(data));
}
NS_ASSUME_NONNULL_BEGIN
@interface NSMutableAttributedString (Extra)
/// OC富文本字符串拼接
-(JobsReturnMutAttributedStringByAttributedStringBlock _Nonnull)add;

@end

NS_ASSUME_NONNULL_END
