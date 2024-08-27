//
//  JobsSnowflake.h
//  FM
//
//  Created by User on 8/27/24.
//  通过ChatGPT 翻译自 https://github.com/DamonHu/SnowflakeSwift

#import <Foundation/Foundation.h>
#include <unistd.h>

@interface JobsSnowflake : NSObject

-(instancetype _Nonnull)initWithPublishMillisecond:(uint64_t)publishMillisecond
                                             IDCID:(uint32_t)IDC
                                         machineID:(uint32_t)machine;
-(nullable NSNumber *)nextID;
-(uint64_t)timeWithID:(uint64_t)id;
-(uint32_t)IDCWithID:(uint64_t)id;
-(uint32_t)machineWithID:(uint64_t)id;

@end
