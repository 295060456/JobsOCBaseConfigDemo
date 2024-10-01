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

#ifndef AttributedString
#define AttributedString NSMutableAttributedString.alloc
#endif /* AttributedString */

#pragma mark —— 创建不可变富文本
NS_INLINE NSAttributedString *_Nonnull JobsAttributedString(NSString *_Nonnull data) {
    if (!data) data = @"";
    return [NSAttributedString.alloc initWithString:data];
}

NS_INLINE NSAttributedString *_Nonnull JobsAttributedStringByAttributes(NSString *_Nonnull data,
                                                                             NSDictionary<NSAttributedStringKey, id> *_Nullable attrs){
    if (!data) data = @"";
    return [NSAttributedString.alloc initWithString:data attributes:attrs];
}

NS_INLINE NSAttributedString *_Nonnull JobsAttributedStringByAttributeString(NSAttributedString *_Nullable data){
    if (!data) data = JobsAttributedString(@"");
    return [NSAttributedString.alloc initWithAttributedString:data];
}

NS_INLINE NSAttributedString *_Nonnull JobsAttributedStringByTextAttachment(NSTextAttachment *_Nonnull data) {
    if (!data) data = NSTextAttachment.alloc.init;
    return [NSAttributedString attributedStringWithAttachment:data];
}
#pragma mark —— 创建可变富文本
NS_INLINE NSMutableAttributedString *_Nonnull toMutAttributedString(NSAttributedString *_Nonnull data) {
    if(!data) data = JobsAttributedString(@"");
    return [NSMutableAttributedString.alloc initWithAttributedString:data];
}

NS_INLINE NSMutableAttributedString *_Nonnull JobsMutAttributedStringByAttributes(NSString *_Nonnull data,
                                                                             NSDictionary<NSAttributedStringKey, id> * _Nullable attrs){
    return toMutAttributedString(JobsAttributedStringByAttributes(data,attrs));
}

NS_INLINE NSMutableAttributedString *_Nonnull JobsMutAttributedString(NSString *_Nonnull data) {
    return toMutAttributedString(JobsAttributedString(data));
}

NS_INLINE NSMutableAttributedString *_Nonnull JobsMutAttributedStringByTextAttachment(NSTextAttachment *_Nonnull data) {
    if (!data) data = NSTextAttachment.alloc.init;
    return toMutAttributedString(JobsAttributedStringByTextAttachment(data));
}

#endif /* JobsAttributedString_h */
