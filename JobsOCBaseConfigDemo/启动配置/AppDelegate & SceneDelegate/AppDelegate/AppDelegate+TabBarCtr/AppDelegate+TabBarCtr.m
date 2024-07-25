//
//  AppDelegate+TabBarCtr.m
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "AppDelegate+TabBarCtr.h"
NSUInteger DefaultIndex = 2;
@implementation AppDelegate (TabBarCtr)
#pragma mark —— 配置一些普通的控制器
@dynamic tabBarVC;
static JobsTabBarVC *_tabBarVC = nil;
+(JobsTabBarVC *)tabBarVC{
    if(!_tabBarVC){
        _tabBarVC = JobsTabBarVC.sharedManager;
        _tabBarVC.isAnimationAlert = YES;//OK
        _tabBarVC.isPlaySound = YES;
        _tabBarVC.isFeedbackGenerator = YES;
        _tabBarVC.isOpenScrollTabbar = NO;
    //    _tabBarVC.isShakerAnimation = YES;
        [_tabBarVC actionReturnBoolByNSUIntegerBlock:^BOOL(NSUInteger data) {
            for (JobsTabBarItemConfig *tabBarItemConfig in self.tabBarItemConfigMutArr) {
                if(tabBarItemConfig.isNeedjump){
                    toast(@"这个跳开");
                    return NO;
                }
            }return YES;
        }];
    }return _tabBarVC;
}

+(void)setTabBarVC:(JobsTabBarVC *)tabBarVC{
    _tabBarVC = tabBarVC;
}
@dynamic jobsCustomTabBarVC;
static JobsCustomTabBarVC *_jobsCustomTabBarVC = nil;
+(JobsCustomTabBarVC *)jobsCustomTabBarVC{
    if(!_jobsCustomTabBarVC){
        _jobsCustomTabBarVC = JobsCustomTabBarVC.sharedManager;
        _jobsCustomTabBarVC.viewControllers = AppDelegate.viewCtrlByTabBarCtrlConfigMutArr;
    }return _jobsCustomTabBarVC;
}

+(void)setJobsCustomTabBarVC:(JobsCustomTabBarVC *)jobsCustomTabBarVC{
    _jobsCustomTabBarVC = jobsCustomTabBarVC;
}
@dynamic lZTabBarCtrl;
static LZTabBarController *_lZTabBarCtrl = nil;
+(LZTabBarController *)lZTabBarCtrl{
    if(!_lZTabBarCtrl){
        @jobs_weakify(self)
        _lZTabBarCtrl = [LZTabBarController createTabBarController:^LZTabBarConfig *(LZTabBarConfig *config) {
            @jobs_strongify(self)
            return self.lZTabBarConfig;
        }];
    }return _lZTabBarCtrl;
}

+(void)setLZTabBarCtrl:(LZTabBarController *)lZTabBarCtrl{
    _lZTabBarCtrl = lZTabBarCtrl;
}
#pragma mark —— 配置一些导航控制器
@dynamic tabBarNavCtrl;
static UINavigationController *_tabBarNavCtrl = nil;
+(UINavigationController *)tabBarNavCtrl{
    if(!_tabBarNavCtrl){
        _tabBarNavCtrl = [UINavigationController.alloc initWithRootViewController:self.tabBarVC];
        _tabBarNavCtrl.hidesBottomBarWhenPushed = YES;
    }return _tabBarNavCtrl;
}

+(void)setTabBarNavCtrl:(UINavigationController *)tabBarNavCtrl{
    _tabBarNavCtrl = tabBarNavCtrl;
}
@dynamic jobsCustomTabBarNavCtrl;
static UINavigationController *_jobsCustomTabBarNavCtrl = nil;
+(UINavigationController *)jobsCustomTabBarNavCtrl{
    if(!_jobsCustomTabBarNavCtrl){
        _jobsCustomTabBarNavCtrl = [UINavigationController.alloc initWithRootViewController:self.jobsCustomTabBarVC];
        _jobsCustomTabBarNavCtrl.hidesBottomBarWhenPushed = YES;
    }return _jobsCustomTabBarNavCtrl;
}

