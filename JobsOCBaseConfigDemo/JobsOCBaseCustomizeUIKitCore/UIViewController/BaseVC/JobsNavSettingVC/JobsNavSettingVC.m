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
    self.setupNavigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     当设置为 YES 时，视图控制器的布局将考虑导航栏、工具栏或标签栏的不透明性，即这些栏的背后内容会从顶部或底部开始布局。
     这样可以确保不透明的栏不会覆盖内容。
     
     当设置为 NO 时，视图控制器的布局会忽略不透明栏的影响，内容会延伸到整个视图控制器的边界，包括被不透明栏遮挡的部分。
     */
    self.extendedLayoutIncludesOpaqueBars = YES;
/// 因为GKNavigationBar对横屏不兼容，所以这里采用GKNavigationBar（竖屏）+JobsNavBar（横屏）的方案
#pragma mark —— 在最终的子类这么写（演示Demo）
//    /// 配置右侧按钮群
//    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(BaseButton.jobsInit()
//                                        .jobsResetBtnBgImage(JobsIMG(@"首页右侧悬浮菜单人工客服（已点击）"))
//                                        .onClickBy(^(UIButton *x){
//                                            @jobs_strongify(self)
//                                            if (self.objBlock) self.objBlock(x);
//                                        }).onLongPressGestureBy(^(id data){
//                                            JobsLog(@"");
//                                        })
//                                        .bySize(CGSizeMake(JobsWidth(24), JobsWidth(24)))));
//    });
//    self.makeNavByConfig(jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable config) {
//        config.alpha = 1;
//        config.titleImage = JobsIMG(@"BSportRedLogo"); /// 配置中间的标题为图片
//        /// 配置返回键
//        config.backBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
////            @jobs_strongify(self)
//            buttonModel.normalImage = JobsIMG(@"全局返回箭头");
//            buttonModel.highlightImage = JobsIMG(@"全局返回箭头");
//            buttonModel.title = JobsInternationalization(@"");
//            buttonModel.titleFont = bayonRegular(14);
//            buttonModel.titleCor = JobsCor(@"#8A93A1");
//            buttonModel.imagePlacement = NSDirectionalRectEdgeLeading;
//            buttonModel.textAlignment = NSTextAlignmentCenter;
//            buttonModel.subTextAlignment = NSTextAlignmentCenter;
//            buttonModel.baseBackgroundColor = JobsClearColor;
//            buttonModel.imagePadding = JobsWidth(5);
//            buttonModel.clickEventBlock = ^id(__kindof UIButton *_Nullable x){
//                @jobs_strongify(self)
//                x.selected = !x.selected;
//                JobsAppTool.loginWork = FMLoginWork_MyFav;
//    //            self.backTo(0);
//                self.backViewControllerCore(self);
//                return nil;
//            };
//            buttonModel.longPressGestureEventBlock = ^id(__kindof UIButton *_Nullable btn){
//                // @jobs_strongify(self)
//                return nil;
//            };
//        }));
//    }));
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
    JobsLog(@"%d",self.setupNavigationBarHidden);
    self.isHiddenNavigationBar = self.setupNavigationBarHidden;
    [self.navigationController setNavigationBarHidden:self.setupNavigationBarHidden animated:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— 一些公有方法
-(jobsByCGFloatBlock _Nonnull)makeNavByAlpha{
    @jobs_weakify(self)
    return ^(CGFloat data){
        @jobs_strongify(self)
        /// JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape
        self.makeGKNavByAlpha(data);
    };
}

-(jobsByCGFloatBlock _Nonnull)makeGKNavByAlpha{
    @jobs_weakify(self)
    return ^(CGFloat data){
        @jobs_strongify(self)
        self.setGKNav(nil);
        self.setGKNavBackBtn(nil);
        if(self.leftBarButtonItems.count) self.gk_navLeftBarButtonItems = self.leftBarButtonItems;
        if(self.rightBarButtonItems.count) self.gk_navRightBarButtonItems = self.rightBarButtonItems;
        self.gk_navigationBar.hidden = !data;
        self.gk_navigationBar.alpha = data;
    };
}

-(jobsByCGFloatBlock _Nonnull)makeJobsNavByAlpha{
    @jobs_weakify(self)
    return ^(CGFloat data){
        @jobs_strongify(self)
        self.makeNavBarConfig(nil,nil);
        self.navBar.hidden = !data;
        self.navBar.alpha = data;
    };
}

-(jobsByNavBarConfigBlock _Nonnull)makeNavByConfig{
    @jobs_weakify(self)
    return ^(__kindof JobsNavBarConfig *_Nullable config){
        @jobs_strongify(self)
        /// GKNavigationBar 对横屏不兼容
        /// 常见横屏兼容性问题：
        /// 导航栏位置错乱：横屏时 GKNavigationBar 可能没有正确适配 statusBar 和 navigationBar 的高度，导致位置偏移。
        /// 高度计算不准确：框架默认是基于竖屏设计的，横屏时高度没有自动根据 UIScreen 旋转调整。
        /// 布局未响应旋转：横竖屏切换时，GKNavigationBar 有时不会触发布局更新（如 layoutSubviews），或者更新不及时。
        /// 适配 SafeArea 问题：尤其是在 iPhone X 系列横屏时，顶部的安全区域（SafeAreaInsets）处理不当，会导致导航栏遮挡内容。
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            self.makeNavBarConfig(nil,nil);
            self.navBar.hidden = !config.viewModel.alpha;
            self.navBar.alpha = config.viewModel.alpha;
        }else{
            self.setGKNav(config.viewModel);/// 配置GKNavigationBar（不包括返回键的设定）
            self.setGKNavBackBtnBy(config.backBtn);/// 配置GKNavigationBar的返回按钮
            self.setGKNavTitleBtnBy(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
                model.backgroundImage = config.viewModel.titleImage;
                model.jobsSize = CGSizeMake(JobsWidth(150), JobsWidth(30));
                model.baseBackgroundColor = JobsClearColor;
            }));
            if(self.leftBarButtonItems.count) self.gk_navLeftBarButtonItems = self.leftBarButtonItems;
            if(self.rightBarButtonItems.count) self.gk_navRightBarButtonItems = self.rightBarButtonItems;
            self.gk_navigationBar.hidden = !config.viewModel.alpha;
            self.gk_navigationBar.alpha = config.viewModel.alpha;
        }
    };
}

@end
