//
//  MacroDef_Func.h
//  UBallLive
//
//  Created by Jobs on 2020/10/9.
//

#ifndef MacroDef_Func_h
#define MacroDef_Func_h

#import <UIKit/UIKit.h>
#import "MacroDef_SysWarning.h"
#import "MacroDef_Notification.h"
#import "MacroDef_QUEUE.h"
#import "MacroDef_String.h"
#import "JobsUserDefaultDefine.h"
#import "MacroDef_Strong@Weak.h"
#import "MacroDef_Time.h"
#import "MacroDef_Singleton.h"
#import "NSObject+WHToast.h"

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#pragma mark —— 关于window的获取
/// 获取 iOS 13 之前的 window
NS_INLINE UIWindow *_Nullable jobsGetMainWindowBefore13(void){
    UIWindow *window = nil;
    /// 使用UIApplication的windows属性来获取当前窗口：
    /// 这种方式获取窗口的方式在iOS 13之前是常用的做法
    if (UIApplication.sharedApplication.delegate.window) {
        window = UIApplication.sharedApplication.delegate.window;
    }
    
    if(!window){
        /// 这种获取窗口的方式在iOS 2.0到iOS 13.0版本之间都是可用的
        SuppressWdeprecatedDeclarationsWarning(
            if (UIApplication.sharedApplication.keyWindow) {
                window = UIApplication.sharedApplication.keyWindow;
            });
    }return window;
}
/// 获取 iOS 13 之后的 window
NS_INLINE UIWindow *_Nullable jobsGetMainWindowAfter13(void){
    UIWindow *mainWindow = nil;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *windowScene in UIApplication.sharedApplication.connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in windowScene.windows) {
                    if (window.isKeyWindow) {
                        mainWindow = window;
                        break;
                    }
                }
            }
            if (mainWindow) {
                break; // 如果找到主窗口，退出循环
            } else if (windowScene.windows.count > 0) {
                mainWindow = windowScene.windows.firstObject;
            }
        }
    }return mainWindow;
}

//NS_INLINE UIWindow *_Nullable jobsGetMainWindowAfter13(void){
//    UIWindow *window = nil;
//    /// 使用UIWindowScene（需要iOS 13及更高版本）来获取主窗口
//    /// iOS 13及更高版本中才会被执行
//    if (@available(iOS 13.0, *)) {
//        for (UIWindowScene* windowScene in UIApplication.sharedApplication.connectedScenes){
//            if (windowScene.activationState == UISceneActivationStateForegroundActive){
//                window = windowScene.windows.firstObject;
//            }
//        }
//    }return window;
//}

NS_INLINE UIWindow *_Nullable jobsGetMainWindow(void){
    UIWindow *mainWindowBefore13 = jobsGetMainWindowBefore13();
    UIWindow *mainWindowAfter13 = jobsGetMainWindowAfter13();
    UIWindow *resultWindow = UIDevice.currentDevice.systemVersion.floatValue >= 13.0 ? mainWindowAfter13 : mainWindowBefore13;
    
    if(resultWindow) return resultWindow;
    if(mainWindowBefore13) return mainWindowBefore13;
    if(mainWindowAfter13) return mainWindowAfter13;
    return nil;
}

/// 获取一个有Size的window
NS_INLINE UIWindow *_Nullable jobsGetMainWindowWithSize(void){
    UIWindow *window = nil;
    window = NSObject.mainWindow();
    return CGSizeEqualToSize(CGSizeZero, window.Size) ? jobsGetMainWindowBefore13() : window;
}
/// 获取 keyWindowScene iOS 13版本后可用
NS_INLINE UIWindowScene *_Nullable jobsGetkeyWindowScene(void) {
    if(@available(iOS 13.0, *)){
        UIWindowScene *keyWindowScene = (UIWindowScene *)UIApplication.sharedApplication.connectedScenes.allObjects.firstObject;
        return keyWindowScene;
    }else return nil;
}
#pragma mark —— 判断目标iPhone是否是刘海屏系列
/**
 在iOS 13之前使用如下方式获取window，谁更加科学？
 UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
 UIWindow *window = UIApplication.sharedApplication.keyWindow;
 
【在iOS 13之前】
 UIApplication.sharedApplication.keyWindow更准确和可靠
 因为它是官方推荐用于获取应用程序主窗口的方式。
 这是因为在较早的iOS版本中，通常只有一个窗口，所以keyWindow属性用于表示主窗口，是一个常用的做法。

 UIApplication.sharedApplication.windows.firstObject也可以工作，但它是一个数组，获取第一个窗口，然后获取其视图层级中的第一个子视图。
 尽管在大多数情况下，这将是主窗口，但它并不像keyWindow属性那样明确表示主窗口，因此可能不如keyWindow准确。

 【在iOS 13之后】，多窗口支持被引入，窗口层次结构变得更加复杂
 因此官方建议不再使用keyWindow属性，而是使用更现代的方法，如基于UIWindowScene的窗口管理方式，以适应新的应用程序架构。
 */
