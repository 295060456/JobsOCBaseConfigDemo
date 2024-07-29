//
//  JobsNetworkingAPI+DemoTestApi.h
//  DouYin
//
//  Created by Jobs on 2021/4/17.
//

#import "JobsNetworkingAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNetworkingAPI (DemoTestApi)
/*
    ❤️这里选用通用性较强的 jobsByIDBlock 的目的，而不是直接对【typedef void(^jobsByIDBlock)(id data)】进行确定类型 JobsResponseModel 的原因：
    防止个别接口不按套路（msg、code、data）出牌
 */
+(void)appInterfaceTesting:(id)parameters
              successBlock:(jobsByIDBlock _Nullable)successBlock
              failureBlock:(jobsByIDBlock _Nullable)failureBlock;

@end

NS_ASSUME_NONNULL_END
