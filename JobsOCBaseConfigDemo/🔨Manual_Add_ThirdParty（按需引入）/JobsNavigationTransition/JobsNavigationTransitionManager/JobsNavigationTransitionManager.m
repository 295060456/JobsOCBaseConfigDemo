//
//  CustomNavigationTransitionManager.m
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import "JobsNavigationTransitionManager.h"

@interface JobsNavigationTransitionManager ()

Prop_weak()UIViewController *viewController;
Prop_assign()JobsTransitionDirection direction;
Prop_strong()UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

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

+(void)attachToViewController:(UIViewController *)viewController
           animationDirection:(JobsTransitionDirection)direction {
    JobsNavigationTransitionManager *manager = jobsMakeNavigationTransitionManager(^(__kindof JobsNavigationTransitionManager * _Nullable manager) {
        manager.viewController = viewController;
        manager.direction = direction;
    });
    /// 关联对象，防止被释放
    objc_setAssociatedObject(viewController,
                             _cmd,
                             manager,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    /// 禁用系统的 pop 手势
    viewController.navigationController.interactivePopGestureRecognizer.enabled = NO;
    /// 设置导航控制器代理
    viewController.navigationController.delegate = manager;
    /// 添加自定义滑动手势
    viewController.view.addGesture([jobsMakePanGesture(^(__kindof UIPanGestureRecognizer * _Nullable gesture) {
        gesture.delegate = manager;
    }) GestureActionBy:^(UIPanGestureRecognizer * _Nullable gesture) {
        CGPoint translation = [gesture translationInView:gesture.view];
        CGFloat progress = translation.x / gesture.view.bounds.size.width;
        /// 右往左滑动手势
        if (direction == JobsTransitionDirectionRight && translation.x < 0) progress = -progress; /// 转为正值
        switch (gesture.state) {
            case UIGestureRecognizerStateBegan:
                manager.interactiveTransition = UIPercentDrivenInteractiveTransition.new;
                [viewController.navigationController popViewControllerAnimated:YES];
                break;
            case UIGestureRecognizerStateChanged:
                [manager.interactiveTransition updateInteractiveTransition:progress];
                break;
            case UIGestureRecognizerStateEnded:
            case UIGestureRecognizerStateCancelled: {
                if (progress > 0.3) {
                    [manager.interactiveTransition finishInteractiveTransition];
                } else {
                    [manager.interactiveTransition cancelInteractiveTransition];
                }manager.interactiveTransition = nil;
            } break;
            default:break;
        }
    }]);
}
#pragma mark —— UINavigationControllerDelegate
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                      interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactiveTransition;
}

+(void)setDirection:(JobsTransitionDirection)direction
forNavigationController:(UINavigationController *)navCtrlVC{
    _storedDirection = direction;
    navCtrlVC.delegate = self.sharedManager;
}
#pragma mark —— UINavigationControllerDelegate
/// 当前导航操作（push 或 pop）时，应该使用哪个自定义转场动画对象
/// - Parameters:
///   - navigationController: 当前正在执行操作的导航控制器
///   - operation: 导航操作的类型（push / pop）
///   - fromVC: 当前正在离开的控制器（源）
///   - toVC: 当前正在进入的控制器（目标）
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                 animationControllerForOperation:(UINavigationControllerOperation)operation
                                              fromViewController:(UIViewController *)fromVC
                                                toViewController:(UIViewController *)toVC {
    if(operation == UINavigationControllerOperationPush) return JobsTransitionAnimator.animatorByPushDirection(_storedDirection);
    if(operation == UINavigationControllerOperationPop) return JobsTransitionAnimator.animatorByPopDirection(_storedDirection);
    return nil;
}

@end
