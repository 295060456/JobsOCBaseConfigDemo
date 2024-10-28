//
//  NSURLSessionDataTask+Extra.h
//  FM
//
//  Created by Admin on 28/10/2024.
//

#import <Foundation/Foundation.h>
#import "NSURLRequest+Extra.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSURLSessionDataTask (Extra)
/// 打印请求体
-(JobsReturnMutableURLRequestByVoidBlock _Nonnull)print;

@end

NS_ASSUME_NONNULL_END
