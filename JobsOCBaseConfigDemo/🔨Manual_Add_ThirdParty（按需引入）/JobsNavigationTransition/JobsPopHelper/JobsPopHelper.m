//
//  JobsPopHelper.m
//  FMNormal
//
//  Created by Jobs on 2025/5/13.
//

#import "JobsPopHelper.h"

@interface JobsPopHelper ()

Prop_weak()UIViewController *viewController;
Prop_assign()JobsTransitionDirection direction;
Prop_strong()UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation JobsPopHelper

+(void)attachToViewController:(UIViewController *)viewController
           animationDirection:(JobsTransitionDirection)direction {
    JobsPopHelper *popHelper = jobsMakePopHelper(^(__kindof JobsPopHelper * _Nullable helper) {
        helper.viewController = viewController;
        helper.direction = direction;
    });
    /// 关联对象，防止被释放
    objc_setAssociatedObject(viewController,
                             _cmd,
                             popHelper,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    /// 禁用系统的 pop 手势
    viewController.navigationController.interactivePopGestureRecognizer.enabled = NO;
    /// 设置导航控制器代理
    viewController.navigationController.delegate = popHelper;
    /// 添加自定义滑动手势
    viewController.view.addGesture([jobsMakePanGesture(^(__kindof UIPanGestureRecognizer * _Nullable gesture) {
        gesture.delegate = popHelper;
    }) GestureActionBy:^(UIPanGestureRecognizer * _Nullable gesture) {
        CGPoint translation = [gesture translationInView:gesture.view];
        CGFloat progress = translation.x / gesture.view.bounds.size.width;
        /// 右往左滑动手势
        if (direction == JobsTransitionDirectionRight && translation.x < 0) progress = -progress; /// 转为正值
        switch (gesture.state) {
            case UIGestureRecognizerStateBegan:
                popHelper.interactiveTransition = UIPercentDrivenInteractiveTransition.new;
                [viewController.navigationController popViewControllerAnimated:YES];
                break;
            case UIGestureRecognizerStateChanged:
                [popHelper.interactiveTransition updateInteractiveTransition:progress];
                break;
            case UIGestureRecognizerStateEnded:
            case UIGestureRecognizerStateCancelled: {
                if (progress > 0.3) {
                    [popHelper.interactiveTransition finishInteractiveTransition];
                } else {
                    [popHelper.interactiveTransition cancelInteractiveTransition];
                }popHelper.interactiveTransition = nil;
            } break;

            default:
                break;
        }
    }]);
}
#pragma mark —— UINavigationControllerDelegate
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                      interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactiveTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    @jobs_weakify(self)
    if (operation == UINavigationControllerOperationPop) {
        return jobsMakeTransitionAnimator(^(__kindof JobsTransitionAnimator * _Nullable animator) {
            @jobs_strongify(self)
            animator.direction = self.direction;
        });
    }return nil;
}
#pragma mark —— LazyLoad

@end
