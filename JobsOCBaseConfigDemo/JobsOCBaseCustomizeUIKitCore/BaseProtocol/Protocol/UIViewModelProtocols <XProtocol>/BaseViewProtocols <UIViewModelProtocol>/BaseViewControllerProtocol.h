//
//  BaseViewControllerProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
#import "BaseViewProtocol.h"
#import "JobsNavBar.h"

#if __has_include(<SPAlertController/SPAlertController.h>)
#import <SPAlertController/SPAlertController.h>
#else
#import "SPAlertController.h"
#endif

@class JobsBasePopupView;

NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewControllerProtocol <BaseViewProtocol>
@optional
/// 生命周期监控
Prop_assign()BOOL LoadView;
Prop_assign()BOOL ViewDidLoad;
Prop_assign()BOOL ViewWillAppear;
Prop_assign()BOOL ViewDidAppear;
Prop_assign()BOOL ViewWillDisappear;
Prop_assign()BOOL ViewDidDisappear;
/// UI
Prop_weak()UIViewController *fromVC;
Prop_strong(nullable)SPAlertController *alertController;
Prop_assign()ComingStyle pushOrPresent;
Prop_assign()BOOL setupNavigationBarHidden;
Prop_strong(nullable)__kindof UIView *statusBar;
Prop_strong(nullable)JobsNavBarConfig *navBarConfig;
Prop_strong(nullable)JobsNavBar *navBar;
Prop_copy(nullable)__kindof NSMutableArray <__kindof UIBarButtonItem *>*leftBarButtonItems;/// 左边UIBarButtonItem 数组
Prop_copy(nullable)__kindof NSMutableArray <__kindof UIBarButtonItem *>*rightBarButtonItems;/// 右边UIBarButtonItem 数组
Prop_copy(nullable)__kindof NSMutableArray <__kindof UIViewController *>*vcs;/// 子视图控制器 数组
Prop_strong(nullable)UIBarButtonItem *barButtonItem;
/// 更新状态栏颜色为自定义的颜色
-(jobsByCorBlock _Nonnull)updateStatusBarCor;
/// 恢复状态栏颜色
-(jobsByCorBlock _Nonnull)restoreStatusBarCor;
/// 让 UIView 像 UINavigationController 一样支持 push 和 pop
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView;
/// 查看用户数据
-(void)showUserInfo;
/// 铺满全屏展示的策略
-(void)fullScreenConstraintTargetView:(__kindof UIView *_Nonnull)view
                        topViewOffset:(CGFloat)topViewOffset;
@end

NS_ASSUME_NONNULL_END
/// 在 @implementation UIViewController (BaseVC) 实现。
#ifndef BaseViewControllerProtocol_synthesize_part1
#define BaseViewControllerProtocol_synthesize_part1 \
\
@synthesize navBar = _navBar;\
@synthesize navBarConfig = _navBarConfig;\

#endif /* BaseViewControllerProtocol_synthesize_part1 */

#ifndef BaseViewControllerProtocol_synthesize
#define BaseViewControllerProtocol_synthesize \
\
@synthesize fromVC = _fromVC;\
@synthesize alertController = _alertController;\
@synthesize pushOrPresent = _pushOrPresent;\
@synthesize setupNavigationBarHidden = _setupNavigationBarHidden;\
@synthesize LoadView = _LoadView;\
@synthesize ViewDidLoad = _ViewDidLoad;\
@synthesize ViewWillAppear = _ViewWillAppear;\
@synthesize ViewDidAppear = _ViewDidAppear;\
@synthesize ViewWillDisappear = _ViewWillDisappear;\
@synthesize ViewDidDisappear = _ViewDidDisappear;\
@synthesize statusBar = _statusBar;\
@synthesize leftBarButtonItems = _leftBarButtonItems;\
@synthesize rightBarButtonItems = _rightBarButtonItems;\
@synthesize vcs = _vcs;\
@synthesize barButtonItem = _barButtonItem;\

#endif /* BaseViewControllerProtocol_synthesize */

#ifndef BaseViewControllerProtocol_dynamic
#define BaseViewControllerProtocol_dynamic \
\
@dynamic fromVC;\
@dynamic alertController;\
@dynamic pushOrPresent;\
@dynamic setupNavigationBarHidden;\
@dynamic ViewAppear;\
@dynamic LoadView;\
@dynamic ViewDidLoad;\
@dynamic ViewWillAppear;\
@dynamic ViewDidAppear;\
@dynamic ViewWillDisappear;\
@dynamic ViewDidDisappear;\
@dynamic statusBar;\
@dynamic leftBarButtonItems;\
@dynamic rightBarButtonItems;\
@dynamic navBarConfig;\
@dynamic navBar;\
@dynamic vcs;\
@dynamic barButtonItem;\

#endif /* BaseViewControllerProtocol_dynamic */
