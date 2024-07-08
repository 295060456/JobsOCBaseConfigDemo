//
//  AppDelegate+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "AppDelegate+Extra.h"

@implementation AppDelegate (Extra)
#pragma mark —— 一些私有方法
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
    
    for (JobsTabBarControllerConfig *config in self.configMutArr) {
        NSInteger index = [self.configMutArr indexOfObject:config];
        config.vc.tabBarItem.title = TabBarTitleMutArr[index];
    }
}
/// 获取Tabbar管理的，不含导航的根控制器
-(NSMutableArray <UIViewController *>*)getAppRootVC{
    NSMutableArray *mutArr = NSMutableArray.array;
    for (JobsTabBarControllerConfig *config in self.configMutArr) {
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
        
//        TabBarVC.jumpIndexArr = @[@3];//小标为3的客服模块需要被跳开做另行处理
//        TabBarVC.needLoginArr = @[@1,@2,@4];
//        TabBarVC.noNeedLoginArr = @[@0];// 在某些页面不需要弹出登录，其优先级高于needLoginArr
        
//        TabBarVC.isShakerAnimation = YES;
        TabBarVC.isOpenScrollTabbar = NO;

        for (JobsTabBarControllerConfig *config in self.configMutArr) {
            [TabBarVC.tabBarControllerConfigMutArr addObject:config];
            [TabBarVC.childVCMutArr addObject:config.vc];
            [self.tabBarTitleMutArr addObject:config.title];
        }
        
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
#pragma mark —— @property(nonatomic,strong)JobsGameTabbarVC *gameTabBarVC;
JobsKey(_gameTabBarVC)
@dynamic gameTabBarVC;
-(JobsGameTabbarVC *)gameTabBarVC{
    JobsGameTabbarVC *GameTabBarVC = Jobs_getAssociatedObject(_gameTabBarVC);
    if (!GameTabBarVC) {
        GameTabBarVC = JobsGameTabbarVC.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_gameTabBarVC, GameTabBarVC);
    }return GameTabBarVC;
}

-(void)setGameTabBarVC:(JobsGameTabbarVC *)gameTabBarVC{
    Jobs_setAssociatedRETAIN_NONATOMIC(_gameTabBarVC, gameTabBarVC);
}
#pragma mark —— @property(nonatomic,strong)NSMutableArray <JobsTabBarControllerConfig *>*configMutArr;
JobsKey(_configMutArr)
@dynamic configMutArr;
-(NSMutableArray<JobsTabBarControllerConfig *> *)configMutArr{
    NSMutableArray *ConfigMutArr = Jobs_getAssociatedObject(_configMutArr);
    if (!ConfigMutArr) {
        ConfigMutArr = NSMutableArray.array;
        {
            JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
            config.vc = UIViewController.new;
            config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
            config.imageSelected = JobsIMG(@"tabbar_home_selected");
            config.imageUnselected = JobsIMG(@"tabbar_home_normal");
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.tag = ConfigMutArr.count + 1;
            [ConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
            config.vc = UIViewController.new;
            config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
            config.imageSelected = JobsIMG(@"tabbar_game_selected");
            config.imageUnselected = JobsIMG(@"tabbar_game_normal");
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.tag = ConfigMutArr.count + 1;
            [ConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
            config.vc = UIViewController.new;
            config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
            config.imageSelected = JobsIMG(@"tabbar_discount_selected");
            config.imageUnselected = JobsIMG(@"tabbar_discount_normal");
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.tag = ConfigMutArr.count + 1;
            [ConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
            config.vc = UIViewController.new;
            config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
            config.imageSelected = JobsIMG(@"tabbar_tutorial_selected");
            config.imageUnselected = JobsIMG(@"tabbar_tutorial_normal");
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.tag = ConfigMutArr.count + 1;
            [ConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarControllerConfig *config = JobsTabBarControllerConfig.new;
            config.vc = UIViewController.new;
            config.title = self.tabBarTitleMutArr[ConfigMutArr.count];
            config.imageSelected = JobsIMG(@"tabbar_member_selected");
            config.imageUnselected = JobsIMG(@"tabbar_member_normal");
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.tag = ConfigMutArr.count + 1;
            [ConfigMutArr addObject:config];
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_configMutArr, ConfigMutArr);
    }return ConfigMutArr;
}

-(void)setConfigMutArr:(NSMutableArray<JobsTabBarControllerConfig *> *)configMutArr{
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
