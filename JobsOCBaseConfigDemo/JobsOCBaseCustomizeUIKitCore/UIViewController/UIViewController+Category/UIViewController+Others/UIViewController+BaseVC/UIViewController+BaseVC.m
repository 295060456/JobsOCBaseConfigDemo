//
//  UIViewController+BaseVC.m
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import "UIViewController+BaseVC.h"

@implementation UIViewController (BaseVC)
#pragma mark —— 一些功能性
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView{
    @jobs_weakify(self)
    return ^(UIView *_Nullable superview,
             UIView *_Nullable view) {
        @jobs_strongify(self)
        self.view.navigator.frame = view.bounds;
        view.navigator = superview.navigator;
        [superview addSubview:self.view.navigator];
    };
}

-(void)showUserInfo{
    if (JobsDebug) {
        UIViewModel *viewModel = [self configViewModelWithTitle:JobsInternationalization(@"用户信息展示(开发测试专用)") subTitle:nil];
        viewModel.cls = JobsShowObjInfoVC.class;
        viewModel.requestParams = self.readUserInfo;
        [self forceComingToPushVC:viewModel.cls.new
                    requestParams:viewModel];// 测试专用
    }
}
/// 配置GKNavigationBar
-(jobsByViewModelBlock)setGKNav{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable data) {
        @jobs_strongify(self)
        UIViewModel *viewModel = data ? : self.viewModel;
        self.gk_navTitle = viewModel.textModel.text;
        self.gk_navTitleColor = viewModel.textModel.textCor ? : HEXCOLOR(0xD3B698);
        self.gk_navTitleFont = viewModel.textModel.font ? : UIFontWeightRegularSize(18);
        self.gk_navBackgroundColor = viewModel.navBgCor;
        self.gk_navBackgroundImage = viewModel.navBgImage;
        self.gk_navLineHidden = YES;
        self.gk_navItemLeftSpace = JobsWidth(20);
        [self hideNavLine];
    };
}
/// 配置GKNavigationBar的返回按钮
-(jobsByBtnBlock _Nonnull)setGKNavBackBtn{
    @jobs_weakify(self)
    return ^(__kindof UIButton *_Nullable btn) {
        @jobs_strongify(self)
        if (self.navigationController.viewControllers.count - 1) {//从上个页面推过来才有返回键，直接的个人中心是没有的
            self.gk_backImage = JobsIMG(@"全局返回箭头");/// 设置返回按钮图片（优先级高于gk_backStyle）
            self.gk_backStyle = GKNavigationBarBackStyleBlack;
            self.gk_navLeftBarButtonItem = UIBarButtonItem.initBy(btn ? : self.backBtnCategory);
        }
    };
}
/// 铺满全屏展示的策略
-(void)fullScreenConstraintTargetView:(__kindof UIView *_Nonnull)view
                        topViewOffset:(CGFloat)topViewOffset{
    /// 防止调用崩溃
    if (![self.view.subviews containsObject:view]) {
        [self.view addSubview:view];
    }
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (self.setupNavigationBarHidden &&
            (!self.gk_navBarAlpha || self.gk_navigationBar.hidden || !self.gk_navigationBar.alpha)) {// 系统、GK均隐藏
            make.top.equalTo(self.view).offset(topViewOffset);
        }else{
            if (!self.setupNavigationBarHidden && (!self.gk_navBarAlpha || self.gk_navigationBar.hidden || !self.gk_navigationBar.alpha) ) {// 用系统的导航栏
                make.top.equalTo(self.view).offset(JobsNavigationBarAndStatusBarHeight(nil) + topViewOffset);
            }else if (self.setupNavigationBarHidden && (self.gk_navBarAlpha || !self.gk_navigationBar.hidden || self.gk_navigationBar.alpha)) {// 用GK的导航栏
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(topViewOffset);
            }else{
                make.top.equalTo(self.view).offset(topViewOffset);
            }
        }make.left.right.bottom.equalTo(self.view);
    }];
}
/**
 ❤️【强制推控制器】❤️
 1、自定义是PUSH还是PRESENT展现控制器，如果自定义PUSH但是navigationController不存在，则换用PRESENT展现控制器
 2、定位于@implementation UINavigationController (SafeTransition)，交换系统的push方法，防止某些情况下系统资源紧张导致的多次推控制器
 @param fromVC 从A控制器（上一个页面）
 @param toVC  推到B控制器 （下一个页面）
 @param comingStyle 自定义展现的方式
 @param presentationStyle  如果是PRESENT情况下的一个系统参数设定
 @param requestParams  A控制器—>B控制器，正向传值
 @param hidesBottomBarWhenPushed 跳转子页面的时候隐藏tabbar
 @param animated  是否动画展现
 @param successBlock 在推控制器之前，反向block(B控制器），以便对B控制器的一些自定义修改
 */
