//
//  AppDelegate+TabBarCtr.m
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "AppDelegate+TabBarCtr.h"

@implementation AppDelegate (TabBarCtr)
#pragma mark —— 配置数据源
/// 配置文件
static TFPopupParam *tfPopupParam = nil;
static LZTabBarConfig *lZTabBarConfig = nil;
/// TabBarCtrl
static JobsTabBarVC *tabBarVC = nil;
static JobsCustomTabBarVC *customTabBarVC = nil;
static LZTabBarController *lZTabBarCtrl = nil;
/// NavCtrl
static UINavigationController *tabBarNavCtrl = nil;
static UINavigationController *jobsTabBarNavCtrl = nil;
static UINavigationController *lZTabBarNavCtrl = nil;
/// 容器
static NSMutableArray <UIViewController *>*viewControllerMutArr = nil;
static NSMutableArray <NSString *>*tabBarItemTitleMutArr = nil;
static NSMutableArray <UIImage *>*imageSelectedMutArr = nil;
static NSMutableArray <UIImage *>*imageUnSelectedMutArr = nil;
static NSMutableArray <NSString *>*imageSelectedNameMutArr = nil;
static NSMutableArray <NSString *>*imageUnselectedNameMutArr = nil;
static NSMutableArray <UIViewController *>*UIViewControllerMutArr = nil;
static NSMutableArray <UINavigationController *>*NavCtrByNormalVCMutArr = nil;
static NSMutableArray <JobsTabBarItemConfig *>*configMutArr = nil;

+(TFPopupParam *)makeTFPopupParameter{
    if(!tfPopupParam){
        tfPopupParam = TFPopupParam.new;
        tfPopupParam.duration = 0.3f;
        tfPopupParam.showAnimationDelay = 0.1f;
        tfPopupParam.hideAnimationDelay = 0.1f;
        tfPopupParam.dragEnable = YES;
        tfPopupParam.offset = CGPointMake(0,-JobsTabBarHeightByBottomSafeArea(tabBarVC));
        tfPopupParam.disuseBackgroundTouchHide = YES;
    //    tfPopupParam.popupSize = [CasinoCustomerServiceView viewSizeWithModel:nil];
    }return tfPopupParam;
}

+(LZTabBarConfig *)makeLZTabBarConfig{
    if(!lZTabBarConfig){
        lZTabBarConfig = LZTabBarConfig.new;
        lZTabBarConfig.viewControllers = AppDelegate.makeViewControllerMutArr;
        lZTabBarConfig.normalImages = AppDelegate.makeImageUnselectedNameMutArr;
        lZTabBarConfig.selectedImages = AppDelegate.makeImageSelectedNameMutArr;
        lZTabBarConfig.titles = AppDelegate.makeTabBarItemTitleMutArr;
        lZTabBarConfig.isNavigation = NO;
    }return lZTabBarConfig;
}

+(JobsTabBarVC *)tabBarVC{
    if(!tabBarVC){
        tabBarVC = JobsTabBarVC.sharedInstance;
        tabBarVC.isAnimationAlert = YES;//OK
        tabBarVC.isPlaySound = YES;
        tabBarVC.isFeedbackGenerator = YES;
        tabBarVC.isOpenScrollTabbar = NO;
    //    TabBarVC.isShakerAnimation = YES;
        [tabBarVC actionReturnBoolByNSUIntegerBlock:^BOOL(NSUInteger data) {
            for (JobsTabBarItemConfig *tabBarItemConfig in AppDelegate.makeTabBarItemConfigMutArr) {
                if(tabBarItemConfig.isNeedjump){
                    toast(@"这个跳开");
                    return NO;
                }
            }return YES;
        }];
    }return tabBarVC;
}

+(JobsCustomTabBarVC *)customTabBarVC{
    if(!customTabBarVC){
        customTabBarVC = JobsCustomTabBarVC.sharedManager;
        customTabBarVC.viewControllers = viewControllerMutArr.count ? viewControllerMutArr :AppDelegate.makeViewControllerMutArr;
    }return customTabBarVC;
}

