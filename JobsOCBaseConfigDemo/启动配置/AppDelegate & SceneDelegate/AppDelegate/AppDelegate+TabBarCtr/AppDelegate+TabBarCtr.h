//
//  AppDelegate+TabBarCtr.h
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "AppDelegate.h"
#import "AppDelegate+Func.h"

#import "NSObject+AppTools.h"

#import "JobsTabBarVC.h"
#import "JobsCustomTabBarVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (TabBarCtr)
#pragma mark —— 配置一些普通的控制器
@property(nonatomic,strong,class)JobsTabBarVC *tabBarVC;
@property(nonatomic,strong,class)JobsCustomTabBarVC *jobsCustomTabBarVC;
@property(nonatomic,strong,class)LZTabBarController *lZTabBarCtrl;
#pragma mark —— 配置一些导航控制器
@property(nonatomic,strong,class)UINavigationController *tabBarNavCtrl;
@property(nonatomic,strong,class)UINavigationController *jobsTabBarNavCtrl;
@property(nonatomic,strong,class)UINavigationController *lZTabBarNavCtrl;
#pragma mark —— 数据源
@property(nonatomic,strong,class)TFPopupParam *tfPopupParam;
@property(nonatomic,strong,class)LZTabBarConfig *lZTabBarConfig;
@property(nonatomic,strong,class)JobsCustomTabBarConfig *jobsCustomTabBarConfig;
@property(nonatomic,strong,class)NSMutableArray <JobsTabBarItemConfig *>*tabBarItemConfigMutArr;
@property(nonatomic,strong,class)NSMutableArray <__kindof UIButton *>*tabBarItemMutArr;
@property(nonatomic,strong,class)NSMutableArray <__kindof NSString *>*tabBarItemTitleMutArr;
@property(nonatomic,strong,class)NSMutableArray <__kindof NSString *>*imageSelectedNameMutArr;
@property(nonatomic,strong,class)NSMutableArray <__kindof NSString *>*imageUnselectedNameMutArr;
@property(nonatomic,strong,class)NSMutableArray <__kindof UIImage *>*imageSelectedMutArr;
@property(nonatomic,strong,class)NSMutableArray <__kindof UIImage *>*imageUnSelectedMutArr;
@property(nonatomic,strong,class)NSMutableArray <__kindof UIViewController *>*viewCtrlByTabBarCtrlConfigMutArr;///【从配置TabBarCtrl信息添加的】Tabbar管理的，不含导航的根控制器
@property(nonatomic,strong,class)NSMutableArray <__kindof UIViewController *>*viewCtrlMutArr;///【手动添加的】Tabbar管理的，不含导航的根控制器
@property(nonatomic,strong,class)NSMutableArray <__kindof UINavigationController *>*navCtrMutArr;
#pragma mark —— 一些公有方法
/// 刷新 TabBarTitle
-(void)refreshTabBarTitle;

@end

NS_ASSUME_NONNULL_END
