//
//  GetMemberInfo.m
//  FM
//
//  Created by User on 9/1/24.
//

#import "GetMemberInfo_api.h"

@implementation GetMemberInfo_api
/// 请求的完整URL：获取会员个人信息【GET】
-(NSString *)requestUrl{
    return self.BaseUrl.add(self.get_member_get.url);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end
