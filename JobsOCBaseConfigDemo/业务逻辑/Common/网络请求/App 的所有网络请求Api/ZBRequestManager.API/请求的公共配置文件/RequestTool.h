//
//  RequestTool.h
//  ZBNetworkingDemo
//
//  Created by Suzhibin on 2020/6/2.
//  Copyright © 2020 Suzhibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "URLManager.h"
#import "ZBNetworking.h"
#import "DataManager.h"
#import "NetworkingConstant.h"
#import "NSObject+UserInfo.h"
#import "NSMutableArray+Extra.h"
#import "NSMutableDictionary+Extra.h"

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#elif __has_include("AFNetworking.h")
#import "AFNetworking.h"
#elif __has_include("AFNetworking-umbrella.h")
#import "AFNetworking-umbrella.h"
#else
#error "AFNetworking header not found"
#endif

NS_INLINE AFHTTPRequestSerializer <AFURLRequestSerialization> *_Nonnull AFRequestSerializer(void){
    return AFHTTPSessionManager.manager.requestSerializer;
}

NS_ASSUME_NONNULL_BEGIN

@interface RequestTool : NSObject

@property(nonatomic,assign)HTTPRequestHeaderLanguageType languageType;

+(jobsByRequestToolBlock _Nullable)setupPublicParametersBy;

@end

NS_ASSUME_NONNULL_END
