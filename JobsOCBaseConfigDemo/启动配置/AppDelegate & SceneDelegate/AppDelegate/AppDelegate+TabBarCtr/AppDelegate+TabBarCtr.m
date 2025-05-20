//
//  AppDelegate+TabBarCtr.m
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "AppDelegate+TabBarCtr.h"
NSUInteger DefaultIndex = 2; /// 默认从第3个开始初始显示
@implementation AppDelegate (TabBarCtr)
#pragma mark —— 配置一些普通的控制器
@dynamic tabBarVC;
static JobsTabBarVC *_tabBarVC = nil;
+(JobsTabBarVC *)tabBarVC{
    if(!_tabBarVC){
        @jobs_weakify(self)
        _tabBarVC = jobsMakeSharedManagerTabBarVC(^(__kindof JobsTabBarVC * _Nullable tabBarVC) {
            tabBarVC.isAnimationAlert = YES;//OK
            tabBarVC.isPlaySound = YES;
            tabBarVC.isFeedbackGenerator = YES;
            tabBarVC.isOpenScrollTabbar = NO;
        //    tabBarVC.isShakerAnimation = YES;
            [tabBarVC actionRetBoolByUIntegerBlock:^BOOL(NSUInteger data) {
                @jobs_strongify(self)
                for (JobsTabBarItemConfig *tabBarItemConfig in self.tabBarItemConfigMutArr) {
                    if(tabBarItemConfig.isNeedjump){
                        toast(@"这个跳开");
                        return NO;
                    }
                }return YES;
            }];
        });
    }return _tabBarVC;
}

+(void)setTabBarVC:(JobsTabBarVC *)tabBarVC{
    _tabBarVC = tabBarVC;
}
@dynamic jobsCustomTabBarVC;
static JobsCustomTabBarVC *_jobsCustomTabBarVC = nil;
+(JobsCustomTabBarVC *)jobsCustomTabBarVC{
    if(!_jobsCustomTabBarVC){
        _jobsCustomTabBarVC = jobsMakeSharedManagerCustomTabBarVC(^(__kindof JobsCustomTabBarVC * _Nullable tabBarVC) {
            tabBarVC.viewControllers = AppDelegate.viewCtrlByTabBarCtrlConfigMutArr;
        });
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
        _tabBarNavCtrl = JobsMakeNavCtrlBy(self.tabBarVC);
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
        _jobsCustomTabBarNavCtrl = JobsMakeNavCtrlBy(self.jobsCustomTabBarVC);
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
        _lZTabBarNavCtrl = JobsMakeNavCtrlBy(self.lZTabBarCtrl);
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
        @jobs_weakify(self)
        _lZTabBarConfig = jobsMakeLZTabBarConfig(^(__kindof LZTabBarConfig * _Nullable data) {
            @jobs_strongify(self)
            data.viewControllers = self.viewCtrlByTabBarCtrlConfigMutArr;
            data.normalImages = self.imageUnselectedNameMutArr;
            data.selectedImages = self.imageSelectedNameMutArr;
            data.titles = self.tabBarItemTitleMutArr;
            data.isNavigation = NO;
        });
    }return _lZTabBarConfig;
}

+(void)setLZTabBarConfig:(LZTabBarConfig *)lZTabBarConfig{
    _lZTabBarConfig = lZTabBarConfig;
}
@dynamic jobsCustomTabBarConfig;
static JobsCustomTabBarConfig *_jobsCustomTabBarConfig = nil;
+(JobsCustomTabBarConfig *)jobsCustomTabBarConfig{
    _jobsCustomTabBarConfig = jobsMakeSharedManagerCustomTabBarConfig(^(__kindof JobsCustomTabBarConfig * _Nullable tabBarConfig) {
        tabBarConfig.tabBarHeight = JobsWidth(60);
        tabBarConfig.tabBarWidth = JobsWidth(389);
    //    tabBarConfig.tabBarX = JobsWidth(0);
    //    tabBarConfig.tabBarY = JobsWidth(0);
    //    tabBarConfig.tabBarSize = CGSizeMake(JobsWidth(0), JobsWidth(0));
    //    tabBarConfig.tabBarOrigin = CGPointMake(JobsWidth(0), JobsWidth(0));
    //    tabBarConfig.tabBarFrame = CGRectMake(JobsWidth(0), JobsWidth(0), JobsWidth(0), JobsWidth(0));
        tabBarConfig.tabBarBackgroundColor = JobsCyanColor;
        tabBarConfig.tabBarBackgroundImage = nil;//JobsIMG(@"");
        tabBarConfig.tabBarItems = self.tabBarItemMutArr;
        tabBarConfig.viewControllers = self.viewCtrlByTabBarCtrlConfigMutArr;
        tabBarConfig.tabBarItemYOffsets = nil;
    });return _jobsCustomTabBarConfig;
}

