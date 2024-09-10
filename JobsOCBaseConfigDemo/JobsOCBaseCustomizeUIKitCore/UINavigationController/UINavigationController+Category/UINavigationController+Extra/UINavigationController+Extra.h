//
//  UINavigationController+Extra.h
//  Casino
//
//  Created by Jobs on 2022/1/4.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Extra)

+(JobsReturnNavCtrByVC)initByRootVC;

-(UIViewController *)rootViewController;

@end

NS_ASSUME_NONNULL_END
