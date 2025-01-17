//
//  UIViewController+BaseNavigationBar.h
//  UBallLive
//
//  Created by Jobs on 2020/10/21.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "BaseNavigationBar.h"
#import "MacroDef_Cor.h"
#import "MacroDef_Size.h"
#import "JobsLoadingImage.h"
#import "UIViewController+BaseVC.h"

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

NS_ASSUME_NONNULL_BEGIN
// 自定义 BaseNavigationBar
@interface UIViewController (BaseNavigationBar)

@property(nonatomic,strong)BaseNavigationBar *navigationBar;
@property(nonatomic,strong)UIBarButtonItem *leftBarButtonItem_back;
@property(nonatomic,strong)UINavigationItem *navItem;
@property(nonatomic,strong)UIColor *bgCor;
@property(nonatomic,assign)CGFloat jobsNavigationBarHeight;
@property(nonatomic,assign)BOOL isHiddenNavigationBar;
@property(nonatomic,assign)BOOL isBarTranslucent;
@property(nonatomic,strong)UIColor *tintColor;
@property(nonatomic,strong)UIColor *barTintColor;
@property(nonatomic,copy)NSString *title;
//titleTextAttributes
@property(nonatomic,strong)NSShadow *shadow;
@property(nonatomic,strong)UIColor *shadowCor;
@property(nonatomic,strong)UIColor *foregroundColorAttributeNameCor;
@property(nonatomic,strong)UIFont *fontAttributeName;

@end

NS_ASSUME_NONNULL_END
/**
 *  要想隐藏系统的导航栏，这里有2个手段。一个是在UIViewController的基类，一个是在UIViewController的分类
 * 1、如果要在viewDidLoad实现隐藏系统的导航栏，则调用UIViewController基类的父类方法self.setupNavigationBarHidden = YES;
 * 2、如果要在viewWillAppear实现隐藏系统的导航栏，则调用UIViewController分类的方法self.isHiddenNavigationBar = YES;//禁用系统的导航栏
 */
