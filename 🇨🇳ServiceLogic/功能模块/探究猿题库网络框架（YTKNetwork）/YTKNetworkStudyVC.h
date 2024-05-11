//
//  YTKNetworkStudyVC.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/2/19.
//

#import "BaseViewController.h"

#import "YTKBatchRequest.h"
#import "YTKChainRequest.h"

#import "YTKUrlArgumentsFilter.h"
#import "GetImageApi.h"
#import "GetUserInfoApi.h"
#import "RegisterApi.h"
#import "UploadImageApi.h"
#import "GetCustomerContactApi.h"

#import "YTKChainRequest+AnimatingAccessory.h"
#import "YTKBatchRequest+AnimatingAccessory.h"
#import "YTKBaseRequest+AnimatingAccessory.h"
#import "YTKAnimatingRequestAccessory.h"

#import "YTKRequest+Custom.h"

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface YTKNetworkStudyVC : BaseViewController<YTKChainRequestDelegate>

@end

NS_ASSUME_NONNULL_END
