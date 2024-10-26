//
//  BaseRequest.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/7/10.
//

#import "BaseRequest.h"

@implementation BaseRequest
#pragma mark —— 一些公有方法
+(instancetype _Nonnull)init{
    return [self.alloc init];
}
/// 直接调用，后面不能拼byURLParameters
+(JobsReturnYTKRequestByDictionaryBlock _Nonnull)initByBodyParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        return [self.class.alloc initByBodyParameters:data];
    };
}
/// 直接调用，后面不能拼byBodyParameters
+(JobsReturnYTKRequestByDictionaryBlock _Nonnull)initByURLParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        return [self.class.alloc initByURLParameters:data];
    };
}

-(JobsReturnYTKRequestByDictionaryBlock _Nonnull)byBodyParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        self.parameters = data;
        return self;
    };
}

-(JobsReturnYTKRequestByIDBlock _Nonnull)byURLParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(id _Nullable data){
        @jobs_strongify(self)
        self.urlParameters = data;
        return self;
    };
}
#pragma mark —— 一些私有方法
-(instancetype _Nullable)initByBodyParameters:(NSDictionary *_Nullable)bodyParameters{
    if (self = [super init]) {
        self.parameters = bodyParameters;
    }return self;
}

-(instancetype _Nullable)initByURLParameters:(id _Nullable)urlParameters{
    if (self = [super init]) {
        self.urlParameters = urlParameters;
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
//    return [This.BaseUrl stringByAppendingString:self.membersLoginPOST.url];
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
//    JobsUserModel *loginModel = self.readUserInfo;
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
        _parameters = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            
        });
    }return _parameters;
}

@end
