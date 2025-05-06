//
//  UIViewController+GKCustomNavigationBar.h
//  FMNormal
//
//  Created by Jobs on 2025/5/5.
//

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#import "UIButtonModel.h"
#import "UIView+Extras.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 针对 GKNavigationBar的标题只能是文字的一种拓展性操作，使之兼容图片
@interface UIViewController (GKCustomNavigationBar)

Prop_strong(nullable)__kindof UIButtonModel *gk_navTitleBtnModel;
Prop_strong(nullable)__kindof UIButton *gk_navTitleBtn;

-(JobsReturnGKNavBarByButtonModelBlock _Nonnull)gk_navTitleBtnBy;

@end

NS_ASSUME_NONNULL_END
