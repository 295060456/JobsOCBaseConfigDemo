//
//  BaseRequest.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/7/10.
//

#import "BaseRequest.h"

@interface BaseRequest ()

@end

@implementation BaseRequest
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
#pragma mark —— 加请求头参数
-(JobsReturnYTKRequestByDictionaryBlock _Nonnull)byHeaderParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        [self.customHTTPHeader addEntriesFromDictionary:data];
        NSLog(@"请求头: %@", self.requestHeaderFieldValueDictionary);
        return self;
    };
}
#pragma mark —— 加Body参数
-(JobsReturnYTKRequestByDictionaryBlock _Nonnull)byBodyParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nonnull data){
        @jobs_strongify(self)
        if(data) self.parameters = data.mutableDic();
        return self;
    };
}
#pragma mark —— 加URL参数
-(JobsReturnYTKRequestByIDBlock _Nonnull)byURLParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(id _Nullable data){
        @jobs_strongify(self)
        self.urlParameters = data;
        return self;
    };
}
#pragma mark —— 一些私有方法
-(instancetype _Nullable)initByBodyParameters:(NSDictionary *_Nonnull)bodyParameters{
    if (self = [super init]) {
        if(bodyParameters) self.parameters = bodyParameters.mutableDic();
    }return self;
}

-(instancetype _Nullable)initByURLParameters:(id _Nullable)urlParameters{
    if (self = [super init]) {
        self.urlParameters = urlParameters;
    }return self;
}
/// Body 参数（GET 请求不可用）
-(id _Nullable)requestArgument{
    return self.parameters;
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
@synthesize customHTTPHeader = _customHTTPHeader;
-(NSMutableDictionary *)customHTTPHeader{
    if(!_customHTTPHeader){
        /// 在这里添加你想要的 HTTP header
        @jobs_weakify(self)
        _customHTTPHeader = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable headers) {
            @jobs_strongify(self)
            /// 设置 Content-Type
            [headers setValue:@"application/json"
                       forKey:ContentType];
            /// 设置 Authorization
            if(self.doorModel) [headers setValue:self.doorModel.token
                                          forKey:Authorization];
            /// 请求的语言环境
    //        switch (self.currentLanguageType) {
    //            case HTTPRequestHeaderLanguageEn:{
    //                headers[@"language"] = @"en_US";
    //            }break;
    //            case HTTPRequestHeaderLanguageCN:{
    //                headers[@"language"] = @"zh_CN";
    //            }break;
    //            default:
    //                break;
    //        }
        });
    }return _customHTTPHeader;
}
#pragma mark —— 在链式请求中，下一个请求的参数来源于上一个请求的结果
//-(NSString *_Nonnull)userId{
//    return [[self.responseJSONObject objectForKey:@"userId"] stringValue] ? : JobsInternationalization(@"");
//}
#pragma mark ——  复写 YTKBaseRequest 方法
/// 设置自定义的 HTTP Header
-(NSMutableDictionary *)requestHeaderFieldValueDictionary{
    return self.customHTTPHeader;
}
/// 具体子类实现请求Api
//-(NSString *)requestUrl{
//    return [This.BaseUrl stringByAppendingString:self.membersLoginPOST.url];
//}
///
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
/// 如果当前请求是GET，下列方法不可用
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
#pragma mark —— LazyLoad
@synthesize parameters = _parameters;
-(NSMutableDictionary *)parameters{
    if(!_parameters){
        _parameters = jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            
        });
    }return _parameters;
}

@end
