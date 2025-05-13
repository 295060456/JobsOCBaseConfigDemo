//
//  JobsPopHelper.h
//  FMNormal
//
//  Created by Jobs on 2025/5/13.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "JobsDefineAllEnumHeader.h"
#import "JobsTransitionAnimator.h"

NS_ASSUME_NONNULL_BEGIN
/// 自定义手势返回方向
@interface JobsPopHelper : NSObject
<
UINavigationControllerDelegate
,UIGestureRecognizerDelegate
>

+(void)attachToViewController:(UIViewController *)viewController
           animationDirection:(JobsTransitionDirection)direction;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsPopHelper *_Nonnull jobsMakePopHelper(jobsByPopHelperBlock _Nonnull block){
    JobsPopHelper *data = JobsPopHelper.alloc.init;
    if (block) block(data);
    return data;
}
