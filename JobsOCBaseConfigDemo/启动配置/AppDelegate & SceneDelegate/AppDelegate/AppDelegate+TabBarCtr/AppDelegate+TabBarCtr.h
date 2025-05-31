//
//  AppDelegate+TabBarCtr.h
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "DefineProperty.h"
#import "AppDelegate.h"
#import "AppDelegate+Func.h"

#import "NSObject+AppTools.h"

#import "JobsTabBarVC.h"
#import "JobsCustomTabBarVC.h"

#ifndef JobsCustomTabBarConfig_appDelegate
#define JobsCustomTabBarConfig_appDelegate AppDelegate.jobsCustomTabBarConfig
#endif /* JobsCustomTabBarConfig_appDelegate */

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (TabBarCtr)
#pragma mark —— 配置一些普通的控制器
Prop_strong(class)JobsTabBarVC *tabBarVC;
Prop_strong(class)JobsCustomTabBarVC *jobsCustomTabBarVC;
Prop_strong(class)LZTabBarController *lZTabBarCtrl;
#pragma mark —— 配置一些导航控制器
Prop_strong(class)__kindof UINavigationController *tabBarNavCtrl;
Prop_strong(class)__kindof UINavigationController *jobsCustomTabBarNavCtrl;
Prop_strong(class)__kindof UINavigationController *lZTabBarNavCtrl;
#pragma mark —— 数据源
Prop_strong(class)LZTabBarConfig *lZTabBarConfig;
Prop_strong(class)JobsCustomTabBarConfig *jobsCustomTabBarConfig;
Prop_strong(class)NSMutableArray <JobsTabBarItemConfig *>*tabBarItemConfigMutArr;
Prop_strong(class)NSMutableArray <__kindof UIButton *>*tabBarItemMutArr;
Prop_strong(class)NSMutableArray <__kindof NSString *>*tabBarItemTitleMutArr;
Prop_strong(class)NSMutableArray <__kindof NSString *>*imageSelectedNameMutArr;
Prop_strong(class)NSMutableArray <__kindof NSString *>*imageUnselectedNameMutArr;
Prop_strong(class)NSMutableArray <__kindof UIImage *>*imageSelectedMutArr;
Prop_strong(class)NSMutableArray <__kindof UIImage *>*imageUnSelectedMutArr;
Prop_strong(class)NSMutableArray <__kindof UIViewController *>*viewCtrlByTabBarCtrlConfigMutArr;///【从配置TabBarCtrl信息添加的】Tabbar管理的，不含导航的根控制器
Prop_strong(class)NSMutableArray <__kindof UIViewController *>*viewCtrlMutArr;///【手动添加的】Tabbar管理的，不含导航的根控制器
Prop_strong(class)NSMutableArray <__kindof UINavigationController *>*navCtrMutArr;
#pragma mark —— 一些公有方法
/// 切换控制器
+(void)button:(__kindof UIButton *)button index:(NSUInteger)index;
+(jobsByNSUIntegerBlock _Nonnull)switchByIndex;
/// 刷新 TabBarTitle
-(void)refreshTabBarTitle;

@end

NS_ASSUME_NONNULL_END
