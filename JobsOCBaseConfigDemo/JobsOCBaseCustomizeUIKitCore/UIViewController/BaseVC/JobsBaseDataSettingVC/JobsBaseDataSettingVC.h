//
//  JobsBaseDataSettingVC.h
//  FM
//
//  Created by User on 9/9/24.
//

#import "JobsDebugVC.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsBaseDataSettingVC : JobsDebugVC
<
BaseViewControllerProtocol
,UIGestureRecognizerDelegate
,UIContentContainer
>

@end

NS_ASSUME_NONNULL_END
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
