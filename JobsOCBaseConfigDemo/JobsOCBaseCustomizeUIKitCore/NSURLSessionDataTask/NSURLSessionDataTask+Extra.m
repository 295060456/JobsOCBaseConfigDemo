//
//  NSURLSessionDataTask+Extra.m
//  FM
//
//  Created by Admin on 28/10/2024.
//

#import "NSURLSessionDataTask+Extra.h"

@implementation NSURLSessionDataTask (Extra)
/// 打印请求体
-(JobsReturnMutableURLRequestByVoidBlock _Nonnull)print{
    @jobs_weakify(self)
    return ^NSMutableURLRequest *_Nullable(){
        @jobs_strongify(self)
        return self.originalRequest.print();
    };
}

@end
