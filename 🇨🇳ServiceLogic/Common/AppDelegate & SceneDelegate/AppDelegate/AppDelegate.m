//
//  AppDelegate.m
//  Casino
//
//  Created by Jobs on 2021/11/16.
//

#import "AppDelegate.h"
#import "AppDelegate+Extra.h"
#import "AppDelegate+Func.h"
#import "AppDelegate+UIApplicationDelegate.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

AppDelegate *appDelegate;/// 声明，否则 extern AppDelegate *appDelegate;会崩溃
@interface AppDelegate ()

@end

@implementation AppDelegate

-(instancetype)init{
    if (self = [super init]) {
        appDelegate = self;
        [self simulateUserData];
    }return self;
}
#pragma mark —— 一些私有方法
/// 模拟用户数据
-(void)simulateUserData{
    JobsUserModel *userModel = JobsUserModel.new;
    userModel.userHeaderIMG = JobsIMG(@"用户默认头像");
    userModel.userName = @"张三丰";
    userModel.phone = @"134****0000";
    [self saveUserInfo:userModel];
    
    id f = self.readUserInfo;
    NSLog(@"");
}
#pragma mark —— 一些公有方法
+(NSMutableArray <UIButton *>*)makeTabBarItems{
    NSMutableArray *buttonMutArr = NSMutableArray.array;
    @jobs_weakify(self)
    [buttonMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:AppDelegate.makeImageUnselectedMutArr[buttonMutArr.count]
                                                          highlightImage:AppDelegate.makeImageSelectedMutArr[buttonMutArr.count]
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:self.makeTabBarItemTitleMutArr[buttonMutArr.count]
                                                                subTitle:nil
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
                   if (self.objectBlock) self.objectBlock(x);
                   return nil;
    }]];
    [buttonMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:AppDelegate.makeImageUnselectedMutArr[buttonMutArr.count]
                                                          highlightImage:AppDelegate.makeImageSelectedMutArr[buttonMutArr.count]
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:self.makeTabBarItemTitleMutArr[buttonMutArr.count]
                                                                subTitle:nil
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
                   if (self.objectBlock) self.objectBlock(x);
                   return nil;
    }]];
    [buttonMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:AppDelegate.makeImageUnselectedMutArr[buttonMutArr.count]
                                                          highlightImage:AppDelegate.makeImageSelectedMutArr[buttonMutArr.count]
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:self.makeTabBarItemTitleMutArr[buttonMutArr.count]
                                                                subTitle:nil
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
                   if (self.objectBlock) self.objectBlock(x);
                   return nil;
    }]];
    [buttonMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:AppDelegate.makeImageUnselectedMutArr[buttonMutArr.count]
                                                          highlightImage:AppDelegate.makeImageSelectedMutArr[buttonMutArr.count]
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:self.makeTabBarItemTitleMutArr[buttonMutArr.count]
                                                                subTitle:nil
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
                   if (self.objectBlock) self.objectBlock(x);
                   return nil;
    }]];
    [buttonMutArr addObject:[BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                              background:nil
                                                          titleAlignment:UIButtonConfigurationTitleAlignmentCenter
                                                           textAlignment:NSTextAlignmentCenter
                                                        subTextAlignment:NSTextAlignmentCenter
                                                             normalImage:AppDelegate.makeImageUnselectedMutArr[buttonMutArr.count]
                                                          highlightImage:AppDelegate.makeImageSelectedMutArr[buttonMutArr.count]
                                                         attributedTitle:nil
                                                 selectedAttributedTitle:nil
                                                      attributedSubtitle:nil
                                                                   title:self.makeTabBarItemTitleMutArr[buttonMutArr.count]
                                                                subTitle:nil
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
                   if (self.objectBlock) self.objectBlock(x);
                   return nil;
    }]];
    return buttonMutArr;
}