+(LZTabBarController *)makeLZTabBarCtrl{
    if(!lZTabBarCtrl){
        lZTabBarCtrl = [LZTabBarController createTabBarController:^LZTabBarConfig *(LZTabBarConfig *config) {
            return AppDelegate.makeLZTabBarConfig;
        }];
    }return lZTabBarCtrl;
}

+(UINavigationController *)makeTabBarNavCtrl{
    if(!tabBarNavCtrl){
        tabBarNavCtrl = [UINavigationController.alloc initWithRootViewController:tabBarVC ? : AppDelegate.tabBarVC];
        tabBarNavCtrl.hidesBottomBarWhenPushed = YES;
    }return tabBarNavCtrl;
}

+(UINavigationController *)makeJobsTabBarNavCtrl{
    if(!jobsTabBarNavCtrl){
        jobsTabBarNavCtrl = [UINavigationController.alloc initWithRootViewController:customTabBarVC ? : AppDelegate.customTabBarVC];
        jobsTabBarNavCtrl.hidesBottomBarWhenPushed = YES;
    }return jobsTabBarNavCtrl;
}

+(UINavigationController *)makeLZTabBarNavCtrl{
    if(!lZTabBarNavCtrl){
        lZTabBarNavCtrl = [UINavigationController.alloc initWithRootViewController:lZTabBarCtrl ? lZTabBarCtrl : AppDelegate.makeLZTabBarCtrl];
        lZTabBarNavCtrl.hidesBottomBarWhenPushed = YES;
    }return lZTabBarNavCtrl;
}

