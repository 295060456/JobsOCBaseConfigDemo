//
//  AppDelegate+UIApplicationDelegate.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "AppDelegate+UIApplicationDelegate.h"
//#import "AppDelegate+UISceneSessionLifeCycle.h"

@implementation AppDelegate (UIApplicationDelegate)
#pragma mark —— UIApplicationDelegate
/// 一进入App就横屏
//- (UIInterfaceOrientationMask)application:(UIApplication *)application
//  supportedInterfaceOrientationsForWindow:(UIWindow *)window {
//    JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
//    JobsAppTool.currentDeviceOrientation = UIDeviceOrientationLandscapeLeft | UIDeviceOrientationLandscapeRight;
//    JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskLandscape;
//    return UIInterfaceOrientationMaskLandscape;
//}

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [self localNotifications];
//    [self launchFunc2];
//    [AppDelegate launchFunc1];

//    @jobs_weakify(self)
//    [JobsAppTools.sharedManager appDelegateWindowBlock:^(UIWindow * _Nullable data) {
//        @jobs_strongify(self)
//        self.window = data;
//        [AppDelegate launchFunc1];
//    } sceneDelegateWindowBlock:nil];
    
    {
        self.window = JobsAppTools.sharedManager.makeAppDelegateWindow;
        self.window.rootViewController = RootViewController;
        [AppDelegate.tabBarVC ppBadge:YES];
        [self.window makeKeyAndVisible];
    }
    
//    {
//        self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
//        LZTabBarController *tab = [LZTabBarController createTabBarController:^LZTabBarConfig *(LZTabBarConfig *config) {
//            config.viewControllers = @[ViewController_1.new,
//                                       ViewController_2.new,
//                                       ViewController_3.new,
//                                       ViewController_4.new];
//            config.normalImages = @[@"tabbbar_home_normal",
//                                      @"tabbbar_weights_normal",
//                                      @"tabbbar_pay_normal",
//                                      @"tabbbar_service_normal"];
//            config.selectedImages = @[@"tabbbar_home_seleteds",
//                                      @"tabbbar_weights_seleteds",
//                                      @"tabbbar_pay_seleteds",
//                                      @"tabbbar_service_seleteds"];
//            config.titles = @[@"微信",@"通讯录",@"发现",@"我"];
//            config.isNavigation = NO;
//            return config;
//        }];
//        // 为了能够使用hidesBottomBarWhenPushed, 不直接把tabBar设置为window的跟视图, 而是设置为导航的rootvc, 然后把导航设置为window的跟视图
//        // 这样, 在子视图上就不用再添加导航了, 即设置: config.isNavigation = NO;
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tab];
//        
//        nav.hidesBottomBarWhenPushed = YES;
//        self.window.rootViewController = nav;
//        self.window.backgroundColor = UIColor.cyanColor;
//        [self.window makeKeyAndVisible];
//        NSLog(@"qwer");
//    }
    
//    {
//        self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
//        self.window.rootViewController = ViewController_2.new;
//        [self.window makeKeyAndVisible];
//        self.window.backgroundColor = UIColor.cyanColor;
//        NSLog(@"qwer");
//    }
    
    return YES;
}
/// 系统版本低于iOS13.0的设备
-(void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"---applicationDidEnterBackground----");//进入后台
    JobsPostNotification(JobsEnterBackgroundStopPlayer, nil);
}
/// 系统版本低于iOS13.0的设备
-(void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"---applicationDidBecomeActive----");//进入前台
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error {
    NSLog(@"Fail to register for remote notifications. error:%@",error);
}

@end
