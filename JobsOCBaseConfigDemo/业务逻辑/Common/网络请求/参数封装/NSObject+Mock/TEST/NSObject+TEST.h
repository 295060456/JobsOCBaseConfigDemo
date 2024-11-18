//
//  NSObject+TEST.h
//  FM
//
//  Created by Admin on 18/11/2024.
//

#import <Foundation/Foundation.h>
#import "FMDoorModel.h"
#import "GTCaptcha4Model.h"

NS_ASSUME_NONNULL_BEGIN
/// 测试环境
@interface NSObject (TEST)
#pragma mark —— 登录
/// 手机号码：
/// 验证码：
/// 账号（用户名）：
/// 密码：
/// 手机验证码登录
-(FMDoorModel *)mock_test_login_data1;
/// 手机号码：
/// 验证码：
/// 账号（用户名）：
/// 密码：
/// 账密登录
-(FMDoorModel *)mock_test_login_data2;
#pragma mark —— 注册
/// 电话号码：
/// 密码：
/// 用户名：
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_test_signUP_data1;
/// 电话号码：
/// 密码：
/// 用户名：
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_test_signUP_data2;
#pragma mark —— 发送验证码
/// 电话号码：
/// 用户名：
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_test_smsCode_data1;
/// 电话号码：
/// 用户名：
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_test_smsCode_data2;
#pragma mark —— 忘记密码

@end

NS_ASSUME_NONNULL_END