+(void)setJobsCustomTabBarConfig:(JobsCustomTabBarConfig *)jobsCustomTabBarConfig{
    _jobsCustomTabBarConfig = jobsCustomTabBarConfig;
}
@dynamic tabBarItemConfigMutArr;
static NSMutableArray <__kindof JobsTabBarItemConfig *>*_tabBarItemConfigMutArr = nil;
+(NSMutableArray <__kindof JobsTabBarItemConfig *>*)tabBarItemConfigMutArr{
    if(!_tabBarItemConfigMutArr){
        @jobs_weakify(self)
        _tabBarItemConfigMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data.add(jobsMakeTabBarItemConfig(^(__kindof JobsTabBarItemConfig * _Nullable config) {
                @jobs_strongify(self)
                config.vc = self.viewCtrlMutArr[0];
                config.title = self.tabBarItemTitleMutArr[0];
                config.imageSelected = self.imageSelectedMutArr[0];
                config.imageUnselected = self.imageUnSelectedMutArr[0];
                config.humpOffsetY = 0;
                config.lottieName = nil;
                config.xOffset = landscapeValue(JobsWidth(200));
                config.tabBarItemWidth = landscapeValue(JobsWidth(100));
                config.spacing = JobsWidth(3);
                config.tag = 1;
                config.isNeedCheckLogin = NO;
                config.isNotNeedCheckLogin = YES;
                config.isNeedjump = NO;
            }));
            data.add(jobsMakeTabBarItemConfig(^(__kindof JobsTabBarItemConfig * _Nullable config) {
                @jobs_strongify(self)
                config.vc = self.viewCtrlMutArr[1];
                config.title = self.tabBarItemTitleMutArr[1];
                config.imageSelected = self.imageSelectedMutArr[1];
                config.imageUnselected = self.imageUnSelectedMutArr[1];
                config.humpOffsetY = 0;
                config.lottieName = nil;
                config.xOffset = landscapeValue(JobsWidth(5));
                config.tabBarItemWidth = landscapeValue(JobsWidth(100));
                config.spacing = JobsWidth(3);
                config.tag = 2;
                config.isNeedCheckLogin = NO;
                config.isNotNeedCheckLogin = YES;
                config.isNeedjump = NO;
            }));
            data.add(jobsMakeTabBarItemConfig(^(__kindof JobsTabBarItemConfig * _Nullable config) {
                @jobs_strongify(self)
                config.vc = self.viewCtrlMutArr[2];
                config.title = self.tabBarItemTitleMutArr[2];
                config.imageSelected = self.imageSelectedMutArr[2];
                config.imageUnselected = self.imageUnSelectedMutArr[2];
                config.humpOffsetY = 0;
                config.lottieName = nil;
                config.xOffset = landscapeValue(JobsWidth(5));
                config.tabBarItemWidth = landscapeValue(JobsWidth(50));
                config.spacing = JobsWidth(3);
                config.tag = 3;
                config.isNeedCheckLogin = NO;
                config.isNotNeedCheckLogin = YES;
                config.isNeedjump = NO;
            }));
            data.add(jobsMakeTabBarItemConfig(^(__kindof JobsTabBarItemConfig * _Nullable config) {
                @jobs_strongify(self)
                config.vc = self.viewCtrlMutArr[3];
                config.title = self.tabBarItemTitleMutArr[3];
                config.imageSelected = self.imageSelectedMutArr[3];
                config.imageUnselected = self.imageUnSelectedMutArr[3];
                config.humpOffsetY = 0;
                config.lottieName = nil;
                config.xOffset = landscapeValue(JobsWidth(5));
                config.tabBarItemWidth = landscapeValue(JobsWidth(50));
                config.spacing = JobsWidth(3);
                config.tag = 4;
                config.isNeedCheckLogin = NO;
                config.isNotNeedCheckLogin = YES;
                config.isNeedjump = NO;
            }));
            data.add(jobsMakeTabBarItemConfig(^(__kindof JobsTabBarItemConfig * _Nullable config) {
                @jobs_strongify(self)
                config.vc = self.viewCtrlMutArr[4];
                config.title = self.tabBarItemTitleMutArr[4];
                config.imageSelected = self.imageSelectedMutArr[4];
                config.imageUnselected = self.imageUnSelectedMutArr[4];
                config.humpOffsetY = 0;
                config.lottieName = nil;
                config.xOffset = landscapeValue(JobsWidth(5));
                config.tabBarItemWidth = landscapeValue(JobsWidth(100));
                config.spacing = JobsWidth(3);
                config.tag = 5;
                config.isNeedCheckLogin = NO;
                config.isNotNeedCheckLogin = YES;
                config.isNeedjump = NO;
            }));
        });
    }return _tabBarItemConfigMutArr;
}

