//
//  LandscapeSwitchVC.m
//  JobsOCBaseConfig
//
//  Created by User on 6/29/24.
//

#import "LandscapeSwitchVC.h"

@interface LandscapeSwitchVC ()
// UI
@property(nonatomic,strong)BaseButton *switchBtn1;
@property(nonatomic,strong)BaseButton *switchBtn2;
@property(nonatomic,strong)BaseButton *switchBtn3;
@property(nonatomic,strong)BaseButton *switchBtn4;
@property(nonatomic,strong)BaseButton *switchBtn5;
@property(nonatomic,strong)BaseButton *switchBtn6;
@property(nonatomic,strong)NSMutableArray <BaseButton *>*btnMutArr;
// Data
@property(nonatomic,assign)UIInterfaceOrientationMask currentVCInterfaceOrientationMask;

@end

@implementation LandscapeSwitchVC

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    NSLog(@"%@",JobsLocalFunc);
    [NSNotificationCenter.defaultCenter removeObserver:self
                                                  name:UIDeviceOrientationDidChangeNotification
                                                object:nil];
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(deviceOrientationDidChange:)
                                               name:UIDeviceOrientationDidChangeNotification
                                             object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
    
    self.switchBtn1.alpha = 1;
    self.switchBtn2.alpha = 1;
    self.switchBtn3.alpha = 1;
    self.switchBtn4.alpha = 1;
    self.switchBtn5.alpha = 1;
    self.switchBtn6.alpha = 1;
    
    [self masonry];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
