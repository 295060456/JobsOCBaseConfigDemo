//
//  NSString+Conversion.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "NSString+Judgment.h"
#import "NSData+Other.h"
#import "JobsBlock.h"

#define FORMAT_STRING(fmt, val) [NSString stringWithFormat:(fmt), (val)]

static inline NSString *_Nonnull toStringByID(id _Nullable i){
    return FORMAT_STRING(@"%@", i);
}

static inline NSString *_Nonnull toStringByInt(int i){
    return FORMAT_STRING(@"%d", i);
}
/// 保留？位小数点有效值
static inline NSString *_Nonnull toStringByFloatDecimalPlaces(float i, NSUInteger decimalPlaces){
    return [NSString stringWithFormat:[NSString stringWithFormat:@"%%.%luf", (unsigned long)decimalPlaces], i];
}

static inline NSString *_Nonnull toStringByFloat(float i){
    return FORMAT_STRING(@"%f", i);
}

static inline NSString *_Nonnull toStringByDouble(double i){
    return FORMAT_STRING(@"%f", i);
}

static inline NSString *_Nonnull toStringByShort(short i){
    return FORMAT_STRING(@"%c", i);
}

static inline NSString *_Nonnull toStringByUnsignedShort(unsigned short i){
    return FORMAT_STRING(@"%c", i);
}

static inline NSString *_Nonnull toStringByNSInteger(NSInteger i){
    return FORMAT_STRING(@"%ld", (long)i);
}

static inline NSString *_Nonnull toStringByNSUInteger(NSUInteger i){
    return FORMAT_STRING(@"%lu", (unsigned long)i);
}

static inline NSString *_Nonnull toStringByLong(long i){
    return FORMAT_STRING(@"%ld", i);
}

static inline NSString *_Nonnull toStringByLongLong(long long i){
    return FORMAT_STRING(@"%lld", i);
}

static inline NSString *_Nonnull toStringByChar(char i){
    return FORMAT_STRING(@"%c", i);
}

static inline NSString *_Nonnull toStringByUnsignedChar(unsigned char i){
    return FORMAT_STRING(@"%c", i);
}

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Conversion)
#pragma mark —— 转化
/// 转化为可变字符串
-(NSMutableString *_Nullable)Mutable;
-(NSData *_Nullable)UTF8Encoding;
/// 字符串中取数字
-(long long)getDigits;
/// 读取本地JSON文件
-(nullable id)readLocalFileWithName;
/// JSON 转 NSDictionary
-(nullable id)dictionaryWithJsonString;
/// NSDictionary 转 json字符串方法//==[dic mj_JSONString]
-(JobsReturnStringByDictionaryBlock _Nonnull)convertToJsonData;
/// NSDictionary 转 NSString
-(JobsReturnStringByDictionaryBlock _Nonnull)convertDictionaryToString;
///【实例方法】解压缩字符串
-(NSData *)compress;
///【类方法】压缩字符串成NSData
-(JobsReturnDataByStringBlock _Nonnull)compressString;
///【类方法】解压缩字符串
+(NSString *)decompressString:(NSData *)compressedData;

@end

NS_ASSUME_NONNULL_END

static inline NSData *_Nullable archivedDataWithRootObject(id _Nullable object){
    NSError *error;
    NSData *compressedData = [NSKeyedArchiver archivedDataWithRootObject:object
                                                   requiringSecureCoding:NO
                                                                   error:&error];
    if(error) NSLog(@"%@",error.description);
    return compressedData;
}
