//
//  SceneDelegate.m
//  Casino
//
//  Created by Jobs on 2021/11/16.
//

#import "SceneDelegate.h"
#import "SceneDelegate+UISceneDelegate.h"

API_AVAILABLE(ios(13.0))
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

SceneDelegate *sceneDelegate;
@interface SceneDelegate ()

@end

@implementation SceneDelegate

-(instancetype)init{
    if (self = [super init]) {
        sceneDelegate = self;
        @jobs_weakify(self)
        JobsAddNotification(self,
                        selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                  id _Nullable arg){
            NSNotification *notification = (NSNotification *)arg;
            @jobs_strongify(self)
            NSLog(@"通知传递过来的 = %@",notification.object);
            self.windowScene = notification.object;
            return nil;
        },nil, self),UISceneWillConnectNotification,nil);
    }return self;
}
#pragma mark —— UIWindowSceneDelegate
- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//    if ([scene isKindOfClass:[UIWindowScene class]]) {
//            UIWindowScene *windowScene = (UIWindowScene *)scene;
//            self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
//            self.window.frame = windowScene.coordinateSpace.bounds;
//            self.window.rootViewController = AppDelegate.sharedManager.tabBarVC;
//            [self.window makeKeyAndVisible];
//    }
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}
#pragma mark —— lazyLoad
-(UIWindow *)window{
    if(!_window){
        _window = [UIWindow.alloc initWithWindowScene:self.windowScene];//UIScreen.mainScreen.bounds
        _window.frame = self.windowScene.coordinateSpace.bounds;
    }
//    _window.rootViewController = RootViewController;
//    _window.rootViewController = AppDelegate.makeJobsTabBarNavCtrl;customTabBarVC
//    _window.rootViewController = AppDelegate.makeLZTabBarNavCtrl;//makeLZTabBarCtrl
    _window.rootViewController = AppDelegate.makeTabBarNavCtrl;//tabBarVC
    [_window makeKeyAndVisible];
    return _window;
}

@end

#pragma clang diagnostic pop
