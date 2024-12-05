//
//  NSURLRequest+Extra.h
//  FM
//
//  Created by User on 9/12/24.
//

#import <Foundation/Foundation.h>
#import "YTKNetworkToolsHeader.h"
#import "JobsBlock.h"

#define GETMethod httpMethod(YTKRequestMethodGET);
#define POSTMethod httpMethod(YTKRequestMethodPOST);
#define PUTMethod httpMethod(YTKRequestMethodPUT);
#define DELETEMethod httpMethod(YTKRequestMethodDELETE);
#define PATCHMethod httpMethod(YTKRequestMethodPATCH);
#define HEADMethod httpMethod(YTKRequestMethodHEAD);

NS_INLINE void JobsPrintURLRequest(NSURLRequest *_Nonnull request){
    // 请求URL
    NSLog(@"请求URL:%@\n",request.URL);
    // 请求方式
    NSLog(@"请求方式:%@\n",request.HTTPMethod);
    // 请求头信息
    NSLog(@"请求头信息:%@\n",request.allHTTPHeaderFields);
    // 请求正文信息
    NSLog(@"请求正文信息:%@\n",request.HTTPBody.stringByUTF8Encoding);
    // 请求响应时间
    NSLog(@"请求响应时间:%@\n",request.currentTimestampString(nil));
    NSLog(@"\n请求URL:%@\n请求方式:%@\n请求头信息:%@\n请求正文信息:%@\n请求响应时间:%@\n",
          request.URL,
          request.HTTPMethod,
          request.allHTTPHeaderFields,
          request.HTTPBody.stringByUTF8Encoding,
          request.currentTimestampString(nil));
}

NS_INLINE NSString * _Nullable httpMethod(YTKRequestMethod method){
    switch (method) {
        case YTKRequestMethodGET:return @"GET";break;
        case YTKRequestMethodPOST:return @"POST";break;
        case YTKRequestMethodPUT:return @"PUT";break;
        case YTKRequestMethodDELETE:return @"DELETE";break;
        case YTKRequestMethodPATCH: return @"PATCH";break;
        case YTKRequestMethodHEAD:return @"HEAD";break;
        default:
            return @"";
            break;
    }
}

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (Extra)
/// 打印NSURLRequest有效内容，并转化为NSMutableURLRequest对外输出
-(JobsReturnMutableURLRequestByVoidBlock _Nonnull)print;

@end

NS_ASSUME_NONNULL_END
