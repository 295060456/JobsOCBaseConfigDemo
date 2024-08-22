//
//  NSString+Conversion.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "NSString+Judgment.h"

static inline NSString * _Nonnull toStringByID(id _Nullable i){
    return [NSString stringWithFormat:@"%@",i];
}

static inline NSString * _Nonnull toStringByInt(int i){
    return [NSString stringWithFormat:@"%d",i];
}

static inline NSString * _Nonnull toStringByFloat(float i){
    return [NSString stringWithFormat:@"%f",i];
}

static inline NSString * _Nonnull toStringByDouble(double i){
    return [NSString stringWithFormat:@"%f",i];
}

static inline NSString * _Nonnull toStringByNSInteger(NSInteger i){
    return [NSString stringWithFormat:@"%ld",(long)i];
}

static inline NSString * _Nonnull toStringByNSUInteger(NSUInteger i){
    return [NSString stringWithFormat:@"%lu",(unsigned long)i];
}

static inline NSString * _Nonnull toStringByLong(long i){
    return [NSString stringWithFormat:@"%ld",i];
}

static inline NSString * _Nonnull toStringByLongLong(long long i){
    return [NSString stringWithFormat:@"%lld",i];
}

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Conversion)
#pragma mark —— 转化
/// 字符串中取数字
-(long long)getDigits;
/// 读取本地JSON文件
-(NSDictionary *)readLocalFileWithName;
/// JSON 转 NSDictionary
-(NSDictionary *)dictionaryWithJsonString;
/// NSDictionary 转 json字符串方法//==[dic mj_JSONString]
-(NSString *)convertToJsonData:(NSDictionary *)dict;
/// NSDictionary 转 NSString
-(NSString *)convertDictionaryToString:(NSMutableDictionary *)dict;
///【实例方法】解压缩字符串
-(NSData *)compress;
///【类方法】压缩字符串成NSData
+(NSData *)compressString:(NSString *)string;
///【类方法】解压缩字符串
+(NSString *)decompressString:(NSData *)compressedData;

@end

NS_ASSUME_NONNULL_END
