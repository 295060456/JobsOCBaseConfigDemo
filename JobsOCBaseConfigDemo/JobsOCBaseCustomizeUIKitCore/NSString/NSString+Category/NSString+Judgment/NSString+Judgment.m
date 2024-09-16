//
//  NSString+Judgment.m
//  Casino
//
//  Created by Jobs on 2021/11/30.
//

#import "NSString+Judgment.h"

@implementation NSString (Judgment)
#pragma mark —— 字符串的 比较 & 判断
-(JobsReturnBOOLByIDBlock _Nullable)isEqualToString{
    @jobs_weakify(self)
    return ^BOOL(NSString *data){
        @jobs_strongify(self)
        if ([data isKindOfClass:NSString.class]) {
            return [self isEqualToString:data];
        }return NO;
    };
}

-(JobsReturnBOOLByIDBlock _Nullable)containsString{
    @jobs_weakify(self)
    return ^BOOL(NSString *data){
        @jobs_strongify(self)
        if ([data isKindOfClass:NSString.class]) {
            return [self containsString:data];
        }return NO;
    };
}

-(JobsReturnBOOLByIDBlock _Nullable)hasPrefix{
    @jobs_weakify(self)
    return ^BOOL(NSString *data){
        @jobs_strongify(self)
        if ([data isKindOfClass:NSString.class]) {
            return [self hasPrefix:data];
        }return NO;
    };
}

-(JobsReturnBOOLByIDBlock _Nullable)hasSuffix{
    @jobs_weakify(self)
    return ^BOOL(NSString *data){
        @jobs_strongify(self)
        if ([data isKindOfClass:NSString.class]) {
            return [self hasSuffix:data];
        }return NO;
    };
}
/// 判断字符串对象是否为狭义范围内的空格
-(BOOL)isNotBlank{
    NSCharacterSet *blank = NSCharacterSet.whitespaceAndNewlineCharacterSet;
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) return YES;
    }return NO;
}
/// 判断是否是广义范围内的空格(space、\t、\r、\n)
-(BOOL)isSpace{
    unichar c;
    for (int i = 0; i < self.length; i++) {
        c = [self characterAtIndex:i];
        if (!isspace(c)) return NO;
//        if (!isblank(c)) return NO;/// 只能判断是否是空格(space和\t)
    }return YES;
}
/// 判断字符串是否包含空格：返回YES【没有空格】
-(BOOL)isContainBlank{
    return [self rangeOfString:@" "].location == NSNotFound;
}
/// 给定某字符串，判断里面的组成char是否全部为某个char
/// @param standardChar 执行标准
-(BOOL)isAllSameCharWithStandardChar:(char)standardChar{
    if (self.length) {
        NSMutableArray <NSString *>*carries = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            for (int i = 0; i < self.length; i++) {
                char s = [self characterAtIndex:i];
                if(s == standardChar){
                    NSString *tempString = [NSString stringWithUTF8String:&s];
                    data.add(tempString);
                }
            }
        });return carries.count == self.length;
    }return NO;
}
/// 是否是系统自带九宫格输入 yes-是 no-不是
-(BOOL)isNineKeyBoard{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    int len = (int)self.length;
    for(int i = 0;i < len;i++){
        if(!([other rangeOfString:self].location != NSNotFound))
            return NO;
    }return YES;
}
/// 如果字符串为null 那么不走isEqualToString，无法比较都是空的情况
+(BOOL)isEqualStrA:(NSString *)stringA strB:(NSString *)stringB{
    if (isNull(stringA) && isNull(stringB)) {/// 双方都是null
        return YES;
    }else return stringA.isEqualToString(stringB);
}
/// 判断是否为整形
-(BOOL)isPureInt{
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && scan.isAtEnd;
}
/// 判断是否为浮点形
-(BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && scan.isAtEnd;
}
/// 判断是否是数字字母结合
-(BOOL)isAlnum{
    unichar c;
    for (int i = 0; i < self.length; i++) {
        c = [self characterAtIndex:i];
        if (!isalnum(c)) return NO;
    }return YES;
}
/// 判断是否是ASCII码的控制字符
-(BOOL)isCntrl{
    unichar c;
    for (int i = 0; i < self.length; i++) {
        c = [self characterAtIndex:i];
        if (!iscntrl(c)) return NO;
    }return YES;
}
/// 判断是否是为可打印字符(不包含空格)
-(BOOL)isGraph{
    unichar c;
    for (int i = 0; i < self.length; i++) {
        c = [self characterAtIndex:i];
        if (!isgraph(c)) return NO;
    }return YES;
}
/// 判断字符是否为可打印字符（含空格）
-(BOOL)isPrint{
    unichar c;
    for (int i = 0; i < self.length; i++) {
        c = [self characterAtIndex:i];
        if (!isprint(c)) return NO;
    }return YES;
}
/// 判断是否是小写的英文字母
-(BOOL)isLower{
    unichar c;
    for (int i = 0; i < self.length; i++) {
        c = [self characterAtIndex:i];
        if (!islower(c)) return NO;
    }return YES;
}
/// 判断字符是否为大写英文字母
-(BOOL)isUpper{
    unichar c;
    for (int i = 0; i < self.length; i++) {
        c = [self characterAtIndex:i];
        if (!isupper(c)) return NO;
    }return YES;
}
/// 判断字符是否为16进制数字
-(BOOL)isXdigit{
    unichar c;
    for (int i = 0; i < self.length; i++) {
        c = [self characterAtIndex:i];
        if (!isxdigit(c)) return NO;
    }return YES;
}
/// 判断字符是否为标点符号或特殊字符
-(BOOL)isPunct{
    unichar c;
    for (int i = 0; i < self.length; i++) {
        c = [self characterAtIndex:i];
        if (!ispunct(c)) return NO;
    }return YES;
}
/// 是否全是字母（26个英文字母）
-(BOOL)isAllLetterCharacter{
    NSString *stringRegex = @"^[A-Za-z]+$";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    return [stringTest evaluateWithObject:self];
}
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl{
    NSString *checkStr = @"https://".add(@"http://");
    return [self rangeOfString:checkStr].location != NSNotFound;
}
/// 正则匹配手机号
-(BOOL)checkTelNumber{
    NSString *pattern = @"^1+[3578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

@end
