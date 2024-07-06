//
//  NSObject+JobsCheck.h
//  Casino
//
//  Created by Jobs on 2022/1/10.
//

#import <Foundation/Foundation.h>
#import "NSString+Judgment.h"

NS_ASSUME_NONNULL_BEGIN
/// 本工程的各种限制条件
@interface NSObject (JobsCheck)

#pragma mark —— 通过验证返回YES
-(BOOL)userAndPasswordNotUpTo:(NSString *)value;
-(BOOL)telNotUpTo:(NSString *)value;
/// 用户账号由6-15个字符组成，只能输入字母大小写和数字
-(BOOL)checkUserName:(NSString *)userName;
/// 用户密码由6-15个字符组成，只能输入字母大小写和数字
-(BOOL)checkUserPassword:(NSString *)userPassword;
/// 登录的数据检验
-(BOOL)checkLoginData:(JobsAppDoorModel *)model;
/// 注册的数据检验
-(BOOL)checkRegisterData:(JobsAppDoorModel *)model;
/// 电话号码可以最多20位数，超过后无法输入，且电话号码中无法包含特殊字符或者空格
-(BOOL)checkTelNum:(NSString *)telNum;

@end

NS_ASSUME_NONNULL_END
