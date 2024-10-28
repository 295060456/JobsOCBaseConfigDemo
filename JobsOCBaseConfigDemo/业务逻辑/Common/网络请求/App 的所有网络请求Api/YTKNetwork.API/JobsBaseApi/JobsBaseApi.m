//
//  JobsBaseApi.m
//  FM
//
//  Created by User on 9/12/24.
//

#import "JobsBaseApi.h"

@implementation JobsBaseApi
#pragma mark —— 覆写 YTKBaseRequest 方法
-(__kindof NSURLRequest *)buildCustomUrlRequest{
    @jobs_weakify(self)
    return [self jobsMakeRequestByBlock:^(__kindof NSMutableURLRequest * _Nullable request) {
        @jobs_strongify(self)
        /// 请求头
        for (NSString *key in self.requestHeaderFieldValueDictionary) {
            [request setValue:self.requestHeaderFieldValueDictionary[key] forHTTPHeaderField:key];
        }
        /// 请求方法
        request.HTTPMethod = httpMethod(self.requestMethod);
        /// 请求的（Body）参数
        if(self.requestMethod != YTKRequestMethodGET){
            request.HTTPBody = self.dataByJSONObject(self.parameters);//body 数据
        }self.printRequestMessage(request);/// 打印URLRequest
    }];
}
#pragma mark ——（本类）父类实现的
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
#pragma mark —— 以下需要在很具体子类进行实现的
/// URL
-(NSString *)requestUrl{
    return @"";
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
