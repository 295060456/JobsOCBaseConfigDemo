//
//  NSNumber+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/28.
//

#import "NSNumber+Extra.h"

@implementation NSNumber (Extra)

+(JobsReturnNumberByCharBlock _Nonnull)initByChar{
    return ^__kindof NSNumber *_Nullable(char data){
        return [NSNumber numberWithChar:data];
    };
}

+(JobsReturnNumberByUnsignedCharBlock _Nonnull)initByUnsignedChar{
    return ^__kindof NSNumber *_Nullable(unsigned char data){
        return [NSNumber numberWithUnsignedChar:data];
    };
}

+(JobsReturnNumberByShortBlock _Nonnull)initByShort{
    return ^__kindof NSNumber *_Nullable(short data){
        return [NSNumber numberWithShort:data];
    };
}

+(JobsReturnNumberByUnsignedShortBlock _Nonnull)initByUnsignedShort{
    return ^__kindof NSNumber *_Nullable(unsigned short data){
        return [NSNumber numberWithUnsignedShort:data];
    };
}

+(JobsReturnNumberByIntBlock _Nonnull)initByInt{
    return ^__kindof NSNumber *_Nullable(int data){
        return [NSNumber numberWithInt:data];
    };
}

+(JobsReturnNumberByUnsignedIntBlock _Nonnull)initByUnsignedInt{
    return ^__kindof NSNumber *_Nullable(unsigned int data){
        return [NSNumber numberWithUnsignedInt:data];
    };
}

+(JobsReturnNumberByLongBlock _Nonnull)initByLong{
    return ^__kindof NSNumber *_Nullable(long data){
        return [NSNumber numberWithLong:data];
    };
}

+(JobsReturnNumberByUnsignedLongBlock _Nonnull)initByUnsignedLong{
    return ^__kindof NSNumber *_Nullable(unsigned long data){
        return [NSNumber numberWithUnsignedLong:data];
    };
}

+(JobsReturnNumberByLongLongBlock _Nonnull)initByLongLong{
    return ^__kindof NSNumber *_Nullable(long long data){
        return [NSNumber numberWithLongLong:data];
    };
}

+(JobsReturnNumberByUnsignedLongLongBlock _Nonnull)initByUnsignedLongLong{
    return ^__kindof NSNumber *_Nullable(unsigned long long data){
        return [NSNumber numberWithUnsignedLongLong:data];
    };
}

+(JobsReturnNumberByFloatBlock _Nonnull)initByFloat{
    return ^__kindof NSNumber *_Nullable(float data){
        return [NSNumber numberWithFloat:data];
    };
}

+(JobsReturnNumberByDoubleBlock _Nonnull)initByDouble{
    return ^__kindof NSNumber *_Nullable(double data){
        return [NSNumber numberWithDouble:data];
    };
}

+(JobsReturnNumberByBOOLBlock _Nonnull)initByBOOL{
    return ^__kindof NSNumber *_Nullable(BOOL data){
        return [NSNumber numberWithBool:data];
    };
}

+(JobsReturnNumberByNSIntegerBlock _Nonnull)initByNSInteger{
    return ^__kindof NSNumber *_Nullable(NSInteger data){
        return [NSNumber numberWithInteger:data];
    };
}

+(JobsReturnNumberByNSUIntegerBlock _Nonnull)initByNSUInteger{
    return ^__kindof NSNumber *_Nullable(NSUInteger data){
        return [NSNumber numberWithUnsignedInteger:data];
    };
}
/// 特殊处理 CGFloat 类型
+(JobsReturnNumberByCGFloatBlock _Nonnull)initByCGFloat{
    return ^__kindof NSNumber *_Nullable(CGFloat data){
        /// 由于 CGFloat 在不同平台上可能是 float 或 double，因此我们根据平台来封装
        #if TARGET_OS_MAC && !TARGET_OS_IPHONE
        return [NSNumber numberWithDouble:data]; // macOS 使用 double
        #else
        return [NSNumber numberWithFloat:data]; // iOS 使用 float
        #endif
    };
}

-(CGFloat)byFloat{
    /// 根据平台进行解包
    #if TARGET_OS_MAC && !TARGET_OS_IPHONE
    return [self doubleValue];  // macOS 使用 double
    #else
    return [self floatValue];   // iOS 使用 float
    #endif
}

-(JobsReturnStringByNumberBlock _Nonnull)toString{
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

-(NSString *)stringValueOrEmpty{
    if (self.intValue == -1) {
        return @""; // 返回空字符串
    }return self.stringValue;
}

-(JobsReturnNumberByNSIntegerBlock _Nonnull)updateByStepInt{
    @jobs_weakify(self)
    return ^NSNumber *(NSInteger data){
        @jobs_strongify(self)
        return @(self.intValue + data);
    };
}

-(JobsReturnNumberByCGFloatBlock _Nonnull)updateByStepFloat{
    @jobs_weakify(self)
    return ^NSNumber *(CGFloat data){
        @jobs_strongify(self)
        return @(self.floatValue + data);
    };
}

@end
