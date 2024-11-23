//
//  Ipdata_api.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "Ipdata_api.h"

@implementation Ipdata_api
/// 请求的完整URL：提供详细的IP信息@GET
/// https://api.ipdata.co/?api-key=YOUR_API_KEY
-(NSString *)requestUrl{
    return @"https://api.ipdata.co/?api-key=".add(self.urlParameters);// YOUR_API_KEY
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end
