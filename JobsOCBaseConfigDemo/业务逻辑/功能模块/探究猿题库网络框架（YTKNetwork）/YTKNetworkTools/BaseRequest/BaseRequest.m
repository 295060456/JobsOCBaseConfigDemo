//
//  BaseRequest.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/7/10.
//

#import "BaseRequest.h"

@implementation BaseRequest

+(JobsReturnIDByDicBlock)initByParameters{
    return ^id _Nullable(NSDictionary *_Nullable data){
        return [self.class.alloc initWithParameters:data];
    };
}

-(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters{
    if (self = [super init]) {
        self.parameters = parameters;
    }return self;
}
/// Body 参数（GET 请求不可用）
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
#pragma mark —— 具体子类实现请求Api
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
#pragma mark —— 设置自定义的 HTTP Header
//- (NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary {
//    // 在这里添加你想要的 HTTP header
//    JobsUserModel *loginModel = self.readUserInfo();
//    return @{
//        @"Content-Type": @"application/json", // 设置 Content-Type
//        @"Authorization": loginModel.token // 设置 Authorization
//    };
//}
#pragma mark —— 如果当前请求是GET，下列方法不可用
//- (NSURLRequest *)buildCustomUrlRequest{
//    if(self.requestMethod == YTKRequestMethodGET) return nil;
//    NSError *parseError = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.parameters
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&parseError];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.requestUrl.jobsUrl
//                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
//                                                       timeoutInterval:30];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPMethod:@"GET"];//GET请求
//    [request setHTTPBody:jsonData];//body 数据
//    self.printRequestMessage(request);
//    NSLog(@"");
//    return request;
//}
#pragma mark —— 在链式请求中，下一个请求的参数来源于上一个请求的结果
//-(NSString *_Nonnull)userId{
//    return [[self.responseJSONObject objectForKey:@"userId"] stringValue] ? : JobsInternationalization(@"");
//}
#pragma mark —— LazyLoad
-(NSDictionary *)parameters{
    if(!_parameters){
        _parameters = NSDictionary.dictionary;
    }return _parameters;
}

@end
