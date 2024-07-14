//
//  UITabbarConfigProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/8/24.
//

#import <Foundation/Foundation.h>
#import "JobsTabBarItemConfig.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UITabbarConfigProtocol <NSObject>

@required
@property(nonatomic,strong)NSMutableArray <JobsTabBarItemConfig *>*tabBarControllerConfigMutArr;/// TabBar的配置数据源

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UITabbarConfigProtocol
#ifndef UITabbarConfigProtocol_synthesize
#define UITabbarConfigProtocol_synthesize \
@synthesize tabBarControllerConfigMutArr = _tabBarControllerConfigMutArr;\

#endif

#pragma mark —— @dynamic UITextModelProtocol
#ifndef UITabbarConfigProtocol_dynamic
#define UITabbarConfigProtocol_dynamic \
@dynamic tabBarControllerConfigMutArr;\

#endif
