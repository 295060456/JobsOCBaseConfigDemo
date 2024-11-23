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

@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *country;
@property(nonatomic,copy)NSString *countryCode;
@property(nonatomic,copy)NSString *region;
@property(nonatomic,copy)NSString *regionName;
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *zip;
@property(nonatomic,copy)NSString *lat;
@property(nonatomic,copy)NSString *lon;
@property(nonatomic,copy)NSString *timezone;
@property(nonatomic,copy)NSString *isp;
@property(nonatomic,copy)NSString *org;
@property(nonatomic,copy)NSString *as;
@property(nonatomic,copy)NSString *query;

@end

NS_ASSUME_NONNULL_END
