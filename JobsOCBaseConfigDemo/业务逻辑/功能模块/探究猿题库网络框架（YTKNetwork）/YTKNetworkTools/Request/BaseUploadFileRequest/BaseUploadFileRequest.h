//
//  BaseUploadFileRequest.h
//  FM
//
//  Created by Admin on 5/12/2024.
//

#import "BaseRequest.h"
#import "JobsFileModel.h"
#import "DefineProperty.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#elif __has_include("AFNetworking.h")
#import "AFNetworking.h"
#elif __has_include("AFNetworking-umbrella.h")
#import "AFNetworking-umbrella.h"
#else
#error "AFNetworking header not found"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BaseUploadFileRequest : BaseRequest

-(JobsReturnRequestByFileModelBlock _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