-(NSMutableArray <UIButton *>*)makeTabBarItems{
    NSMutableArray <UIButton *>*buttonMutArr = NSMutableArray.array;
    @jobs_weakify(self)
    [buttonMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:AppDelegate.makeImageUnselectedMutArr[buttonMutArr.count]
                                                          highlightImage:AppDelegate.makeImageSelectedMutArr[buttonMutArr.count]
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:AppDelegate.makeTabBarItemTitleMutArr[buttonMutArr.count]
                                                                subTitle:nil
                                                               titleFont:UIFontWeightBoldSize(18)
                                                            subTitleFont:nil
                                                                titleCor:JobsCor(@"#333333")
                                                             subTitleCor:nil
                                                      titleLineBreakMode:NSLineBreakByWordWrapping
                                                   subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                     baseBackgroundColor:UIColor.whiteColor
                                                            imagePadding:JobsWidth(0)
                                                            titlePadding:JobsWidth(10)
                                                          imagePlacement:NSDirectionalRectEdgeNone
                                              contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                                contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                           contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                       cornerRadiusValue:JobsWidth(0)
                                                         roundingCorners:UIRectCornerAllCorners
                                                    roundingCornersRadii:CGSizeZero
                                                          layerBorderCor:nil
                                                             borderWidth:JobsWidth(0)
                                                           primaryAction:nil
                                              longPressGestureEventBlock:nil
                                                         clickEventBlock:^id(BaseButton *x) {
        @jobs_strongify(self)
        x.selected = !x.selected;
        NSLog(@"1");
//        [self.customTabBarVC.delegate tabBarController:self.customTabBarVC
//                               didSelectViewController:self.customTabBarVC.viewControllers[0]];
        if (self.objectBlock) self.objectBlock(x);
        return nil;
    }]];
    [buttonMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:AppDelegate.makeImageUnselectedMutArr[buttonMutArr.count]
                                                          highlightImage:AppDelegate.makeImageSelectedMutArr[buttonMutArr.count]
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:AppDelegate.makeTabBarItemTitleMutArr[buttonMutArr.count]
                                                                subTitle:nil
                                                               titleFont:UIFontWeightBoldSize(18)
                                                            subTitleFont:nil
                                                                titleCor:JobsCor(@"#333333")
                                                             subTitleCor:nil
                                                      titleLineBreakMode:NSLineBreakByWordWrapping
                                                   subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                     baseBackgroundColor:UIColor.whiteColor
                                                            imagePadding:JobsWidth(0)
                                                            titlePadding:JobsWidth(10)
                                                          imagePlacement:NSDirectionalRectEdgeNone
                                              contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                                contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                           contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                       cornerRadiusValue:JobsWidth(0)
                                                         roundingCorners:UIRectCornerAllCorners
                                                    roundingCornersRadii:CGSizeZero
                                                          layerBorderCor:nil
                                                             borderWidth:JobsWidth(0)
                                                           primaryAction:nil
                                              longPressGestureEventBlock:nil
                                                         clickEventBlock:^id(BaseButton *x) {
        @jobs_strongify(self)
        x.selected = !x.selected;
        NSLog(@"2");
        if (self.objectBlock) self.objectBlock(x);
        return nil;
    }]];
    [buttonMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:AppDelegate.makeImageUnselectedMutArr[buttonMutArr.count]
                                                          highlightImage:AppDelegate.makeImageSelectedMutArr[buttonMutArr.count]
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:AppDelegate.makeTabBarItemTitleMutArr[buttonMutArr.count]
                                                                subTitle:nil
                                                               titleFont:UIFontWeightBoldSize(18)
                                                            subTitleFont:nil
                                                                titleCor:JobsCor(@"#333333")
                                                             subTitleCor:nil
                                                      titleLineBreakMode:NSLineBreakByWordWrapping
                                                   subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                     baseBackgroundColor:UIColor.whiteColor
                                                            imagePadding:JobsWidth(0)
                                                            titlePadding:JobsWidth(10)
                                                          imagePlacement:NSDirectionalRectEdgeNone
                                              contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                                contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                           contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                       cornerRadiusValue:JobsWidth(0)
                                                         roundingCorners:UIRectCornerAllCorners
                                                    roundingCornersRadii:CGSizeZero
                                                          layerBorderCor:nil
                                                             borderWidth:JobsWidth(0)
                                                           primaryAction:nil
                                              longPressGestureEventBlock:nil
                                                         clickEventBlock:^id(BaseButton *x) {
        @jobs_strongify(self)
        x.selected = !x.selected;
        NSLog(@"3");
        if (self.objectBlock) self.objectBlock(x);
        return nil;
    }]];
    [buttonMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:AppDelegate.makeImageUnselectedMutArr[buttonMutArr.count]
                                                          highlightImage:AppDelegate.makeImageSelectedMutArr[buttonMutArr.count]
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:AppDelegate.makeTabBarItemTitleMutArr[buttonMutArr.count]
                                                                subTitle:nil
                                                               titleFont:UIFontWeightBoldSize(18)
                                                            subTitleFont:nil
                                                                titleCor:JobsCor(@"#333333")
                                                             subTitleCor:nil
                                                      titleLineBreakMode:NSLineBreakByWordWrapping
                                                   subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                     baseBackgroundColor:UIColor.whiteColor
                                                            imagePadding:JobsWidth(0)
                                                            titlePadding:JobsWidth(10)
                                                          imagePlacement:NSDirectionalRectEdgeNone
                                              contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                                contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                           contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                       cornerRadiusValue:JobsWidth(0)
                                                         roundingCorners:UIRectCornerAllCorners
                                                    roundingCornersRadii:CGSizeZero
                                                          layerBorderCor:nil
                                                             borderWidth:JobsWidth(0)
                                                           primaryAction:nil
                                              longPressGestureEventBlock:nil
                                                         clickEventBlock:^id(BaseButton *x) {
        @jobs_strongify(self)
        x.selected = !x.selected;
        NSLog(@"4");
        if (self.objectBlock) self.objectBlock(x);
        return nil;
    }]];
    [buttonMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:AppDelegate.makeImageUnselectedMutArr[buttonMutArr.count]
                                                          highlightImage:AppDelegate.makeImageSelectedMutArr[buttonMutArr.count]
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:AppDelegate.makeTabBarItemTitleMutArr[buttonMutArr.count]
                                                                subTitle:nil
                                                               titleFont:UIFontWeightBoldSize(18)
                                                            subTitleFont:nil
                                                                titleCor:JobsCor(@"#333333")
                                                             subTitleCor:nil
                                                      titleLineBreakMode:NSLineBreakByWordWrapping
                                                   subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                     baseBackgroundColor:UIColor.whiteColor
                                                            imagePadding:JobsWidth(0)
                                                            titlePadding:JobsWidth(10)
                                                          imagePlacement:NSDirectionalRectEdgeNone
                                              contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                                contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                           contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                       cornerRadiusValue:JobsWidth(0)
                                                         roundingCorners:UIRectCornerAllCorners
                                                    roundingCornersRadii:CGSizeZero
                                                          layerBorderCor:nil
                                                             borderWidth:JobsWidth(0)
                                                           primaryAction:nil
                                              longPressGestureEventBlock:nil
                                                         clickEventBlock:^id(BaseButton *x) {
        @jobs_strongify(self)
        x.selected = !x.selected;
        NSLog(@"5");
        if (self.objectBlock) self.objectBlock(x);
        return nil;
    }]];return buttonMutArr;
}

