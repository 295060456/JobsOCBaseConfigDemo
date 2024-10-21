//
//  FM_user_logout_api.m
//  FM
//
//  Created by User on 9/16/24.
//

#import "FM_user_logout_api.h"

@implementation FM_user_logout_api
/// 请求的完整URL：用户登出【POST】
-(NSString *)requestUrl{
    return This.BaseUrl.add(self.post_user_auth_logout.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
