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

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseRequest : YTKRequest

@property(nonatomic,strong,nullable)id urlParameters;
@property(nonatomic,strong,nullable)NSMutableDictionary *parameters;
@property(nonatomic,strong,nullable)NSMutableDictionary *customHTTPHeader;
/// 为了防止后端某些非标准的写法。比如POST请求将参数封装到URL里面进行传输
+(instancetype _Nonnull)init;
+(JobsReturnYTKRequestByDictionaryBlock _Nonnull)initByBodyParameters;/// 直接调用，后面不能拼byURLParameters
+(JobsReturnYTKRequestByDictionaryBlock _Nonnull)initByURLParameters;/// 直接调用，后面不能拼byBodyParameters
#pragma mark —— 加请求头参数
-(JobsReturnYTKRequestByDictionaryBlock _Nonnull)byHeaderParameters;
#pragma mark —— 加Body参数
-(JobsReturnYTKRequestByDictionaryBlock _Nonnull)byBodyParameters;
#pragma mark —— 加URL参数
-(JobsReturnYTKRequestByIDBlock _Nonnull)byURLParameters;

@end

NS_ASSUME_NONNULL_END
