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

NS_ASSUME_NONNULL_BEGIN

@interface BaseRequest : YTKRequest

@property(nonatomic,strong,nullable)NSDictionary *parameters;

-(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters;

@end

NS_ASSUME_NONNULL_END