+(void)setJobsTabBarNavCtrl:(UINavigationController *)jobsCustomTabBarNavCtrl{
    _jobsCustomTabBarNavCtrl = jobsCustomTabBarNavCtrl;
}
@dynamic lZTabBarNavCtrl;
static UINavigationController *_lZTabBarNavCtrl = nil;
+(UINavigationController *)lZTabBarNavCtrl{
    if(!_lZTabBarNavCtrl){
        _lZTabBarNavCtrl = [UINavigationController.alloc initWithRootViewController:self.lZTabBarCtrl];
        _lZTabBarNavCtrl.hidesBottomBarWhenPushed = YES;
    }return _lZTabBarNavCtrl;
}

+(void)setLZTabBarNavCtrl:(UINavigationController *)lZTabBarNavCtrl{
    _lZTabBarNavCtrl = lZTabBarNavCtrl;
}
#pragma mark —— 数据源
@dynamic lZTabBarConfig;
static LZTabBarConfig *_lZTabBarConfig = nil;
+(LZTabBarConfig *)lZTabBarConfig{
    if(!_lZTabBarConfig){
        _lZTabBarConfig = LZTabBarConfig.new;
        _lZTabBarConfig.viewControllers = self.viewCtrlByTabBarCtrlConfigMutArr;
        _lZTabBarConfig.normalImages = self.imageUnselectedNameMutArr;
        _lZTabBarConfig.selectedImages = self.imageSelectedNameMutArr;
        _lZTabBarConfig.titles = self.tabBarItemTitleMutArr;
        _lZTabBarConfig.isNavigation = NO;
    }return _lZTabBarConfig;
}

+(void)setLZTabBarConfig:(LZTabBarConfig *)lZTabBarConfig{
    _lZTabBarConfig = lZTabBarConfig;
}
@dynamic jobsCustomTabBarConfig;
static JobsCustomTabBarConfig *_jobsCustomTabBarConfig = nil;
+(JobsCustomTabBarConfig *)jobsCustomTabBarConfig{
    _jobsCustomTabBarConfig = JobsCustomTabBarConfig.sharedManager;
    _jobsCustomTabBarConfig.tabBarHeight = JobsWidth(60);
    _jobsCustomTabBarConfig.tabBarWidth = JobsWidth(389);
//    _jobsCustomTabBarConfig.tabBarX = JobsWidth(0);
//    _jobsCustomTabBarConfig.tabBarY = JobsWidth(0);
//    _jobsCustomTabBarConfig.tabBarSize = CGSizeMake(JobsWidth(0), JobsWidth(0));
//    _jobsCustomTabBarConfig.tabBarOrigin = CGPointMake(JobsWidth(0), JobsWidth(0));
//    _jobsCustomTabBarConfig.tabBarFrame = CGRectMake(JobsWidth(0), JobsWidth(0), JobsWidth(0), JobsWidth(0));
    _jobsCustomTabBarConfig.tabBarBackgroundColor = JobsCyanColor;
    _jobsCustomTabBarConfig.tabBarBackgroundImage = nil;//JobsIMG(@"");
    _jobsCustomTabBarConfig.tabBarItems = self.tabBarItemMutArr;
    _jobsCustomTabBarConfig.viewControllers = self.viewCtrlByTabBarCtrlConfigMutArr;
    _jobsCustomTabBarConfig.tabBarItemYOffsets = nil;
    return _jobsCustomTabBarConfig;
}

