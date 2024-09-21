//
//  JobsBaseApi.m
//  FM
//
//  Created by User on 9/12/24.
//

#import "JobsBaseApi.h"

@implementation JobsBaseApi
#pragma mark —— 需要在很具体子类进行实现的
/// URL
-(NSString *)requestUrl{
    return @"";
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}
#pragma mark —— （本类）父类实现的
/// Body 参数
-(id _Nullable)requestArgument{
    return self.parameters;
}
/// 限定接收到的字段类型，如果不匹配则外层block走Failure
-(id)jsonValidator{
    return nil;
}

-(NSInteger)cacheTimeInSeconds{
    return 60 * 3;
}
/// 设置自定义的 HTTP Header
-(NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary {
    // 在这里添加你想要的 HTTP header
    JobsUserModel *loginModel = self.readUserInfoByUserName(JobsUserModel.class,用户信息);
    return @{
        @"Content-Type": @"application/json", // 设置 Content-Type
        @"Authorization": loginModel.token ? : @"" // 设置 Authorization
    };
}

- (NSURLRequest *)buildCustomUrlRequest{
    NSMutableURLRequest *request = self.request(self.requestUrl.jobsUrl);
    for (NSString *key in self.requestHeaderFieldValueDictionary) {
        JobsRequestBuilder.initByURLRequest(request)
            .httpHeaderField(key)
            .value(self.requestHeaderFieldValueDictionary[key]);
    }
    request.HTTPMethod = httpMethod(self.requestMethod);
    if(self.requestMethod != YTKRequestMethodGET){
        request.HTTPBody = self.dataByJSONObject(self.parameters);//body 数据
    }
    self.printRequestMessage(request);
    return request;
}

@end
