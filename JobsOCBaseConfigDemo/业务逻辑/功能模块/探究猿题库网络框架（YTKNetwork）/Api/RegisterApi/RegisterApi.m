//
//  RegisterApi.m
//  Solar
//
//  Created by TangQiao on 11/8/14.
//  Copyright (c) 2014 fenbi. All rights reserved.
//

#import "RegisterApi.h"

@implementation RegisterApi
/// 请求的完整URL：
-(NSString *_Nonnull)requestUrl {
    return @"";
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(NSString *_Nonnull)userId{
    return [[self.responseJSONObject objectForKey:@"userId"] stringValue] ? : JobsInternationalization(@"");
}

@end