/// UIViewController 的生命周期方法。这个方法会在设备方向即将变化时被调用
- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size
          withTransitionCoordinator:coordinator];

    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // 在动画过渡中执行的操作，可以根据 size 和当前设备方向来调整界面布局
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // 过渡动画完成后的操作，如果需要的话
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{

}
#pragma mark —— 一些私有方法
-(void)masonry{
//    [self.btnMutArr mas_distributeViewsAlongAxis:MASAxisTypeVertical
//                                withFixedSpacing:10
//                                     leadSpacing:100
//                                     tailSpacing:100];
//     /// 设置控件的高度
//     [self.btnMutArr mas_makeConstraints:^(MASConstraintMaker *make) {
//         make.width.mas_equalTo(100); // 宽度设为固定值，这里示意为 100
//         make.centerX.equalTo(self.view.mas_centerX); // 水平居中
//     }];
    
    // 使用Masonry布局
    [self.btnMutArr mas_distributeViewsAlongAxis:MASAxisTypeVertical
                                withFixedSpacing:10
                                     leadSpacing:100
                                     tailSpacing:100];
    
    [self.btnMutArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100); // 设置按钮宽度为固定值
        make.centerX.equalTo(self.view.mas_centerX); // 水平居中
    }];
    
    [_switchBtn1 makeBtnLabelByShowingType:UILabelShowingType_03];
    [_switchBtn2 makeBtnLabelByShowingType:UILabelShowingType_03];
    [_switchBtn3 makeBtnLabelByShowingType:UILabelShowingType_03];
    [_switchBtn4 makeBtnLabelByShowingType:UILabelShowingType_03];
    [_switchBtn5 makeBtnLabelByShowingType:UILabelShowingType_03];
    [_switchBtn6 makeBtnLabelByShowingType:UILabelShowingType_03];
}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
    UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
    switch (orientation) {
        // 处理竖屏方向的逻辑
        case UIDeviceOrientationPortrait:/// 设备竖直向上，Home 按钮在下方
            NSLog(@"系统通知：↓");
            break;
        case UIDeviceOrientationPortraitUpsideDown:/// 设备竖直向下，Home 按钮在上方
            NSLog(@"系统通知：↑");
            break;
        // 处理横屏方向的逻辑
        case UIDeviceOrientationLandscapeLeft:/// 设备水平，Home 按钮在右侧
            NSLog(@"系统通知：→");
            break;
        case UIDeviceOrientationLandscapeRight:/// 设备水平，Home 按钮在左侧
            NSLog(@"系统通知：←");
            break;
        default:
            break;
    }
}
#pragma mark —— 屏幕旋转相关
-(BOOL)shouldAutorotate {
    return YES;
}
/// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.currentVCInterfaceOrientationMask;
}
/// 检测屏幕方向
-(void)checkScreenOrientation{
    /**
     界面方向（UIInterfaceOrientation）与设备方向（UIDeviceOrientation）对应关系：
     界面方向（UIInterfaceOrientation）用于描述应用界面的期望方向，通常在应用中设置和管理。（开发中常用）
     设备方向（UIDeviceOrientation）描述了设备在物理空间中的方向，可以通过设备的传感器获取。
 
     UIInterfaceOrientationUnknown            = UIDeviceOrientationUnknown, // 通常用于表示界面方向未知或无法确定的情况
     UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait,
     UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown,
     UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight,
     UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft
 
     【界面】竖屏方向
     UIInterfaceOrientationPortraitUpsideDown：设备竖直向下，Home 按钮在上方。
     UIInterfaceOrientationPortrait：设备竖直向上，Home 按钮在下方。
     【界面】横屏方向
     UIInterfaceOrientationLandscapeLeft：设备水平，Home 按钮在左侧
     UIInterfaceOrientationLandscapeRight：设备水平，Home 按钮在右侧

     【设备】竖屏方向
     UIDeviceOrientationPortrait：设备竖直向上，Home 按钮在下方。
     UIDeviceOrientationPortraitUpsideDown：设备竖直向下，Home 按钮在上方。
     【设备】竖屏方向
     UIDeviceOrientationLandscapeRight：设备水平，Home 按钮在左侧
     UIDeviceOrientationLandscapeLeft：设备水平，Home 按钮在右侧
     */
    UIInterfaceOrientation currentOrientation = UIInterfaceOrientationUnknown;
    if (@available(iOS 13.0, *)) {
        // 获取当前窗口的场景
        UIWindowScene *windowScene = self.view.window.windowScene;
        // 获取当前窗口场景的界面方向
        currentOrientation = windowScene.interfaceOrientation;
    } else {
        SuppressWdeprecatedDeclarationsWarning(currentOrientation = UIApplication.sharedApplication.statusBarOrientation;);
    }
    
    switch (currentOrientation) {
        ///【界面】竖屏方向
        case UIInterfaceOrientationPortraitUpsideDown:{
            NSLog(@"检测屏幕方向：设备竖直向下，Home 按钮在上方");
        }break;
        case UIInterfaceOrientationPortrait:{
            NSLog(@"检测屏幕方向：设备竖直向上，Home 按钮在下方");
        }break;
        ///【界面】横屏方向
        case UIInterfaceOrientationLandscapeLeft:{
            NSLog(@"检测屏幕方向：设备水平，Home 按钮在左侧");
        }break;
        case UIInterfaceOrientationLandscapeRight:{
            NSLog(@"检测屏幕方向：设备水平，Home 按钮在右侧");
        }default:
            break;
    }
}
#pragma mark —— lazyLoad
-(BaseButton *)switchBtn1{
    if(!_switchBtn1){
        @jobs_weakify(self)
        _switchBtn1 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                                    titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:nil
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:JobsInternationalization(@"点击")
                                                          subTitle:JobsInternationalization(@"切换到竖屏")
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
                                                 cornerRadiusValue:JobsWidth(8)
                                                   roundingCorners:UIRectCornerAllCorners
                                              roundingCornersRadii:CGSizeZero
                                                    layerBorderCor:nil
                                                       borderWidth:JobsWidth(0)
                                                     primaryAction:nil
                                        longPressGestureEventBlock:^(BaseButton *_Nullable weakSelf,
                                                                     id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
        }
                                                   clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
//            NSLog(@"按钮点击：设备竖直向上，Home 按钮在下方");
//            UIDevice.currentDevice.jobsKVC(@"orientation",@(UIInterfaceOrientationPortrait));/// 设备竖直向上，Home 按钮在下方
            
            [self hx_rotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown];
            return nil;
        }];
        [self.view addSubview:_switchBtn1];