/// 判断目标iPhone是否是刘海屏系列：   X系列（X/XS/XR/XS Max)、11系列（11、pro、pro max）
/// @return YES 是该系列 NO 不是该系列
NS_INLINE BOOL isiPhoneX_series(void) {
    BOOL iPhoneXSeries = NO;
    if(UIDevice.currentDevice.systemVersion.floatValue >= 13.0){
        NSArray<UIWindow *> *sceneWindows = jobsGetkeyWindowScene().windows;
        if (sceneWindows.count) {
            UIWindow *window = sceneWindows.firstObject;
            iPhoneXSeries = window.safeAreaInsets.top > 20;
        }
    }else{
        UIWindow *window;
        SuppressWdeprecatedDeclarationsWarning(window = UIApplication.sharedApplication.keyWindow;);
        iPhoneXSeries = window.safeAreaInsets.top > 20;
    }return iPhoneXSeries;
}
#pragma mark —— 获取 AppDelegate 和 SceneDelegate
/// AppDelegate.sharedManager
NS_INLINE id<UIApplicationDelegate> _Nullable getSysAppDelegate(void){
    return UIApplication.sharedApplication.delegate;
}
/**
    1、该方法只能获取系统默认的SceneDelegate；
    2、如果要获取自定义的sceneDelegate，则需要：
 
     SceneDelegate *sceneDelegate;//在类定义域和实现域之外暴露
         
     -(instancetype)init{
         if (self = [super init]) {
             sceneDelegate = self;
         }return self;
     }
     
     获取方式：extern SceneDelegate *sceneDelegate;
 */
NS_INLINE id<UIWindowSceneDelegate> _Nullable getSysSceneDelegate(void){
    id sceneDelegate = nil;
    if (@available(iOS 13.0, *)) {
        sceneDelegate = UIApplication.sharedApplication.connectedScenes.allObjects.firstObject.delegate;
    }return sceneDelegate;
}
#pragma mark —— 弹出提示
NS_INLINE void toast(NSString *_Nullable msg){
    if(!msg || ![msg isKindOfClass:NSString.class]){
        msg = JobsInternationalization(@"数据错误");
    }NSObject.jobsToastMsg(JobsInternationalization(msg));
}

NS_INLINE void toastErr(NSString *_Nullable msg){
    if(!msg || ![msg isKindOfClass:NSString.class]){
        msg = JobsInternationalization(@"数据错误");
    }NSObject.jobsToastErrMsg(JobsInternationalization(msg));
}
#pragma mark —— 定义一些默认值
#ifndef listContainerViewDefaultOffset
#define listContainerViewDefaultOffset JobsWidth(40)
#endif

#ifndef JobsDefaultValue
#define JobsDefaultValue 0
#endif

#ifndef JobsDefaultObj
#define JobsDefaultObj Nil
#endif

#ifndef JobsDefaultSize
#define JobsDefaultSize CGSizeZero
#endif
/// 其他
#ifndef PrintRetainCount
#define PrintRetainCount(obj) printf("Retain Count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(obj)));//打印引用计数器
#endif

#ifndef ReuseIdentifier
#define ReuseIdentifier self.class.description
#endif

#ifndef reuseIdentifier
#define reuseIdentifier(Class) Class.class.description
#endif

#ifndef JobsAvailableSysVersion
#define JobsAvailableSysVersion(version) @available(iOS version, *)
#endif

#ifndef JobsCellRandomCor
#define JobsCellRandomCor cell.backgroundColor = cell.contentView.backgroundColor = JobsRandomColor;
#endif

#ifndef JobsCellCor
#define JobsCellCor(cor) cell.backgroundColor = cell.contentView.backgroundColor = cor;
#endif

#ifndef JobsCellSelfCor
#define JobsCellSelfCor(cor) self.backgroundColor = self.contentView.backgroundColor = cor;
#endif

#ifndef JobsIndexPathForItem
#define JobsIndexPathForItem(section,item) [NSIndexPath indexPathForItem:item inSection:section]
#endif

#ifndef JobsIndexPathForRow
#define JobsIndexPathForRow(section,row) [NSIndexPath indexPathForRow:row inSection:section]
#endif

#endif /* MacroDef_Func_h */
