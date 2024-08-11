//
//  JobsTabbarVC.m
//  TabbarItemLottie
//
//  Created by 叶晓倩 on 2017/9/29.
//  Copyright © 2017年 xa. All rights reserved.
//

#import "JobsTabBarVC.h"

@interface JobsTabBarVC (){
    BOOL A;
}
/// UI
@property(nonatomic,strong,readwrite)JobsTabBar *myTabBar;/// myTabBar.humpOffsetY 凸起的高度自定义，默认值30  offsetHeight
/// Data
@property(nonatomic,assign)BOOL isOpenPPBadge;
@property(nonatomic,assign)NSInteger subViewControllerCount;
@property(nonatomic,strong)NSMutableArray <UIView *>*UITabBarButtonMutArr;/// UITabBarButton 是内部类 直接获取不到，需要间接获取
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*pullListAutoSizeViewMutArr;

@end

@implementation JobsTabBarVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}
#pragma mark —— 初始化方法
static JobsTabBarVC *JobsTabBarVCInstance = nil;
static dispatch_once_t JobsTabBarVCOnceToken;
+ (instancetype)sharedManager {
    dispatch_once(&JobsTabBarVCOnceToken, ^{
        JobsTabBarVCInstance = [[super allocWithZone:NULL] init];
    });return JobsTabBarVCInstance;
}
///【单例模式】使用外界自定义的JobsTabBar
+(instancetype)sharedInstanceWithJobsTabBar:(JobsTabBar *)tabBar{
    dispatch_once(&JobsTabBarVCOnceToken, ^{
        JobsTabBarVCInstance = [[super allocWithZone:NULL] init];
        JobsTabBarVCInstance.myTabBar = tabBar;
    });return JobsTabBarVCInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedManager];
}
/// 防止外部调用copy
- (instancetype)copyWithZone:(NSZone *)zone {
    return self;
}
/// 防止外部调用mutableCopy
- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}
/// 一般的初始化模式
-(instancetype)initWithJobsTabBar:(JobsTabBar *)tabBar{
    if (self = [super init]) {
        self.myTabBar = tabBar;
    }return self;
}
#pragma mark —— 单例的销毁
+ (void)destroyInstance {
    JobsTabBarVCInstance = nil;
    JobsTabBarVCOnceToken = 0;
}
#pragma mark —— ViewController的生命周期
-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    A = YES;
    self.delegate = self;
    self.isOpenScrollTabbar = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 手势左右滑动以切换TabbarControl挂载的ViewController
    if (self.isOpenScrollTabbar) {
        [self openPan];
        self.view.panGR.enabled = self.isOpenScrollTabbar;
    }
    self.myTabBar.alpha = 1;
//    self.suspendBtn.alpha = 1;
//    UIDeviceOrientation f =  UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
//    NSLog(@"");
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.isHiddenNavigationBar = YES;
    @jobs_weakify(self)
    static dispatch_once_t JobsTabbarVC_viewWillAppear_onceToken;
    dispatch_once(&JobsTabbarVC_viewWillAppear_onceToken, ^{
        @jobs_strongify(self)
        [self UISetting];//最高只能在viewWillAppear，在viewDidLoad不出效果 self.tabBar.subviews为空
//        [self 添加长按手势];
    });
//    UIDeviceOrientation f =  UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
//    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    UIDeviceOrientation f =  UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
//    NSLog(@"");
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}
static dispatch_once_t onceToken;
-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    dispatch_once(&onceToken, ^{
        self.myTabBar.height += self.myTabBar.customTabBarOffsetHeight;
        self.myTabBar.y = self.view.height - self.myTabBar.height;
    });

