//
//  NSNumber+Extra.h
//  Casino
//
//  Created by Jobs on 2021/12/28.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSInteger {
    NSNumber_None = 0,
    NSNumber_Bool,
    NSNumber_NSInteger,
    NSNumber_NSUInteger,
    NSNumber_int,
    NSNumber_unsignedInt,
    NSNumber_float,
    NSNumber_double,
    NSNumber_char,
    NSNumber_unsignedChar,
    NSNumber_short,
    NSNumber_unsignedShort,
    NSNumber_long,
    NSNumber_unsignedLong,
    NSNumber_unsignedLongLong
} NSNumberStyle;

@interface NSNumber (Extra)

-(NSString *)toString:(jobsByNSIntegerBlock _Nullable)block;

@end

NS_ASSUME_NONNULL_END
