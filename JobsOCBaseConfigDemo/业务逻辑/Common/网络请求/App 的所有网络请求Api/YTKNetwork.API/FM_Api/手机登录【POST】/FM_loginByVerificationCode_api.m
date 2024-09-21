//
//  FM_loginByVerificationCode_api.m
//  FM
//
//  Created by User on 8/27/24.
//

#import "FM_loginByVerificationCode_api.h"

@implementation FM_loginByVerificationCode_api
/// 请求的完整URL：手机登录【POST】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.post_user_auth_mobileLogin.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(NSString *_Nonnull)accessToken{
    return [[self.responseJSONObject objectForKey:@"useaccessTokenrId"] stringValue] ? : JobsInternationalization(@"");
}
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(NSString *_Nonnull)expireTime{
    return [[self.responseJSONObject objectForKey:@"expireTime"] stringValue] ? : JobsInternationalization(@"");
}

@end