//        [_switchBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(100)));
//            make.center.equalTo(self.view);
//        }];
//        [_switchBtn1 makeBtnLabelByShowingType:UILabelShowingType_03];
    }return _switchBtn1;
}

-(BaseButton *)switchBtn2{
    if(!_switchBtn2){
        @jobs_weakify(self)
        _switchBtn2 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                                    titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:nil
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:JobsInternationalization(@"点击")
                                                          subTitle:JobsInternationalization(@"切换到竖屏")
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
                                                 cornerRadiusValue:JobsWidth(8)
                                                   roundingCorners:UIRectCornerAllCorners
                                              roundingCornersRadii:CGSizeZero
                                                    layerBorderCor:nil
                                                       borderWidth:JobsWidth(0)
                                                     primaryAction:nil
                                        longPressGestureEventBlock:^(BaseButton *_Nullable weakSelf,
                                                                     id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
        }
                                                   clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
//            NSLog(@"按钮点击：设备竖直向下，Home 按钮在上方");
//            UIDevice.currentDevice.jobsKVC(@"orientation",@(UIInterfaceOrientationPortraitUpsideDown));/// 设备竖直向下，Home 按钮在上方
            [self hx_rotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown];
            return nil;
        }];
        [self.view addSubview:_switchBtn2];
//        [_switchBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(100)));
//            make.center.equalTo(self.view);
//        }];
//        [_switchBtn2 makeBtnLabelByShowingType:UILabelShowingType_03];
    }return _switchBtn2;
}

-(BaseButton *)switchBtn3{
    if(!_switchBtn3){
        @jobs_weakify(self)
        _switchBtn3 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                                    titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:nil
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:JobsInternationalization(@"点击")
                                                          subTitle:JobsInternationalization(@"切换到横屏")
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
                                                 cornerRadiusValue:JobsWidth(8)
                                                   roundingCorners:UIRectCornerAllCorners
                                              roundingCornersRadii:CGSizeZero
                                                    layerBorderCor:nil
                                                       borderWidth:JobsWidth(0)
                                                     primaryAction:nil
                                        longPressGestureEventBlock:^(BaseButton *_Nullable weakSelf,
                                                                     id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
        }
                                                   clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
//            NSLog(@"按钮点击：设备水平，Home 按钮在右侧");
//            UIDevice.currentDevice.jobsKVC(@"orientation",@(UIInterfaceOrientationLandscapeRight));/// 设备水平，Home 按钮在右侧
            NSLog(@"按钮点击：强制旋转到横屏");
            self.currentVCInterfaceOrientationMask = UIInterfaceOrientationMaskAllButUpsideDown;
            [self hx_rotateToInterfaceOrientation:UIInterfaceOrientationLandscapeRight];
            return nil;
        }];
        [self.view addSubview:_switchBtn3];
//        [_switchBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(100)));
//            make.center.equalTo(self.view);
//        }];
//        [_switchBtn3 makeBtnLabelByShowingType:UILabelShowingType_03];
    }return _switchBtn3;
}

-(BaseButton *)switchBtn4{
    if(!_switchBtn4){
        @jobs_weakify(self)
        _switchBtn4 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                                    titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:nil
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:JobsInternationalization(@"点击")
                                                          subTitle:JobsInternationalization(@"切换到横屏 no")
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
                                                 cornerRadiusValue:JobsWidth(8)
                                                   roundingCorners:UIRectCornerAllCorners
                                              roundingCornersRadii:CGSizeZero
                                                    layerBorderCor:nil
                                                       borderWidth:JobsWidth(0)
                                                     primaryAction:nil
                                        longPressGestureEventBlock:^(BaseButton *_Nullable weakSelf,
                                                                     id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
        }
                                                   clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
//            NSLog(@"按钮点击：设备水平，Home 按钮在左侧");
//            UIDevice.currentDevice.jobsKVC(@"orientation",@(UIInterfaceOrientationLandscapeLeft));/// 设备水平，Home 按钮在左侧
            self.currentVCInterfaceOrientationMask = UIInterfaceOrientationMaskAllButUpsideDown;
            [self hx_rotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
            return nil;
        }];
        [self.view addSubview:_switchBtn4];
//        [_switchBtn4 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(100)));
//            make.center.equalTo(self.view);
//        }];
//        [_switchBtn4 makeBtnLabelByShowingType:UILabelShowingType_03];
    }return _switchBtn4;
}

