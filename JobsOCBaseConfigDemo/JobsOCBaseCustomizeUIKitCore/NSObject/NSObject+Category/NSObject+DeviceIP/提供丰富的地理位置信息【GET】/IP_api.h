//
//  IP_api.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "JobsBaseApi.h"

NS_ASSUME_NONNULL_BEGIN
/// 提供丰富的地理位置信息@GET
/// http://ip-api.com/json/
@interface IP_api : JobsBaseApi

@end

@interface IPApiModel : NSObject

Prop_copy()NSString *status;
Prop_copy()NSString *country;
Prop_copy()NSString *countryCode;
Prop_copy()NSString *region;
Prop_copy()NSString *regionName;
Prop_copy()NSString *city;
Prop_copy()NSString *zip;
Prop_copy()NSString *lat;
Prop_copy()NSString *lon;
Prop_copy()NSString *timezone;
Prop_copy()NSString *isp;
Prop_copy()NSString *org;
Prop_copy()NSString *as;
Prop_copy()NSString *query;

@end

NS_ASSUME_NONNULL_END
