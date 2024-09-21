//
//  FM_loginByAccAndPwd.m
//  FM
//
//  Created by User on 8/24/24.
//

#import "FM_loginByAccAndPwd_api.h"

@implementation FM_loginByAccAndPwd_api
/// 请求的完整URL：账号密码登录【POST】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.post_user_auth_accountLogin.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