-(BaseButton *)switchBtn5{
    if(!_switchBtn5){
        @jobs_weakify(self)
        _switchBtn5 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                                    titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:nil
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:JobsInternationalization(@"点击")
                                                          subTitle:JobsInternationalization(@"锁定横屏")
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
                                                 cornerRadiusValue:JobsWidth(8)
                                                   roundingCorners:UIRectCornerAllCorners
                                              roundingCornersRadii:CGSizeZero
                                                    layerBorderCor:nil
                                                       borderWidth:JobsWidth(0)
                                                     primaryAction:nil
                                        longPressGestureEventBlock:^(BaseButton *_Nullable weakSelf,
                                                                     id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
        }
                                                   clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            NSLog(@"锁定横屏 ？？");
            self.currentVCInterfaceOrientationMask = UIInterfaceOrientationMaskLandscape;
            [self hx_setNeedsUpdateOfSupportedInterfaceOrientations];
            return nil;
        }];
        [self.view addSubview:_switchBtn5];
//        [_switchBtn5 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(100)));
//            make.center.equalTo(self.view);
//        }];
//        [_switchBtn5 makeBtnLabelByShowingType:UILabelShowingType_03];
    }return _switchBtn5;
}

-(BaseButton *)switchBtn6{
    if(!_switchBtn6){
        @jobs_weakify(self)
        _switchBtn6 = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                        background:nil
                                                    titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                     textAlignment:NSTextAlignmentCenter
                                                  subTextAlignment:NSTextAlignmentCenter
                                                       normalImage:nil
                                                    highlightImage:nil
                                                   attributedTitle:nil
                                           selectedAttributedTitle:nil
                                                attributedSubtitle:nil
                                                             title:JobsInternationalization(@"点击")
                                                          subTitle:JobsInternationalization(@"解除锁定")
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
                                                 cornerRadiusValue:JobsWidth(8)
                                                   roundingCorners:UIRectCornerAllCorners
                                              roundingCornersRadii:CGSizeZero
                                                    layerBorderCor:nil
                                                       borderWidth:JobsWidth(0)
                                                     primaryAction:nil
                                        longPressGestureEventBlock:^(BaseButton *_Nullable weakSelf,
                                                                     id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
        }
                                                   clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            NSLog(@"解除锁定 ？？");
            self.currentVCInterfaceOrientationMask = UIInterfaceOrientationMaskAllButUpsideDown;
            [self hx_setNeedsUpdateOfSupportedInterfaceOrientations];
            return nil;
        }];
        [self.view addSubview:_switchBtn6];
//        [_switchBtn6 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(JobsWidth(80), JobsWidth(100)));
//            make.center.equalTo(self.view);
//        }];
//        [_switchBtn6 makeBtnLabelByShowingType:UILabelShowingType_03];
    }return _switchBtn6;
}

-(NSMutableArray<BaseButton *> *)btnMutArr{
    if(!_btnMutArr){
        _btnMutArr = NSMutableArray.array;
        [_btnMutArr addObject:self.switchBtn1];
        [_btnMutArr addObject:self.switchBtn2];
        [_btnMutArr addObject:self.switchBtn3];
        [_btnMutArr addObject:self.switchBtn4];
        [_btnMutArr addObject:self.switchBtn5];
        [_btnMutArr addObject:self.switchBtn6];
    }return _btnMutArr;
}

@end
