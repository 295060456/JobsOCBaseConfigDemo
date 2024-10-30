//
//  NSObject+RegularExpression.m
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#import "NSObject+RegularExpression.h"

@implementation NSObject (RegularExpression)
#pragma mark —— 一些私有方法
/// 基本的验证方法：YES:成功 NO:失败
/// - Parameters:
///   - regEx: 校验格式
///   - data: 要校验的数据
+(BOOL)baseCheckForRegEx:(NSString *)regEx data:(NSString *)data{
    NSPredicate *card = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    return [card evaluateWithObject:data];
}
#pragma mark —— 校验只能输入n位的数字
+(BOOL)checkingNumberWithLength:(NSString *)length number:(NSString *)number{
    NSString *regEx = [NSString stringWithFormat:@"^\\d{%@}$", length];
    return [NSObject baseCheckForRegEx:regEx data:number];
}
#pragma mark —— 校验最少输入n位的数字
+(BOOL)checkingNumberWithLeastLength:(NSString *)leastLength number:(NSString *)number{
    NSString *regEx = [NSString stringWithFormat:@"^\\d{%@,}$", leastLength];
    return [NSObject baseCheckForRegEx:regEx data:number];
}
#pragma mark —— 密码校验
+(BOOL)lc_checkingPasswordWithShortest:(NSInteger)shortest
                               longest:(NSInteger)longest
                              password:(NSString *)pwd{
    NSString *regEx =[NSString stringWithFormat:@"^[a-zA-Z0-9]{%ld,%ld}+$", shortest, longest];
    return [NSObject baseCheckForRegEx:regEx data:pwd];
}
#pragma mark —— 邮箱校验
+(JobsReturnBOOLByStringBlock _Nonnull)checkingEmail{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable email){
        @jobs_strongify(self)
        NSString *regEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        return [NSObject baseCheckForRegEx:regEx data:email];
    };
}
#pragma mark —— 验证(中国大陆)手机号
-(JobsReturnBOOLByStringBlock _Nonnull)checkingMobile{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable mobile){
        @jobs_strongify(self)
        NSString *regEx = @"^1[3|4|5|7|8][0-9]\\d{8}$";
        return [NSObject baseCheckForRegEx:regEx data:mobile];
    };
}
#pragma mark —— 验证电话号
-(JobsReturnBOOLByStringBlock _Nonnull)checkingPhoneNum{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable phone){
        @jobs_strongify(self)
        NSString *regEx = @"^(\\d{3,4}-)\\d{7,8}$";
        return [NSObject baseCheckForRegEx:regEx data:phone];
    };
}
#pragma mark —— 身份证号验证
-(JobsReturnBOOLByStringBlock _Nonnull)checkingIdCard{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable idCard){
        @jobs_strongify(self)
        NSString *regEx = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
        return [NSObject baseCheckForRegEx:regEx data:idCard];
    };
}
#pragma mark —— 由数字和26个英文字母组成的字符串
-(JobsReturnBOOLByStringBlock _Nonnull)checkingStrFormNumberAndLetter{
    return ^BOOL(NSString *_Nullable data){
        NSString *regEx = @"^[A-Za-z0-9]+$";
        return [NSObject baseCheckForRegEx:regEx data:data];
    };
}
#pragma mark —— 26位英文大小写字母组成的字符
-(JobsReturnBOOLByStringBlock _Nonnull)checkingStrFormLowerAndUpperLetter{
    return ^BOOL(NSString *_Nullable data){
        NSString *regEx = @"^[A-Za-z]+$";
        return [NSObject baseCheckForRegEx:regEx data:data];
    };
}
#pragma mark —— 小写字母
-(JobsReturnBOOLByStringBlock _Nonnull)checkingLowerLetter{
    return ^BOOL(NSString *_Nullable lowerCase){
        NSString *regEx = @"^[a-z]+$";
        return [NSObject baseCheckForRegEx:regEx data:lowerCase];
    };
}
#pragma mark —— 大写字母
-(JobsReturnBOOLByStringBlock _Nonnull)checkingUpperLetter{
    return ^BOOL(NSString *_Nullable upperCase){
        NSString *regEx = @"^[A-Z]+$";
        return [NSObject baseCheckForRegEx:regEx data:upperCase];
    };
}
#pragma mark —— 特殊字符
-(JobsReturnBOOLByStringBlock _Nonnull)checkingSpecialChar{
    return ^BOOL(NSString *_Nullable data){
        NSString *regEx = @"[^%&',;=?$\x22]+";
        return [NSObject baseCheckForRegEx:regEx data:data];
    };
}
#pragma mark —— 只能输入数字
-(JobsReturnBOOLByStringBlock _Nonnull)checkingNumber{
    return ^BOOL(NSString *_Nullable number){
        NSString *regEx = @"^[0-9]*$";
        return [NSObject baseCheckForRegEx:regEx data:number];
    };
}

@end