+(instancetype _Nullable)comingFromVC:(UIViewController *_Nonnull)fromVC // 上一个页面
                                 toVC:(UIViewController *_Nonnull)toVC // 下一个页面
                          comingStyle:(ComingStyle)comingStyle
                    presentationStyle:(UIModalPresentationStyle)presentationStyle
                        requestParams:(id _Nullable)requestParams
             hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
                             animated:(BOOL)animated
                              success:(jobsByIDBlock _Nullable)successBlock{
    if (toVC) {
        if([toVC isKindOfClass:UINavigationController.class]){
            UINavigationController *navVC = (UINavigationController *)toVC;
            navVC.rootViewController.requestParams = requestParams;
            navVC.rootViewController.fromVC = fromVC;// 【承上启下】下一个页面记录是从哪里来的
        }else{
            toVC.requestParams = requestParams;
            NSLog(@"%@",toVC.requestParams);
            toVC.fromVC = fromVC;// 【承上启下】下一个页面记录是从哪里来的
        }
        @jobs_weakify(fromVC)
        jobsByVoidBlock presentViewControllerBlock = ^(){
            /// 防止多次present控制器
            if(!fromVC.presentedViewController){
                toVC.pushOrPresent = ComingStyle_PRESENT;
                /// iOS_13中modalPresentationStyle的默认改为UIModalPresentationAutomatic,而在之前默认是UIModalPresentationFullScreen
                toVC.modalPresentationStyle = presentationStyle;
                [weak_fromVC presentViewController:toVC
                                          animated:animated
                                        completion:^{
                    if (successBlock) successBlock(toVC);
                }];
            }
        };
        switch (comingStyle) {
            case ComingStyle_PUSH:{
                if (fromVC.navigationController) {
                    toVC.pushOrPresent = ComingStyle_PUSH;
                    toVC.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed;/// 下面有黑条
                    [weak_fromVC.navigationController pushViewController:toVC animated:animated];
                    if (successBlock) successBlock(toVC);
                }else if(presentViewControllerBlock) presentViewControllerBlock();
            }break;
            case ComingStyle_PRESENT:{
                if(presentViewControllerBlock) presentViewControllerBlock();
            }break;
            default:
                NSLog(@"错误的推进方式");
                break;
        }return toVC;
    }else return nil;// 为了防止多次推VC
}
#pragma mark —— <BaseViewControllerProtocol> @property(nonatomic,weak)UIViewController *fromVC;
JobsKey(_fromVC)
@dynamic fromVC;
-(UIViewController *)fromVC{
    return Jobs_getAssociatedObject(_fromVC);
}

-(void)setFromVC:(UIViewController *)fromVC{
    Jobs_setAssociatedASSIGN(_fromVC, fromVC)
}
#pragma mark —— <BaseViewControllerProtocol> @property(nonatomic,assign)ComingStyle pushOrPresent;
JobsKey(_pushOrPresent)
@dynamic pushOrPresent;
-(ComingStyle)pushOrPresent{
    return [Jobs_getAssociatedObject(_pushOrPresent) integerValue];
}

-(void)setPushOrPresent:(ComingStyle)pushOrPresent{
    Jobs_setAssociatedRETAIN_NONATOMIC(_pushOrPresent, @(pushOrPresent))
}
#pragma mark —— <UIViewModelProtocol> @property(nonatomic,strong)id requestParams;
JobsKey(_requestParams)
@dynamic requestParams;
-(id)requestParams{
    return Jobs_getAssociatedObject(_requestParams);
}