+(void)setTabBarItemConfigMutArr:(NSMutableArray<__kindof JobsTabBarItemConfig *> *)tabBarItemConfigMutArr{
    _tabBarItemConfigMutArr = tabBarItemConfigMutArr;
}
@dynamic tabBarItemMutArr;
static NSMutableArray <__kindof UIButton *>*_tabBarItemMutArr = nil;
+(NSMutableArray <__kindof UIButton *>*)tabBarItemMutArr{
    if(!_tabBarItemMutArr){
        _tabBarItemMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UIButton *>* _Nullable data) {
            @jobs_weakify(self)
            data.add(BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                @jobs_strongify(self)
                buttonModel.normalImage = self.imageUnSelectedMutArr[0];
                buttonModel.highlightImage = self.imageSelectedMutArr[0];
                buttonModel.title = AppDelegate.tabBarItemTitleMutArr[0];
                buttonModel.titleFont = bayonRegular(14);
                buttonModel.titleCor = JobsCor(@"#FFFFFF");
                buttonModel.imagePlacement = NSDirectionalRectEdgeTop;
                buttonModel.textAlignment = NSTextAlignmentCenter;
                buttonModel.subTextAlignment = NSTextAlignmentCenter;
                buttonModel.imagePadding = JobsWidth(5);
                buttonModel.baseBackgroundColor = JobsClearColor;
                buttonModel.backgroundImage = DefaultIndex == 0 ? JobsIMG(@"TabBarItem选中的背景色") :JobsIMG(@"TabBarItem选中的背景色（透明）");
            }))
                     .onClickBy(^(__kindof UIButton *x){
                         x.selected = !x.selected;
                         JobsAppTool.loginWork = FMLoginWork_MyFav;
                         @jobs_weakify(self)
//                         [self isLogin:^{
//                             @jobs_strongify(self)
//                             [AppDelegate button:x index:0];
//                             if (self.objBlock) self.objBlock(x);
//                         }];
                         [AppDelegate button:x index:0];
                     }).onLongPressGestureBy(^(id data){
                         JobsLog(@"");
                     }));
            data.add(BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                @jobs_strongify(self)
                buttonModel.normalImage = self.imageUnSelectedMutArr[1];
                buttonModel.highlightImage = self.imageSelectedMutArr[1];
                buttonModel.title = AppDelegate.tabBarItemTitleMutArr[1];
                buttonModel.titleFont = bayonRegular(14);
                buttonModel.titleCor = JobsCor(@"#FFFFFF");
                buttonModel.imagePlacement = NSDirectionalRectEdgeTop;
                buttonModel.textAlignment = NSTextAlignmentCenter;
                buttonModel.subTextAlignment = NSTextAlignmentCenter;
                buttonModel.imagePadding = JobsWidth(5);
                buttonModel.baseBackgroundColor = JobsClearColor;
                buttonModel.backgroundImage = DefaultIndex == 1 ? JobsIMG(@"TabBarItem选中的背景色")  :JobsIMG(@"TabBarItem选中的背景色（透明）");
            }))
                     .onClickBy(^(__kindof UIButton *x){
                         x.selected = !x.selected;
                         JobsAppTool.loginWork = FMLoginWork_MyBank;
                         @jobs_weakify(self)
//                         [self isLogin:^{
//                             @jobs_strongify(self)
//                             [AppDelegate button:x index:1];
//                             if (self.objBlock) self.objBlock(x);
//                         }];
                         [AppDelegate button:x index:1];
                     }).onLongPressGestureBy(^(id data){
                         JobsLog(@"");
                     }));
            data.add(BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                @jobs_strongify(self)
                buttonModel.normalImage = self.imageUnSelectedMutArr[2];
                buttonModel.highlightImage = self.imageSelectedMutArr[2];
                buttonModel.title = AppDelegate.tabBarItemTitleMutArr[2];
                buttonModel.titleFont = bayonRegular(14);
                buttonModel.titleCor = JobsCor(@"#FFFFFF");
                buttonModel.imagePlacement = NSDirectionalRectEdgeTop;
                buttonModel.textAlignment = NSTextAlignmentCenter;
                buttonModel.subTextAlignment = NSTextAlignmentCenter;
                buttonModel.imagePadding = JobsWidth(5);
                buttonModel.baseBackgroundColor = JobsClearColor;
                buttonModel.backgroundImage = JobsIMG(@"TabBarItem选中的背景色（透明）");
//                DefaultIndex == 2 ? JobsIMG(@"TabBarItem选中的背景色") :JobsIMG(@"TabBarItem选中的背景色（透明）");
            }))
                     .onClickBy(^(__kindof UIButton *x){
                         @jobs_strongify(self)
                         x.selected = !x.selected;
                         [AppDelegate button:x index:2];
                         if (self.objBlock) self.objBlock(x);
                     }).onLongPressGestureBy(^(id data){
                         JobsLog(@"");
                     }));
            
            data.add(BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                @jobs_strongify(self)
                buttonModel.normalImage = self.imageUnSelectedMutArr[3];
                buttonModel.highlightImage = self.imageSelectedMutArr[3];
                buttonModel.title = AppDelegate.tabBarItemTitleMutArr[3];
                buttonModel.titleFont = bayonRegular(14);
                buttonModel.titleCor = JobsCor(@"#FFFFFF");
                buttonModel.imagePlacement = NSDirectionalRectEdgeTop;
                buttonModel.textAlignment = NSTextAlignmentCenter;
                buttonModel.subTextAlignment = NSTextAlignmentCenter;
                buttonModel.imagePadding = JobsWidth(5);
                buttonModel.baseBackgroundColor = JobsClearColor;
                buttonModel.backgroundImage = DefaultIndex == 3 ? JobsIMG(@"TabBarItem选中的背景色") :JobsIMG(@"TabBarItem选中的背景色（透明）");
            }))
                     .onClickBy(^(__kindof UIButton *x){
                         @jobs_strongify(self)
                         JobsAppTool.loginWork = FMLoginWork_Default;
                         x.selected = !x.selected;
                         [AppDelegate button:x index:3];
                         if (self.objBlock) self.objBlock(x);
                     }).onLongPressGestureBy(^(id data){
                         JobsLog(@"");
                     }));
            data.add(BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
                @jobs_strongify(self)
                buttonModel.normalImage = self.imageUnSelectedMutArr[4];
                buttonModel.highlightImage = self.imageSelectedMutArr[4];
                buttonModel.title = AppDelegate.tabBarItemTitleMutArr[4];
                buttonModel.titleFont = bayonRegular(14);
                buttonModel.titleCor = JobsCor(@"#FFFFFF");
                buttonModel.imagePlacement = NSDirectionalRectEdgeTop;
                buttonModel.textAlignment = NSTextAlignmentCenter;
                buttonModel.subTextAlignment = NSTextAlignmentCenter;
                buttonModel.imagePadding = JobsWidth(5);
                buttonModel.baseBackgroundColor = JobsClearColor;
                buttonModel.backgroundImage = DefaultIndex == 4 ? JobsIMG(@"TabBarItem选中的背景色") :JobsIMG(@"TabBarItem选中的背景色（透明）");
            }))
                     .onClickBy(^(__kindof UIButton *x){
                         @jobs_strongify(self)
                         x.selected = !x.selected;
                         [AppDelegate button:x index:4];
                         if (self.objBlock) self.objBlock(x);
                     }).onLongPressGestureBy(^(id data){
                         JobsLog(@"");
                     }));
        });
    } return _tabBarItemMutArr;
}

