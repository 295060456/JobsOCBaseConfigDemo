//
//  NSString+Conversion.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Conversion.h"

@implementation NSString (Conversion)
#pragma mark —— 转化
/// 对系统方法 initWithData 的二次封装
+(JobsReturnStringByDataBlock _Nonnull)initByUTF8Data{
    return ^__kindof NSString *_Nullable(NSData *_Nullable data){
        return [NSString.alloc initWithData:data encoding:NSUTF8StringEncoding];
    };
}
/// 转化为可变字符串
-(NSMutableString *_Nullable)Mutable{
    return [NSMutableString stringWithString:self];
}

-(NSData *_Nullable)UTF8Encoding{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}
/// 字符串中取数字
-(long long)getDigits{
    NSCharacterSet *nonDigits = NSCharacterSet.decimalDigitCharacterSet.invertedSet;
    int remainSecond = [self stringByTrimmingCharactersInSet:nonDigits].intValue;
    return (long long)remainSecond;
}
/// 读取本地JSON文件
-(nullable id)readLocalFileWithName{
    // 获取文件路径
    NSString *path = self.add(@".json").pathForResourceWithFullName;
    // 将文件数据化
    NSData *data = self.initByContentsOfFile(path);
    // 对数据进行JSON格式化并返回字典形式
    return self.JSONkNilOptions(data);
}
/// JSON 转 NSDictionary
-(nullable id)dictionaryWithJsonString{
    if (isNull(self)) return nil;
    // 特殊字符会导致解析失败 https://www.wynter.wang/2019/02/15/ios%20%20%E5%A4%84%E7%90%86%E5%AF%BC%E8%87%B4json%E8%A7%A3%E6%9E%90%E5%A4%B1%E8%B4%A5%E7%9A%84%E7%89%B9%E6%AE%8A%E5%AD%97%E7%AC%A6/
    return self.JSONReadingMutableContainers(self.UTF8Encoding);
}
/// NSDictionary 转 json字符串方法//==[dic mj_JSONString]
-(JobsReturnStringByDictionaryBlock _Nonnull)convertToJsonData{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(__kindof NSDictionary *_Nullable dict){
        @jobs_strongify(self)
        NSString *jsonString = self.JSONWritingPrettyPrinted(dict).stringByUTF8Encoding;
        NSMutableString *mutStr = jsonString.Mutable;
        NSRange range = {0,jsonString.length};
        /// 去掉字符串中的空格
        [mutStr replaceOccurrencesOfString:@" "
                                withString:@""
                                   options:NSLiteralSearch
                                     range:range];
        NSRange range2 = {0,mutStr.length};
        /// 去掉字符串中的换行符
        [mutStr replaceOccurrencesOfString:JobsNewline
                                withString:@""
                                   options:NSLiteralSearch
                                     range:range2];
        return mutStr;
    };
}
/// NSDictionary 转 NSString
-(JobsReturnStringByDictionaryBlock _Nonnull)convertDictionaryToString{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(__kindof NSDictionary *_Nullable dict){
        @jobs_strongify(self)
        return self.JSONWritingPrettyPrinted(dict).stringByUTF8Encoding;
    };
}
///【实例方法】解压缩字符串
-(NSData *)compress{
    return NSKeyedArchiver.archivedDataByRootObject(self.UTF8Encoding);
}
///【类方法】压缩字符串成NSData
-(JobsReturnDataByStringBlock _Nonnull)compressString{
    return ^NSData *_Nullable(__kindof NSString *_Nullable string){
        return NSKeyedArchiver.archivedDataByRootObject(string.UTF8Encoding);
    };
}
///【类方法】解压缩字符串
+(JobsReturnStringByDataBlock _Nonnull)decompressString{
    return ^__kindof NSString *_Nullable(NSData *_Nullable data){
        return data.decompressToStr;
    };
}
/// 对象转OC字符串
+(JobsReturnStringByIDBlock _Nonnull)toString{
    return ^NSString *_Nullable (id _Nullable data) {
        return toStringByID(data);
    };
}
/// OC字符串转NSDate
-(JobsReturnDateByDateFormatterBlock _Nonnull)dataByDateFormatter{
    @jobs_weakify(self)
    return ^NSDate *_Nullable(NSDateFormatter *_Nullable data){
        @jobs_strongify(self)
        return [data dateFromString:self];
    };
}
/// OC字符串数组 转 OC字符串
+(NSString *_Nonnull)toStrByStringArr:(NSArray <NSString *>*_Nonnull)arr{
    NSString *resultStr;
    for (int i = 0; i < arr.count; i++) {
        NSString *tempStr = arr[i];
        tempStr = tempStr.removeSeparationMark;//去除字符 /
        resultStr.add(@"/").add(tempStr);
    }return resultStr;
}
/// 纯字符串格式化为4位数字为一组的银行卡格式字符串
-(__kindof NSString *_Nullable)bankCardStyle{
    return self.bankCardStyleBy(4);
}

-(JobsReturnStringByIntegerBlock _Nonnull)bankCardStyleBy{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSInteger data){
        @jobs_strongify(self)
        if(self.isPureDigit){
            NSMutableString *formattedString = self.pureString.Mutable;
            for (NSInteger i = formattedString.length - data; i > 0; i -= data) {
                [formattedString insertString:@" " atIndex:i];
            }return formattedString;
        }else{
            NSLog(@"当前字符串为%@,不是纯字符串，无法格式化输出",self);
            return @"";
        }
    };
}
/// 将字典转换成GET请求的URL（带参数）
-(JobsReturnStringByDictionaryBlock _Nonnull)GETRequestURLParaBy{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(__kindof NSDictionary *_Nullable params){
        @jobs_strongify(self)
        NSString *queryString = [jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            [params enumerateKeysAndObjectsUsingBlock:^(id key,
                                                        id obj,
                                                        BOOL *stop) {
                if (obj && ![obj isKindOfClass:[NSNull class]]) { // 忽略空值
                    NSString *encodedKey = [[key description] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
                    NSString *encodedValue = [[obj description] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
                    NSString *queryItem = encodedKey.add(@"=").add(encodedValue);
                    data.add(queryItem);
                }
            }];
        }) componentsJoinedByString:@"&"];
        return queryString.length ? self.add(@"?").add(queryString) : self;
    };
}
/// 从指定的 URL 加载文本内容，并将其读取为一个可变字符串
-(JobsReturnStringByVoidBlock _Nonnull)stringByContentsOfURL{
    return ^ __kindof NSString *_Nullable(){
        NSError *err = nil;
        NSMutableString *string = [NSMutableString stringWithContentsOfURL:self.jobsUrl
                                                                  encoding:NSUTF8StringEncoding
                                                                     error:&err];
        if(err){
            NSLog(@"err = %@",err.description)
            return nil;
        }return string;
    };
}

@end
