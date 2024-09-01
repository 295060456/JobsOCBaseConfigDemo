//
//  GetCustomerContactApi.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/2/19.
//

#import "GetCustomerContactApi.h"

@implementation GetCustomerContactApi

-(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters{
    if (self = [super init]) {
        self.parameters = parameters;
    }return self;
}
/// 请求Api
-(NSString *)requestUrl{
    return self.BaseUrl.add(@"");
}
/// Body 参数
-(id _Nullable)requestArgument{
    return self.parameters;
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}
/// 限定接收到的字段类型，如果不匹配则外层block走Failure
-(id)jsonValidator{
    return nil;
}

-(NSInteger)cacheTimeInSeconds{
    return 60 * 3;
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
    [request setHTTPMethod:@"POST"];//POST请求
    [request setHTTPBody:jsonData];//body 数据
    self.printRequestMessage(request);
    NSLog(@"");
    return request;
}


@end
