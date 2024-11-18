//
//  NSObject+UAT.h
//  FM
//
//  Created by Admin on 18/11/2024.
//

#import <Foundation/Foundation.h>
#import "FMDoorModel.h"
#import "GTCaptcha4Model.h"

NS_ASSUME_NONNULL_BEGIN
/// UAT环境
@interface NSObject (UAT)
#pragma mark —— 登录
/// 手机号码：09970000001
/// 验证码：888
/// 账号（用户名）：dev023
/// 密码：Jobs29506045^
/// 手机验证码登录
-(FMDoorModel *)mock_uat_login_data1;
/// 手机号码：09970000002
/// 验证码：888
/// 账号（用户名）：JobsGo
/// 密码：Jobs29506045^
/// 备注：账密登录
-(FMDoorModel *)mock_uat_login_data2;
#pragma mark —— 注册
/// 电话号码：09970000001
/// 密码：Jobs29506045^
/// 用户名：dev023
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_signUP_data1;
/// 电话号码：09970000002
/// 密码：Jobs29506045^
/// 用户名：JobsGo
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_signUP_data2;
#pragma mark —— 发送验证码
/// 电话号码：09970000001
/// 用户名：dev023
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_smsCode_data1;
/// 电话号码：09970000002
/// 用户名：JobsGo
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_smsCode_data2;
#pragma mark —— 忘记密码

@end

NS_ASSUME_NONNULL_END
