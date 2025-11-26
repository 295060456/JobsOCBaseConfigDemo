//
//  UINavigationController+Extra.h
//  Casino
//
//  Created by Jobs on 2022/1/4.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsNavigationTransitionMgr.h"

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Extra)

+(JobsRetNavCtrByVCBlock _Nonnull)initBy;
-(UIViewController *)rootViewController;
-(jobsByNSUIntegerBlock _Nonnull)navDirectionBy;

@end

NS_ASSUME_NONNULL_END
