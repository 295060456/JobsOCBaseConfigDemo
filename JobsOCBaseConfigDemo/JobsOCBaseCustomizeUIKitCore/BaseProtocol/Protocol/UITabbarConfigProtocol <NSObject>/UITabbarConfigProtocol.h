//
//  UITabbarConfigProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/8/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UITabbarConfigProtocol <NSObject>

@required
@property(nonatomic,strong)NSMutableArray <UIViewController *>*childVCMutArr;/// 子控制器
@property(nonatomic,strong)NSMutableArray <JobsTabBarControllerConfig *>*tabBarControllerConfigMutArr;/// TabBar的配置数据源

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UITabbarConfigProtocol
#ifndef UITabbarConfigProtocol_synthesize
#define UITabbarConfigProtocol_synthesize \
@synthesize childVCMutArr = _childVCMutArr;\
@synthesize tabBarControllerConfigMutArr = _tabBarControllerConfigMutArr;\

#endif

#pragma mark —— @dynamic UITextModelProtocol
#ifndef UITabbarConfigProtocol_dynamic
#define UITabbarConfigProtocol_dynamic \
@dynamic childVCMutArr;\
@dynamic tabBarControllerConfigMutArr;\

#endif