+(void)setJobsCustomTabBarConfig:(JobsCustomTabBarConfig *)jobsCustomTabBarConfig{
    _jobsCustomTabBarConfig = jobsCustomTabBarConfig;
}
@dynamic tabBarItemConfigMutArr;
static NSMutableArray <__kindof JobsTabBarItemConfig *>*_tabBarItemConfigMutArr = nil;
+(NSMutableArray <__kindof JobsTabBarItemConfig *>*)tabBarItemConfigMutArr{
    if(!_tabBarItemConfigMutArr){
        _tabBarItemConfigMutArr = NSMutableArray.array;
        {
            JobsTabBarItemConfig *config = JobsTabBarItemConfig.new;
            config.vc = self.viewCtrlMutArr[_tabBarItemConfigMutArr.count];
            config.title = self.tabBarItemTitleMutArr[_tabBarItemConfigMutArr.count];
            config.imageSelected = self.imageSelectedMutArr[_tabBarItemConfigMutArr.count];
            config.imageUnselected = self.imageUnSelectedMutArr[_tabBarItemConfigMutArr.count];
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.xOffset = landscapeValue(JobsWidth(200));
            config.tabBarItemWidth = landscapeValue(JobsWidth(100));
            config.spacing = JobsWidth(3);
            config.tag = _tabBarItemConfigMutArr.count + 1;
            config.isNeedCheckLogin = NO;
            config.isNotNeedCheckLogin = YES;
            config.isNeedjump = NO;
            [_tabBarItemConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarItemConfig *config = JobsTabBarItemConfig.new;
            config.vc = self.viewCtrlMutArr[_tabBarItemConfigMutArr.count];
            config.title = self.tabBarItemTitleMutArr[_tabBarItemConfigMutArr.count];
            config.imageSelected = self.imageSelectedMutArr[_tabBarItemConfigMutArr.count];
            config.imageUnselected = self.imageUnSelectedMutArr[_tabBarItemConfigMutArr.count];
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.xOffset = landscapeValue(JobsWidth(5));
            config.tabBarItemWidth = landscapeValue(JobsWidth(100));
            config.spacing = JobsWidth(3);
            config.tag = _tabBarItemConfigMutArr.count + 1;
            config.isNeedCheckLogin = NO;
            config.isNotNeedCheckLogin = YES;
            config.isNeedjump = NO;
            [_tabBarItemConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarItemConfig *config = JobsTabBarItemConfig.new;
            config.vc = self.viewCtrlMutArr[_tabBarItemConfigMutArr.count];
            config.title = self.tabBarItemTitleMutArr[_tabBarItemConfigMutArr.count];
            config.imageSelected = self.imageSelectedMutArr[_tabBarItemConfigMutArr.count];
            config.imageUnselected = self.imageUnSelectedMutArr[_tabBarItemConfigMutArr.count];
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.xOffset = landscapeValue(JobsWidth(5));
            config.tabBarItemWidth = landscapeValue(JobsWidth(50));
            config.spacing = JobsWidth(3);
            config.tag = _tabBarItemConfigMutArr.count + 1;
            config.isNeedCheckLogin = NO;
            config.isNotNeedCheckLogin = YES;
            config.isNeedjump = NO;
            [_tabBarItemConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarItemConfig *config = JobsTabBarItemConfig.new;
            config.vc = self.viewCtrlMutArr[_tabBarItemConfigMutArr.count];
            config.title = self.tabBarItemTitleMutArr[_tabBarItemConfigMutArr.count];
            config.imageSelected = self.imageSelectedMutArr[_tabBarItemConfigMutArr.count];
            config.imageUnselected = self.imageUnSelectedMutArr[_tabBarItemConfigMutArr.count];
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.xOffset = landscapeValue(JobsWidth(5));
            config.tabBarItemWidth = landscapeValue(JobsWidth(50));
            config.spacing = JobsWidth(3);
            config.tag = _tabBarItemConfigMutArr.count + 1;
            config.isNeedCheckLogin = NO;
            config.isNotNeedCheckLogin = YES;
            config.isNeedjump = NO;
            [_tabBarItemConfigMutArr addObject:config];
        }
        
        {
            JobsTabBarItemConfig *config = JobsTabBarItemConfig.new;
            config.vc = self.viewCtrlMutArr[_tabBarItemConfigMutArr.count];
            config.title = self.tabBarItemTitleMutArr[_tabBarItemConfigMutArr.count];
            config.imageSelected = self.imageSelectedMutArr[_tabBarItemConfigMutArr.count];
            config.imageUnselected = self.imageUnSelectedMutArr[_tabBarItemConfigMutArr.count];
            config.humpOffsetY = 0;
            config.lottieName = nil;
            config.xOffset = landscapeValue(JobsWidth(5));
            config.tabBarItemWidth = landscapeValue(JobsWidth(100));
            config.spacing = JobsWidth(3);
            config.tag = _tabBarItemConfigMutArr.count + 1;
            config.isNeedCheckLogin = NO;
            config.isNotNeedCheckLogin = YES;
            config.isNeedjump = NO;
            [_tabBarItemConfigMutArr addObject:config];
        }
    }return _tabBarItemConfigMutArr;
}

+(void)setTabBarItemConfigMutArr:(NSMutableArray<__kindof JobsTabBarItemConfig *> *)tabBarItemConfigMutArr{
    _tabBarItemConfigMutArr = tabBarItemConfigMutArr;
}
@dynamic tabBarItemMutArr;
static NSMutableArray <__kindof UIButton *>*_tabBarItemMutArr = nil;
+(NSMutableArray <__kindof UIButton *>*)tabBarItemMutArr{
    if(!_tabBarItemMutArr){
        _tabBarItemMutArr = NSMutableArray.array;
        @jobs_weakify(self)
        [_tabBarItemMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                                       background:nil
                                                       buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                                    textAlignment:NSTextAlignmentCenter
                                                                 subTextAlignment:NSTextAlignmentCenter
                                                                      normalImage:self.imageUnSelectedMutArr[_tabBarItemMutArr.count]
                                                                   highlightImage:self.imageSelectedMutArr[_tabBarItemMutArr.count]
                                                                  attributedTitle:nil
                                                          selectedAttributedTitle:nil
                                                               attributedSubtitle:nil
                                                                            title:AppDelegate.tabBarItemTitleMutArr[_tabBarItemMutArr.count]
                                                                         subTitle:nil
                                                                        titleFont:bayonRegular(14)
                                                                     subTitleFont:nil
                                                                         titleCor:JobsCor(@"#FFFFFF")
                                                                      subTitleCor:nil
                                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                              baseBackgroundColor:JobsClearColor
                                                                  backgroundImage:DefaultIndex == _tabBarItemMutArr.count ? JobsIMG(@"TabBarItem选中的背景色") :JobsIMG(@"TabBarItem选中的背景色（透明）")
                                                                     imagePadding:JobsWidth(0)
                                                                     titlePadding:JobsWidth(0)
                                                                   imagePlacement:NSDirectionalRectEdgeTop
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
            [AppDelegate button:x index:0];
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }]];
        [_tabBarItemMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                                       background:nil
                                                       buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                                    textAlignment:NSTextAlignmentCenter
                                                                 subTextAlignment:NSTextAlignmentCenter
                                                                      normalImage:self.imageUnSelectedMutArr[_tabBarItemMutArr.count]
                                                                   highlightImage:self.imageSelectedMutArr[_tabBarItemMutArr.count]
                                                                  attributedTitle:nil
                                                          selectedAttributedTitle:nil
                                                               attributedSubtitle:nil
                                                                            title:AppDelegate.tabBarItemTitleMutArr[_tabBarItemMutArr.count]
                                                                         subTitle:nil
                                                                        titleFont:bayonRegular(14)
                                                                     subTitleFont:nil
                                                                         titleCor:JobsCor(@"#FFFFFF")
                                                                      subTitleCor:nil
                                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                              baseBackgroundColor:JobsClearColor
                                                                  backgroundImage:DefaultIndex == _tabBarItemMutArr.count ? JobsIMG(@"TabBarItem选中的背景色") :JobsIMG(@"TabBarItem选中的背景色（透明）")
                                                                     imagePadding:JobsWidth(0)
                                                                     titlePadding:JobsWidth(0)
                                                                   imagePlacement:NSDirectionalRectEdgeTop
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
            [AppDelegate button:x index:1];
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }]];
        [_tabBarItemMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                                       background:nil
                                                       buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                                    textAlignment:NSTextAlignmentCenter
                                                                 subTextAlignment:NSTextAlignmentCenter
                                                                      normalImage:self.imageUnSelectedMutArr[_tabBarItemMutArr.count]
                                                                   highlightImage:self.imageSelectedMutArr[_tabBarItemMutArr.count]
                                                                  attributedTitle:nil
                                                          selectedAttributedTitle:nil
                                                               attributedSubtitle:nil
                                                                            title:AppDelegate.tabBarItemTitleMutArr[_tabBarItemMutArr.count]
                                                                         subTitle:nil
                                                                        titleFont:bayonRegular(14)
                                                                     subTitleFont:nil
                                                                         titleCor:JobsCor(@"#FFFFFF")
                                                                      subTitleCor:nil
                                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                              baseBackgroundColor:JobsClearColor
                                                                  backgroundImage:DefaultIndex == _tabBarItemMutArr.count ? JobsIMG(@"TabBarItem选中的背景色") :JobsIMG(@"TabBarItem选中的背景色（透明）")
                                                                     imagePadding:JobsWidth(0)
                                                                     titlePadding:JobsWidth(0)
                                                                   imagePlacement:NSDirectionalRectEdgeTop
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
            [AppDelegate button:x index:2];
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }]];
        [_tabBarItemMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                                       background:nil
                                                       buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                                    textAlignment:NSTextAlignmentCenter
                                                                 subTextAlignment:NSTextAlignmentCenter
                                                                      normalImage:self.imageUnSelectedMutArr[_tabBarItemMutArr.count]
                                                                   highlightImage:self.imageSelectedMutArr[_tabBarItemMutArr.count]
                                                                  attributedTitle:nil
                                                          selectedAttributedTitle:nil
                                                               attributedSubtitle:nil
                                                                            title:AppDelegate.tabBarItemTitleMutArr[_tabBarItemMutArr.count]
                                                                         subTitle:nil
                                                                        titleFont:bayonRegular(14)
                                                                     subTitleFont:nil
                                                                         titleCor:JobsCor(@"#FFFFFF")
                                                                      subTitleCor:nil
                                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                              baseBackgroundColor:JobsClearColor
                                                                  backgroundImage:DefaultIndex == _tabBarItemMutArr.count ? JobsIMG(@"TabBarItem选中的背景色") :JobsIMG(@"TabBarItem选中的背景色（透明）")
                                                                     imagePadding:JobsWidth(0)
                                                                     titlePadding:JobsWidth(0)
                                                                   imagePlacement:NSDirectionalRectEdgeTop
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
            [AppDelegate button:x index:3];
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }]];
        [_tabBarItemMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                                       background:nil
                                                       buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                                    textAlignment:NSTextAlignmentCenter
                                                                 subTextAlignment:NSTextAlignmentCenter
                                                                      normalImage:self.imageUnSelectedMutArr[_tabBarItemMutArr.count]
                                                                   highlightImage:self.imageSelectedMutArr[_tabBarItemMutArr.count]
                                                                  attributedTitle:nil
                                                          selectedAttributedTitle:nil
                                                               attributedSubtitle:nil
                                                                            title:AppDelegate.tabBarItemTitleMutArr[_tabBarItemMutArr.count]
                                                                         subTitle:nil
                                                                        titleFont:bayonRegular(14)
                                                                     subTitleFont:nil
                                                                         titleCor:JobsCor(@"#FFFFFF")
                                                                      subTitleCor:nil
                                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                              baseBackgroundColor:JobsClearColor
                                                                  backgroundImage:DefaultIndex == _tabBarItemMutArr.count ? JobsIMG(@"TabBarItem选中的背景色") :JobsIMG(@"TabBarItem选中的背景色（透明）")
                                                                     imagePadding:JobsWidth(0)
                                                                     titlePadding:JobsWidth(0)
                                                                   imagePlacement:NSDirectionalRectEdgeTop
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
            [AppDelegate button:x index:4];
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }]];
    } return _tabBarItemMutArr;
}

