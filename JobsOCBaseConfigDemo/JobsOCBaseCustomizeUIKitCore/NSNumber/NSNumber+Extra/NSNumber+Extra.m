//
//  NSNumber+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/28.
//

#import "NSNumber+Extra.h"

@implementation NSNumber (Extra)

-(NSString *)toString:(jobsByNSIntegerBlock _Nullable)block{
    NSNumber *b = (NSNumber *)self;
    if (strcmp([self objCType], @encode(BOOL)) == 0) {// Bool 类型
        if (block) block(NSNumber_Bool);
        return [NSString stringWithFormat:@"%d",b.boolValue];
    }else if (strcmp([self objCType], @encode(NSInteger)) == 0){// NSInteger 类型
        if (block) block(NSNumber_NSInteger);
        return [NSString stringWithFormat:@"%ld",(long)b.integerValue];
    }else if (strcmp([self objCType], @encode(NSUInteger)) == 0){// NSUInteger 类型
        if (block) block(NSNumber_NSUInteger);
        return [NSString stringWithFormat:@"%ld",(long)b.unsignedIntegerValue];
    }else if (strcmp([self objCType], @encode(int)) == 0){// int 类型
        if (block) block(NSNumber_int);
        return [NSString stringWithFormat:@"%d",b.intValue];
    }else if (strcmp([self objCType], @encode(unsigned int)) == 0){// unsigned int 类型
        if (block) block(NSNumber_unsignedInt);
        return [NSString stringWithFormat:@"%d",b.unsignedIntValue];
    }else if (strcmp([self objCType], @encode(float)) == 0){// float 类型
        if (block) block(NSNumber_float);
        return [NSString stringWithFormat:@"%f",b.floatValue];
    }else if (strcmp([self objCType], @encode(double)) == 0){// double 类型
        if (block) block(NSNumber_double);
        return [NSString stringWithFormat:@"%f",b.doubleValue];
    }else if (strcmp([self objCType], @encode(char)) == 0){// char 类型
        if (block) block(NSNumber_char);
        return [NSString stringWithFormat:@"%c",b.charValue];
    }else if (strcmp([self objCType], @encode(unsigned char)) == 0){//unsigned char 类型
        if (block) block(NSNumber_unsignedChar);
        return [NSString stringWithFormat:@"%c",b.unsignedCharValue];
    }else if (strcmp([self objCType], @encode(short)) == 0){// short 类型
        if (block) block(NSNumber_short);
        return [NSString stringWithFormat:@"%c",b.shortValue];
    }else if (strcmp([self objCType], @encode(unsigned short)) == 0){//unsigned short 类型
        if (block) block(NSNumber_unsignedShort);
        return [NSString stringWithFormat:@"%c",b.unsignedShortValue];
    }else if (strcmp([self objCType], @encode(long)) == 0){// long 类型
        if (block) block(NSNumber_long);
        return [NSString stringWithFormat:@"%ld",b.longValue];
    }else if (strcmp([self objCType], @encode(unsigned long)) == 0){// unsigned long 类型
        if (block) block(NSNumber_unsignedLong);
        return [NSString stringWithFormat:@"%lu",b.unsignedLongValue];
    }else if (strcmp([self objCType], @encode(unsigned long long)) == 0){// unsigned long long 类型
        if (block) block(NSNumber_unsignedLongLong);
        return [NSString stringWithFormat:@"%llu",b.unsignedLongLongValue];
    }else if (block) block(NSNumber_None);return JobsInternationalization(@"");
}

@end