+(void)setTabBarItemMutArr:(NSMutableArray<__kindof UIButton *> *)tabBarItemMutArr{
    _tabBarItemMutArr = tabBarItemMutArr;
}
@dynamic tabBarItemTitleMutArr;
static NSMutableArray <__kindof NSString *>*_tabBarItemTitleMutArr = nil;
+(NSMutableArray <__kindof NSString *>*)tabBarItemTitleMutArr{
    if(!_tabBarItemTitleMutArr){
        _tabBarItemTitleMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof NSString *>*_Nullable data) {
            data.add(JobsInternationalization(@"MY FAV"));
            data.add(JobsInternationalization(@"BANK"));
            data.add(JobsInternationalization(@"INCENTIVE"));
            data.add(JobsInternationalization(@"INVITE"));
            data.add(JobsInternationalization(@"CONTACT US"));
        });
    }return _tabBarItemTitleMutArr;
}

+(void)setTabBarItemTitleMutArr:(NSMutableArray<__kindof NSString *> *)tabBarItemTitleMutArr{
    _tabBarItemTitleMutArr = tabBarItemTitleMutArr;
}
@dynamic imageSelectedNameMutArr;
static NSMutableArray <__kindof NSString *>*_imageSelectedNameMutArr = nil;
+(NSMutableArray <__kindof NSString *>*)imageSelectedNameMutArr{
    if(!_imageSelectedNameMutArr){
        _imageSelectedNameMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof NSString *>*_Nullable data) {
            data.add(@"MY FAV_已点击");
            data.add(@"BANK_已点击");
            data.add(@"INCENTIVE_已点击");
            data.add(@"INVITE_已点击");
            data.add(@"CONTACT US_已点击");
        });
    }return _imageSelectedNameMutArr;
}