-(JobsCustomTabBarConfig *)makeJobsCustomTabBarConfig{
    JobsCustomTabBarConfig *customTabBarConfig = JobsCustomTabBarConfig.sharedManager;
    customTabBarConfig.tabBarHeight = JobsWidth(80);
    customTabBarConfig.tabBarBackgroundColor = JobsCyanColor;
    customTabBarConfig.tabBarBackgroundImage = JobsIMG(@"");
    customTabBarConfig.tabBarItems = self.makeTabBarItems;
    customTabBarConfig.viewControllers = AppDelegate.makeUIViewControllerMutArr;
//    customTabBarConfig.tabBarItemYOffsets
    return customTabBarConfig;
}

+(NSMutableArray <UIViewController *>*)makeViewControllerMutArr{
    if(!viewControllerMutArr){
        viewControllerMutArr = NSMutableArray.array;
        for (JobsTabBarItemConfig *tabBarCtrlConfig in AppDelegate.makeTabBarItemConfigMutArr) {
            [viewControllerMutArr addObject:tabBarCtrlConfig.vc];
        }
    }return viewControllerMutArr;
}

+(NSMutableArray <NSString *>*)makeTabBarItemTitleMutArr{
    if(!tabBarItemTitleMutArr){
        tabBarItemTitleMutArr = NSMutableArray.array;
        [tabBarItemTitleMutArr addObject:JobsInternationalization(@"首页")];
        [tabBarItemTitleMutArr addObject:JobsInternationalization(@"戏码")];
        [tabBarItemTitleMutArr addObject:JobsInternationalization(@"充值")];
        [tabBarItemTitleMutArr addObject:JobsInternationalization(@"客服")];
        [tabBarItemTitleMutArr addObject:JobsInternationalization(@"会员中心")];
    }return tabBarItemTitleMutArr;
}

+(NSMutableArray <UIImage *>*)makeImageSelectedMutArr{
    if(!imageSelectedMutArr){
        imageSelectedMutArr = NSMutableArray.array;
        for (NSString *imageSelectedName in AppDelegate.makeImageSelectedNameMutArr) {
            [imageSelectedMutArr addObject:JobsIMG(imageSelectedName)];
        }
    }return imageSelectedMutArr;
}

+(NSMutableArray <UIImage *>*)makeImageUnselectedMutArr{
    if(!imageUnSelectedMutArr){
        imageUnSelectedMutArr = NSMutableArray.array;
        for (NSString *imageUnSelectedName in AppDelegate.makeImageUnselectedNameMutArr) {
            [imageUnSelectedMutArr addObject:JobsIMG(imageUnSelectedName)];
        }
    }return imageUnSelectedMutArr;
}

