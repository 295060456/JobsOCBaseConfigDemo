//
//  AppDelegate.m
//  Casino
//
//  Created by Jobs on 2021/11/16.
//

#import "AppDelegate.h"

#import "AppDelegate+TabBarCtr.h"
#import "AppDelegate+Func.h"
#import "AppDelegate+UIApplicationDelegate.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface AppDelegate ()

@end

@implementation AppDelegate

static AppDelegate *AppDelegateInstance = nil;
static dispatch_once_t AppDelegateOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&AppDelegateOnceToken, ^{
        AppDelegateInstance = [super allocWithZone:NULL].init;
    });return AppDelegateInstance;
}
/// 单例的销毁
+(void)destroyInstance{
    AppDelegateOnceToken = 0;
    AppDelegateInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    dispatch_once(&AppDelegateOnceToken, ^{
        AppDelegateInstance = [super allocWithZone:zone];
    });return AppDelegateInstance;
}

-(instancetype)copyWithZone:(NSZone *)zone{
    return self;
}

-(instancetype)mutableCopyWithZone:(NSZone *)zone{
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
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
//-(UIWindow *)window{
//    if (!_window) {
//        _window = UIWindow.new;
//        _window.frame = UIScreen.mainScreen.bounds;
////        self.configMutArr = AppDelegate.makeTabBarItemConfigMutArr;
////        _window.rootViewController = RootViewController;
////        [self.tabBarVC ppBadge:YES];
//        [_window makeKeyAndVisible];
//    }return _window;
//}
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
