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
#import "YTKCustomBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTKBaseRequest (Extra)<YTKCustomBaseRequest>

@property(nonatomic,strong)JobsResponseModel *responseModel;

-(NSMutableURLRequest *)jobsMakeRequestByBlock:(jobsByMutableURLRequestBlock _Nullable)block;
#pragma mark —— 加URL参数
+(JobsReturnYTKRequestByIDBlock _Nonnull)ByURLParameters;
-(JobsReturnYTKRequestByIDBlock _Nonnull)byURLParameters;
#pragma mark —— 加Body参数
+(JobsReturnYTKRequestByIDBlock _Nonnull)ByBodyParameters;
-(JobsReturnYTKRequestByDictionaryBlock _Nonnull)byBodyParameters;
#pragma mark —— 加请求头参数
+(JobsReturnYTKRequestByIDBlock _Nonnull)ByHeaderParameters;
-(JobsReturnYTKRequestByDictionaryBlock _Nonnull)byHeaderParameters;

@end

NS_ASSUME_NONNULL_END
