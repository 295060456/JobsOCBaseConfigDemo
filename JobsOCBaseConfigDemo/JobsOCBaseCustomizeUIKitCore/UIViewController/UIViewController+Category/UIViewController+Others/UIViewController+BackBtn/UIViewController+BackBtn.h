//
//  UIViewController+BackBtn.h
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "LoadingImage.h"
#import "MacroDef_Cor.h"
#import "MacroDef_App.h"
#import "MacroDef_String.h"
#import "BaseViewControllerProtocol.h"
#import "UIButton+ImageTitleSpacing.h"
#import "UIButton+UI.h"

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BackBtn)<BaseViewControllerProtocol>

#pragma mark —— BaseVC+BackBtn
@property(nonatomic,strong)UIButton *backBtnCategory;
@property(nonatomic,strong)UIBarButtonItem *backBtnCategoryItem;
/// 创建返回键，没有配置按钮的normalImage属性
-(UIButton *)makeBackBtn:(UIViewModel *)viewModel;
/// 配置返回键图片
-(UIImage *)makeBackBtnImage;
///【子类需要覆写 】创建返回键的点击事件
-(void)backBtnClickEvent:(UIButton *_Nullable)sender;

@end

NS_ASSUME_NONNULL_END
