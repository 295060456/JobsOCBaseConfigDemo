//
//  JobsNavSettingVC.m
//  FM
//
//  Created by User on 9/9/24.
//

#import "JobsNavSettingVC.h"

@interface JobsNavSettingVC ()

@end

@implementation JobsNavSettingVC

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc{
    JobsRemoveNotification(self);
    [self.view endEditing:YES];
}

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     当设置为 YES 时，视图控制器的布局将考虑导航栏、工具栏或标签栏的不透明性，即这些栏的背后内容会从顶部或底部开始布局。
     这样可以确保不透明的栏不会覆盖内容。
     
     当设置为 NO 时，视图控制器的布局会忽略不透明栏的影响，内容会延伸到整个视图控制器的边界，包括被不透明栏遮挡的部分。
     */
    self.extendedLayoutIncludesOpaqueBars = YES;

#pragma mark —— JobsNavBar <BaseViewControllerProtocol> 仅做Demo演示
//    self.makeNavBarConfig(nil,nil);
//    self.navBar.getBackBtn.normalTitleColor(JobsWhiteColor);
//    self.navBar.getBackBtn.jobsVisible = YES;
//    self.navBar.jobsVisible = YES;
#pragma mark —— GKNavigationBar -(void)makeGKNavigationBarConfigure 仅做Demo演示
//    self.gk_statusBarHidden = NO;
//    self.setGKNav(nil);
//    self.setGKNavBackBtn(nil);
//    self.gk_navBackgroundColor = JobsWhiteColor;
//    self.gk_navTitleFont = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
//    self.gk_navTitleColor = AppMainCor_01;
//    self.gk_backStyle = GKNavigationBarBackStyleBlack;
//    self.gk_navLineHidden = YES;
//    self.gk_navRightBarButtonItem = JobsBarButtonItem(self.contactBtn);
//    self.gk_navigationBar.jobsVisible = YES;
//    @jobs_weakify(self)
//    self.gk_navRightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
//        @jobs_strongify(self)
//        data.add(self.msgBtn);
//        data.add(self.customerServiceBtn);
//    });
#pragma mark —— 在最终的子类这么写
//    if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
//        self.makeNavBarConfig(nil,nil);
//        self.navBar.alpha = 1;
//    }else{
//        self.setGKNav(nil);
//        self.setGKNavBackBtn(nil);
//        self.gk_navigationBar.jobsVisible = YES;
//    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.setupNavigationBarHidden animated:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%d",self.setupNavigationBarHidden);
    self.isHiddenNavigationBar = self.setupNavigationBarHidden;
    [self.navigationController setNavigationBarHidden:self.setupNavigationBarHidden animated:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— 一些公有方法
-(jobsByCGFloatBlock)makeNavByAlpha{
    @jobs_weakify(self)
    return ^(CGFloat data){
        @jobs_strongify(self)
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            self.makeNavBarConfig(nil,nil);
            self.navBar.hidden = !data;
            self.navBar.alpha = data;
        }else{
            self.setGKNav(nil);
            self.setGKNavBackBtn(nil);
            self.gk_navLeftBarButtonItems = self.leftBarButtonItems;
            self.gk_navRightBarButtonItems = self.rightBarButtonItems;
            self.gk_navigationBar.hidden = !data;
            self.gk_navigationBar.alpha = data;
        }
    };
}
#pragma mark —— lazyLoad


@end
