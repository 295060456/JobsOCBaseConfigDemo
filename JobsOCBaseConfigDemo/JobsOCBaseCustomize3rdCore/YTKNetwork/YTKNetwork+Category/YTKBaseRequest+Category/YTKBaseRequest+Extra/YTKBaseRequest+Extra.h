//
//  YTKBaseRequest+Extra.h
//  FM
//
//  Created by Admin on 28/10/2024.
//

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "JobsBlock.h"
#import "DefineProperty.h"
#import "YTKCustomBaseRequestProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTKBaseRequest (Extra)<YTKCustomBaseRequestProtocol>

Prop_strong()JobsResponseModel *responseModel;

-(NSMutableURLRequest *)jobsMakeRequestByBlock:(jobsByMutableURLRequestBlock _Nullable)block;

@end

NS_ASSUME_NONNULL_END
