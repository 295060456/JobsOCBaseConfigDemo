//
//  LZTabBarController.m
//  LZTabBarController
//
//  Created by Artron_LQQ on 2016/12/12.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZTabBarController.h"

@interface LZTabBarController ()

@property(nonatomic,strong)LZTabBar *customTabBar;
@property(nonatomic,strong)LZTabBarConfig *config;

@end

@implementation LZTabBarController

+ (instancetype)defaultTabBarController {
    return [LZTabBarController createTabBarController:nil];
}

+ (instancetype)createTabBarController:(tabBarBlock)block {
    static dispatch_once_t onceToken;
    static LZTabBarController *tabBar;
    dispatch_once(&onceToken, ^{
        tabBar = [LZTabBarController.alloc initWithBlock:block];
    });return tabBar;
}

- (instancetype)initWithBlock:(tabBarBlock)block {
    if (self = [super init]) {
        LZTabBarConfig *config = LZTabBarConfig.new;
        NSAssert(block, @"Param 'block' in zhe function, can not be nil");
        if (block) _config = block(config);
        NSAssert(_config.viewControllers, @"Param 'viewControllers' in the 'config', can not be nil");
        [self setupViewControllers];
        [self setupTabBar];
        _isAutoRotation = YES;
    }return self;
}

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    extern NSUInteger DefaultIndex;
    self.selectedIndex = DefaultIndex;
}
#pragma mark —— 一些公有方法
- (void)customSelectIndex:(NSUInteger)index {
    self.selectedIndex = index;
    /// TODO 系统的 UITabBarController 的切换方法没有暴露出来，但是实际情况是最好监控这个方法的运行机制，所以期望有一个高仿系统 self.selectedIndex 切换的逻辑
}

- (void)hiddenTabBarWithAnimation:(BOOL)isAnimation {
    if (isAnimation) {
        @jobs_weakify(self)
        [UIView animateWithDuration:0.2
                         animations:^{
            @jobs_strongify(self)
            self.customTabBar.alpha = 0;
        }];
    } else {
        self.customTabBar.alpha = 0;
    }
}

- (void)showTabBarWithAnimation:(BOOL)isAnimation {
    if (isAnimation) {
        @jobs_weakify(self)
        [UIView animateWithDuration:0.2 animations:^{
            @jobs_strongify(self)
            self.customTabBar.alpha = 1.0;
        }];
    } else {
        self.customTabBar.alpha = 1.0;
    }
}

- (void)setupViewControllers {
    if (_config.isNavigation) {
        NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:_config.viewControllers.count];
        for (UIViewController *vc in _config.viewControllers) {
            if (![vc isKindOfClass:UINavigationController.class]) {
                UINavigationController *nav = [UINavigationController.alloc initWithRootViewController:vc];
                [vcs addObject:nav];
            } else {
                [vcs addObject:vc];
            }
        }
        self.viewControllers = vcs.copy;
    } else {
        self.viewControllers = _config.viewControllers.copy;
    }
}

- (void)setupTabBar {
    NSMutableArray *items = NSMutableArray.array;
    LZTabBarItemType type;
    if ((_config.selectedImages.count > 0 || _config.normalImages.count > 0) && _config.titles.count > 0) {
        type = LZTabBarItemTypeDefault;
    } else if ((_config.selectedImages.count > 0 || _config.normalImages.count > 0) && _config.titles.count <= 0) {
        type = LZTabBarItemTypeImage;
    } else if ((_config.selectedImages.count <= 0 && _config.normalImages.count <= 0) && _config.titles.count > 0) {
        type = LZTabBarItemTypeText;
    } else {
        type = LZTabBarItemTypeDefault;
    }
    
    for (int i = 0; i < _config.viewControllers.count; i++) {
        LZTabBarItem *item = LZTabBarItem.new;
        item.type = type;
        if (i == 0) {
            item.icon = _config.selectedImages[i];
            if (_config.titles.count > 0) {
                item.titleColor = _config.selectedColor;
            }
        } else {
            item.icon = _config.normalImages[i];
            if (_config.titles.count > 0) {
                
                item.titleColor = _config.normalColor;
            }
        }
        if (i < _config.titles.count) {
            item.title = _config.titles[i];
        }
        
        [items addObject:item];
        item.tag = i;
    }
    // 隐藏掉系统的tabBar
    self.tabBar.hidden = YES;
    self.customTabBar.items = items.copy;
    self.customTabBar.frame = CGRectMake(0,
                                         CGRectGetHeight(self.view.frame) - JobsTabBarHeightByBottomSafeArea(self),
                                         CGRectGetWidth(self.view.frame),
                                         JobsTabBarHeightByBottomSafeArea(self));
    [self.view addSubview:self.customTabBar];
}
#pragma mark —— LZTabBarDelegate
- (void)tabBar:(LZTabBar *)tab 
 didSelectItem:(LZTabBarItem *)item 
       atIndex:(NSInteger)index {
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:0];
    for (UIView *view in tab.subviews) {
        if ([view isKindOfClass:LZTabBarItem.class]) {
            [items addObject:view];
        }
    }
    
    for (int i = 0; i < items.count; i++) {
        UIView *view = items[i];
        if ([view isKindOfClass:LZTabBarItem.class]) {
            LZTabBarItem *item = (LZTabBarItem *)view;
            item.icon = self.config.normalImages[i];
            if (self.config.titles.count > 0) {
                item.titleColor = _config.normalColor;
            }
        }
    }
    
    item.icon = self.config.selectedImages[index];
    if (self.config.titles.count > 0) {
        item.titleColor = self.config.selectedColor;
    }
//    self.selectedIndex = index;
    
    [self customSelectIndex:index];
    
    NSLog(@"SSS = %lu",(unsigned long)self.selectedIndex);
}
// 屏幕旋转时调整tabbar
- (void)viewWillTransitionToSize:(CGSize)size 
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    self.customTabBar.frame = CGRectMake(0, 
                                         size.height - JobsTabBarHeightByBottomSafeArea(self),
                                         size.width,
                                         JobsTabBarHeightByBottomSafeArea(self));
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
/// 适配横屏
- (BOOL)shouldAutorotate {
    return self.isAutoRotation;
}
#pragma clang diagnostic pop
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (self.isAutoRotation) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (LZTabBar *)customTabBar {
    if (_customTabBar == nil) {
        _customTabBar = LZTabBar.new;
        _customTabBar.delegate = self;
    }return _customTabBar;
}

@end