+(void)setTabBarItemMutArr:(NSMutableArray<__kindof UIButton *> *)tabBarItemMutArr{
    _tabBarItemMutArr = tabBarItemMutArr;
}
@dynamic tabBarItemTitleMutArr;
static NSMutableArray <__kindof NSString *>*_tabBarItemTitleMutArr = nil;
+(NSMutableArray <__kindof NSString *>*)tabBarItemTitleMutArr{
    if(!_tabBarItemTitleMutArr){
        _tabBarItemTitleMutArr = NSMutableArray.array;
        [_tabBarItemTitleMutArr addObject:JobsInternationalization(@"MY FAV")];
        [_tabBarItemTitleMutArr addObject:JobsInternationalization(@"BANK")];
        [_tabBarItemTitleMutArr addObject:JobsInternationalization(@"INCENTIVE")];
        [_tabBarItemTitleMutArr addObject:JobsInternationalization(@"INVITE")];
        [_tabBarItemTitleMutArr addObject:JobsInternationalization(@"CONTACT US")];
    }return _tabBarItemTitleMutArr;
}

+(void)setTabBarItemTitleMutArr:(NSMutableArray<__kindof NSString *> *)tabBarItemTitleMutArr{
    _tabBarItemTitleMutArr = tabBarItemTitleMutArr;
}
@dynamic imageSelectedNameMutArr;
static NSMutableArray <__kindof NSString *>*_imageSelectedNameMutArr = nil;
+(NSMutableArray <__kindof NSString *>*)imageSelectedNameMutArr{
    if(!_imageSelectedNameMutArr){
        _imageSelectedNameMutArr = NSMutableArray.array;
        [_imageSelectedNameMutArr addObject:@"MY FAV_已点击"];
        [_imageSelectedNameMutArr addObject:@"BANK_已点击"];
        [_imageSelectedNameMutArr addObject:@"INCENTIVE_已点击"];
        [_imageSelectedNameMutArr addObject:@"INVITE_已点击"];
        [_imageSelectedNameMutArr addObject:@"CONTACT US_已点击"];
    }return _imageSelectedNameMutArr;
}

