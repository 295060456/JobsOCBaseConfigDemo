//
//  NSMutableAttributedString+Extra.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "NSMutableAttributedString+Extra.h"

@implementation NSMutableAttributedString (Extra)
/// OC富文本字符串拼接
-(JobsReturnMutAttributedStringByAttributedStringBlock _Nonnull)add{
    return ^NSMutableAttributedString * _Nullable(NSAttributedString * _Nonnull data) {
        if(!data) data = JobsAttributedString(@"");
        [self appendAttributedString:data];
        return self;
    };
}

@end
