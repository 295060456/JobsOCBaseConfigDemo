//
//  CustomNavigationTransitionManager.h
//  FMNormal
//
//  Created by Jobs on 2025/5/4.
//

#import <Foundation/Foundation.h>
#import "JobsTransitionAnimator.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavigationTransitionManager : NSObject<UINavigationControllerDelegate>

+(void)setDirection:(JobsTransitionDirection)direction
forNavigationController:(UINavigationController *)navCtrlVC;

@end

NS_ASSUME_NONNULL_END
