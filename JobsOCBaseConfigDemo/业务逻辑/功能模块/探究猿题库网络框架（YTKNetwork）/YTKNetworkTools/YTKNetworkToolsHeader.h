//
//  YTKNetworkToolsHeader.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/7/10.
//

#ifndef YTKNetworkToolsHeader_h
#define YTKNetworkToolsHeader_h

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<AFNetworking/AFURLRequestSerialization.h>)
#import <AFNetworking/AFURLRequestSerialization.h>
#else
#import "AFURLRequestSerialization.h"
#endif

#pragma mark —— 自定义封装
#import "YTKBaseRequest+Extra.h"
#pragma mark —— 一些基础定义
#import "NetworkingConstant.h"
#pragma mark —— BaseRequest
#import "BaseRequest.h"
#pragma mark —— YTKNetworkAccessory
#import "YTKChainRequest+AnimatingAccessory.h"
#import "YTKBatchRequest+AnimatingAccessory.h"
#import "YTKBaseRequest+AnimatingAccessory.h"
#import "YTKAnimatingRequestAccessory.h"
#pragma mark —— YTKUrlArgumentsFilter
#import "YTKUrlArgumentsFilter.h"

#endif /* YTKNetworkToolsHeader_h */
