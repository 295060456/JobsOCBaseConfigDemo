//
//  YTKBaseRequest+Extra.h
//  FM
//
//  Created by Admin on 28/10/2024.
//

#import <YTKNetwork/YTKNetwork.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTKBaseRequest (Extra)

-(NSMutableURLRequest *)jobsMakeRequestByBlock:(jobsByMutableURLRequestBlock _Nullable)block;

@end

NS_ASSUME_NONNULL_END
