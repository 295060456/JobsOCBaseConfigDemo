//
//  JobsNavigationTransitionMgr.h
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import <Foundation/Foundation.h>
#import "UIViewController+Extra.h"
#import "JobsDefineAllEnumHeader.h"
#import "BaseProtocol.h"
#import "DefineProperty.h"
/// Push/pop 控制器的方向
#ifndef JOBS_TRANSITIONDIRECTION_TYPE_ENUM_DEFINED
#define JOBS_TRANSITIONDIRECTION_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, JobsTransitionDirection) {
    JobsTransitionDirectionTop,    /// 从上面进，回去也到上面
    JobsTransitionDirectionBottom  /// 从下面进，回去也到底部
    JobsTransitionDirectionLeft,   /// 从左边进，回去也到左边
    JobsTransitionDirectionRight,  /// 从右边进，回去也到右边
};
#endif /* JOBS_TRANSITIONDIRECTION_TYPE_ENUM_DEFINED */

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavigationTransitionMgr : NSObject
<
UINavigationControllerDelegate
,UIGestureRecognizerDelegate
,UIViewControllerAnimatedTransitioning
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
