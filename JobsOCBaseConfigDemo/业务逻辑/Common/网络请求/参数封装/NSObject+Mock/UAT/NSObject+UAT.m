//
//  NSObject+UAT.m
//  FM
//
//  Created by Admin on 18/11/2024.
//

#import "NSObject+UAT.h"

@implementation NSObject (UAT)
#pragma mark —— 登录
/// 手机号码：09970000001
/// 验证码：888
/// 账号（用户名）：dev023
/// 密码：Jobs29506045^
/// 手机验证码登录
-(FMDoorModel *)mock_uat_login_data1{
    return jobsMakeDoorModel(^(__kindof FMDoorModel * _Nullable data) {
        data.captcha_id = @"";
        data.captcha_key = @"";
        data.captcha_output = @"";
        data.countryCode = @"CN";/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
        data.domain = @"";
        data.gen_time = @"";
        data.inviteCode = @"";/// 代理邀请码
        data.lot_number = @"";
        data.mobile = @"09970000001";/// 手机号 09970000001
        data.pass_token = @"";
        data.password = @"Jobs29506045^";/// 密码 Jobs29506045^
        data.referCode = @"";
        data.smsCode = @"888";/// 短信验证码 888
        data.userName = @"dev023";/// 用户名 dev023
    });
}
/// 手机号码：09970000002
/// 验证码：888
/// 账号（用户名）：JobsGo
/// 密码：Jobs29506045^
/// 备注：账密登录
-(FMDoorModel *)mock_uat_login_data2{
    return jobsMakeDoorModel(^(__kindof FMDoorModel *_Nullable data) {
        data.captcha_id = @"";
        data.captcha_key = @"";
        data.captcha_output = @"";
        data.countryCode = @"PH";/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
        data.domain = @"";
        data.domainName = @"";/// 好友邀请域名
        data.gen_time = @"";
        data.inviteName = @"";/// 好友邀请人账号
        data.inviteCode = @"";/// 代理邀请码
        data.lot_number = @"";
        data.mobile = @"09970000002";/// 手机号 09970000002
        data.pass_token = @"";
        data.password = @"Jobs29506045^";/// 密码 Jobs29506045^
        data.referCode = @"";
        data.smsCode = @"888";/// 短信验证码 888
        data.userName = @"JobsGo";/// 账号（用户名）：pendlessk01
    });
}
#pragma mark —— 注册
/// 电话号码：09970000001
/// 密码：Jobs29506045^
/// 用户名：dev023
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_signUP_data1{
    return ^__kindof FMDoorModel *_Nullable(__kindof GTCaptcha4Model *_Nullable model){
        return jobsMakeDoorModel(^(__kindof FMDoorModel * _Nullable data) {
            data.captcha_key = @"";
            data.captcha_id = Guard(model.result.captcha_id);
            data.captcha_output = Guard(model.result.captcha_output);
            data.gen_time = Guard(model.result.gen_time);
            data.lot_number = Guard(model.result.lot_number);
            data.pass_token = Guard(model.result.pass_token);
            data.countryCode = @"PH";/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
            data.domain = @"";
            data.inviteCode = @"";/// 代理邀请码
            data.mobile = @"09970000001";
            data.password = @"Jobs29506045^";/// 密码
            data.referCode = @"";/// 好友邀请码
            data.smsCode = @"888";/// 短信验证码
            data.userName = @"dev023";/// 账号（用户名）：dev023
        });
    };
}
/// 电话号码：09970000002
/// 密码：Jobs29506045^
/// 用户名：JobsGo
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_signUP_data2{
    return ^__kindof FMDoorModel *_Nullable(__kindof GTCaptcha4Model *_Nullable model){
        return jobsMakeDoorModel(^(__kindof FMDoorModel * _Nullable data) {
            data.captcha_key = @"";
            data.captcha_id = Guard(model.result.captcha_id);
            data.captcha_output = Guard(model.result.captcha_output);
            data.gen_time = Guard(model.result.gen_time);
            data.lot_number = Guard(model.result.lot_number);
            data.pass_token = Guard(model.result.pass_token);
            data.countryCode = @"PH";/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
            data.domain = @"";
            data.inviteCode = @"";/// 代理邀请码
            data.mobile = @"09970000002";
            data.password = @"Jobs29506045^";/// 密码
            data.referCode = @"";/// 好友邀请码
            data.smsCode = @"888";/// 短信验证码
            data.userName = @"JobsGo";/// 用户名
        });
    };
}
#pragma mark —— 发送验证码
/// 电话号码：09970000001
/// 用户名：dev023
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_smsCode_data1{
    return ^__kindof FMDoorModel *_Nullable(__kindof GTCaptcha4Model *_Nullable model){
        return jobsMakeDoorModel(^(__kindof FMDoorModel * _Nullable data) {
            data.actionType = @(USERTYPE_REGISTER);
            data.businessSource = @(BUSINESSSOURCE_MEMBER);/// 业务来源（1.会员 2.代理）默认会员
            data.callFlag = @"";/// 调用标识，用于判断是app还是后台管理，默认为空，为空则需要校验图形验证码（1.代理服务）
            data.captcha_id = model.result.captcha_id;
            data.captcha_key = @"";
            data.captcha_output = model.result.captcha_output;
            data.domain = @"";
            data.gen_time = model.result.gen_time;
            data.lot_number = model.result.lot_number;
            data.mobile = @"09970000001";///
            data.mobileArea = @"63";/// 区号代码
            data.pass_token = model.result.pass_token;
            data.userName = @"dev023";/// 会员/代理账号
        });
    };
}
/// 电话号码：09970000002
/// 用户名：JobsGo
-(JobsReturnDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_smsCode_data2{
    return ^__kindof FMDoorModel *_Nullable(__kindof GTCaptcha4Model *_Nullable model){
        return jobsMakeDoorModel(^(__kindof FMDoorModel * _Nullable data) {
            data.actionType = @(USERTYPE_REGISTER);
            data.businessSource = @(BUSINESSSOURCE_MEMBER);/// 业务来源（1.会员 2.代理）默认会员
            data.callFlag = @"";/// 调用标识，用于判断是app还是后台管理，默认为空，为空则需要校验图形验证码（1.代理服务）
            data.captcha_id = model.result.captcha_id;
            data.captcha_key = @"";
            data.captcha_output = model.result.captcha_output;
            data.domain = @"";
            data.gen_time = model.result.gen_time;
            data.lot_number = model.result.lot_number;
            data.mobile = @"09970000002";///
            data.mobileArea = @"63";/// 区号代码
            data.pass_token = model.result.pass_token;
            data.userName = @"JobsGo";/// 会员/代理账号
        });
    };
}
#pragma mark —— 忘记密码

@end