+(void)setImageSelectedNameMutArr:(NSMutableArray<__kindof NSString *> *)imageSelectedNameMutArr{
    _imageSelectedNameMutArr = imageSelectedNameMutArr;
}
@dynamic imageUnselectedNameMutArr;
static NSMutableArray <__kindof NSString *>*_imageUnselectedNameMutArr = nil;
+(NSMutableArray <__kindof NSString *>*)imageUnselectedNameMutArr{
    if(!_imageUnselectedNameMutArr){
        _imageUnselectedNameMutArr = NSMutableArray.array;
        [_imageUnselectedNameMutArr addObject:@"MY FAV_未点击"];
        [_imageUnselectedNameMutArr addObject:@"BANK_未点击"];
        [_imageUnselectedNameMutArr addObject:@"INCENTIVE_未点击"];
        [_imageUnselectedNameMutArr addObject:@"INVITE_未点击"];
        [_imageUnselectedNameMutArr addObject:@"CONTACT US_未点击"];
    }return _imageUnselectedNameMutArr;
}

+(void)setImageUnselectedNameMutArr:(NSMutableArray<__kindof NSString *> *)imageUnselectedNameMutArr{
    _imageUnselectedNameMutArr = imageUnselectedNameMutArr;
}
@dynamic imageSelectedMutArr;
static NSMutableArray <__kindof UIImage *>*_imageSelectedMutArr = nil;
+(NSMutableArray <__kindof UIImage *>*)imageSelectedMutArr{
    if(!_imageSelectedMutArr){
        _imageSelectedMutArr = NSMutableArray.array;
        for (NSString *imageSelectedName in self.imageSelectedNameMutArr) {
            [_imageSelectedMutArr addObject:JobsIMG(imageSelectedName)];
        }
    }return _imageSelectedMutArr;
}

