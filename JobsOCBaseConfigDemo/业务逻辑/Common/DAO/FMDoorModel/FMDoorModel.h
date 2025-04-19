//
//  FMSignUpModel.h
//  FM
//
//  Created by Admin on 6/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefineAllEnumHeader.h"
#import "BaseModel.h"
#import "NSCoder+Extra.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FMDoorModel : BaseModel
<
NSCoding,/// 编码
NSSecureCoding/// 解码
>
#pragma mark —— 共用参数
Prop_copy()NSString *accessToken;
Prop_copy()NSString *mobile;/// 手机号
Prop_copy()NSString *userName;/// 用户名
#pragma mark —— 请求参数
/// 注册（登录）接口的请求参数
Prop_copy()NSString *captcha_id;
Prop_copy()NSString *captcha_key;
Prop_copy()NSString *captcha_output;
Prop_copy()NSString *countryCode;/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
Prop_copy()NSString *domain;
Prop_copy()NSString *domainName;/// 好友邀请域名
Prop_copy()NSString *gen_time;
Prop_copy()NSString *inviteCode;/// 代理邀请码
Prop_copy()NSString *inviteName;/// 好友邀请人账号
Prop_copy()NSString *lot_number;
Prop_copy()NSString *pass_token;
Prop_copy()NSString *password;/// 密码
Prop_copy()NSString *referCode;/// 好友邀请码
Prop_copy()NSString *smsCode;/// 短信验证码
/// 获取短信验证码的请求参数
Prop_strong()NSNumber *actionType;
Prop_strong()NSNumber *businessSource;/// 业务来源（1.会员 2.代理）默认会员
Prop_copy()NSString *callFlag;/// 调用标识，用于判断是app还是后台管理，默认为空，为空则需要校验图形验证码（1.代理服务）
Prop_copy()NSString *mobileArea;/// 区号代码
#pragma mark —— 响应参数
/// 登录接口的响应参数
Prop_copy()NSString *expireTime;
Prop_copy()NSString *regTime;
Prop_copy()NSString *birthday;
Prop_copy()NSString *nickName;
Prop_copy()NSString *status;
Prop_assign()NSInteger financeTier;
Prop_assign()NSInteger cryptoCount;
Prop_copy()NSString *sex;
Prop_copy()NSString *realName;
Prop_assign()BOOL passwordFlag;
Prop_copy()NSString *regCurrency;
Prop_copy()NSString *identityCode;
Prop_assign()NSInteger ID;
Prop_assign()NSInteger tenantId;
Prop_copy()NSString *email;
Prop_assign()BOOL nickNameStatus;
Prop_copy()NSString *regNationCode;
Prop_copy()NSString *regNation;
Prop_copy()NSString *avatar;
Prop_assign()NSInteger role;
Prop_assign()NSInteger bankCardCount;
Prop_assign()NSInteger regDay;
Prop_assign()NSInteger vipLevel;
Prop_copy()NSString *regLang;
#pragma mark —— 自建字段
Prop_assign()LoginType loginType;
Prop_copy()NSString *tokenExpireTime;
/// 此对象在使用MJExtension.mj_keyValues（将本数据模型转化为字典的时候）需要被排除，因为不支持UIImage数据类型
Prop_strong()UIImage *userDefaultHeadImage;
/// 新值（入参）冲抵老值（调用方）
-(JobsDoorModelBlock _Nonnull)updateBy;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FMDoorModel *_Nonnull jobsMakeDoorModel(jobsByDoorModelBlock _Nonnull block){
    FMDoorModel *data = FMDoorModel.alloc.init;
    if (block) block(data);
    return data;
}
