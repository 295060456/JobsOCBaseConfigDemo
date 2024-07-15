//
//  GetCustomerContactApi.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/2/19.
//

#import "GetCustomerContactApi.h"

@implementation GetCustomerContactApi{
    NSDictionary *_Nullable _parameters;
}

-(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters{
    if (self = [super init]) {
        _parameters = parameters;
    }return self;
}
/// 请求Api
-(NSString *)requestUrl{
    return [self.BaseUrl stringByAppendingString:self.customerContactGET.url];
}
/// Body 参数
-(id _Nullable)requestArgument{
    return _parameters;
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

- (NSURLRequest *)buildCustomUrlRequest{
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
    return request;
}

@end
