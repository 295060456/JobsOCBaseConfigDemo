//
//  JobsTabbarVC.h
//  TabbarItemLottie
//
//  Created by 叶晓倩 on 2017/9/29.
//  Copyright © 2017年 xa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BaseProtocol.h"

#import "MacroDef_Func.h"
#import "JobsLoadingImage.h"
#import "NSObject+Sound.h"
#import "NSObject+Extras.h"
#import "UIView+Gesture.h"
#import "UIView+Measure.h"
#import "UIButton+UI.h"
#import "NSObject+CallBackInfoByBlock.h"

#import "JobsTabBarItem.h"

#import "JobsTabBar.h"
#import "UITabBar+Ex.h"
#import "TLTabBarAnimation.h"
#import "UITabBar+TLAnimation.h"
#import "UITabBarItem+TLAnimation.h"
#import "UIViewController+Lottie.h"
#import "BaseNavigationVC.h"

#import "TransitionController.h"
#import "TransitionAnimation.h"
#import "JobsPullListAutoSizeView.h"
#import "JobsTabBarItemConfig.h"
#import "JobsSuspendBtn.h"

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#if __has_include(<PPBadgeView/PPBadgeView.h>)
#import <PPBadgeView/PPBadgeView.h>
#else
#import "PPBadgeView.h"
#endif

/*
 * 1、如果用系统的 UITabBarController —— UITabBar 当关联VC ＞ 6 个的时候，最后一个会变成more按钮，其余的VC会在more按钮里面形成一个TableView来进行展现
 * 2、如果希望下方是可以滑动的效果，只能用UIView系列来实现，这里推崇第三方工具库 pod 'JXCategoryView'  # https://github.com/pujiaxin33/JXCategoryView A powerful and easy to use category view (segmentedcontrol, segmentview, pagingview, pagerview, pagecontrol) (腾讯新闻、今日头条、QQ音乐、网易云音乐、京东、爱奇艺、腾讯视频、淘宝、天猫、简书、微博等所有主流App分类切换滚动视图)
 */

/// 此类仅仅对系统给出的 UITabBarController —— UITabBar做最大程度上的增加功能，并且解耦
@interface JobsTabBarVC : UITabBarController
<
UITabBarControllerDelegate,
UIGestureRecognizerDelegate,
BaseProtocol
>
/// UI
@property(nonatomic,strong,readonly)JobsTabBar * _Nonnull myTabBar;/// myTabBar.humpOffsetY 凸起的高度自定义，默认值30  offsetHeight
/// Data
@property(nonatomic,assign)BOOL isOpenScrollTabbar;/// 是否开启手势横向滚动子VC联动Tabbar切换，默认开启
@property(nonatomic,assign)BOOL isAnimationAlert;/// 图片从小放大
@property(nonatomic,assign)BOOL isShakerAnimation;/// 重力弹跳动画效果
@property(nonatomic,assign)BOOL isPlaySound;// 点击声
@property(nonatomic,assign)BOOL isFeedbackGenerator;/// 振动反馈
@property(nonatomic,assign)BOOL isJumpToNextVC;/// 当需要跳开的item,是否是需要直接跳到下一个VC？默认NO
#pragma mark —— 初始化方法
///【单例模式】使用外界自定义的JobsTabBar
+(instancetype _Nonnull)sharedInstanceWithJobsTabBar:(JobsTabBar *_Nullable)tabBar;
/// 一般的初始化模式
-(instancetype _Nonnull)initWithJobsTabBar:(JobsTabBar *_Nonnull)tabBar;
#pragma mark —— 一些公有方法
/// 需要强制跳转登录的index。点击和手势滑动都需要共同调用
-(JobsReturnBOOLByNSUIntegerBlock _Nullable)forcedLoginIndex;
/// 关闭手势
-(jobsByVoidBlock _Nullable)closePan;
/// 打开手势
-(jobsByVoidBlock _Nullable)openPan;
/// 开启/关闭 PPBadgeView的效果,至少在viewDidLayoutSubviews后有效
-(jobsByBOOLBlock _Nonnull)ppBadge;

@end
