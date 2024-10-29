//
//  YTKBatchRequest+Extra.h
//  FM
//
//  Created by Admin on 29/10/2024.
//

#import <YTKNetwork/YTKNetwork.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTKBatchRequest (Extra)

+(JobsReturnBatchRequestByArrBlock _Nonnull)initByRequestArray;

@end

NS_ASSUME_NONNULL_END
