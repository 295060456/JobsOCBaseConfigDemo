//
//  MacroDef_Size.h
//  UBallLive
//
//  Created by Jobs on 2020/10/9.
//

#ifndef MacroDef_Size_h
#define MacroDef_Size_h

#import <UIKit/UIKit.h>
#import "MacroDef_SysWarning.h"
#import "MacroDef_AppDeviceScreenSize.h"
#import "UIDevice+XMUtils.h"
/// 资料来源：https://tommygirl.cn/2022/09/15/iPhone_dev_size/
#pragma mark —— 屏幕尺寸/启动图作图大小 (从 iPhone 4 开始统计)
/**
      型号                                 屏幕尺寸(inch)      屏幕密度(ppi)      屏幕宽高(pt)      屏幕分辨率(px)      倍图
 -----------------------------------------------------------------------------
 iPhone 4/4S                                       3.5                       326                  320 * 480          640 * 960          @2x
 iPhone 5/5C/5S/SE                            4.0                       326                  320 * 568          640 * 1136        @2x
 iPhone 6/6S/7/8/SE 2                         4.7                       326                  375 * 667          750 * 1334        @2x
 iPhone 6/6S/7/8 Plus                         5.5                       401                  414 * 736          1242 * 2208      @3x
 iPhone X / XS / 11 Pro                       5.8                       458                  375 * 812          1125 * 2436      @3x
 iPhone Xr / 11                                    6.1                       326                  414 * 896           828 * 1792       @2x
 iPhone XS Max / 11 Pro Max             6.5                       458                  414 * 896          1242 * 2688      @3x
 iPhone 12 mini                                   5.4                       476                  375 * 812          1125 * 2436      @3x
 iPhone 12 / 12 Pro                             6.1                       460                  390 * 844          1170 * 2532      @3x
 iPhone 12 Pro Max                            6.7                       458                  428 * 926          1284 * 2778      @3x
 iPhone 13 mini                                   5.4                       476                  375 * 812          1125 * 2436      @3x
 iPhone 13 / 13 Pro                             6.1                       460                  390 * 844          1170 * 2532      @3x
 iPhone 13 Pro Max                            6.7                       458                  428 * 926          1284 * 2778      @3x
 iPhone 14                                          6.1                       460                  375 * 812          1125 * 2436      @3x
 iPhone 14 Plus                                  6.7                       458                  428 * 926          1284 * 2778      @3x
 iPhone 14 Pro                                    6.1                       460                  393 * 852          1179 * 2556     @3x
 iPhone 14 Pro Max                            6.7                       460                  430 * 932          1290 * 2796     @3x
 ----------------------------------------------------------------------------
 */
