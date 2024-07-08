//
//  AppDelegate+Extra.h
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "AppDelegate.h"
#import "AppDelegate+Func.h"

#import "NSObject+AppTools.h"

#import "JobsGameTabbarVC.h"
#import "JobsTabbarVC.h"
#import "JobsTabBarControllerConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (Extra)
/// UI
@property(nonatomic,strong)JobsTabbarVC *tabBarVC;
@property(nonatomic,strong)JobsGameTabbarVC *gameTabBarVC;
/// Data
@property(nonatomic,strong)NSMutableArray <JobsTabBarControllerConfig *>*_Nullable configMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*_Nullable tabBarTitleMutArr;
/// 刷新 TabBarTitle
-(void)refreshTabBarTitle;
/// 获取Tabbar管理的，不含导航的根控制器
-(NSMutableArray <UIViewController *>*)getAppRootVC;

@end

NS_ASSUME_NONNULL_END
