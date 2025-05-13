//
//  JobsNavigationTransitionMgr.m
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import "JobsNavigationTransitionMgr.h"

@interface JobsNavigationTransitionMgr ()

Prop_weak()UIViewController *viewController;
Prop_assign()JobsTransitionDirection direction;
Prop_strong()UIPercentDrivenInteractiveTransition *interactiveTransition;
Prop_assign()ComingStyle comingStyle;

@end

@implementation JobsNavigationTransitionMgr
static JobsTransitionDirection _storedDirection;
static JobsNavigationTransitionMgr *static_navigationTransitionMgr = nil;
static dispatch_once_t static_navigationTransitionManagerOnceToken;
/// 单例化和销毁
+(void)destroySingleton{
    static_navigationTransitionManagerOnceToken = 0;
    static_navigationTransitionMgr = nil;
}

+(instancetype)sharedManager{
    dispatch_once(&static_navigationTransitionManagerOnceToken, ^{
        static_navigationTransitionMgr = JobsNavigationTransitionMgr.new;
    });return static_navigationTransitionMgr;
}
#pragma mark —— 一些私有方法
-(BOOL)isPush{
    return self.comingStyle == ComingStyle_PUSH;
}
#pragma mark —— 一些公共方法
+(void)setDirection:(JobsTransitionDirection)direction
forNavigationController:(UINavigationController *)navCtrlVC{
    _storedDirection = direction;
    navCtrlVC.delegate = self.sharedManager;
}

+(void)attachToViewController:(UIViewController *)viewController
           animationDirection:(JobsTransitionDirection)direction {
    JobsNavigationTransitionMgr *manager = jobsMakeNavigationTransitionMgr(^(__kindof JobsNavigationTransitionMgr * _Nullable manager) {
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
/// 当导航控制器要执行动画切换时，询问是否需要一个交互式的转场控制器
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                      interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactiveTransition;
}
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
    if(operation == UINavigationControllerOperationPush){
        return jobsMakeNavigationTransitionMgr(^(__kindof JobsNavigationTransitionMgr * _Nullable manager) {
            manager.direction = _storedDirection;
            manager.comingStyle = ComingStyle_PUSH;
        });
    }
    if(operation == UINavigationControllerOperationPop){
        return jobsMakeNavigationTransitionMgr(^(__kindof JobsNavigationTransitionMgr * _Nullable manager) {
            manager.direction = _storedDirection;
            manager.comingStyle = ComingStyle_POP;
        });
    }return nil;
}
#pragma mark —— UIViewControllerAnimatedTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    CGRect screenBounds = UIScreen.mainScreen.bounds;

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
        containerView.addSubview(toVC.view);
        toVC.view.frame = toStartFrame;
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
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}


@end