typedef NS_ENUM(NSUInteger, iPhScrPxType) {
    iPhScrPxType_None,
    iPhScrPxType_4_4S,// 屏幕分辨率(px) = 640 * 960
    iPhScrPxType_5_5C_5S_SE,// 屏幕分辨率(px) = 640 * 1136
    iPhScrPxType_6_6S_7_8_SE2,// 屏幕分辨率(px) = 750 * 1334
    iPhScrPxType_6_6S_7_8Plus,// 屏幕分辨率(px) = 1242 * 2208
    /// 从这里开始刘海屏
    iPhScrPxType_X_XS_11Pro,// 屏幕分辨率(px) = 1125 * 2436
    iPhScrPxType_Xr_11,// 屏幕分辨率(px) = 828 * 1792
    iPhScrPxType_XSMax_11ProMax,// 屏幕分辨率(px) = 1242 * 2688
    iPhScrPxType_12mini,// 屏幕分辨率(px) = 1125 * 2436
    iPhScrPxType_12_12Pro,// 屏幕分辨率(px) = 1170 * 2532
    iPhScrPxType_12ProMax,// 屏幕分辨率(px) = 1284 * 2778
    iPhScrPxType_13mini,// 屏幕分辨率(px) = 1125 * 2436
    iPhScrPxType_13_13Pro,// 屏幕分辨率(px) = 1170 * 2532
    iPhScrPxType_13ProMax,// 屏幕分辨率(px) = 1284 * 2778
    iPhScrPxType_14,// 屏幕分辨率(px) = 1125 * 2436
    iPhScrPxType_14Plus,// 屏幕分辨率(px) = 1284 * 2778
    iPhScrPxType_14Pro,// 屏幕分辨率(px) = 1179 * 2556
    iPhScrPxType_14ProMax,// 屏幕分辨率(px) = 1290 * 2796
};
/// 获取当前iOS移动设备的屏幕分辨率
static inline iPhScrPxType iPhScrPx(void){
    if([UIDevice.platformIDStr isEqualToString:@"iPhone3,1"]||// iPhone 4 (GSM)
       [UIDevice.platformIDStr isEqualToString:@"iPhone3,2"]||// iPhone 4 (GSM Rev A)
       [UIDevice.platformIDStr isEqualToString:@"iPhone3,3"]||// iPhone 4 (CDMA)
       [UIDevice.platformIDStr isEqualToString:@"iPhone4.1,"]){// iPhone 4S
        return iPhScrPxType_4_4S;
    }
    
    if([UIDevice.platformIDStr isEqualToString:@"iPhone5,1"]||// iPhone 5 (GSM)
       [UIDevice.platformIDStr isEqualToString:@"iPhone5,2"]||// iPhone 5 (CDMA)
       [UIDevice.platformIDStr isEqualToString:@"iPhone5,3"]||// iPhone 5c
       [UIDevice.platformIDStr isEqualToString:@"iPhone5,4"]||// iPhone 5c
       [UIDevice.platformIDStr isEqualToString:@"iPhone6,1"]||// iPhone 5s
       [UIDevice.platformIDStr isEqualToString:@"iPhone6,2"]||// iPhone 5s
       [UIDevice.platformIDStr isEqualToString:@"iPhone8,4"]){// iPhone SE (1st generation)
        return iPhScrPxType_5_5C_5S_SE;
    }
    
    if([UIDevice.platformIDStr isEqualToString:@"iPhone7,2"]||// iPhone 6
       [UIDevice.platformIDStr isEqualToString:@"iPhone8,1"]||// iPhone 6s
       [UIDevice.platformIDStr isEqualToString:@"iPhone9,1"]||// iPhone 7
       [UIDevice.platformIDStr isEqualToString:@"iPhone9,3"]||// iPhone 7
       [UIDevice.platformIDStr isEqualToString:@"iPhone10,1"]||// iPhone 8
       [UIDevice.platformIDStr isEqualToString:@"iPhone10,4"]||// iPhone 8
       [UIDevice.platformIDStr isEqualToString:@"iPhone12,8"]){// iPhone SE (2nd generation)
        return iPhScrPxType_6_6S_7_8_SE2;
    }
    
    if([UIDevice.platformIDStr isEqualToString:@"iPhone7,2"]||// iPhone 6
       [UIDevice.platformIDStr isEqualToString:@"iPhone8,1"]||// iPhone 6s
       [UIDevice.platformIDStr isEqualToString:@"iPhone9,1"]||// iPhone 7
       [UIDevice.platformIDStr isEqualToString:@"iPhone9,3"]||// iPhone 7
       [UIDevice.platformIDStr isEqualToString:@"iPhone10,2"]||// iPhone 8 Plus
       [UIDevice.platformIDStr isEqualToString:@"iPhone10,5"]){// iPhone 8 Plus
        return iPhScrPxType_6_6S_7_8Plus;
    }

    if([UIDevice.platformIDStr isEqualToString:@"iPhone10,6"]||// iPhone X
       [UIDevice.platformIDStr isEqualToString:@"iPhone11,2"]||// iPhone XS
       [UIDevice.platformIDStr isEqualToString:@"iPhone12,3"]){// iPhone 11 Pro
        return iPhScrPxType_X_XS_11Pro;
    }

    if([UIDevice.platformIDStr isEqualToString:@"iPhone11,8"]||// iPhone XR
       [UIDevice.platformIDStr isEqualToString:@"iPhone12,1"]){// iPhone 11
        return iPhScrPxType_Xr_11;
    }
    
    if([UIDevice.platformIDStr isEqualToString:@"iPhone11,4"]||// iPhone XS Max
       [UIDevice.platformIDStr isEqualToString:@"iPhone11,6"]||// iPhone XS Max
       [UIDevice.platformIDStr isEqualToString:@"iPhone12,5"]){// iPhone 11 Pro Max
        return iPhScrPxType_XSMax_11ProMax;
    }
    
    if ([UIDevice.platformIDStr isEqualToString:@"iPhone13,1"]) {// iPhone 12 mini
        return iPhScrPxType_12mini;
    }
    
    if ([UIDevice.platformIDStr isEqualToString:@"iPhone13,2"]||// iPhone 12
        [UIDevice.platformIDStr isEqualToString:@"iPhone13,3"]) {// iPhone 12 Pro
        return iPhScrPxType_12_12Pro;
    }
    
    if ([UIDevice.platformIDStr isEqualToString:@"iPhone13,4"]){// iPhone 12 Pro Max
        return iPhScrPxType_12ProMax;
    }
    
    if ([UIDevice.platformIDStr isEqualToString:@"iPhone14,4"]){// iPhone 13 mini
        return iPhScrPxType_13mini;
    }
    
    if ([UIDevice.platformIDStr isEqualToString:@"iPhone14,2"]||// iPhone 13 Pro
        [UIDevice.platformIDStr isEqualToString:@"iPhone14,5"]){// iPhone 13
        return iPhScrPxType_13_13Pro;
    }
    
    if ([UIDevice.platformIDStr isEqualToString:@"iPhone14,3"]){// iPhone 13 Pro Max
        return iPhScrPxType_13ProMax;
    }
    
    if ([UIDevice.platformIDStr isEqualToString:@"iPhone14,7"]) {// iPhone 14
        return iPhScrPxType_14;
    }
    
    if ([UIDevice.platformIDStr isEqualToString:@"iPhone14,8"]){// iPhone 14 Plus
        return iPhScrPxType_14Plus;
    }

    if ([UIDevice.platformIDStr isEqualToString:@"iPhone15,2"]){// iPhone 14 Pro
        return iPhScrPxType_14Pro;
    }
    
    if ([UIDevice.platformIDStr isEqualToString:@"iPhone15,3"]){// iPhone 14 Pro Max
        return iPhScrPxType_14ProMax;
    }return iPhScrPxType_None;
}
/// 判断当前设备是否是全面屏
static inline BOOL isFullScreen(void){
    if(iPhScrPx() == iPhScrPxType_None ||
       iPhScrPx() == iPhScrPxType_4_4S ||
       iPhScrPx() == iPhScrPxType_5_5C_5S_SE ||
       iPhScrPx() == iPhScrPxType_6_6S_7_8_SE2 ||
       iPhScrPx() == iPhScrPxType_6_6S_7_8Plus) {
        return NO;
    }return YES;
}
#pragma mark —— APP桌面Logo图片尺寸
/**
        标注                                               尺寸(px)
------------------------------------------------
 iPhone Notification 20pt @2x                       40 * 40
 iPhone Notification 20pt @3x                       60 * 60
 iPhone Settings 29pt @2x                            58 * 58
 iPhone Settings 29pt @3x                            87 * 87
 iPhone Spotlight 40pt @2x                           80 * 80
 iPhone Spotlight 40pt @3x                          120 * 120
 iPhone App 60pt @2x                                  120 * 120
 iPhone App 60pt @3x                                  180 * 180
 App Store 1024pt @1x                                1024 * 1024
------------------------------------------------
 */
