//
//  NSURLRequest+Extra.h
//  FM
//
//  Created by User on 9/12/24.
//

#import <Foundation/Foundation.h>
#import "YTKNetworkToolsHeader.h"
#import "DefineConstString.h" /// 常量字符串的定义
#import "JobsBlock.h"

#ifndef GETMethod
#define GETMethod httpMethod(YTKRequestMethodGET)
#endif

#ifndef POSTMethod
#define POSTMethod httpMethod(YTKRequestMethodPOST)
#endif

#ifndef PUTMethod
#define PUTMethod httpMethod(YTKRequestMethodPUT)
#endif

#ifndef DELETEMethod
#define DELETEMethod httpMethod(YTKRequestMethodDELETE)
#endif

#ifndef PATCHMethod
#define PATCHMethod httpMethod(YTKRequestMethodPATCH)
#endif

#ifndef HEADMethod
#define HEADMethod httpMethod(YTKRequestMethodHEAD)
#endif


NS_INLINE void JobsPrintURLRequest(NSURLRequest *_Nonnull request){
    if (!request) return;
    // 请求URL
    JobsLog(@"请求URL:%@\n",request.URL);
    // 请求方式
    JobsLog(@"请求方式:%@\n",request.HTTPMethod);
    // 请求头信息
    JobsLog(@"请求头信息:%@\n",request.allHTTPHeaderFields);
    // 请求正文信息
    JobsLog(@"请求正文信息:%@\n",request.HTTPBody.stringByUTF8Encoding);
    // 请求响应时间
    JobsLog(@"请求响应时间:%@\n",request.currentTimestampString(nil));
    JobsLog(@"\n请求URL:%@\n请求方式:%@\n请求头信息:%@\n请求正文信息:%@\n请求响应时间:%@\n",
          request.URL,
          request.HTTPMethod,
          request.allHTTPHeaderFields,
          request.HTTPBody.stringByUTF8Encoding,
          request.currentTimestampString(nil));
}

NS_INLINE NSString * _Nullable httpMethod(YTKRequestMethod method){
    switch (method) {
        case YTKRequestMethodGET:return GET;break;
        case YTKRequestMethodPOST:return POST;break;
        case YTKRequestMethodPUT:return PUT;break;
        case YTKRequestMethodDELETE:return DELETE;break;
        case YTKRequestMethodPATCH: return PATCH;break;
        case YTKRequestMethodHEAD:return HEAD;break;
        default:
            return @"";
            break;
    }
}

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (Extra)
+(JobsReturnURLRequestByURLBlock _Nonnull)initBy;
/// 打印NSURLRequest有效内容，并转化为NSMutableURLRequest对外输出
-(JobsReturnMutableURLRequestByVoidBlock _Nonnull)print;

@end

NS_ASSUME_NONNULL_END