+(JobsCustomTabBarConfig *)makeJobsCustomTabBarConfig{
    JobsCustomTabBarConfig *customTabBarConfig = JobsCustomTabBarConfig.sharedManager;
    customTabBarConfig.tabBarHeight = JobsWidth(80);
    customTabBarConfig.tabBarBackgroundColor = JobsCyanColor;
    customTabBarConfig.tabBarBackgroundImage = JobsIMG(@"");
    customTabBarConfig.tabBarItems = self.makeTabBarItems;
//    customTabBarConfig.tabBarItemYOffsets
    return customTabBarConfig;
}

+(NSMutableArray <UIViewController *>*)makeViewControllerMutArr{
    NSMutableArray *viewControllerMutArr = NSMutableArray.array;
    for (JobsTabBarCtrlConfig *tabBarCtrlConfig in self.makeConfigMutArr) {
        [viewControllerMutArr addObject:tabBarCtrlConfig.vc];
    }return viewControllerMutArr;
}

+(NSMutableArray <NSString *>*)makeTabBarItemTitleMutArr{
    NSMutableArray *tabBarItemTitleMutArr = NSMutableArray.array;
    [tabBarItemTitleMutArr addObject:JobsInternationalization(@"首页")];
    [tabBarItemTitleMutArr addObject:JobsInternationalization(@"戏码")];
    [tabBarItemTitleMutArr addObject:JobsInternationalization(@"充值")];
    [tabBarItemTitleMutArr addObject:JobsInternationalization(@"客服")];
    [tabBarItemTitleMutArr addObject:JobsInternationalization(@"会员中心")];
    return tabBarItemTitleMutArr;
}

+(NSMutableArray <UIImage *>*)makeImageSelectedMutArr{
    NSMutableArray *imageSelectedMutArr = NSMutableArray.array;
    [imageSelectedMutArr addObject:JobsIMG(@"tabbbar_home_seleteds")];
    [imageSelectedMutArr addObject:JobsIMG(@"tabbbar_weights_seleteds")];
    [imageSelectedMutArr addObject:JobsIMG(@"tabbbar_pay_seleteds")];
    [imageSelectedMutArr addObject:JobsIMG(@"tabbbar_service_seleteds")];
    [imageSelectedMutArr addObject:JobsIMG(@"tabbar_VIP_seleteds")];
    return imageSelectedMutArr;
}

+(NSMutableArray <UIImage *>*)makeImageUnselectedMutArr{
    NSMutableArray *imageUnselectedMutArr = NSMutableArray.array;
    [imageUnselectedMutArr addObject:JobsIMG(@"tabbbar_home_normal")];
    [imageUnselectedMutArr addObject:JobsIMG(@"tabbbar_weights_normal")];
    [imageUnselectedMutArr addObject:JobsIMG(@"tabbbar_pay_normal")];
    [imageUnselectedMutArr addObject:JobsIMG(@"tabbbar_service_normal")];
    [imageUnselectedMutArr addObject:JobsIMG(@"tabbar_VIP_normal")];
    return imageUnselectedMutArr;
}

