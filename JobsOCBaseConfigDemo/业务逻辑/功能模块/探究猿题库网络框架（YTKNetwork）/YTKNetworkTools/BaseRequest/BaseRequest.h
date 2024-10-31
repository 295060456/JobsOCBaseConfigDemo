//
//  BaseRequest.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/7/10.
//

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "YTKCustomBaseRequest.h"
#import "YTKBaseRequest+Extra.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseRequest : YTKRequest <YTKCustomBaseRequest>

+(JobsReturnYTKRequestByDictionaryBlock _Nonnull)initByBodyParameters;/// 直接调用，后面不能拼byURLParameters
+(JobsReturnYTKRequestByDictionaryBlock _Nonnull)initByURLParameters;/// 直接调用，后面不能拼byBodyParameters

@end

NS_ASSUME_NONNULL_END
