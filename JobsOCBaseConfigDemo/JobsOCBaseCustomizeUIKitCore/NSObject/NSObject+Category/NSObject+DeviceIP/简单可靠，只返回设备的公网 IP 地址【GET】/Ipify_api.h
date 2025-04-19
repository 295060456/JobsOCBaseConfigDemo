//
//  Ipify_api.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "JobsBaseApi.h"

NS_ASSUME_NONNULL_BEGIN
/// 简单可靠，只返回设备的公网IP地址@GET
/// https://api.ipify.org?format=json
@interface Ipify_api : JobsBaseApi

@end

@interface IpifyModel : NSObject

Prop_copy()NSString *ip;

@end

NS_ASSUME_NONNULL_END
