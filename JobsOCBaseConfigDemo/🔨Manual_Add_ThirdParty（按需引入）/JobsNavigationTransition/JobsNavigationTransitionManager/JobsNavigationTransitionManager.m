//
//  CustomNavigationTransitionManager.m
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import "JobsNavigationTransitionManager.h"

@implementation JobsNavigationTransitionManager
static JobsTransitionDirection _storedDirection;
static JobsNavigationTransitionManager *static_navigationTransitionManager = nil;
static dispatch_once_t static_navigationTransitionManagerOnceToken;
/// 单例化和销毁
+(void)destroySingleton{
    static_navigationTransitionManagerOnceToken = 0;
    static_navigationTransitionManager = nil;
}

+(instancetype)sharedManager{
    dispatch_once(&static_navigationTransitionManagerOnceToken, ^{
        static_navigationTransitionManager = JobsNavigationTransitionManager.new;
    });return static_navigationTransitionManager;
}

+(void)setDirection:(JobsTransitionDirection)direction
forNavigationController:(UINavigationController *)navCtrlVC{
    _storedDirection = direction;
    navCtrlVC.delegate = self.sharedManager;
}
#pragma mark —— UINavigationControllerDelegate
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                 animationControllerForOperation:(UINavigationControllerOperation)operation
                                              fromViewController:(UIViewController *)fromVC
                                                toViewController:(UIViewController *)toVC {
    if(operation == UINavigationControllerOperationPush) return JobsTransitionAnimator.animatorByPushDirection(_storedDirection);
    if(operation == UINavigationControllerOperationPop) return JobsTransitionAnimator.animatorByPopDirection(_storedDirection);
    return nil;
}

@end
