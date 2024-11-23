//
//  IP_api.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "IP_api.h"

@implementation IP_api
/// 请求的完整URL：提供丰富的地理位置信息@GET
/// http://ip-api.com/json/
-(NSString *)requestUrl{
    return @"http://ip-api.com/json/".add(self.urlParameters);
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end

@implementation IPApiModel

@end
