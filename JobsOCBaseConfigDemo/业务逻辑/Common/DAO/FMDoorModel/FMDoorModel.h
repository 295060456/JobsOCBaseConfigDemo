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
@property(nonatomic,copy)NSString *accessToken;
@property(nonatomic,copy)NSString *mobile;/// 手机号
@property(nonatomic,copy)NSString *userName;/// 用户名
#pragma mark —— 请求参数
/// 注册（登录）接口的请求参数
@property(nonatomic,copy)NSString *captcha_id;
@property(nonatomic,copy)NSString *captcha_key;
@property(nonatomic,copy)NSString *captcha_output;
@property(nonatomic,copy)NSString *countryCode;/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
@property(nonatomic,copy)NSString *domain;
@property(nonatomic,copy)NSString *domainName;/// 好友邀请域名
@property(nonatomic,copy)NSString *gen_time;
@property(nonatomic,copy)NSString *inviteCode;/// 代理邀请码
@property(nonatomic,copy)NSString *inviteName;/// 好友邀请人账号
@property(nonatomic,copy)NSString *lot_number;
@property(nonatomic,copy)NSString *pass_token;
@property(nonatomic,copy)NSString *password;/// 密码
@property(nonatomic,copy)NSString *referCode;/// 好友邀请码
@property(nonatomic,copy)NSString *smsCode;/// 短信验证码
/// 获取短信验证码的请求参数
@property(nonatomic,strong)NSNumber *actionType;
@property(nonatomic,strong)NSNumber *businessSource;/// 业务来源（1.会员 2.代理）默认会员
@property(nonatomic,copy)NSString *callFlag;/// 调用标识，用于判断是app还是后台管理，默认为空，为空则需要校验图形验证码（1.代理服务）
@property(nonatomic,copy)NSString *mobileArea;/// 区号代码
#pragma mark —— 响应参数
/// 登录接口的响应参数
@property(nonatomic,copy)NSString *expireTime;
@property(nonatomic,copy)NSString *regTime;
@property(nonatomic,copy)NSString *birthday;
@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,assign)NSInteger financeTier;
@property(nonatomic,assign)NSInteger cryptoCount;
@property(nonatomic,copy)NSString *sex;
@property(nonatomic,copy)NSString *realName;
@property(nonatomic,assign)BOOL passwordFlag;
@property(nonatomic,copy)NSString *regCurrency;
@property(nonatomic,copy)NSString *identityCode;
@property(nonatomic,assign)NSInteger ID;
@property(nonatomic,assign)NSInteger tenantId;
@property(nonatomic,copy)NSString *email;
@property(nonatomic,assign)BOOL nickNameStatus;
@property(nonatomic,copy)NSString *regNationCode;
@property(nonatomic,copy)NSString *regNation;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,assign)NSInteger role;
@property(nonatomic,assign)NSInteger bankCardCount;
@property(nonatomic,assign)NSInteger regDay;
@property(nonatomic,assign)NSInteger vipLevel;
@property(nonatomic,copy)NSString *regLang;
#pragma mark —— 自建字段
@property(nonatomic,assign)LoginType loginType;
@property(nonatomic,copy)NSString *tokenExpireTime;
/// 此对象在使用MJExtension.mj_keyValues（将本数据模型转化为字典的时候）需要被排除，因为不支持UIImage数据类型
@property(nonatomic,strong)UIImage *userDefaultHeadImage;
/// 新值（入参）冲抵老值（调用方）
-(JobsDoorModelBlock _Nonnull)updateBy;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FMDoorModel *_Nonnull jobsMakeDoorModel(jobsByDoorModelBlock _Nonnull block){
    FMDoorModel *data = FMDoorModel.alloc.init;
    if (block) block(data);
    return data;
}