-(void)setRequestParams:(id)requestParams{
    Jobs_setAssociatedRETAIN_NONATOMIC(_requestParams, requestParams)
}
#pragma mark —— <UIViewModelProtocol> @property(nonatomic,strong)UIImage *bgImage;
JobsKey(_bgImage)
@dynamic bgImage;
-(UIImage *)bgImage{
    UIImage *BgImage = Jobs_getAssociatedObject(_bgImage);
    if (!BgImage) {
        BgImage = JobsIMG(@"启动页SLOGAN");
        Jobs_setAssociatedRETAIN_NONATOMIC(_bgImage, BgImage)
    }return BgImage;
}

-(void)setBgImage:(UIImage *)bgImage{
    Jobs_setAssociatedRETAIN_NONATOMIC(_bgImage, bgImage)
}
#pragma mark —— @property(nonatomic,assign)BOOL setupNavigationBarHidden;
JobsKey(_setupNavigationBarHidden)
@dynamic setupNavigationBarHidden;
-(BOOL)setupNavigationBarHidden{
    return Jobs_getAssociatedObject(_setupNavigationBarHidden);
}

-(void)setSetupNavigationBarHidden:(BOOL)setupNavigationBarHidden{
    Jobs_setAssociatedRETAIN_NONATOMIC(_setupNavigationBarHidden, @(setupNavigationBarHidden));
}
#pragma mark —— @property(nonatomic,assign)NSUInteger __block jobsTag;
JobsKey(_jobsTag)
@dynamic jobsTag;
-(NSUInteger)jobsTag{
    return [Jobs_getAssociatedObject(_jobsTag) unsignedIntegerValue];
}

-(void)setJobsTag:(NSUInteger)jobsTag{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsTag, @(jobsTag))
}
#pragma mark —— @property(nonatomic,strong)JobsNavBarConfig *navBarConfig;
JobsKey(_navBarConfig)
@dynamic navBarConfig;
-(void)setNavBarConfig:(JobsNavBarConfig *)navBarConfig{
    Jobs_setAssociatedRETAIN_NONATOMIC(_navBarConfig, navBarConfig)
}

-(JobsNavBarConfig *)navBarConfig{
    JobsNavBarConfig *NavBarConfig = Jobs_getAssociatedObject(_navBarConfig);
    if(!NavBarConfig){
        Jobs_setAssociatedRETAIN_NONATOMIC(_navBarConfig, jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable data) {
            
        }))
    }return NavBarConfig;
}
#pragma mark —— @property(nonatomic,strong)JobsNavBar *navBar;
JobsKey(_navBar)
@dynamic navBar;
-(void)setNavBar:(JobsNavBar *)navBar{
    Jobs_setAssociatedRETAIN_NONATOMIC(_navBar, navBar)
}

-(JobsNavBar *)navBar{
    JobsNavBar *NavBar = Jobs_getAssociatedObject(_navBar);
    if(!NavBar){
        @jobs_weakify(self)
        Jobs_setAssociatedRETAIN_NONATOMIC(_navBar, jobsMakeNavBar(^(__kindof JobsNavBar * _Nullable data) {
            @jobs_strongify(self)
            if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
                self.navBarConfig.backBtnModel.btn_offset_x = self.navBarConfig.backBtnModel.btn_offset_x ? : JobsWidth(40);
                self.navBarConfig.closeBtnModel.btn_offset_x = self.navBarConfig.closeBtnModel.btn_offset_x ? : JobsWidth(40);
            }
            NSLog(@"%f",self.navBarConfig.backBtnModel.btn_offset_x);
            NSLog(@"%f",self.navBarConfig.closeBtnModel.btn_offset_x);
    //        if(!self.navBarConfig.title) self.navBarConfig.title = self.viewModel.textModel.text;
            data.navBarConfig = self.navBarConfig;
            self.view.addSubview(data);
            [data mas_makeConstraints:^(MASConstraintMaker *make) {
                if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
                    make.top.equalTo(self.view);
                }else{
                    make.top.equalTo(self.view).offset(JobsStatusBarHeight());
                }
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(JobsWidth(40));
            }];self.view.refresh();
            data.jobsRichViewByModel(nil);
            @jobs_weakify(self)
            [data actionNavBarBackBtnClickBlock:^(UIButton * _Nullable x) {
                @jobs_strongify(self)
                self.backBtnClickEvent(x);
            }];
            [data actionNavBarCloseBtnClickBlock:^(UIButton * _Nullable x) {
    //            @jobs_strongify(self)
            }];
        }))
    }return NavBar;
}

@end