//    [self ppBadge:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— 在 UITabBarController 中适配横屏在 UITabBarController 中适配横屏
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
/// 决定当前界面是否开启自动转屏，如果返回NO，后面两个方法也不会被调用，只是会支持默认的方向
- (BOOL)shouldAutorotate {
    return self.selectedViewController.shouldAutorotate;
}
#pragma clang diagnostic pop
/// 当前控制器支持的屏幕旋转方向（在具体的控制器子类进行覆写）
/// iPad设备上，默认返回值UIInterfaceOrientationMaskAllButUpSideDwon
/// iPhone设备上，默认返回值是UIInterfaceOrientationMaskAll
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.selectedViewController.supportedInterfaceOrientations;
}
/// 设置进入界面默认支持的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [super preferredInterfaceOrientationForPresentation];
}
#pragma mark —— 一些公有方法
/// 关闭手势
-(void)closePan{
    self.view.panGR.enabled = NO;
}
/// 打开手势
-(void)openPan{
    self.view.numberOfTouchesRequired = 1;
    self.view.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
    self.view.minimumPressDuration = 0.1;
    self.view.numberOfTouchesRequired = 1;
    self.view.allowableMovement = 1;
    self.view.userInteractionEnabled = YES;
    self.view.target = self;
    @jobs_weakify(self)
    self.view.panGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target,
                                                                            UIPanGestureRecognizer *_Nullable pan) {
        @jobs_strongify(self)
        if (self.transitionCoordinator) return nil;
        if (pan.state == UIGestureRecognizerStateBegan ||
            pan.state == UIGestureRecognizerStateChanged){
            [self beginInteractiveTransitionIfPossible:pan];
        }return nil;
    }];
    self.view.panGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
}
/// 开启/关闭 PPBadgeView的效果,至少在viewDidLayoutSubviews后有效
-(void)ppBadge:(BOOL)open{
    self.isOpenPPBadge = open;
    if (open) {
        for (UITabBarItem *item in self.tabBar.items) {
            if ([item.title isEqualToString:JobsInternationalization(@"首页")]) {
                [item pp_addBadgeWithText:@"919+"];
#pragma mark —— 动画
                [item.badgeView animationAlert];//图片从小放大
                [item.badgeView shakerAnimationWithDuration:2 height:20];//重力弹跳动画效果
    //            [UIView 视图上下一直来回跳动的动画:item.badgeView];
            }
        }
    }
}
#pragma mark —— 一些私有方法
/// 需要强制跳转登录的index。点击和手势滑动都需要共同调用
-(BOOL)forcedLoginIndex:(NSUInteger)index{
    for (JobsTabBarItemConfig *tabBarItemConfig in AppDelegate.tabBarItemConfigMutArr) {
        if(tabBarItemConfig.isNeedCheckLogin){
            [self forcedLogin];
            return YES;
        }
    }return NO;
}
/// 判别是否有Lottie
/// @param index index
-(BOOL)judgeLottieWithIndex:(NSInteger)index{
    JobsTabBarItemConfig *config = nil;
    if(AppDelegate.tabBarItemConfigMutArr.count){
        config = (JobsTabBarItemConfig *)AppDelegate.tabBarItemConfigMutArr[index];
    }return ![NSString isNullString:config.lottieName];
}
/// ❤️关键方法❤️
-(void)UISetting{
    for (int i = 0; i < AppDelegate.tabBarItemConfigMutArr.count; i++) {
        JobsTabBarItemConfig *config = (JobsTabBarItemConfig *)AppDelegate.tabBarItemConfigMutArr[i];
//        self.tabBarItem.title = config.title;
//        self.tabBarItem.image = config.imageUnselected;
        // For Test
//        if ([self judgeLottieWithIndex:i]) {
//            [self addLottieImage:config.lottieName];// 有Lottie动画名，则优先创建Lottie动画
//        }
        UIViewController *viewController = AppDelegate.viewCtrlByTabBarCtrlConfigMutArr[i];
        viewController.title = config.title;
        viewController.tabBarItem = [JobsTabBarItem.alloc initWithConfig:config];
        
        if (config.humpOffsetY != 0) {
            //一般的图片
            /// 修改图片偏移量，上下，左右必须为相反数，否则图片会被压缩
            viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(-config.humpOffsetY,
                                                                     0,
                                                                     -config.humpOffsetY / 2,
                                                                     0);
            /// 修改文字偏移量
            viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 0);/// titlePositionAdjustment是图文间距
        }

        /// 用导航控制器包裹每一个控制器
//        if (![viewController isKindOfClass:UINavigationController.class]) {/// 防止UIImagePickerController崩
//            BaseNavigationVC *nav = [BaseNavigationVC.alloc initWithRootViewController:viewController];
//            nav.title = config.title;
//            [AppDelegate.makeUIViewControllerMutArr replaceObjectAtIndex:i withObject:nav];/// 替换元素，每个VC加Navigation
//        }
    }
    /// ❤️这句话走了以后 才会有self.tabBar
    self.viewControllers = AppDelegate.viewCtrlByTabBarCtrlConfigMutArr;
    for (UIView *subView in self.tabBar.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [subView animationAlert];/// 图片从小放大
            [self.UITabBarButtonMutArr addObject:subView];
        }
    }
    /// 初始显示【具备Lottie播放条件才进行相关初始化操作】
    extern NSUInteger DefaultIndex;
    if (DefaultIndex < self.viewControllers.count) {
        self.selectedIndex = DefaultIndex; /// 初始显示的视图控制器
        if ([self judgeLottieWithIndex:self.selectedIndex]) {
            [AppDelegate.viewCtrlByTabBarCtrlConfigMutArr[DefaultIndex] lottieImagePlay];
            [self.tabBar animationLottieImage:DefaultIndex];
        }
    }
}
/// 手势左右滑动以切换TabbarControl挂载的ViewController
-(void)beginInteractiveTransitionIfPossible:(UIPanGestureRecognizer *)sender{
    CGPoint translation = [sender translationInView:self.view];
    NSLog(@"FromIndex = %lu",(unsigned long)self.selectedIndex);
    /// ❤️需要被跳开的item的逻辑❤️
    for (JobsTabBarItemConfig *tabBarItemConfig in AppDelegate.tabBarItemConfigMutArr) {
        if(tabBarItemConfig.isNeedjump){
            NSUInteger d = [AppDelegate.tabBarItemConfigMutArr indexOfObject:tabBarItemConfig];
            if (d <= self.tabBar.items.count - 1) {
                {// 手势从左到右 和 手势从右到左 的两种触发方式
                    // 手势从左到右
                    if (self.selectedIndex == d - 1) {
                        if (translation.x > 0.f && self.selectedIndex > 0) {
                            self.selectedIndex --;
                        }else{
                            if (self.isJumpToNextVC) {
                                self.selectedIndex += 2;
                            }
                            // 向外回调需要做的事
                            if (self.returnBoolByNSUIntegerBlock) A = self.returnBoolByNSUIntegerBlock(d);
                        }return;
                    }
                    // 手势从右到左
                    if (self.selectedIndex == d + 1) {
                        if (translation.x < 0.f && self.selectedIndex + 1 < self.viewControllers.count) {
                            self.selectedIndex ++;
                        }else{
                            if (self.isJumpToNextVC) {
                                self.selectedIndex -= 2;
                            }
                            // 向外回调需要做的事
                            if (self.returnBoolByNSUIntegerBlock) A = self.returnBoolByNSUIntegerBlock(d);
                        }return;
                    }
                }
            }

        }
    }
    if (translation.x > 0.f && self.selectedIndex > 0) {
        self.selectedIndex --;
    }else if (translation.x < 0.f && self.selectedIndex + 1 < self.viewControllers.count) {
        self.selectedIndex ++;
    }else{}
    [self forcedLoginIndex:self.selectedIndex];
    NSLog(@"ToIndex = %lu",(unsigned long)self.selectedIndex);
}
#pragma mark —— TabBarItem的相关手势
-(void)添加长按手势{
    for (UIView *subView in self.UITabBarButtonMutArr) {
        subView.tag = [self.UITabBarButtonMutArr indexOfObject:subView];
        
        subView.numberOfTouchesRequired = 1;
        subView.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
        subView.minimumPressDuration = 0.1;
        subView.numberOfTouchesRequired = 1;
        subView.allowableMovement = 1;
        subView.userInteractionEnabled = YES;
        subView.target = self;
        subView.longPressGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                                    UILongPressGestureRecognizer *_Nullable longPressGR) {
            if(self.gestureRecognizerBlock) self.gestureRecognizerBlock(longPressGR);
            switch (longPressGR.state) {
                case UIGestureRecognizerStatePossible:{
                    NSLog(@"没有触摸事件发生，所有手势识别的默认状态");
                }break;
                case UIGestureRecognizerStateBegan:{
                    if (self.isFeedbackGenerator) {
                        NSObject.feedbackGenerator();/// 震动反馈
                    }
                    /// 长按手势出菜单（高仿 Telegram）
                    [JobsPullListAutoSizeView initWithTargetView:self.UITabBarButtonMutArr[longPressGR.view.tag]
                                                      dataMutArr:self.pullListAutoSizeViewMutArr];
                    NSLog(@"一个手势已经开始  但尚未改变或者完成时");
                }break;
                case UIGestureRecognizerStateChanged:{
                    NSLog(@"手势状态改变");
                }break;
                case UIGestureRecognizerStateEnded:{// = UIGestureRecognizerStateRecognized
                    NSLog(@"手势完成");
                }break;
                case UIGestureRecognizerStateCancelled:{
                    NSLog(@"手势取消，恢复至Possible状态");
                }break;
                case UIGestureRecognizerStateFailed:{
                    NSLog(@"手势失败，恢复至Possible状态");
                }break;
                default:
                    break;
            }return nil;
        }];
        subView.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
    }
}
#pragma mark —— UITabBarDelegate
/// 监听TabBarItem点击事件
- (void)tabBar:(UITabBar *)tabBar
 didSelectItem:(UITabBarItem *)item {
    if ([tabBar.items containsObject:item]) {
        NSUInteger index = [self.tabBar.items indexOfObject:item];
        NSLog(@"当前点击：%ld",(long)index);
        for (JobsTabBarItemConfig *tabBarItemConfig in AppDelegate.tabBarItemConfigMutArr) {
            if(tabBarItemConfig.isNeedjump){
                if (![self forcedLoginIndex:index]) {
                    /// 不需要进行强制登录的时候，才重新赋值刷新self.selectedIndex
                    self.selectedIndex = index;
                }
            }
        }
        // Lottie 动画
        if ([self judgeLottieWithIndex:self.selectedIndex]) [self.tabBar animationLottieImage:(int)index];
        // 震动反馈
        if (self.isFeedbackGenerator) NSObject.feedbackGenerator();
        // 点击声音
        if (self.isPlaySound) [self playSoundWithFileName:@"Sound.wav"];
        // 重力弹跳动画效果
        if (self.isShakerAnimation) [item.badgeView shakerAnimationWithDuration:2 height:20];
        // 点击增加标数
        if (self.isOpenPPBadge) [item pp_increase];
        // 图片从小放大
        if (self.isAnimationAlert) [self.UITabBarButtonMutArr[index] animationAlert];
    }
}
#pragma mark - UITabBarControllerDelegate
/**
 【点击TabBarItem进行切换】return YES可以切换 | return NO 不可切换
 
 【调用先后次序】
    ①- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item；
 
    ②- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController；
 
 【📢注意】在①中，如果对self.selectedIndex进行修改，那么在②中，设置返回值为NO无效
 */
