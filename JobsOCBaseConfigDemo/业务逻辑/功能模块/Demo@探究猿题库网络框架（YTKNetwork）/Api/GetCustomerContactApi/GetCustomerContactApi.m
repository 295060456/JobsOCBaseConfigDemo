//
//  GetCustomerContactApi.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/2/19.
//

#import "GetCustomerContactApi.h"

@implementation GetCustomerContactApi
/// 请求Api
-(NSString *)requestUrl{
    return This.BaseUrl.add(@"");
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end
