//
//  BaseRequest.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/7/10.
//

#import "BaseRequest.h"

@implementation BaseRequest

-(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters{
    if (self = [super init]) {
        self.parameters = parameters;
    }return self;
}
/// Body 参数
-(id _Nullable)requestArgument{
    return _parameters;
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}
/// 限定接收到的字段类型，如果不匹配则外层block走Failure
-(id)jsonValidator{
    return nil;
}

-(NSInteger)cacheTimeInSeconds{
    return 60 * 3;
}
#pragma mark —— 具体子类实现
/// 请求Api
//-(NSString *)requestUrl{
//    return [self.BaseUrl stringByAppendingString:self.membersLoginPOST.url];
//}
//- (NSURLRequest *)buildCustomUrlRequest {
//    NSError *parseError = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.parameters
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&parseError];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.requestUrl.url
//                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
//                                                       timeoutInterval:30];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPMethod:@"POST"];//POST请求
//    [request setHTTPBody:jsonData];//body 数据
//    return request;
//}

@end