- (BOOL)tabBarController:(UITabBarController *)tabBarController
shouldSelectViewController:(UIViewController *)viewController {
    NSInteger index = [AppDelegate.viewCtrlByTabBarCtrlConfigMutArr indexOfObject:viewController];
    if ([viewController isKindOfClass:UIViewController.class] &&
        [self judgeLottieWithIndex:index]) {
        [viewController lottieImagePlay];
    }
    
    if (self.returnBoolByNSUIntegerBlock) A = self.returnBoolByNSUIntegerBlock(index);
    return [self forcedLoginIndex:index] ? (A && self.isLogin) : A;
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
           animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                             toViewController:(UIViewController *)toVC{
    // 打开注释 可以屏蔽点击item时的动画效果
    if (self.view.panGR.state == UIGestureRecognizerStateBegan ||
        self.view.panGR.state == UIGestureRecognizerStateChanged) {
        NSArray *viewControllers = tabBarController.viewControllers;
        return [TransitionAnimation.alloc initWithTargetEdge:
                [viewControllers indexOfObject:toVC] > [viewControllers indexOfObject:fromVC] ? UIRectEdgeLeft : UIRectEdgeRight];
    }else return nil;
}

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController{
    NSLog(@"");
}

- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if (self.view.panGR.state == UIGestureRecognizerStateBegan ||
        self.view.panGR.state == UIGestureRecognizerStateChanged) {
        return [TransitionController.alloc initWithGestureRecognizer:self.view.panGR];
    }else return nil;
}
#pragma mark —— lazyLoad
@synthesize viewModel = _viewModel;
-(UIViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = UIViewModel.new;
        _viewModel.bgCor = JobsWhiteColor;
//        _viewModel.bgImage = isiPhoneX_series() ? JobsIMG(@"底部导航栏背景(刘海屏)") : JobsIMG(@"底部导航栏背景(非刘海屏)");
        _viewModel.isTranslucent = NO;
        _viewModel.offsetHeight = JobsWidth(5);
    }return _viewModel;
}
@synthesize myTabBar = _myTabBar;
-(void)setMyTabBar:(JobsTabBar *)myTabBar{
    _myTabBar = myTabBar;
}

