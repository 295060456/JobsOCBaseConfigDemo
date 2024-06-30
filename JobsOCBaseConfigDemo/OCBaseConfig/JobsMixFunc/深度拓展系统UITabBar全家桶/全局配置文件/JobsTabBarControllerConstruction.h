//
//  JobsTabBarControllerConstruction.h
//  DouDong-II
//
//  Created by Jobs on 2021/1/11.
//

#import "TLTabBarAnimation.h"
#import "UITabBarItem+TLAnimation.h"
#import "MacroDef_Func.h"
#import "AppDelegate.h"

#pragma mark —— 创建动画函数
static inline TLBounceAnimation *bounceAnimation(void){
    TLBounceAnimation *anm = TLBounceAnimation.alloc.init;
    anm.isPlayFireworksAnimation = YES;
    return anm;
}

static inline TLRotationAnimation *rotationAnimation(void){
    TLRotationAnimation *anm = TLRotationAnimation.alloc.init;
    return anm;
}

static inline TLTransitionAniamtion *transitionAniamtion(void){
    TLTransitionAniamtion *anm = TLTransitionAniamtion.alloc.init;
    anm.direction = 1; // 1~6
    anm.disableDeselectAnimation = NO;
    return anm;
}

static inline TLFumeAnimation *fumeAnimation(void){
    TLFumeAnimation *anm = TLFumeAnimation.alloc.init;
    return anm;
}

static inline NSArray *imgs(void){//静态轮播图
    NSMutableArray *temp = NSMutableArray.array;
    for (NSInteger i = 28 ; i <= 65; i++) {
        NSString *imgName = [NSString stringWithFormat:@"Tools_000%zi", i];
        CGImageRef img = JobsIMG(imgName).CGImage;
        [temp addObject:(__bridge id _Nonnull)(img)];
    }return temp;
}

static inline TLFrameAnimation *frameAnimation(void){
    TLFrameAnimation *anm = TLFrameAnimation.alloc.init;
    anm.images = imgs();
    anm.isPlayFireworksAnimation = YES;
    return anm;
}
#pragma mark —— 给UITabBarItem绑定动画
/// 给UITabBarItem绑定动画
static inline void setAnimation(UITabBarItem *item,
                                NSInteger index) {
     item.animation = @[
                       bounceAnimation(),
                       rotationAnimation(),
                       transitionAniamtion(),
                       fumeAnimation(),
                       frameAnimation()
                       ][index];
}
/*  系统样式UITabBarItem
 *  UITabBarSystemItemMore,
 *  UITabBarSystemItemFavorites,
 *  UITabBarSystemItemFeatured,
 *  UITabBarSystemItemTopRated,
 *  UITabBarSystemItemRecents,
 *  UITabBarSystemItemContacts,
 *  UITabBarSystemItemHistory,
 *  UITabBarSystemItemBookmarks,
 *  UITabBarSystemItemSearch,
 *  UITabBarSystemItemDownloads,
 *  UITabBarSystemItemMostRecent,
 *  UITabBarSystemItemMostViewed,
 */
static inline UIViewController *childViewController_SystemStyle(UIViewController *viewController,
                                                                UITabBarSystemItem systemItem,
                                                                NSUInteger tag){
    viewController.view.backgroundColor = UIColor.whiteColor;
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:systemItem
                                                                           tag:tag];
    setAnimation(viewController.tabBarItem, tag);//可选实现
    return viewController;
}
