//
//  RegisterApi.m
//  Solar
//
//  Created by TangQiao on 11/8/14.
//  Copyright (c) 2014 fenbi. All rights reserved.
//

#import "RegisterApi.h"

@implementation RegisterApi

-(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters{
    if (self = [super init]) {
        self.parameters = parameters;
    }return self;
}

-(NSString *_Nonnull)requestUrl {
    return @"";
}

-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

-(id)requestArgument {
    return nil;
}

-(id)jsonValidator {
    return nil;
}
/// 设置自定义的 HTTP Header
- (NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary {
    // 在这里添加你想要的 HTTP header
    JobsUserModel *loginModel = self.readUserInfo();
    return @{
        @"Content-Type": @"application/json", // 设置 Content-Type
        @"Authorization": loginModel.token // 设置 Authorization
    };
}
/// 如果当前请求是GET，下列方法不可用
- (NSURLRequest *)buildCustomUrlRequest{
    if(self.requestMethod == YTKRequestMethodGET) return nil;
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.parameters
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&parseError];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.requestUrl.jobsUrl
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:30];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"GET"];//GET请求
    [request setHTTPBody:jsonData];//body 数据
    self.printRequestMessage(request);
    NSLog(@"");
    return request;
}
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(NSString *_Nonnull)userId{
    return [[self.responseJSONObject objectForKey:@"userId"] stringValue] ? : JobsInternationalization(@"");
}

@end
