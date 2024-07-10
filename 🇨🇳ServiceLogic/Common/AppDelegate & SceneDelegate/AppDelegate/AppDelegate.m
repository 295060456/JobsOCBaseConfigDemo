//
//  AppDelegate.m
//  Casino
//
//  Created by Jobs on 2021/11/16.
//

#import "AppDelegate.h"
#import "AppDelegate+Extra.h"
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
-(NSMutableArray <JobsTabBarCtrlConfig *>*)makeConfigMutArr{
    NSMutableArray *ConfigMutArr = NSMutableArray.array;
    {
        JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
        config.vc = ViewController_1.new;
        config.title = JobsInternationalization(@"首页");
        config.imageSelected = JobsIMG(@"tabbbar_home_seleteds");
        config.imageUnselected = JobsIMG(@"tabbbar_home_normal");
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.xOffset = JobsWidth(200);
        config.tabBarItemWidth = JobsWidth(100);
        config.spacing = JobsWidth(3);
        config.tag = ConfigMutArr.count + 1;
        [ConfigMutArr addObject:config];
    }
    
    {
        JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
        config.vc = ViewController_2.new;
        config.title = JobsInternationalization(@"洗码");
        config.imageSelected = JobsIMG(@"tabbbar_weights_seleteds");
        config.imageUnselected = JobsIMG(@"tabbbar_weights_normal");
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.xOffset = JobsWidth(5);
        config.tabBarItemWidth = JobsWidth(100);
        config.spacing = JobsWidth(3);
        config.tag = ConfigMutArr.count + 1;
        [ConfigMutArr addObject:config];
    }
    
    {
        JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
        config.vc = ViewController_3.new;
        config.title = JobsInternationalization(@"充值");
        config.imageSelected = JobsIMG(@"tabbbar_pay_seleteds");
        config.imageUnselected = JobsIMG(@"tabbbar_pay_normal");
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.xOffset = JobsWidth(5);
        config.tabBarItemWidth = JobsWidth(50);
        config.spacing = JobsWidth(3);
        config.tag = ConfigMutArr.count + 1;
        [ConfigMutArr addObject:config];
    }
    
    {
        JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
        config.vc = ViewController_4.new;
        config.title = JobsInternationalization(@"客服");
        config.imageSelected = JobsIMG(@"tabbbar_service_seleteds");
        config.imageUnselected = JobsIMG(@"tabbbar_service_normal");
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.xOffset = JobsWidth(5);
        config.tabBarItemWidth = JobsWidth(50);
        config.spacing = JobsWidth(3);
        config.tag = ConfigMutArr.count + 1;
        [ConfigMutArr addObject:config];
    }
    
    {
        JobsTabBarCtrlConfig *config = JobsTabBarCtrlConfig.new;
        config.vc = ViewController_5.new;
        config.title = JobsInternationalization(@"会员中心");
        config.imageSelected = JobsIMG(@"tabbar_VIP_seleteds");
        config.imageUnselected = JobsIMG(@"tabbar_VIP_normal");
        config.humpOffsetY = 0;
        config.lottieName = nil;
        config.xOffset = JobsWidth(5);
        config.tabBarItemWidth = JobsWidth(100);
        config.tag = ConfigMutArr.count + 1;
        [ConfigMutArr addObject:config];
    }
    
    return ConfigMutArr;
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
    completionHandler(UNAuthorizationOptionAlert + UNAuthorizationOptionSound);
}
/// 一进入App就横屏
//- (UIInterfaceOrientationMask)application:(UIApplication *)application
//  supportedInterfaceOrientationsForWindow:(UIWindow *)window {
//    return UIInterfaceOrientationMaskLandscape;
//}
#pragma mark —— lazyLoad
/// 仅仅为了iOS 13 版本向下兼容而存在
-(UIWindow *)window{
    if (!_window) {
        _window = UIWindow.new;
        _window.frame = UIScreen.mainScreen.bounds;
        self.configMutArr = self.makeConfigMutArr;
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
