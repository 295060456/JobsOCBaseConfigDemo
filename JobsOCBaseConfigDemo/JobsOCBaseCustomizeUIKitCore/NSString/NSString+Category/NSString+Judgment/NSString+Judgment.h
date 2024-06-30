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

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JudgeNull)
#pragma mark —— 判空
/**
*  判断字符串对象是否为空
*  为空返回 NO
*  不为空返回 YES
*/
- (BOOL)isNotBlank;
/**
*  判断字符串对象是否为空
*  为空返回 YES
*  不为空返回 NO
*/
+(BOOL)isNullString:(NSString *)string;
/// 判断是否是空格(space和\t)
-(BOOL)isBlank;
/// 判断是否是空格(space、\t、\r、\n)
-(BOOL)isSpace;
/// 判断字符串是否包含空格：返回YES【没有空格】
-(BOOL)isContainBlank;

@end

@interface NSString (Judgment)

-(JobsReturnBOOLByIDBlock)isEqualToString;
-(JobsReturnBOOLByIDBlock)containsString;

#pragma mark —— 字符串的 比较 & 判断
/// 给定某字符串，判断里面的组成char是否全部为某个char
/// @param standardChar 执行标准
-(BOOL)isAllSameCharWithStandardChar:(char)standardChar;
/// 是否是系统自带九宫格输入 yes-是 no-不是
-(BOOL)isNineKeyBoard;
/// 如果字符串为null 那么不走isEqualToString，无法比较都是空的情况
+(BOOL)isEqualStrA:(NSString *)stringA
              strB:(NSString *)stringB;
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
/*
 分开来注释一下：
 ^ 匹配一行的开头位置
 (?![0-9]+$) 预测该位置后面不全是数字
 (?![a-zA-Z]+$) 预测该位置后面不全是字母
 [0-9A-Za-z] {8,16} 由8-16位数字或这字母组成
 $ 匹配行结尾位置
 
 注：(?!xxxx) 是正则表达式的负向零宽断言一种形式，标识预该位置后不是xxxx字符。
 https:blog.csdn.net/w6524587/article/details/56279494
密码(以字母开头，长度在6~18之间，只能包含字母、数字和下划线)：
 ^[a-zA-Z]\w{5,17}$
强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)：
 ^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$
 */
-(BOOL)isContainAllCharType;

@end

NS_ASSUME_NONNULL_END
