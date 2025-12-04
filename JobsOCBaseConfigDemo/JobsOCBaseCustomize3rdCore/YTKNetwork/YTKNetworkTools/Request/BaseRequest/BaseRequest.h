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

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#elif __has_include("AFNetworking.h")
#import "AFNetworking.h"
#elif __has_include("AFNetworking-umbrella.h")
#import "AFNetworking-umbrella.h"
#else
#error "AFNetworking header not found"
#endif

#import "YTKCustomBaseRequestProtocol.h"
#import "YTKRequest+Extra.h"
#import "DefineConstString.h" // 常量字符串的定义
#import "JobsBlock.h"
#import "NSMutableDictionary+Extra.h"

NS_ASSUME_NONNULL_BEGIN
@class BaseRequest;   // 🔴 关键：先声明有这个类
/// 用于普通数据的交互
@interface BaseRequest <__covariant T:BaseRequest *> : YTKRequest <YTKCustomBaseRequestProtocol>

+(JobsRetYTKRequestByDictionaryBlock _Nonnull)initByBodyParameters; // 直接调用，后面不能拼byURLParameters
+(JobsRetYTKRequestByDictionaryBlock _Nonnull)initByURLParameters;  // 直接调用，后面不能拼byBodyParameters
/// 添加URL参数
-(T (^)(id _Nullable))byURLParameters;
/// 添加Body参数
-(T (^)(NSDictionary * _Nullable))byBodyParameters;
/// 添加Header参数
-(T (^)(NSDictionary * _Nullable))byHeaderParameters;
-(T (^)(void))handleErr;

@end

NS_ASSUME_NONNULL_END