-(JobsTabBar *)myTabBar{
    if (!_myTabBar) {
        _myTabBar = JobsTabBar.new;
        _myTabBar.alignmentType = ImageTopTitleBottom;
        [_myTabBar richElementsInViewWithModel:self.viewModel];
        self.jobsKVC(@"tabBar",_myTabBar);/// ❤️KVC 进行替换❤️
    }return _myTabBar;
}

-(NSMutableArray<UIView *> *)UITabBarButtonMutArr{
    if (!_UITabBarButtonMutArr) {
        _UITabBarButtonMutArr = NSMutableArray.array;
    }return _UITabBarButtonMutArr;
}

-(NSMutableArray<UIViewModel *> *)pullListAutoSizeViewMutArr{
    if (!_pullListAutoSizeViewMutArr) {
        _pullListAutoSizeViewMutArr = NSMutableArray.array;
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = JobsIMG(JobsInternationalization(@""));
            viewModel.textModel.text = JobsInternationalization(@"111");
            [_pullListAutoSizeViewMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = JobsIMG(JobsInternationalization(@""));
            viewModel.textModel.text = JobsInternationalization(@"222");
            [_pullListAutoSizeViewMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.image = JobsIMG(JobsInternationalization(@""));
            viewModel.textModel.text = JobsInternationalization(@"333");
            [_pullListAutoSizeViewMutArr addObject:viewModel];
        }
        
    }return _pullListAutoSizeViewMutArr;
}

@end
