//
//  FMSignUpModel.h
//  FM
//
//  Created by Admin on 6/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefineAllEnumHeader.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FMDoorModel : NSObject
/// 注册（登录）接口的请求参数
@property(nonatomic,copy)NSString *captcha_id;
@property(nonatomic,copy)NSString *captcha_key;
@property(nonatomic,copy)NSString *captcha_output;
@property(nonatomic,copy)NSString *countryCode;/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
@property(nonatomic,copy)NSString *domain;
@property(nonatomic,copy)NSString *gen_time;
@property(nonatomic,copy)NSString *inviteCode;/// 代理邀请码
@property(nonatomic,copy)NSString *lot_number;
@property(nonatomic,copy)NSString *mobile;/// 手机号
@property(nonatomic,copy)NSString *pass_token;
@property(nonatomic,copy)NSString *password;/// 密码
@property(nonatomic,copy)NSString *referCode;
@property(nonatomic,copy)NSString *smsCode;/// 短信验证码
@property(nonatomic,copy)NSString *userName;/// 用户名
/// 密码重置的请求参数
@property(nonatomic,copy)NSString *accessToken;
/// 获取短信验证码的请求参数
@property(nonatomic,strong)NSNumber *actionType;
@property(nonatomic,strong)NSNumber *businessSource;/// 业务来源（1.会员 2.代理）默认会员
@property(nonatomic,copy)NSString *callFlag;/// 调用标识，用于判断是app还是后台管理，默认为空，为空则需要校验图形验证码（1.代理服务）
@property(nonatomic,copy)NSString *mobileArea;/// 区号代码

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FMDoorModel *_Nonnull jobsMakeDoorModel(jobsBySignUpModelBlock _Nonnull block){
    FMDoorModel *data = FMDoorModel.alloc.init;
    if (block) block(data);
    return data;
}
