//
//  Ipinfo_api.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "Ipinfo_api.h"

@implementation Ipinfo_api
/// 请求的完整URL：提供详细的IP信息@GET
/// https://ipinfo.io/json
-(NSString *)requestUrl{
    return @"https://ipinfo.io/json".add(self.urlParameters);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end

@implementation IpinfoModel

@end
