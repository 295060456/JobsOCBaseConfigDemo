#import <UIKit/UIKit.h>

@interface JobsPresentationCtrl : UIPresentationController 
<
UIViewControllerTransitioningDelegate,
UIViewControllerAnimatedTransitioning
>

@end
/**
 自定义高度的模态推送控制器使用示例
 1、如果self = ViewController
 JobsPresentedVC *vc = JobsPresentedVC.new;
 JobsPresentationCtrl *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
 presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:vc presentingViewController:self];
 vc.presentUpHeight = JobsWidth(200);
 vc.view.backgroundColor = JobsRedColor;
 vc.transitioningDelegate = presentationController;
 
 [self presentViewController:vc animated:YES completion:NULL];
 
 2、如果self = View
 JobsCommentCoreVC *jobsCommentCoreVC = JobsCommentCoreVC.new;
 JobsPresentationCtrl *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
 presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:jobsCommentCoreVC presentingViewController:self.jobsGetCurrentViewController];
 jobsCommentCoreVC.presentUpHeight = JobsWidth(800);
 /// jobsCommentCoreVC.view.backgroundColor = JobsRedColor;
 jobsCommentCoreVC.transitioningDelegate = presentationController;
 
 [self forceComingToPresentVC:jobsCommentCoreVC
                requestParams:JobsInternationalization(@"")
                   completion:nil];
 
 */
