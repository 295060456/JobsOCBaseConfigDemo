//
//  CustomTransitionAnimator.h
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"

typedef NS_ENUM(NSUInteger, CustomTransitionType) {
    CustomTransitionTypePushLeftToRight,
    CustomTransitionTypePopRightToLeft,
    CustomTransitionTypePushBottomToTop,
    CustomTransitionTypePopTopToBottom
};

NS_ASSUME_NONNULL_BEGIN

@interface JobsTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

Prop_assign()CustomTransitionType transitionType;

+(instancetype)animatorWithType:(CustomTransitionType)type;

@end

NS_ASSUME_NONNULL_END

//NS_INLINE __kindof UILabel *_Nonnull jobsMakeLabel(jobsByLabelBlock _Nonnull block){
//    UILabel *data = UILabel.alloc.init;
//    if (block) block(data);
//    return data;
//}