+(NSMutableArray <JobsTabBarCtrlConfig *>*)makeConfigMutArr{
    NSMutableArray *configMutArr = NSMutableArray.array;
    {
        JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
        config.vc = ViewController_1.new;
        config.title = self.makeTabBarItemTitleMutArr[configMutArr.count];
        config.imageSelected = self.makeImageSelectedMutArr[configMutArr.count];
        config.imageUnselected = self.makeImageUnselectedMutArr[configMutArr.count];
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.xOffset = landscapeValue(JobsWidth(200));
        config.tabBarItemWidth = landscapeValue(JobsWidth(100));
        config.spacing = JobsWidth(3);
        config.tag = configMutArr.count + 1;
        [configMutArr addObject:config];
    }
    
    {
        JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
        config.vc = ViewController_2.new;
        config.title = self.makeTabBarItemTitleMutArr[configMutArr.count];
        config.imageSelected = self.makeImageSelectedMutArr[configMutArr.count];
        config.imageUnselected = self.makeImageUnselectedMutArr[configMutArr.count];
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.xOffset = landscapeValue(JobsWidth(5));
        config.tabBarItemWidth = landscapeValue(JobsWidth(100));
        config.spacing = JobsWidth(3);
        config.tag = configMutArr.count + 1;
        [configMutArr addObject:config];
    }
    
    {
        JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
        config.vc = ViewController_3.new;
        config.title = self.makeTabBarItemTitleMutArr[configMutArr.count];
        config.imageSelected = self.makeImageSelectedMutArr[configMutArr.count];
        config.imageUnselected = self.makeImageUnselectedMutArr[configMutArr.count];
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.xOffset = landscapeValue(JobsWidth(5));
        config.tabBarItemWidth = landscapeValue(JobsWidth(50));
        config.spacing = JobsWidth(3);
        config.tag = configMutArr.count + 1;
        [configMutArr addObject:config];
    }
    
    {
        JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
        config.vc = ViewController_4.new;
        config.title = self.makeTabBarItemTitleMutArr[configMutArr.count];
        config.imageSelected = self.makeImageSelectedMutArr[configMutArr.count];
        config.imageUnselected = self.makeImageUnselectedMutArr[configMutArr.count];
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.xOffset = landscapeValue(JobsWidth(5));
        config.tabBarItemWidth = landscapeValue(JobsWidth(50));
        config.spacing = JobsWidth(3);
        config.tag = configMutArr.count + 1;
        [configMutArr addObject:config];
    }
    
    {
        JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
        config.vc = ViewController_5.new;
        config.title = self.makeTabBarItemTitleMutArr[configMutArr.count];
        config.imageSelected = self.makeImageSelectedMutArr[configMutArr.count];
        config.imageUnselected = self.makeImageUnselectedMutArr[configMutArr.count];
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.xOffset = landscapeValue(JobsWidth(5));
        config.tabBarItemWidth = landscapeValue(JobsWidth(100));
        config.spacing = JobsWidth(3);
        config.tag = configMutArr.count + 1;
        [configMutArr addObject:config];
    }
    
    return configMutArr;
}
/// Core Data Saving support
- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if (context.hasChanges && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
#pragma mark - UISceneSession lifecycle
- (UISceneConfiguration *)application:(UIApplication *)application
configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession
                              options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [UISceneConfiguration.alloc initWithName:@"Default Configuration"
                                        sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application 
didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}
// Handle notification when app is running
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    if(completionHandler) completionHandler(UNAuthorizationOptionAlert + UNAuthorizationOptionSound);
}
/// 一进入App就横屏
//- (UIInterfaceOrientationMask)application:(UIApplication *)application
//  supportedInterfaceOrientationsForWindow:(UIWindow *)window {
//    JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
//    JobsAppTool.currentDeviceOrientation = UIDeviceOrientationLandscapeLeft | UIDeviceOrientationLandscapeRight;
//    JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskLandscape;
//    return UIInterfaceOrientationMaskLandscape;
//}
#pragma mark —— lazyLoad
/// 仅仅为了iOS 13 版本向下兼容而存在
-(UIWindow *)window{
    if (!_window) {
        _window = UIWindow.new;
        _window.frame = UIScreen.mainScreen.bounds;
        self.configMutArr = AppDelegate.makeConfigMutArr;
        _window.rootViewController = RootViewController;
//        [self.tabBarVC ppBadge:YES];
        [_window makeKeyAndVisible];
    }return _window;
}
/// Core Data stack
@synthesize persistentContainer = _persistentContainer;
- (NSPersistentCloudKitContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [NSPersistentCloudKitContainer.alloc initWithName:HDAppDisplayName];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription,
                                                                              NSError *error) {
                if (error) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }return _persistentContainer;
}

@end

#pragma clang diagnostic pop