+(NSMutableArray <NSString *>*)makeImageSelectedNameMutArr{
    if(!imageSelectedNameMutArr){
        imageSelectedNameMutArr = NSMutableArray.array;
        [imageSelectedNameMutArr addObject:@"tabbbar_home_seleteds"];
        [imageSelectedNameMutArr addObject:@"tabbbar_weights_seleteds"];
        [imageSelectedNameMutArr addObject:@"tabbbar_pay_seleteds"];
        [imageSelectedNameMutArr addObject:@"tabbbar_service_seleteds"];
        [imageSelectedNameMutArr addObject:@"tabbar_VIP_seleteds"];
    }return imageSelectedNameMutArr;
}

+(NSMutableArray <NSString *>*)makeImageUnselectedNameMutArr{
    if(!imageUnselectedNameMutArr){
        imageUnselectedNameMutArr = NSMutableArray.array;
        [imageUnselectedNameMutArr addObject:@"tabbbar_home_normal"];
        [imageUnselectedNameMutArr addObject:@"tabbbar_weights_normal"];
        [imageUnselectedNameMutArr addObject:@"tabbbar_pay_normal"];
        [imageUnselectedNameMutArr addObject:@"tabbbar_service_normal"];
        [imageUnselectedNameMutArr addObject:@"tabbar_VIP_normal"];
    }return imageUnselectedNameMutArr;
}

+(NSMutableArray <UIViewController *>*)makeUIViewControllerMutArr{
    if(!UIViewControllerMutArr){
        UIViewControllerMutArr = NSMutableArray.array;
        [UIViewControllerMutArr addObject:ViewController_5.new];
        [UIViewControllerMutArr addObject:ViewController_1.new];
        [UIViewControllerMutArr addObject:ViewController_2.new];
        [UIViewControllerMutArr addObject:ViewController_3.new];
        [UIViewControllerMutArr addObject:ViewController_4.new];
    }return UIViewControllerMutArr;
}

+(NSMutableArray <UINavigationController *>*)makeNavCtrByNormalVCMutArr{
    if(!NavCtrByNormalVCMutArr){
        NavCtrByNormalVCMutArr = NSMutableArray.array;
        for (UIViewController *vc in AppDelegate.makeUIViewControllerMutArr) {
            [NavCtrByNormalVCMutArr addObject:[UINavigationController.alloc initWithRootViewController:vc]];
        }
    }return NavCtrByNormalVCMutArr;
}

