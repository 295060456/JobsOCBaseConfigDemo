//
//  RegisterApi.h
//  Solar
//
//  Created by TangQiao on 11/8/14.
//  Copyright (c) 2014 fenbi. All rights reserved.
//
#import "YTKNetworkToolsHeader.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

@interface RegisterApi : BaseRequest

-(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters;
-(NSString *_Nonnull)userId;/// 在链式请求中，下一个请求的参数来源于上一个请求的结果

@end
