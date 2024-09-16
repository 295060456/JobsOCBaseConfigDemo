//
//  NSString+Replace.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "MacroDef_SysWarning.h"
#import "JobsBlock.h"
#import "NSNumber+Extra.h"
#import "NSString+Others.h"
#import "NSString+Judgment.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Replace)
#pragma mark —— 字符串替换
-(JobsReturnStringByStringBlock _Nullable)replace;
///  有时候我们加载的URL中可能会出现中文,需要我们手动进行转码,但是同时又要保证URL中的特殊字符保持不变,那么我们就可以使用下面的方法
-(NSURL *)Url_Chinese;
/// 替换某个字符串中间的字符为replacement
/// @param replacement 用来替换的字符（通常为 *）
/// @param count 需要替换的字符数量
- (NSString *)replaceMiddleCharactersWithReplacement:(NSString *)replacement
                                               count:(NSInteger)count;
/// 每隔num个字符添加一个空格的字符串算法
/// @param num 默认值是4
-(NSString *)dealWithString:(NSInteger)num;
/// 在字符串前面和后面拼接一个字符串
-(JobsReturnStringByStringStringBlock _Nonnull)resetStringByFontAndTailStrings;
/// 在字符串前面和后面拼接一个相同的字符串
-(JobsReturnStringByStringBlock _Nonnull)resetStringByFontAndTailString;
/// 在字符串前面拼接一个字符串
-(JobsReturnStringByStringBlock _Nonnull)resetStringByFontString;
/// 在字符串后面拼接一个字符串
-(JobsReturnStringByStringBlock _Nonnull)resetStringByTailString;
/// 单词首字母转换为大写
-(NSString *)jobsCapitalCaseString;
/// 服务器请求的数据为空值的时候进行替换本地默认值
/// 因为json传输是通过对象包装来进行，所以其实归结起来就是2类，一类是基本数据类型被包装成Number、其他包装成String
/// @param nullableString 进行检查的资源
/// @param replaceString 进行替换的备用文字资源
#define JobsNonnullString(nullableStr,replaceStr) [NSString nullableString:nullableStr replaceString:replaceStr]
+(NSString *)nullableString:(id)nullableString
              replaceString:(NSString *)replaceString;

@end

NS_ASSUME_NONNULL_END
