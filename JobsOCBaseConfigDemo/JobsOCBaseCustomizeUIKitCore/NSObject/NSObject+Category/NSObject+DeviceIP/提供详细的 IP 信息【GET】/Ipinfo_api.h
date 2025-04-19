//
//  Ipinfo_api.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "JobsBaseApi.h"

NS_ASSUME_NONNULL_BEGIN
/// 提供详细的IP信息@GET
/// https://ipinfo.io/json
@interface Ipinfo_api : JobsBaseApi

@end

@interface IpinfoModel : NSObject

Prop_copy()NSString *ip;
Prop_copy()NSString *hostname;
Prop_copy()NSString *city;
Prop_copy()NSString *region;
Prop_copy()NSString *country;
Prop_copy()NSString *loc;
Prop_copy()NSString *org;
Prop_copy()NSString *postal;
Prop_copy()NSString *timezone;
Prop_copy()NSString *readme;

@end

NS_ASSUME_NONNULL_END
