//
//  AppDelegate+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "AppDelegate+Extra.h"

@implementation AppDelegate (Extra)
#pragma mark —— 一些私有方法
/// UITabBarController 配置数据：子VC、Tabbaritem标题
-(void)dataWithTabBarVC:(UITabBarController <UITabbarConfigProtocol>*)tabBarVC{
    for (JobsTabBarCtrlConfig *config in self.configMutArr) {
        [tabBarVC.tabBarControllerConfigMutArr addObject:config];
        [tabBarVC.childVCMutArr addObject:config.vc];
        [self.tabBarTitleMutArr addObject:config.title];
    }
}
/// 仅仅对数值tabBarTitleMutArr做简单的添加元素并赋值
-(NSMutableArray *)addElementByTabBarTitleMutArr:(NSMutableArray *_Nullable)tabBarTitleMutArr{
    NSMutableArray *mutArr = nil;
    if(tabBarTitleMutArr){
        mutArr = tabBarTitleMutArr;
    }else{
        mutArr = NSMutableArray.array;
    }
    
    if (mutArr) {
        [mutArr addObject:JobsInternationalization(@"首页")];
        [mutArr addObject:JobsInternationalization(@"洗码")];
        [mutArr addObject:JobsInternationalization(@"")];
        [mutArr addObject:JobsInternationalization(@"客服")];
        [mutArr addObject:JobsInternationalization(@"会员中心")];
        Jobs_setAssociatedRETAIN_NONATOMIC(_tabBarTitleMutArr, mutArr)
    }return mutArr;
}

-(TFPopupParam *)appDelegatePopupParameter{
    TFPopupParam *PopupParameter = TFPopupParam.new;
    PopupParameter.duration = 0.3f;
    PopupParameter.showAnimationDelay = 0.1f;
    PopupParameter.hideAnimationDelay = 0.1f;
    PopupParameter.dragEnable = YES;
    PopupParameter.offset = CGPointMake(0,-JobsTabBarHeightByBottomSafeArea(self.tabBarVC));
    PopupParameter.disuseBackgroundTouchHide = YES;
//    PopupParameter.popupSize = [CasinoCustomerServiceView viewSizeWithModel:nil];
    return PopupParameter;
}
#pragma mark —— 一些公有方法
/// 刷新 TabBarTitle
-(void)refreshTabBarTitle{
    NSMutableArray *TabBarTitleMutArr = objc_getAssociatedObject(self, _cmd);
    if (TabBarTitleMutArr.count) {
        [TabBarTitleMutArr removeAllObjects];
        TabBarTitleMutArr = nil;
    }
    
    TabBarTitleMutArr = [self addElementByTabBarTitleMutArr:TabBarTitleMutArr];
    
    for (JobsTabBarCtrlConfig *config in self.configMutArr) {
        NSInteger index = [self.configMutArr indexOfObject:config];
        config.vc.tabBarItem.title = TabBarTitleMutArr[index];
    }
}
/// 获取Tabbar管理的，不含导航的根控制器
-(NSMutableArray <UIViewController *>*)getAppRootVC{
    NSMutableArray *mutArr = NSMutableArray.array;
    for (JobsTabBarCtrlConfig *config in self.configMutArr) {
        [mutArr addObject:config.vc];
    }return mutArr;
}
#pragma mark —— @property(nonatomic,strong)JobsTabbarVC *tabBarVC;
JobsKey(_tabBarVC)
@dynamic tabBarVC;
-(JobsTabbarVC *)tabBarVC{
    JobsTabbarVC *TabBarVC = Jobs_getAssociatedObject(_tabBarVC);
    if (!TabBarVC) {
        TabBarVC = JobsTabbarVC.new;
        TabBarVC.isAnimationAlert = YES;//OK
        TabBarVC.isPlaySound = YES;
        TabBarVC.isFeedbackGenerator = YES;
        
        TabBarVC.jumpIndexArr = @[@3];//小标为3的客服模块需要被跳开做另行处理
        TabBarVC.needLoginArr = @[@1,@2,@4];
        TabBarVC.noNeedLoginArr = @[@0];// 在某些页面不需要弹出登录，其优先级高于needLoginArr
        
//        TabBarVC.isShakerAnimation = YES;
        TabBarVC.isOpenScrollTabbar = NO;

        [self dataWithTabBarVC:TabBarVC];
        
        [TabBarVC actionReturnObjectBlock:^id(id data) {
            if ([data isKindOfClass:NSNumber.class]) {
                NSNumber *num = (NSNumber *)data;
                
                BOOL ok = NO;
                for (NSNumber *number in self.tabBarVC.jumpIndexArr) {
                    if (num.unsignedIntegerValue == number.unsignedIntegerValue) {
                        ok = YES;
                        break;
                    }
                }
                if (ok) {
//                    if (self.customerContactModel.customerList.count) {
//                        /// 单例模式防止重复添加
//                        CasinoCustomerServiceView *customerServiceView = CasinoCustomerServiceView.sharedInstance;
//                        [customerServiceView actionObjectBlock:^(id data) {
//                            [customerServiceView tf_hide];
//                        }];
//                        customerServiceView.size = [CasinoCustomerServiceView viewSizeWithModel:self.hotLabelDataMutArr];
//                        [customerServiceView richElementsInViewWithModel:self.hotLabelDataMutArr];
//                        [customerServiceView tf_showSlide:jobsGetMainWindow()
//                                                direction:PopupDirectionBottom
//                                               popupParam:self.appDelegatePopupParameter];
//                    }
                }return @(!ok);
            }return @(YES);
        }];
        Jobs_setAssociatedRETAIN_NONATOMIC(_tabBarVC, TabBarVC);
    }return TabBarVC;
}