+(void)setImageSelectedNameMutArr:(NSMutableArray<__kindof NSString *> *)imageSelectedNameMutArr{
    _imageSelectedNameMutArr = imageSelectedNameMutArr;
}
@dynamic imageUnselectedNameMutArr;
static NSMutableArray <__kindof NSString *>*_imageUnselectedNameMutArr = nil;
+(NSMutableArray <__kindof NSString *>*)imageUnselectedNameMutArr{
    if(!_imageUnselectedNameMutArr){
        _imageUnselectedNameMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof NSString *>*_Nullable data) {
            data.add(@"MY FAV_未点击");
            data.add(@"BANK_未点击");
            data.add(@"INCENTIVE_未点击");
            data.add(@"INVITE_未点击");
            data.add(@"CONTACT US_未点击");
        });
    }return _imageUnselectedNameMutArr;
}

+(void)setImageUnselectedNameMutArr:(NSMutableArray<__kindof NSString *> *)imageUnselectedNameMutArr{
    _imageUnselectedNameMutArr = imageUnselectedNameMutArr;
}
@dynamic imageSelectedMutArr;
static NSMutableArray <__kindof UIImage *>*_imageSelectedMutArr = nil;
+(NSMutableArray <__kindof UIImage *>*)imageSelectedMutArr{
    if(!_imageSelectedMutArr){
        @jobs_weakify(self)
        _imageSelectedMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UIImage *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *imageSelectedName in self.imageSelectedNameMutArr) {
                data.add(JobsIMG(imageSelectedName));
            }
        });
    }return _imageSelectedMutArr;
}

+(void)setImageSelectedMutArr:(NSMutableArray<__kindof UIImage *> *)imageSelectedMutArr{
    _imageSelectedMutArr = imageSelectedMutArr;
}
@dynamic imageUnSelectedMutArr;
static NSMutableArray <__kindof UIImage *>*_imageUnSelectedMutArr = nil;
+(NSMutableArray <__kindof UIImage *>*)imageUnSelectedMutArr{
    if(!_imageUnSelectedMutArr){
        @jobs_weakify(self)
        _imageUnSelectedMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UIImage *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *imageUnSelectedName in self.imageUnselectedNameMutArr) {
                data.add(JobsIMG(imageUnSelectedName));
            }
        });
    }return _imageUnSelectedMutArr;
}

