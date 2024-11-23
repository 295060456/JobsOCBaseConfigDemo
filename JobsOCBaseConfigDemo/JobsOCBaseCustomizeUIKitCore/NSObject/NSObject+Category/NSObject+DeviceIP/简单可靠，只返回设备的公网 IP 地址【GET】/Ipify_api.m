//
//  Ipify_api.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "Ipify_api.h"

@implementation Ipify_api
/// 请求的完整URL：简单可靠，只返回设备的公网IP地址@GET
/// https://api.ipify.org?format=json
-(NSString *)requestUrl{
    return @"https://api.ipify.org?format=json".add(self.urlParameters);// YOUR_API_KEY
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end

@implementation IpifyModel

@end


