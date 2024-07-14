//
//  AppDelegate+TabBarCtr.h
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "AppDelegate.h"
#import "AppDelegate+Func.h"

#import "NSObject+AppTools.h"

#import "JobsTabbarVC.h"
#import "JobsCustomTabBarVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (TabBarCtr)
#pragma mark —— 配置数据源
+(TFPopupParam *)makeTFPopupParameter;
+(LZTabBarConfig *)makeLZTabBarConfig;
+(JobsTabbarVC *)tabBarVC;
+(JobsCustomTabBarVC *)customTabBarVC;
+(LZTabBarController *)makeLZTabBarCtrl;
+(UINavigationController *)makeTabBarNavCtrl;
+(UINavigationController *)makeJobsTabBarNavCtrl;
+(UINavigationController *)makeLZTabBarNavCtrl;
-(NSMutableArray <UIButton *>*)makeTabBarItems;
-(JobsCustomTabBarConfig *)makeJobsCustomTabBarConfig;
+(NSMutableArray <UIViewController *>*)makeViewControllerMutArr;
+(NSMutableArray <NSString *>*)makeTabBarItemTitleMutArr;
+(NSMutableArray <UIImage *>*)makeImageSelectedMutArr;
+(NSMutableArray <UIImage *>*)makeImageUnselectedMutArr;
+(NSMutableArray <NSString *>*)makeImageSelectedNameMutArr;
+(NSMutableArray <NSString *>*)makeImageUnselectedNameMutArr;
+(NSMutableArray <UIViewController *>*)makeUIViewControllerMutArr;
+(NSMutableArray <UINavigationController *>*)makeNavCtrByNormalVCMutArr;
+(NSMutableArray <JobsTabBarItemConfig *>*)makeTabBarItemConfigMutArr;
#pragma mark —— 一些私有方法
#pragma mark —— 一些公有方法
/// 刷新 TabBarTitle
-(void)refreshTabBarTitle;
/// 获取Tabbar管理的，不含导航的根控制器
-(NSMutableArray <UIViewController *>*)getAppRootVC;

@end

NS_ASSUME_NONNULL_END
