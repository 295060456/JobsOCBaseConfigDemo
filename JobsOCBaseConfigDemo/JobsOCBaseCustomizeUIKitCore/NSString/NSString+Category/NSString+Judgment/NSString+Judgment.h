//
//  NSString+Judgment.h
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import <Foundation/Foundation.h>
#import "MacroDef_Func.h"
#import "NSString+Judgment.h"
#import <_ctype.h>
#import "JobsBlock.h"

/// 要判nil和NULL，必须用类方法或者内联函数，在实例方法里面nil和NULL会被包装为空串
static inline BOOL isNull(NSString * _Nullable string){
    if(string == nil) return YES;
    if(string == NULL) return YES;
    if((NSNull *)string == NSNull.null) return YES;
    if([string isKindOfClass:NSNull.class]) return YES;
    if([string isKindOfClass:NSString.class]){
        NSString *str = (NSString *)string;
        if([str isEqualToString:@"(null)"]) return YES;
        if([str isEqualToString:@"null"]) return YES;
        if([str isEqualToString:@"<null>"]) return YES;
        if([str isEqualToString:@""]) return YES;
        /// 去掉两端的空格
        return ![str stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].length;
    }else{
        NSString *str = [NSString stringWithFormat:@"%@",string];
        /// 去掉两端的空格
        return ![str stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].length;
    }return NO;
}

static inline BOOL isValue(NSString * _Nullable string){
    return !isNull(string);
}

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Judgment)
#pragma mark —— 字符串的 比较 & 判断
-(JobsReturnBOOLByIDBlock)isEqualToString;
-(JobsReturnBOOLByIDBlock)containsString;
-(JobsReturnBOOLByIDBlock)hasPrefix;
-(JobsReturnBOOLByIDBlock)hasSuffix;
/// 判断字符串对象是否为狭义范围内的空格
-(BOOL)isNotBlank;
/// 判断是否是广义范围内的空格(space、\t、\r、\n)
-(BOOL)isSpace;
/// 判断字符串是否包含空格：返回YES【没有空格】
-(BOOL)isContainBlank;
/// 给定某字符串，判断里面的组成char是否全部为某个char
/// @param standardChar 执行标准
-(BOOL)isAllSameCharWithStandardChar:(char)standardChar;
/// 是否是系统自带九宫格输入 yes-是 no-不是
-(BOOL)isNineKeyBoard;
/// 如果字符串为null 那么不走isEqualToString，无法比较都是空的情况
+(BOOL)isEqualStrA:(NSString *)stringA strB:(NSString *)stringB;
/// 判断是否为整形
-(BOOL)isPureInt;
/// 判断是否为浮点形
-(BOOL)isPureFloat;
/// 判断是否是数字字母结合
-(BOOL)isAlnum;
/// 判断是否是ASCII码的控制字符
-(BOOL)isCntrl;
/// 判断是否是为可打印字符(不包含空格)
-(BOOL)isGraph;
/// 判断字符是否为可打印字符（含空格）
-(BOOL)isPrint;
/// 判断是否是小写的英文字母
-(BOOL)isLower;
/// 判断字符是否为大写英文字母
-(BOOL)isUpper;
/// 判断字符是否为16进制数字
-(BOOL)isXdigit;
/// 判断字符是否为标点符号或特殊字符
-(BOOL)isPunct;
/// 是否全是字母（26个英文字母）
-(BOOL)isAllLetterCharacter;
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl;
/// 正则匹配手机号
-(BOOL)checkTelNumber;

@end

NS_ASSUME_NONNULL_END
