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

@property(nonatomic,copy)NSString *ip;
@property(nonatomic,copy)NSString *hostname;
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *region;
@property(nonatomic,copy)NSString *country;
@property(nonatomic,copy)NSString *loc;
@property(nonatomic,copy)NSString *org;
@property(nonatomic,copy)NSString *postal;
@property(nonatomic,copy)NSString *timezone;
@property(nonatomic,copy)NSString *readme;

@end

NS_ASSUME_NONNULL_END
