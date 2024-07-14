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
#pragma mark —— lazyLoad
-(UIWindow *)window{
    if(!_window){
        _window = [UIWindow.alloc initWithWindowScene:self.windowScene];//UIScreen.mainScreen.bounds
        _window.frame = self.windowScene.coordinateSpace.bounds;
    }
    _window.rootViewController = RootViewController;
    [_window makeKeyAndVisible];
    return _window;
}

@end

#pragma clang diagnostic pop
