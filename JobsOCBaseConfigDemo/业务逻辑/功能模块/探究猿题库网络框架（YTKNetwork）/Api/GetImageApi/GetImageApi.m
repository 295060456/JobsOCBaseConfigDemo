//
//  GetImageApi.m
//  YTKNetworkDemo
//
//  Created by TangQiao on 11/8/14.
//  Copyright (c) 2014 yuantiku.com. All rights reserved.
//

#import "GetImageApi.h"

@implementation GetImageApi
/// 请求的完整URL：
-(NSString *)requestUrl{
    return self.BaseUrl.add(@"");
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

@end