+(void)setImageUnSelectedMutArr:(NSMutableArray<__kindof UIImage *> *)imageUnSelectedMutArr{
    _imageUnSelectedMutArr = imageUnSelectedMutArr;
}
@dynamic viewCtrlByTabBarCtrlConfigMutArr;
static NSMutableArray <__kindof UIViewController *>*_viewCtrlByTabBarCtrlConfigMutArr = nil;
+(NSMutableArray <__kindof UIViewController *>*)viewCtrlByTabBarCtrlConfigMutArr{
    if(!_viewCtrlByTabBarCtrlConfigMutArr){
        @jobs_weakify(self)
        _viewCtrlByTabBarCtrlConfigMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            for (JobsTabBarItemConfig *tabBarCtrlConfig in self.tabBarItemConfigMutArr) {
                data.add(tabBarCtrlConfig.vc);
            }
        });
    }return _viewCtrlByTabBarCtrlConfigMutArr;
}

+(void)setViewCtrlByTabBarCtrlConfigMutArr:(NSMutableArray<__kindof UIViewController *> *)viewCtrlByTabBarCtrlConfigMutArr{
    _viewCtrlByTabBarCtrlConfigMutArr = viewCtrlByTabBarCtrlConfigMutArr;
}
@dynamic viewCtrlMutArr;
static NSMutableArray <__kindof UIViewController *>*_viewCtrlMutArr = nil;
+(NSMutableArray <__kindof UIViewController *>*)viewCtrlMutArr{
    if(!_viewCtrlMutArr){
        _viewCtrlMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UIViewController *>*_Nullable data) {
            data.add(ViewController_1.new);
            data.add(ViewController_2.new);
            data.add(ViewController_3.new);
            data.add(ViewController_4.new);
            data.add(ViewController_5.new);
        });
    }return _viewCtrlMutArr;
}

+(void)setViewCtrlMutArr:(NSMutableArray<__kindof UIViewController *> *)viewCtrlMutArr{
    _viewCtrlMutArr = viewCtrlMutArr;
}
@dynamic navCtrMutArr;
static NSMutableArray <__kindof UINavigationController *>*_navCtrMutArr = nil;
+(NSMutableArray <__kindof UINavigationController *>*)navCtrMutArr{
    if(!_navCtrMutArr){
        @jobs_weakify(self)
        _navCtrMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UINavigationController *>*_Nullable data) {
            @jobs_strongify(self)
            for (UIViewController *vc in self.viewCtrlMutArr) {
                data.add(JobsMakeNavCtrlBy(vc));
            }
        });
    }return _navCtrMutArr;
}

+(void)setNavCtrMutArr:(NSMutableArray<__kindof UINavigationController *> *)navCtrMutArr{
    _navCtrMutArr = navCtrMutArr;
}
#pragma mark —— 一些公有方法
/// 切换控制器
+(void)button:(__kindof UIButton *)button index:(NSUInteger)index{
    int t = 0;
    for (__kindof UIButton *btn in AppDelegate.tabBarItemMutArr) {
        btn.jobsResetBtnImage(self.imageUnSelectedMutArr[t]);
        btn.jobsResetBtnTitleCor(JobsCor(@"#FFFFFF"));
        btn.jobsResetBtnBgImage(JobsIMG(@"TabBarItem选中的背景色（透明）"));
        t+=1;
    }
    button.jobsResetBtnImage(self.imageSelectedMutArr[index]);
    button.jobsResetBtnTitleCor(JobsCor(@"#FFF500"));
    button.jobsResetBtnBgImage(JobsIMG(@"TabBarItem选中的背景色"));
    self.jobsCustomTabBarVC.customSelectIndex(index);
}
/// 刷新 TabBarTitle
-(void)refreshTabBarTitle{
    for (JobsTabBarItemConfig *config in AppDelegate.tabBarItemConfigMutArr) {
        NSInteger index = [AppDelegate.tabBarItemConfigMutArr indexOfObject:config];
        config.vc.tabBarItem.title = AppDelegate.tabBarItemTitleMutArr[index];
    }
}

@end
