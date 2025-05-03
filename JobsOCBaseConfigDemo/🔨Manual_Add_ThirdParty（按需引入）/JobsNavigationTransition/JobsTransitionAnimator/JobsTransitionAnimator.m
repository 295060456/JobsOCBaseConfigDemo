//
//  CustomTransitionAnimator.m
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import "JobsTransitionAnimator.h"

@implementation JobsTransitionAnimator

+(instancetype)animatorWithDirection:(JobsTransitionDirection)direction isPush:(BOOL)isPush{
    return jobsMakeTransitionAnimator(^(__kindof JobsTransitionAnimator * _Nullable transitionAnimator) {
        transitionAnimator.direction = direction;
        transitionAnimator.isPush = isPush;
    });
}
#pragma mark —— UIViewControllerAnimatedTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    CGRect screenBounds = [UIScreen mainScreen].bounds;

    CGRect toStartFrame = screenBounds;
    CGRect fromEndFrame = screenBounds;

    CGFloat w = screenBounds.size.width;
    CGFloat h = screenBounds.size.height;

    switch (self.direction) {
        case JobsTransitionDirectionLeft:
            toStartFrame = self.isPush ? CGRectOffset(screenBounds, -w, 0) : screenBounds;
            fromEndFrame = self.isPush ? screenBounds : CGRectOffset(screenBounds, -w, 0);
            break;
        case JobsTransitionDirectionRight:
            toStartFrame = self.isPush ? CGRectOffset(screenBounds, w, 0) : screenBounds;
            fromEndFrame = self.isPush ? screenBounds : CGRectOffset(screenBounds, w, 0);
            break;
        case JobsTransitionDirectionTop:
            toStartFrame = self.isPush ? CGRectOffset(screenBounds, 0, -h) : screenBounds;
            fromEndFrame = self.isPush ? screenBounds : CGRectOffset(screenBounds, 0, -h);
            break;
        case JobsTransitionDirectionBottom:
            toStartFrame = self.isPush ? CGRectOffset(screenBounds, 0, h) : screenBounds;
            fromEndFrame = self.isPush ? screenBounds : CGRectOffset(screenBounds, 0, h);
            break;
    }

    if (self.isPush) {
        toVC.view.frame = toStartFrame;
        containerView.addSubview(toVC.view);
    } else {
        [containerView insertSubview:toVC.view belowSubview:fromVC.view];
        toVC.view.frame = screenBounds;
    }

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (self.isPush) {
            toVC.view.frame = screenBounds;
            fromVC.view.frame = screenBounds;
        } else {
            fromVC.view.frame = fromEndFrame;
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
