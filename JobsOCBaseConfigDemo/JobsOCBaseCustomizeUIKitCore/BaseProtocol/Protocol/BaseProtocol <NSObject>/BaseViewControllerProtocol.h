//
//  BaseViewControllerProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "JobsBlock.h"
#import "JobsNavBar.h"

#if __has_include(<SPAlertController/SPAlertController.h>)
#import <SPAlertController/SPAlertController.h>
#else
#import "SPAlertController.h"
#endif

@class JobsBasePopupView;

#ifndef COMING_STYLE_ENUM_DEFINED
#define COMING_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, ComingStyle) {
    ComingStyle_PUSH = 0,
    ComingStyle_PRESENT
};
#endif /* COMING_STYLE_ENUM_DEFINED */

NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewControllerProtocol<BaseViewProtocol>
@optional
/// 生命周期监控
@property(nonatomic,assign)BOOL LoadView;
@property(nonatomic,assign)BOOL ViewDidLoad;
@property(nonatomic,assign)BOOL ViewWillAppear;
@property(nonatomic,assign)BOOL ViewDidAppear;
@property(nonatomic,assign)BOOL ViewWillDisappear;
@property(nonatomic,assign)BOOL ViewDidDisappear;
/// UI
@property(nonatomic,weak)UIViewController *fromVC;
@property(nonatomic,strong,nullable)SPAlertController *alertController;
@property(nonatomic,assign)ComingStyle pushOrPresent;
@property(nonatomic,assign)BOOL setupNavigationBarHidden;
@property(nonatomic,strong)__kindof UIView *statusBar;
@property(nonatomic,strong)JobsNavBarConfig *navBarConfig;
@property(nonatomic,strong)JobsNavBar *navBar;
@property(nonatomic,strong)NSMutableArray<__kindof UIBarButtonItem *> *leftBarButtonItems;/// 左边UIBarButtonItem 数组
@property(nonatomic,strong)NSMutableArray<__kindof UIBarButtonItem *> *rightBarButtonItems;/// 右边UIBarButtonItem 数组
@property(nonatomic,strong)NSMutableArray<__kindof UIViewController *> *vcs;/// 子视图控制器 数组
@property(nonatomic,strong)UIBarButtonItem *barButtonItem;
/// 更新状态栏颜色为自定义的颜色
-(jobsByCorBlock _Nonnull)updateStatusBarCor;
/// 恢复状态栏颜色
-(jobsByCorBlock _Nonnull)restoreStatusBarCor;
/// 让 UIView 像 UINavigationController 一样支持 push 和 pop
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView;
/// 查看用户数据
-(void)showUserInfo;
/// 铺满全屏展示的策略
-(void)fullScreenConstraintTargetView:(nonnull __kindof UIView *)view
                        topViewOffset:(CGFloat)topViewOffset;
@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize BaseViewControllerProtocol
#ifndef BaseViewControllerProtocol_synthesize
#define BaseViewControllerProtocol_synthesize \
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
//@synthesize navBar = _navBar;\ 在 @implementation UIViewController (BaseVC) 实现。这里不写
//@synthesize navBarConfig = _navBarConfig;\ 在 @implementation UIViewController (BaseVC) 实现。这里不写

#endif

#pragma mark —— @dynamic BaseViewControllerProtocol
#ifndef BaseViewControllerProtocol_dynamic
#define BaseViewControllerProtocol_dynamic \
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

#endif