+(NSMutableArray <JobsTabBarItemConfig *>*)makeTabBarItemConfigMutArr{
    if(!configMutArr){
        configMutArr = NSMutableArray.array;
        {
            JobsTabBarItemConfig *config = JobsTabBarItemConfig.new;
            config.vc = AppDelegate.makeUIViewControllerMutArr[configMutArr.count];
            config.title = self.makeTabBarItemTitleMutArr[configMutArr.count];
            config.imageSelected = self.makeImageSelectedMutArr[configMutArr.count];
            config.imageUnselected = self.makeImageUnselectedMutArr[configMutArr.count];
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.xOffset = landscapeValue(JobsWidth(200));
            config.tabBarItemWidth = landscapeValue(JobsWidth(100));
            config.spacing = JobsWidth(3);
            config.tag = configMutArr.count + 1;
            config.isNeedCheckLogin = NO;
            config.isNotNeedCheckLogin = YES;
            config.isNeedjump = NO;
            [configMutArr addObject:config];
        }
        
        {
            JobsTabBarItemConfig *config = JobsTabBarItemConfig.new;
            config.vc = AppDelegate.makeUIViewControllerMutArr[configMutArr.count];
            config.title = self.makeTabBarItemTitleMutArr[configMutArr.count];
            config.imageSelected = self.makeImageSelectedMutArr[configMutArr.count];
            config.imageUnselected = self.makeImageUnselectedMutArr[configMutArr.count];
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.xOffset = landscapeValue(JobsWidth(5));
            config.tabBarItemWidth = landscapeValue(JobsWidth(100));
            config.spacing = JobsWidth(3);
            config.tag = configMutArr.count + 1;
            config.isNeedCheckLogin = NO;
            config.isNotNeedCheckLogin = YES;
            config.isNeedjump = NO;
            [configMutArr addObject:config];
        }
        
        {
            JobsTabBarItemConfig *config = JobsTabBarItemConfig.new;
            config.vc = AppDelegate.makeUIViewControllerMutArr[configMutArr.count];
            config.title = self.makeTabBarItemTitleMutArr[configMutArr.count];
            config.imageSelected = self.makeImageSelectedMutArr[configMutArr.count];
            config.imageUnselected = self.makeImageUnselectedMutArr[configMutArr.count];
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.xOffset = landscapeValue(JobsWidth(5));
            config.tabBarItemWidth = landscapeValue(JobsWidth(50));
            config.spacing = JobsWidth(3);
            config.tag = configMutArr.count + 1;
            config.isNeedCheckLogin = NO;
            config.isNotNeedCheckLogin = YES;
            config.isNeedjump = NO;
            [configMutArr addObject:config];
        }
        
        {
            JobsTabBarItemConfig *config = JobsTabBarItemConfig.new;
            config.vc = AppDelegate.makeUIViewControllerMutArr[configMutArr.count];
            config.title = self.makeTabBarItemTitleMutArr[configMutArr.count];
            config.imageSelected = self.makeImageSelectedMutArr[configMutArr.count];
            config.imageUnselected = self.makeImageUnselectedMutArr[configMutArr.count];
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.xOffset = landscapeValue(JobsWidth(5));
            config.tabBarItemWidth = landscapeValue(JobsWidth(50));
            config.spacing = JobsWidth(3);
            config.tag = configMutArr.count + 1;
            config.isNeedCheckLogin = NO;
            config.isNotNeedCheckLogin = YES;
            config.isNeedjump = NO;
            [configMutArr addObject:config];
        }
        
        {
            JobsTabBarItemConfig *config = JobsTabBarItemConfig.new;
            config.vc = AppDelegate.makeUIViewControllerMutArr[configMutArr.count];
            config.title = self.makeTabBarItemTitleMutArr[configMutArr.count];
            config.imageSelected = self.makeImageSelectedMutArr[configMutArr.count];
            config.imageUnselected = self.makeImageUnselectedMutArr[configMutArr.count];
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.xOffset = landscapeValue(JobsWidth(5));
            config.tabBarItemWidth = landscapeValue(JobsWidth(100));
            config.spacing = JobsWidth(3);
            config.tag = configMutArr.count + 1;
            config.isNeedCheckLogin = NO;
            config.isNotNeedCheckLogin = YES;
            config.isNeedjump = NO;
            [configMutArr addObject:config];
        }
    }return configMutArr;
}
#pragma mark —— 一些私有方法
#pragma mark —— 一些公有方法
/// 刷新 TabBarTitle
-(void)refreshTabBarTitle{
    NSMutableArray *TabBarTitleMutArr = objc_getAssociatedObject(self, _cmd);
    if (TabBarTitleMutArr.count) {
        [TabBarTitleMutArr removeAllObjects];
        TabBarTitleMutArr = nil;
    }
    TabBarTitleMutArr = AppDelegate.makeTabBarItemTitleMutArr;
    for (JobsTabBarItemConfig *config in configMutArr) {
        NSInteger index = [configMutArr indexOfObject:config];
        config.vc.tabBarItem.title = TabBarTitleMutArr[index];
    }
}
/// 获取Tabbar管理的，不含导航的根控制器
-(NSMutableArray <UIViewController *>*)getAppRootVC{
    NSMutableArray *mutArr = NSMutableArray.array;
    for (JobsTabBarItemConfig *config in configMutArr) {
        [mutArr addObject:config.vc];
    }return mutArr;
}

@end
