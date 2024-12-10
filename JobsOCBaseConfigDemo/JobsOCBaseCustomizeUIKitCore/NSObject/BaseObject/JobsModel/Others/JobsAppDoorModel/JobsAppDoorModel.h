//
//  JobsAppDoorModel.h
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorModel : NSObject

@property(nonatomic,copy)NSString *userName;/// 用户名
@property(nonatomic,copy)NSString *password;/// 密码
@property(nonatomic,copy)NSString *confirmPassword;/// 确认密码
@property(nonatomic,copy)NSString *tel;/// 电话号码
@property(nonatomic,copy)NSString *verificationCode;/// 手机验证码

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsAppDoorModel *_Nonnull jobsMakeAppDoorModel (jobsByAppDoorModelBlock _Nonnull block){
    JobsAppDoorModel *data = JobsAppDoorModel.alloc.init;
    if (block) block(data);
    return data;
}
