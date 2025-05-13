//
//  CustomNavigationTransitionManager.h
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import <Foundation/Foundation.h>
#import "JobsTransitionAnimator.h"
#import "BaseProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavigationTransitionManager : NSObject
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

NS_INLINE __kindof JobsNavigationTransitionManager *_Nonnull jobsMakeNavigationTransitionManager(jobsByNavigationTransitionManagerBlock _Nonnull block){
    JobsNavigationTransitionManager *data = JobsNavigationTransitionManager.alloc.init;
    if (block) block(data);
    return data;
}
