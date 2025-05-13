//
//  JobsNavigationTransitionMgr.h
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import <Foundation/Foundation.h>
#import "JobsTransitionAnimator.h"
#import "BaseProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavigationTransitionMgr : NSObject
<
UINavigationControllerDelegate
,UIGestureRecognizerDelegate
,BaseProtocol
>

+(void)setDirection:(JobsTransitionDirection)direction
forNavigationController:(UINavigationController *)navCtrlVC;

+(void)attachToViewController:(UIViewController *)viewController
           animationDirection:(JobsTransitionDirection)direction;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsNavigationTransitionMgr *_Nonnull jobsMakeNavigationTransitionMgr(jobsByNavigationTransitionManagerBlock _Nonnull block){
    JobsNavigationTransitionMgr *data = JobsNavigationTransitionMgr.alloc.init;
    if (block) block(data);
    return data;
}