+(void)setImageSelectedMutArr:(NSMutableArray<__kindof UIImage *> *)imageSelectedMutArr{
    _imageSelectedMutArr = imageSelectedMutArr;
}
@dynamic imageUnSelectedMutArr;
static NSMutableArray <__kindof UIImage *>*_imageUnSelectedMutArr = nil;
+(NSMutableArray <__kindof UIImage *>*)imageUnSelectedMutArr{
    if(!_imageUnSelectedMutArr){
        _imageUnSelectedMutArr = NSMutableArray.array;
        for (NSString *imageUnSelectedName in self.imageUnselectedNameMutArr) {
            [_imageUnSelectedMutArr addObject:JobsIMG(imageUnSelectedName)];
        }
    }return _imageUnSelectedMutArr;
}

+(void)setImageUnSelectedMutArr:(NSMutableArray<__kindof UIImage *> *)imageUnSelectedMutArr{
    _imageUnSelectedMutArr = imageUnSelectedMutArr;
}
@dynamic viewCtrlByTabBarCtrlConfigMutArr;
static NSMutableArray <__kindof UIViewController *>*_viewCtrlByTabBarCtrlConfigMutArr = nil;
+(NSMutableArray <__kindof UIViewController *>*)viewCtrlByTabBarCtrlConfigMutArr{
    if(!_viewCtrlByTabBarCtrlConfigMutArr){
        _viewCtrlByTabBarCtrlConfigMutArr = NSMutableArray.array;
        for (JobsTabBarItemConfig *tabBarCtrlConfig in self.tabBarItemConfigMutArr) {
            [_viewCtrlByTabBarCtrlConfigMutArr addObject:tabBarCtrlConfig.vc];
        }
    }return _viewCtrlByTabBarCtrlConfigMutArr;
}