#pragma mark —— 安全区
/**
       型号                                                   Edge(Top, Left, Bottom, Right)
 ----------------------------------------------------------
 iPhone SE / 5S                                                                 ——
 iPhone 6s / 7 / 8                                                               ——
 iPhone 6 / 7 / 8 Plus                                                         ——
 iPhone X / XS                                                              (44, 0, 34, 0)
 iPhone Xr / 11                                                              (48, 0, 34, 0)
 iPhone XS Max / 11 Pro Max                                       (44, 0, 34, 0)
 iPhone 12 mini / 13mini                                               (50, 0, 34, 0)
 iPhone 12 / 12 Pro / 13 / 13 Pro                                  (47, 0, 34, 0)
 iPhone 12 Pro Max / 13 Pro Max                                 (47, 0, 34, 0)
 iPhone 14                                                                     (47, 0, 34, 0)
 iPhone 14 Plus                                                             (47, 0, 34, 0)
 iPhone 14 Pro                                                              (59, 0, 34, 0)
 iPhone 14 Pro Max                                                      (59, 0, 34, 0)
 ----------------------------------------------------------
 */
#pragma mark ——Tabbar 作图大小
/**
 型号                                                           尺寸(px)         Tabbar 高度(pt)
 ----------------------------------------------------------
 iPhone SE / 5S                                          640 * 98               49
 iPhone 6s / 7 / 8                                        750 * 98                49
 iPhone 6 / 7 / 8 Plus                                1242 * 147              49
 iPhone X / XS                                          1125 * 249               83
 iPhone Xr / 11                                            828 * 166              83
 iPhone XS Max / 11 Pro Max                   1242 * 249              83
 iPhone 12 mini / 13mini                            1080 * 249             83
 iPhone 12 / 12 Pro / 13 / 13 Pro               1170 * 249              83
 iPhone 12 Pro Max / 13 Pro Max             1284 * 249              83
 iPhone 14                                                 1170 * 249              83
 iPhone 14 Plus                                         1284 * 249             83
 iPhone 14 Pro                                           1179 * 249             83
 iPhone 14 Pro Max                                   1290 * 249             83
 ----------------------------------------------------------
 */
