//
//  NSString+Replace.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Replace.h"

@implementation NSString (Replace)
#pragma mark —— 字符串替换
-(JobsReturnStringByStringBlock _Nullable)replace{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return isValue(self) ? self : data;
    };
}
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
-(NSString *)replaceMiddleCharactersWithReplacement:(NSString *)replacement
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
/// 将某个OC字符串进行限定字符个数，二次包装以后对外输出。【截取完了以后添加替换字符】
/// @param replaceStr 多余的字符串用replaceStr进行占位表示，一般的这里是用"."来进行替换
/// @param replaceStrLenth 替代字符串的字符长度
/// @param lineBreakMode 省略的字符串位于整个原始字符串的位置
/// @param limit 限制的字符数
-(NSString *_Nonnull)omitByReplaceStr:(NSString *_Nullable)replaceStr
                      replaceStrLenth:(NSInteger)replaceStrLenth
                        lineBreakMode:(NSLineBreakMode)lineBreakMode
                                limit:(NSInteger)limit{
    if (!replaceStrLenth) replaceStrLenth = 3;
    if (isNull(replaceStr)) replaceStr = @".";
    /// limit 是不包括省略号的实际的限制字数
    if(!self.isPureDigit){
        NSLog(@"当前字符串为%@,不是纯字符串，无法格式化输出",self);
        return @"";
    }
    NSString *resultStr = self;
    NSRange range;
    NSString *pointStr = @"";
    for (int i = 0; i < replaceStrLenth; i++) {
        pointStr = pointStr.add(replaceStr);
    }
    /// 关键节点用向下取整进行保守处理
    if (self.length > limit) {
        if (lineBreakMode == NSLineBreakByTruncatingHead){/// 前面部分文字以...方式省略，显示尾部文字内容
            range = NSMakeRange(self.length - limit,limit);
            resultStr = pointStr.add([self substringWithRange:range]);
        }else if (lineBreakMode == NSLineBreakByTruncatingTail){/// 结尾部分的内容以……方式省略，显示头的文字内容
            range = NSMakeRange(0,limit);
            resultStr = [self substringWithRange:range].add(pointStr);
        }else if (lineBreakMode == NSLineBreakByTruncatingMiddle){/// 中间的内容以...方式省略，显示头尾的文字内容
            NSRange rangeA = NSMakeRange(0,floor(limit / 2));
            NSString *resultStrA = [self substringWithRange:rangeA];
            NSRange rangeB = NSMakeRange(floor(self.length - limit / 2),floor(limit / 2));
            NSString *resultStrB = [self substringWithRange:rangeB];
            resultStr = resultStrA.add(pointStr).add(resultStrB);
        }else{}
    }return resultStr;
}
/// 将字符串中除首尾字符外的所有字符替换为星号 (*)
-(NSString *_Nonnull)getAnonymousString{
    if (self.length < 2) return self;
    @jobs_weakify(self)
    NSString *string = [jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        for (int i = 1; i < self.length - 1; i++) {
            char s = [self characterAtIndex:i];
            s = '*';
            NSString *tempString = StringWithUTF8String(&s);
            data.add(tempString);
        }
    }) componentsJoinedByString:@""];
    return [self stringByReplacingCharactersInRange:NSMakeRange(1, self.length - 2) withString:string];
}
// 加密中国的电话号码。如：13409090909 => 134****0909
-(NSString *_Nonnull)encryptedChineseTele{
    return [self omitByReplaceStr:@"*"
                  replaceStrLenth:4
                    lineBreakMode:NSLineBreakByTruncatingMiddle
                            limit:7];
}
/// OC字符串去除最后一个字符
-(NSString *_Nonnull)removeLastChars{
    return [self substringToIndex:self.length - 1];
}
/// 图片URL路径补齐
-(NSString *_Nullable)imageURLPlus{
    if(!This.BaseUrl_Image || !This.BaseUrl) return self;
    if(!self.containsString(@"http") && isValue(self)){
        return (isValue(This.BaseUrl_Image) ? This.BaseUrl_Image : This.BaseUrl).add(self);
    }else return self;
}
/// 一般的URL路径补齐
-(NSString *_Nullable)normalURLPlus{
    if(!This.BaseUrl_Image) return self;
    if(!self.containsString(@"http") && isValue(self)){
        return This.BaseUrl_Image.add(self);
    }else return self;
}
/// 去除OC字符串中的空格
-(NSString *)pureString{
    return [self stringByReplacingOccurrencesOfString:JobsSpace withString:@""];
}
/// 去除OC字符串中的小数点
-(__kindof NSString *_Nullable)removeDecimalPoint{
    return [self stringByReplacingOccurrencesOfString:JobsDot withString:@""];
}
/// 去除OC字符串中回车符号的转义字符：\r
-(__kindof NSString *_Nullable)removeRetMark{
    return [self stringByReplacingOccurrencesOfString:回车符号转义字符 withString:@""];
}
/// 去除OC字符串中换行符号的转义字符：\n
-(__kindof NSString *_Nullable)removeNewLineMark{
    return [self stringByReplacingOccurrencesOfString:JobsNewline withString:@""];
}
/// 去除OC字符串中换行符号的转义字符：\t
-(__kindof NSString *_Nullable)removeTableMark{
    return [self stringByReplacingOccurrencesOfString:JobsTab withString:@""];
}
/// 去除OC字符串中的等号：=
-(__kindof NSString *_Nullable)removeEqualMark{
    return [self stringByReplacingOccurrencesOfString:JobsEqual withString:@""];
}
/// 去除OC字符串中的分隔符：/
-(__kindof NSString *_Nullable)removeSeparationMark{
    return [self stringByReplacingOccurrencesOfString:JobsSeparation withString:@""];
}
/// 去除OC字符串中的冒号（英文输入法）
-(__kindof NSString *_Nullable)removeColonMark{
    return [self stringByReplacingOccurrencesOfString:JobsColon withString:@""];
}
/// 去除OC字符串中零宽空格的转义字符：\u200B
/// 零宽空格 (\u200B)：顾名思义，这个字符没有任何宽度（即不可见），它的作用是插入一个“空格”，但不会占据任何可见的空间。
/// 零宽空格在视觉上不会显示出来，但它可以在字符串中用于各种控制和格式化的目的。
-(__kindof NSString *_Nullable)remove200BMark{
    return [self stringByReplacingOccurrencesOfString:零宽转义字符 withString:@""];
}
/// 从字符串中提取指定范围内的子字符串
-(JobsReturnStringByRangeBlock _Nonnull)substringWithRange{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSRange data){
        @jobs_strongify(self)
        return [self substringWithRange:data];
    };
}

@end