-(void)setTabBarVC:(JobsTabbarVC *)tabBarVC{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tabBarVC, tabBarVC);
}
#pragma mark —— @property(nonatomic,strong)JobsCustomTabBarVC *customTabBarVC;
JobsKey(_customTabBarVC)
@dynamic customTabBarVC;
-(JobsCustomTabBarVC *)customTabBarVC{
    JobsCustomTabBarVC *CustomTabBarVC = Jobs_getAssociatedObject(_customTabBarVC);
    if(!CustomTabBarVC){
        CustomTabBarVC = JobsCustomTabBarVC.new;
        CustomTabBarVC.viewControllers = AppDelegate.makeViewControllerMutArr;
        Jobs_setAssociatedRETAIN_NONATOMIC(_customTabBarVC, CustomTabBarVC);
    }return CustomTabBarVC;
}

-(void)setCustomTabBarVC:(JobsCustomTabBarVC *)customTabBarVC{
    Jobs_setAssociatedRETAIN_NONATOMIC(_customTabBarVC, customTabBarVC);
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray <JobsTabBarControllerConfig *>*configMutArr;
JobsKey(_configMutArr)
@dynamic configMutArr;
-(NSMutableArray<JobsTabBarCtrlConfig *> *)configMutArr{
    NSMutableArray *ConfigMutArr = Jobs_getAssociatedObject(_configMutArr);
    if (!ConfigMutArr) {
        ConfigMutArr = AppDelegate.makeConfigMutArr;
        Jobs_setAssociatedRETAIN_NONATOMIC(_configMutArr, ConfigMutArr);
    }return ConfigMutArr;
}

-(void)setConfigMutArr:(NSMutableArray<JobsTabBarCtrlConfig *> *)configMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_configMutArr, configMutArr);
}
#pragma mark —— #pragma mark —— @property(nonatomic,strong)NSMutableArray <NSString *>*tabBarTitleMutArr;
JobsKey(_tabBarTitleMutArr)
@dynamic tabBarTitleMutArr;
-(NSMutableArray<NSString *> *)tabBarTitleMutArr{
    return [self addElementByTabBarTitleMutArr:Jobs_getAssociatedObject(_tabBarTitleMutArr)];
}

-(void)setTabBarTitleMutArr:(NSMutableArray<NSString *> *)tabBarTitleMutArr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tabBarTitleMutArr, tabBarTitleMutArr)
}

@end