#pragma mark —— 屏幕二维长宽数据输出
static inline CGSize JobsMainScreen(void){
    return UIScreen.mainScreen.bounds.size;
}

static inline CGFloat JobsMainScreen_WIDTH(void){
    return JobsMainScreen().width;
}

static inline CGFloat JobsMainScreen_HEIGHT(void){
    return JobsMainScreen().height;
}

static inline CGFloat SCREEN_MAX_LENGTH(void){
    return MAX(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
}

static inline CGFloat SCREEN_MIN_LENGTH(void){
    return MIN(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
}
#pragma mark —— 屏幕像素标准转化：输入原型图上的宽和高，对外输出App对应的移动设备的真实宽高
/// 宽转化 JobsWidth(1) == 0.85333333333...9
static inline CGFloat JobsWidth(CGFloat width){
    return (MIN(JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT()) / 375) * width; //375 对应原型图的宽 在iph 12 pro max 此系数 = 1.1413333333333333
}
/// 高转化 JobsHeight(1) == 0.93270524899057872
static inline CGFloat JobsHeight(CGFloat height){
    return (JobsMainScreen_HEIGHT() / 743) * height; //743 对应原型图的高
}
#import "MacroDef_Func.h"/// 提到最前面，就会因为编译顺序的问题报错
#pragma mark —— 安全区域
/// 顶部的安全距离
static inline CGFloat JobsTopSafeAreaHeight(void){
    if (@available(iOS 11.0, *)) {
        return jobsGetMainWindow().safeAreaInsets.top;
    } else return 0.f;
}
/// 底部的安全距离，全面屏手机为34pt，非全面屏手机为0pt
static inline CGFloat JobsBottomSafeAreaHeight(void){
    if (@available(iOS 11.0, *)) {
        return jobsGetMainWindow().safeAreaInsets.bottom;
    } else return 0.f;
}
#pragma mark —— 状态栏高度
/**
【iOS 14前】
 刘海屏手机的状态栏高度 = 44pt
 非刘海屏手机的状态栏高度 = 20pt
 
【iOS 14后】刘海屏的状态栏高度不再是固定的44pt
 iPhone 11/X/XR的状态栏高度 = 48pt
 iPhone 12/12 Pro/13/13 Pro/14的状态栏高度 = 47pt
 iPhone 14 Pro/14 Pro Max的状态栏高度 = 59pt
 其他刘海屏的状态栏高度 = 44pt
 非刘海屏的状态栏高度 = 20pt
 */
/// 方法一：状态栏高度
static inline CGFloat JobsStatusBarHeightByAppleIncData(void){
    if (UIDevice.currentDevice.systemVersion.floatValue < 14.0) {
        return isiPhoneX_series() ? 44 : 20;
    } else {
        if([UIDevice.simulatorModel isEqualToString:@"iPhone12,1"] ||// iPhone 11
           [UIDevice.simulatorModel isEqualToString:@"iPhone12,3"] ||// iPhone 11 Pro
           [UIDevice.simulatorModel isEqualToString:@"iPhone12,5"] ||// iPhone 11 Pro Max
           [UIDevice.simulatorModel isEqualToString:@"iPhone10,6"] ||// iPhone X
           [UIDevice.simulatorModel isEqualToString:@"iPhone10,8"] ){// iPhone XR
            return 48;
        }
           
        if([UIDevice.simulatorModel isEqualToString:@"iPhone13,2"] ||// iPhone 12
           [UIDevice.simulatorModel isEqualToString:@"iPhone13,3"] ||// iPhone 12 Pro
           [UIDevice.simulatorModel isEqualToString:@"iPhone14,2"] ||// iPhone 13 Pro
           [UIDevice.simulatorModel isEqualToString:@"iPhone14,5"] ||// iPhone 13
           [UIDevice.simulatorModel isEqualToString:@"iPhone14,7"] ){// iPhone 14
            return 47;
        }
        
        if([UIDevice.simulatorModel isEqualToString:@"iPhone15,2"] ||// iPhone 14 Pro
           [UIDevice.simulatorModel isEqualToString:@"iPhone15,3"] ){// iPhone 14 Pro Max
            return 59;
        } return UIDevice.isFullScreen ? 44 : 20;
    }
}
/// 方法二：状态栏高度
static inline CGFloat JobsRectOfStatusbar(void){
    SuppressWdeprecatedDeclarationsWarning(
        if (@available(iOS 13.0, *)){
            UIStatusBarManager *statusBarManager = jobsGetMainWindow().windowScene.statusBarManager;
            return statusBarManager.statusBarHidden ? 0 : statusBarManager.statusBarFrame.size.height;
        }else return UIApplication.sharedApplication.statusBarFrame.size.height;);
}
/// 方法三：状态栏高度
static inline CGFloat JobsStatusBarHeight(void){
    if (@available(iOS 11.0, *)) {
        return jobsGetMainWindow().safeAreaInsets.top;
    } else return JobsRectOfStatusbar();
}
#pragma mark —— 导航栏高度
/// @param navigationController 传nil为系统默认navigationController高度；因为navigationController可以自定义高度，传自定义navigationController返回自定义的navigationController的高度
static inline CGFloat JobsNavigationHeight(UINavigationController * _Nullable navigationController){
    if (navigationController) {
        return navigationController.navigationBar.frame.size.height;
    }else return 44.f;
}
#pragma mark —— 状态栏 + 导航栏高度
/// 非刘海屏：状态栏高度(20.f) + 导航栏高度(44.f) = 64.f
/// 刘海屏系列：状态栏高度(44.f) + 导航栏高度(44.f) = 88.f
static inline CGFloat JobsNavigationBarAndStatusBarHeight(UINavigationController * _Nullable navigationController){
    return JobsStatusBarHeight() + JobsNavigationHeight(navigationController);
}
#pragma mark —— Tabbar高度：全面屏手机比普通手机多34的安全区域
/// @param tabBarController 传nil为系统默认tabbar高度；因为tabBarController可以自定义高度，传自定义tabBarController返回自定义的tabBarController的高度
static inline CGFloat JobsTabBarHeight(UITabBarController * _Nullable tabBarController){
    //因为tabbar可以自定义高度，所以这个地方返回系统默认的49像素的高度
    if (tabBarController) {
        return tabBarController.tabBar.frame.size.height;
    }else return 49.f;
}
/// tabbar高度：【包括了底部安全区域的TabBar高度，一般用这个】
static inline CGFloat JobsTabBarHeightByBottomSafeArea(UITabBarController * _Nullable tabBarController){
    return JobsTabBarHeight(tabBarController) + JobsBottomSafeAreaHeight();
}
#pragma mark ——  除开 tabBarController 和 navigationController 的内容可用区域的大小
static inline CGFloat JobsContentAreaHeight(UITabBarController * _Nullable tabBarController,
                                            UINavigationController * _Nullable navigationController){
    CGFloat tabBarHeightByBottomSafeArea = JobsTabBarHeightByBottomSafeArea(tabBarController);
    CGFloat navigationBarAndStatusBarHeight = JobsNavigationBarAndStatusBarHeight(navigationController);
    return JobsMainScreen_HEIGHT() - tabBarHeightByBottomSafeArea - navigationBarAndStatusBarHeight;
}
#pragma mark —— 尺寸相关的结构体判定
/// 结构体虽然分配了空间，但是里面的成员的值是随机的，特别是如果里面有指针的话，如果不初始化而直接访问，则会造成读取非法的内存地址的错误。
/// 判定一个Size是否是CGSizeZero
static inline BOOL jobsZeroSizeValue(CGSize sizeValue){
    return CGSizeEqualToSize(CGSizeZero, sizeValue);
}
/// 判定一个CGRect是否是CGRectZero
static inline BOOL jobsZeroRectValue(CGRect rectValue){
    return CGRectEqualToRect(CGRectZero, rectValue);
}
/// 判定一个CGPoint是否是CGPointZero
static inline BOOL jobsZeroPointValue(CGPoint pointValue){
    return CGPointEqualToPoint(CGPointZero, pointValue);
}
/// 构建一个四边距离相等的 UIEdgeInsets
static inline UIEdgeInsets jobsSameEdgeInset(CGFloat insets){
    return (UIEdgeInsetsMake(JobsWidth(insets),
                             JobsWidth(insets),
                             JobsWidth(insets),
                             JobsWidth(insets)));
}
/// 构建一个宽高相等的 CGSize
static inline CGSize jobsSameSize(CGFloat x){
    return CGSizeMake(JobsWidth(x), JobsWidth(x));
}
/// 构建一个XY相等的 CGPoint
static inline CGPoint jobsSamePoint(CGFloat x){
    return CGPointMake(JobsWidth(x), JobsWidth(x));
}
/// 构建一个内边距相等的 NSDirectionalEdgeInsets
static inline NSDirectionalEdgeInsets jobsSameDirectionalEdgeInsets(CGFloat x){
    return NSDirectionalEdgeInsetsMake(x, x, x, x);
}

static inline BOOL jobsEqualToZeroRect(CGRect x){
    return CGRectEqualToRect(x, CGRectZero);
}

static inline BOOL jobsEqualToZeroPoint(CGPoint x){
    return CGPointEqualToPoint(x, CGPointZero);
}

static inline BOOL jobsEqualToZeroSize(CGSize x){
    return CGSizeEqualToSize(x, CGSizeZero);
}

#endif /* MacroDef_Size_h */