+(void)setViewCtrlByTabBarCtrlConfigMutArr:(NSMutableArray<__kindof UIViewController *> *)viewCtrlByTabBarCtrlConfigMutArr{
    _viewCtrlByTabBarCtrlConfigMutArr = viewCtrlByTabBarCtrlConfigMutArr;
}
@dynamic viewCtrlMutArr;
static NSMutableArray <__kindof UIViewController *>*_viewCtrlMutArr = nil;
+(NSMutableArray <__kindof UIViewController *>*)viewCtrlMutArr{
    if(!_viewCtrlMutArr){
        _viewCtrlMutArr = NSMutableArray.array;
        [_viewCtrlMutArr addObject:ViewController_1.new];
        [_viewCtrlMutArr addObject:ViewController_2.new];
        [_viewCtrlMutArr addObject:ViewController_3.new];
        [_viewCtrlMutArr addObject:ViewController_4.new];
        [_viewCtrlMutArr addObject:ViewController_5.new];
    }return _viewCtrlMutArr;
}

+(void)setViewCtrlMutArr:(NSMutableArray<__kindof UIViewController *> *)viewCtrlMutArr{
    _viewCtrlMutArr = viewCtrlMutArr;
}
@dynamic navCtrMutArr;
static NSMutableArray <__kindof UINavigationController *>*_navCtrMutArr = nil;
+(NSMutableArray <__kindof UINavigationController *>*)navCtrMutArr{
    if(!_navCtrMutArr){
        _navCtrMutArr = NSMutableArray.array;
        for (UIViewController *vc in self.viewCtrlMutArr) {
            [_navCtrMutArr addObject:[UINavigationController.alloc initWithRootViewController:vc]];
        }
    }return _navCtrMutArr;
}

+(void)setNavCtrMutArr:(NSMutableArray<__kindof UINavigationController *> *)navCtrMutArr{
    _navCtrMutArr = navCtrMutArr;
}
#pragma mark —— 一些私有方法
+(void)button:(UIButton *)button index:(NSUInteger)index{
    int t = 0;
    for (UIButton *btn in AppDelegate.tabBarItemMutArr) {
        btn.jobsResetBtnImage(self.imageUnSelectedMutArr[t]);
        btn.jobsResetBtnTitleCor(JobsCor(@"#FFFFFF"));
        btn.jobsResetBtnBgImage(JobsIMG(@"TabBarItem选中的背景色（透明）"));
        t+=1;
    }
    button.jobsResetBtnImage(self.imageSelectedMutArr[index]);
    button.jobsResetBtnTitleCor(JobsCor(@"#FFF500"));
    button.jobsResetBtnBgImage(JobsIMG(@"TabBarItem选中的背景色"));
    [self.jobsCustomTabBarVC customSelectIndex:index];
}
#pragma mark —— 一些公有方法
/// 刷新 TabBarTitle
-(void)refreshTabBarTitle{
    for (JobsTabBarItemConfig *config in AppDelegate.tabBarItemConfigMutArr) {
        NSInteger index = [AppDelegate.tabBarItemConfigMutArr indexOfObject:config];
        config.vc.tabBarItem.title = AppDelegate.tabBarItemTitleMutArr[index];
    }
}

@end
