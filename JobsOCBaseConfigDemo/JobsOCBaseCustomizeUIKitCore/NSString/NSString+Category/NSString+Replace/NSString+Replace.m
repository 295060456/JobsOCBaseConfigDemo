//
//  NSString+Replace.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Replace.h"

@implementation NSString (Replace)
#pragma mark —— 字符串替换
///  有时候我们加载的URL中可能会出现中文,需要我们手动进行转码,但是同时又要保证URL中的特殊字符保持不变,那么我们就可以使用下面的方法
-(NSURL *)Url_Chinese{
    SuppressWdeprecatedDeclarationsWarning(
      return NSString.toString(CFBridgingRelease(
                                                 CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                         (CFStringRef)self,
                                                                                         (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                                         NULL,
                                                                                         kCFStringEncodingUTF8))).jobsUrl);
}
/// 替换某个字符串中间的字符为replacement
/// @param replacement 用来替换的字符（通常为 *）
/// @param count 需要替换的字符数量
- (NSString *)replaceMiddleCharactersWithReplacement:(NSString *)replacement
                                               count:(NSInteger)count{
    if (self.length <= count || count <= 0) return self; // 字符串长度小于等于替换长度，或替换长度无效，直接返回原字符串
        
    NSInteger start = (self.length - count) / 2;
    NSString *prefix = [self substringToIndex:start];
    NSString *suffix = [self substringFromIndex:start + count];
    
    NSMutableString *result = JobsMutableString(prefix);
    for (NSInteger i = 0; i < count; i++) {
        result = result.add(replacement);
    }
    result = result.add(suffix);
    return result;
}
/// 每隔num个字符添加一个空格的字符串算法
/// @param num 默认值是4
-(NSString *)dealWithString:(NSInteger)num{
    NSString *doneTitle = @"";
    if (num == 0) num = 4;
    int count = 0;
    for (int i = 0; i < self.length; i++) {
        count++;
        doneTitle = doneTitle.add([self substringWithRange:NSMakeRange(i, 1)]);
        if (count == num) {
            doneTitle = doneTitle.add(@" ");
            count = 0;
        }
    }NSLog(@"%@", doneTitle);
    return doneTitle;
}
/// 在字符串前面和后面拼接一个字符串
-(JobsReturnStringByStringStringBlock _Nonnull)resetStringByFontAndTailStrings{
    @jobs_weakify(self)
    return ^(NSString *fontString,NSString *tailString) {
        @jobs_strongify(self)
        return fontString.add(self).add(tailString);
    };
}
/// 在字符串前面和后面拼接一个相同的字符串
-(JobsReturnStringByStringBlock _Nonnull)resetStringByFontAndTailString{
    @jobs_weakify(self)
    return ^(NSString *data) {
        @jobs_strongify(self)
        return data.add(self).add(data);
    };
}
/// 在字符串前面拼接一个字符串
-(JobsReturnStringByStringBlock _Nonnull)resetStringByFontString{
    @jobs_weakify(self)
    return ^(NSString *data) {
        @jobs_strongify(self)
        return data.add(self);
    };
}
/// 在字符串后面拼接一个字符串
-(JobsReturnStringByStringBlock _Nonnull)resetStringByTailString{
    @jobs_weakify(self)
    return ^(NSString *data) {
        @jobs_strongify(self)
        return self.add(data);
    };
}
/// 单词首字母转换为大写
-(NSString *)jobsCapitalCaseString{
    return [self stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                         withString:[self substringToIndex:1].capitalizedString];
}
/// 服务器请求的数据为空值的时候进行替换本地默认值
/// 因为json传输是通过对象包装来进行，所以其实归结起来就是2类，一类是基本数据类型被包装成Number、其他包装成String
/// @param nullableString 进行检查的资源
/// @param replaceString 进行替换的备用文字资源
+(NSString *)nullableString:(id)nullableString
              replaceString:(NSString *)replaceString{
    
    if (isNull(replaceString)) replaceString = JobsInternationalization(@"No Data");
    if (isNull(nullableString)) nullableString = replaceString;
    
    /// 只有NSNumber 和 NSString 这两种情况
    if([nullableString isKindOfClass:NSString.class]){
        NSString *str = (NSString *)nullableString;
        /// 过滤特殊字符：空格
        str = [str stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];//有空格，去除空格
        return str.length == 0 ? replaceString : str;
    }
    
    if([nullableString isKindOfClass:NSNumber.class])
        return isNull(toStringByID(nullableString)) ? replaceString : toStringByID(nullableString);
    
    return replaceString;
}

@end
