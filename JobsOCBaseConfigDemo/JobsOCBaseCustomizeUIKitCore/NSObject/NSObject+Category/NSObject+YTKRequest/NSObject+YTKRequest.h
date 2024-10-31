//
//  NSObject+YTKNetwork.h
//  FM
//
//  Created by Admin on 31/10/2024.
//

#import <Foundation/Foundation.h>

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "NSObject+YTKNetwork.h"
#import "YTKBaseRequest+Extra.h"

#import "JobsResponseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YTKRequest) <YTKChainRequestDelegate>

@end

NS_ASSUME_NONNULL_END
