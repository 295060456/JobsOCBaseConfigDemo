//
// Created by Chenyu Lan on 8/27/14.
// Copyright (c) 2014 Fenbi. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKBaseRequest.h>)
#import <YTKNetwork/YTKBaseRequest.h>
#else
#import "YTKBaseRequest.h"
#endif

#if __has_include(<YTKNetwork/YTKNetworkConfig.h>)
#import <YTKNetwork/YTKNetworkConfig.h>
#else
#import "YTKNetworkConfig.h"
#endif

#if __has_include(<AFNetworking/AFURLRequestSerialization.h>)
#import <AFNetworking/AFURLRequestSerialization.h>
#else
#import "AFURLRequestSerialization.h"
#endif
/// 给url追加arguments，用于全局参数，比如AppVersion, ApiVersion等
@interface YTKUrlArgumentsFilter : NSObject <YTKUrlFilterProtocol>

+(YTKUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;

-(NSString *)filterUrl:(NSString *)originUrl
           withRequest:(YTKBaseRequest *)request;

@end
