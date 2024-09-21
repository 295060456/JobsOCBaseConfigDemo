//
//  FM_check_login_verification.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/2/19.
//

#import "FM_check_login_verification_api.h"

@implementation FM_check_login_verification_api
/// 请求的完整URL：发送短信验证码【POST】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.post_user_verCode_sendSms.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
