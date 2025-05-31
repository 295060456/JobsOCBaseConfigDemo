//
//  UITabBarController+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/5/31.
//

#import <UIKit/UIKit.h>
#import "AppDelegate+TabBarCtr.h"
#import "JobsCustomTabBar.h"
#import "JobsBlock.h"
#import "UIView+Measure.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (Extra)

-(jobsByCGFloatBlock _Nonnull)resetSubVCViewHeightBy;
-(jobsByVoidBlock _Nonnull)resetSubVCViewHeight;

@end

NS_ASSUME_NONNULL_END
