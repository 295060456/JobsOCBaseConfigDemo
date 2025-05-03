//
//  CustomTransitionAnimator.h
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"
#import "JobsDefineAllEnumHeader.h"
/// Push/pop 控制器的方向
#ifndef JOBS_TRANSITIONDIRECTION_TYPE_ENUM_DEFINED
#define JOBS_TRANSITIONDIRECTION_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, JobsTransitionDirection) {
    JobsTransitionDirectionLeft,   /// 从左边进，回去也到左边
    JobsTransitionDirectionRight,  /// 从右边进，回去也到右边
    JobsTransitionDirectionTop,    /// 从上面进，回去也到上面
    JobsTransitionDirectionBottom  /// 从下面进，回去也到底部
};
#endif /* JOBS_TRANSITIONDIRECTION_TYPE_ENUM_DEFINED */
NS_ASSUME_NONNULL_BEGIN

@interface JobsTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

Prop_assign()JobsTransitionDirection direction;
Prop_assign()BOOL isPush;

+(instancetype)animatorWithDirection:(JobsTransitionDirection)direction isPush:(BOOL)isPush;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTransitionAnimator *_Nonnull jobsMakeTransitionAnimator(jobsByTransitionAnimatorBlock _Nonnull block){
    JobsTransitionAnimator *data = JobsTransitionAnimator.alloc.init;
    if (block) block(data);
    return data;
}

