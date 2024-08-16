//
//  JobsAttributedString.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/16/24.
//

#ifndef JobsAttributedString_h
#define JobsAttributedString_h

#import "NSMutableAttributedString+Extra.h"
#import "NSAttributedString+Extra.h"

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

#endif /* JobsAttributedString_h */
