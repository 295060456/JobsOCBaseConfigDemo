//
//  JobsGameTabbarVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/8/24.
//

#import "JobsGameTabbarVC.h"

@interface JobsGameTabbarVC ()

@property (nonatomic, strong) UIView *tabBarContainerView;

@end

@implementation JobsGameTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set up the tab bar container view
    self.tabBarContainerView = [[UIView alloc] init];
    self.tabBarContainerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tabBarContainerView];
    
    // Move the tab bar into the container view
    [self.tabBar removeFromSuperview];
    [self.tabBarContainerView addSubview:self.tabBar];
    
    // Set up constraints for the container view
    self.tabBarContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.tabBarContainerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50], // Adjust leading margin
        [self.tabBarContainerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-50], // Adjust trailing margin
        [self.tabBarContainerView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
        [self.tabBarContainerView.heightAnchor constraintEqualToAnchor:self.tabBar.heightAnchor]
    ]];
    
//    // Set up the view controllers
//    UIViewController *vc1 = [[UIViewController alloc] init];
//    vc1.view.backgroundColor = [UIColor redColor];
//    vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:nil tag:0];
//    
//    UIViewController *vc2 = [[UIViewController alloc] init];
//    vc2.view.backgroundColor = [UIColor greenColor];
//    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Bank" image:nil tag:1];
//    
//    UIViewController *vc3 = [[UIViewController alloc] init];
//    vc3.view.backgroundColor = [UIColor blueColor];
//    vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Incentive" image:nil tag:2];
//    
//    UIViewController *vc4 = [[UIViewController alloc] init];
//    vc4.view.backgroundColor = [UIColor yellowColor];
//    vc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Invite" image:nil tag:3];
//    
//    UIViewController *vc5 = [[UIViewController alloc] init];
//    vc5.view.backgroundColor = [UIColor purpleColor];
//    vc5.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Contact" image:nil tag:4];
//    
//    self.viewControllers = @[vc1, vc2, vc3, vc4, vc5];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // Adjust tabBar frame within the container view
    self.tabBar.frame = self.tabBarContainerView.bounds;
}
#pragma mark —— 在 UITabBarController 中适配横屏
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

@end
