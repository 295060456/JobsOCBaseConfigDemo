//
//  NSNumber+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/28.
//

#import "NSNumber+Extra.h"

@implementation NSNumber (Extra)

-(JobsReturnStringByNumberBlock)toString{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSNumber *_Nullable data) {
        @jobs_strongify(self)
        if(KindOfNumberCls(data)){
            if (strcmp(self.objCType, @encode(BOOL)) == 0) {// Bool 类型
                return toStringByInt(data.boolValue);
            }else if (strcmp(self.objCType, @encode(NSInteger)) == 0){// NSInteger 类型
                return toStringByNSInteger(data.integerValue);
            }else if (strcmp(self.objCType, @encode(NSUInteger)) == 0){// NSUInteger 类型
                return toStringByLong(data.unsignedIntegerValue);
            }else if (strcmp(self.objCType, @encode(int)) == 0){// int 类型
                return toStringByInt(data.intValue);
            }else if (strcmp(self.objCType, @encode(unsigned int)) == 0){// unsigned int 类型
                return toStringByInt(data.unsignedIntValue);
            }else if (strcmp(self.objCType, @encode(float)) == 0){// float 类型
                return toStringByFloat(data.floatValue);
            }else if (strcmp(self.objCType, @encode(double)) == 0){// double 类型
                return toStringByDouble(data.doubleValue);
            }else if (strcmp(self.objCType, @encode(char)) == 0){// char 类型
                return toStringByChar(data.charValue);
            }else if (strcmp(self.objCType, @encode(unsigned char)) == 0){//unsigned char 类型
                return toStringByUnsignedChar(data.unsignedCharValue);
            }else if (strcmp(self.objCType, @encode(short)) == 0){// short 类型
                return toStringByShort(data.shortValue);
            }else if (strcmp(self.objCType, @encode(unsigned short)) == 0){//unsigned short 类型
                return toStringByUnsignedShort(data.unsignedShortValue);
            }else if (strcmp(self.objCType, @encode(long)) == 0){// long 类型
                return toStringByLong(data.longValue);
            }else if (strcmp(self.objCType, @encode(unsigned long)) == 0){// unsigned long 类型
                return toStringByNSUInteger(data.unsignedLongValue);
            }else if (strcmp(self.objCType, @encode(unsigned long long)) == 0){// unsigned long long 类型
                return toStringByLongLong(data.unsignedLongLongValue);
            }else return @"";
        }else return @"";
    };
}

@end
