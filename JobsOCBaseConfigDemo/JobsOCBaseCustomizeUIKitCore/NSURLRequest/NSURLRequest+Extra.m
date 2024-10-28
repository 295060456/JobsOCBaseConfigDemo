//
//  NSURLRequest+Extra.m
//  FM
//
//  Created by User on 9/12/24.
//

#import "NSURLRequest+Extra.h"

@implementation NSURLRequest (Extra)

-(JobsReturnMutableURLRequestByVoidBlock _Nonnull)print{
    @jobs_weakify(self)
    return ^NSMutableURLRequest *_Nullable(){
        @jobs_strongify(self)
        // 请求URL
        NSLog(@"请求URL:%@\n",self.URL);
        // 请求方式
        NSLog(@"请求方式:%@\n",self.HTTPMethod);
        // 请求头信息
        NSLog(@"请求头信息:%@\n",self.allHTTPHeaderFields);
        // 请求正文信息
        NSLog(@"请求正文信息:%@\n",self.HTTPBody.stringByUTF8Encoding);
        // 请求响应时间
        NSLog(@"请求响应时间:%@\n",self.currentTimestampString);
        NSLog(@"\n请求URL:%@\n请求方式:%@\n请求头信息:%@\n请求正文信息:%@\n请求响应时间:%@\n",
              self.URL,
              self.HTTPMethod,
              self.allHTTPHeaderFields,
              self.HTTPBody.stringByUTF8Encoding,
              self.currentTimestampString);
        return self.mutableCopy;
    };
}

@end
