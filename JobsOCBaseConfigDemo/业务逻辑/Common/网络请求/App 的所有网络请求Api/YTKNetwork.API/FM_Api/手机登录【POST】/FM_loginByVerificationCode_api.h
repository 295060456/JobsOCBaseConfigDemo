//
//  FM_loginByVerificationCode_api.h
//  FM
//
//  Created by User on 8/27/24.
//

#import "JobsBaseApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface FM_loginByVerificationCode_api : JobsBaseApi

@property(nonatomic,copy)NSString *accessToken;/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
@property(nonatomic,copy)NSString *expireTime;/// 在链式请求中，下一个请求的参数来源于上一个请求的结果

@end

NS_ASSUME_NONNULL_END
