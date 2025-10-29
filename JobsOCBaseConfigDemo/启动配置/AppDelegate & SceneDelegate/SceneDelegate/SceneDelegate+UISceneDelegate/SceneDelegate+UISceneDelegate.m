//
//  SceneDelegate+UISceneDelegate.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "SceneDelegate+UISceneDelegate.h"

@implementation SceneDelegate (UISceneDelegate)
#pragma mark —— UIWindowSceneDelegate
- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    self.windowScene = (UIWindowScene *)scene;
    @jobs_weakify(self)
    [JobsAppTools.sharedManager appDelegateWindowBlock:nil
                              sceneDelegateWindowBlock:^(id _Nullable data) {
        @jobs_strongify(self);
        UIWindowScene *ws = (UIWindowScene *)scene;
        // ① 窗口兜底
        self.window = (UIWindow *)data ?: [[UIWindow alloc] initWithWindowScene:ws];
        self.window.windowScene = ws;
        self.window.frame = ws.coordinateSpace.bounds;
        // ② 复用你原先的入口
        self.window.rootViewController = RootViewController;      // 或 [AppDelegate tabBarNavCtrl]
        [self.window makeKeyAndVisible];
        // ③ 保留你原有的启动副作用（如需）
        AppDelegate.launchFunc1();
        AppDelegate.tabBarVC.ppBadge(YES); // 需要在 root 就绪后设置的话，这里比 AppDelegate 更稳
    }];
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    JobsLog(@"---applicationDidBecomeActive----");//进入前台
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
    JobsLog(@"---applicationDidEnterBackground----"); //进入后台
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
    JobsPostNotification(退到后台停止播放ZFPlayer, nil);
}

@end
