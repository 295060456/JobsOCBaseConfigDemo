//
//  GetUserInfoApi.h
//  YTKNetworkDemo
//
//  Created by TangQiao on 11/8/14.
//  Copyright (c) 2014 yuantiku.com. All rights reserved.
//
#import "YTKNetworkToolsHeader.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

@interface GetUserInfoApi : BaseRequest

-(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters;

@end
