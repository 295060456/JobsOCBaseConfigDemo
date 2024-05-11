//
//  JobsAppDoorModel.h
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorModel : NSObject

@property(nonatomic,strong)NSString *userName;/// 用户名
@property(nonatomic,strong)NSString *password;/// 密码
@property(nonatomic,strong)NSString *confirmPassword;/// 确认密码
@property(nonatomic,strong)NSString *tel;/// 电话号码
@property(nonatomic,strong)NSString *verificationCode;/// 手机验证码

@end

NS_ASSUME_NONNULL_END
