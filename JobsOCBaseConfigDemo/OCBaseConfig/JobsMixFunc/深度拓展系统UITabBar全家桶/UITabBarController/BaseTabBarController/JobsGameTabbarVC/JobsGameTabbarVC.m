//
//  JobsGameTabbarVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/8/24.
//

#import "JobsGameTabbarVC.h"

@interface JobsGameTabbarVC (){
    BOOL A;
}
/// UI
@property(nonatomic,strong,readwrite)JobsTabBar *myTabBar;/// myTabBar.humpOffsetY 凸起的高度自定义，默认值30  offsetHeight
/// Data
@property(nonatomic,assign)BOOL isOpenPPBadge;
@property(nonatomic,assign)NSInteger subViewControllerCount;
@property(nonatomic,strong)NSMutableArray <UIView *>*UITabBarButtonMutArr;/// UITabBarButton 是内部类 直接获取不到，需要间接获取
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*pullListAutoSizeViewMutArr;

@property (nonatomic, strong) UIView *tabBarContainerView;

@end

@implementation JobsGameTabbarVC
UITabbarConfigProtocol_synthesize
//static dispatch_once_t onceToken;
//- (void)dealloc{
//    NSLog(@"%@",JobsLocalFunc);
//    [NSNotificationCenter.defaultCenter removeObserver:self];
//    onceToken = 0;
//}
//#pragma mark —— 初始化方法
//static JobsGameTabbarVC *static_tabbarVC = nil;
/////【单例模式】使用内置默认的JobsTabBar
//+(instancetype)sharedInstance{
//    @synchronized(self){
//        if (!static_tabbarVC) {
//            static_tabbarVC = [super allocWithZone:NULL].init;
//        }
//    }return static_tabbarVC;
//}
/////【单例模式】使用外界自定义的JobsTabBar
//+(instancetype)sharedInstanceWithJobsTabBar:(JobsTabBar *)tabBar{
//    @synchronized(self){
//        if (!static_tabbarVC) {
//            static_tabbarVC = [super allocWithZone:NULL].init;
//            static_tabbarVC.myTabBar = tabBar;
//        }
//    }return static_tabbarVC;
//}
///// 在单例实现中，如果覆盖了 allocWithZone: 应该确保初始化方法也使用这个覆盖的方法进行实例化
//+ (instancetype)allocWithZone:(struct _NSZone *)zone {
//    @synchronized(self) {
//        if (!static_tabbarVC) {
//            static_tabbarVC = [super allocWithZone:zone];
//            return static_tabbarVC;
//        }
//    }return nil;
//}
//
//- (instancetype)copyWithZone:(NSZone *)zone {
//    return self;
//}
//
//- (instancetype)mutableCopyWithZone:(NSZone *)zone {
//    return self;
//}
///// 一般的初始化模式
//-(instancetype)initWithJobsTabBar:(JobsTabBar *)tabBar{
//    if (self = [super init]) {
//        self.myTabBar = tabBar;
//    }return self;
//}
//#pragma mark —— 单例的销毁
//+ (void)destroyInstance{
//    @synchronized(self) {
//        static_tabbarVC = nil;
//    }
//}
#pragma mark —— ViewController的生命周期
-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTabBar.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.isHiddenNavigationBar = YES;
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}
#pragma mark —— 在 UITabBarController 中适配横屏在 UITabBarController 中适配横屏
/// 决定当前界面是否开启自动转屏，如果返回NO，后面两个方法也不会被调用，只是会支持默认的方向
- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}
/// 当前控制器支持的屏幕旋转方向（在具体的控制器子类进行覆写）
/// iPad设备上，默认返回值UIInterfaceOrientationMaskAllButUpSideDwon
/// iPhone设备上，默认返回值是UIInterfaceOrientationMaskAll
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}
/// 设置进入界面默认支持的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [super preferredInterfaceOrientationForPresentation];
}
#pragma mark —— 一些公有方法

#pragma mark —— TabBarItem的相关手势

#pragma mark —— UITabBarDelegate
///// 监听TabBarItem点击事件
//- (void)tabBar:(UITabBar *)tabBar
// didSelectItem:(UITabBarItem *)item {
//
//}
//#pragma mark - UITabBarControllerDelegate
///**
// 【点击TabBarItem进行切换】return YES可以切换 | return NO 不可切换
// 
// 【调用先后次序】
//    ①- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item；
// 
//    ②- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController；
// 
// 【📢注意】在①中，如果对self.selectedIndex进行修改，那么在②中，设置返回值为NO无效
// */
//- (BOOL)tabBarController:(UITabBarController *)tabBarController
//shouldSelectViewController:(UIViewController *)viewController {
//
//    return YES;
//}
//
//- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
//           animationControllerForTransitionFromViewController:(UIViewController *)fromVC
//                                             toViewController:(UIViewController *)toVC{
//    // 打开注释 可以屏蔽点击item时的动画效果
////    if (self.panGestureRecognizer.state == UIGestureRecognizerStateBegan || self.panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
//        NSArray *viewControllers = tabBarController.viewControllers;
//        return [TransitionAnimation.alloc initWithTargetEdge: [viewControllers indexOfObject:toVC] > [viewControllers indexOfObject:fromVC] ? UIRectEdgeLeft : UIRectEdgeRight];
////    }
////    else{
////        return nil;
////    }
//}
//
//- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
//                     interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
//    if (self.view.panGR.state == UIGestureRecognizerStateBegan ||
//        self.view.panGR.state == UIGestureRecognizerStateChanged) {
//        return [TransitionController.alloc initWithGestureRecognizer:self.view.panGR];
//    }else {
//        return nil;
//    }
//}
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
        [_myTabBar richElementsInViewWithModel:self.viewModel];
        self.jobsKVC(@"tabBar",_myTabBar);/// KVC 进行替换
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
