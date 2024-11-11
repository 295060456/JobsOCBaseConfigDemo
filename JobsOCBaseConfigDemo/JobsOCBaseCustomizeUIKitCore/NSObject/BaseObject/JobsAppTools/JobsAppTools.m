//
//  JobsAppTools.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/11.
//

#import "JobsAppTools.h"

@interface JobsAppTools ()

@property(nonatomic,strong)UIWindow *appDelegateWindow;
@property(nonatomic,strong)UIWindow *sceneDelegateWindow;

@end

@implementation JobsAppTools
#pragma mark —— 初始化方法
static JobsAppTools *JobsAppToolsInstance = nil;
static dispatch_once_t JobsAppToolsOnceToken;
+(instancetype)sharedManager {
    dispatch_once(&JobsAppToolsOnceToken, ^{
        JobsAppToolsInstance = [super allocWithZone:NULL].init;
    });return JobsAppToolsInstance;
}
/// 单例的销毁
+(void)destroySingleton {
    JobsAppToolsOnceToken = 0;
    JobsAppToolsInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}
/// 防止外部调用copy
-(instancetype)copyWithZone:(NSZone *)zone{
    return self;
}
/// 防止外部调用mutableCopy
-(instancetype)mutableCopyWithZone:(NSZone *)zone{
    return self;
}
#pragma mark —— 一些公共方法
-(UIWindow *)makeAppDelegateWindow{
    return self.appDelegateWindow;
}

-(UIWindow *)makeSceneDelegateWindow{
    return self.sceneDelegateWindow;
}

-(void)appDelegateWindowBlock:(jobsByWindowBlock _Nullable)appDelegateWindowBlock
     sceneDelegateWindowBlock:(jobsByWindowBlock _Nullable)sceneDelegateWindowBlock{
    if (appDelegateWindowBlock) appDelegateWindowBlock(self.appDelegateWindow);
    if (sceneDelegateWindowBlock) sceneDelegateWindowBlock(self.sceneDelegateWindow);
}
#pragma mark —— lazyLoad
/// 在使用sceneDelegate的情况下，仅仅为了iOS 13 版本向下兼容而存在
-(UIWindow *)appDelegateWindow{
    if(!_appDelegateWindow){
        @jobs_weakify(self)
        _appDelegateWindow = jobsMakeWindow(^(__kindof UIWindow * _Nullable data) {
            @jobs_strongify(self)
            data.frame = UIScreen.mainScreen.bounds;
            data.rootViewController = RootViewController;
            [data makeKeyAndVisible];
        });AppDelegate.tabBarVC.ppBadge(YES);
    }return _appDelegateWindow;
}

//-(UIWindow *)sceneDelegateWindow{
//    if(!_sceneDelegateWindow){
//        SceneDelegate *sceneDelegate = (SceneDelegate *)getSysSceneDelegate();
//        _sceneDelegateWindow = UIWindow.initByScene(sceneDelegate.windowScene);
//        _sceneDelegateWindow.frame = sceneDelegate.windowScene.coordinateSpace.bounds;
//        _sceneDelegateWindow.rootViewController = self.rootViewControllerBy(FMHomeVC.new);;
//        [_sceneDelegateWindow makeKeyAndVisible];
//    }return _sceneDelegateWindow;
//}

@end
