//
//  JobsCustomTabBarVC.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import <UIKit/UIKit.h>
#import "JobsCustomTabBar.h"
#import "JobsCustomTabBarConfig.h"

#import "UIView+Measure.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCustomTabBarVC : UITabBarController

+(instancetype)sharedManager;
+(void)destroyInstance;

-(void)customSelectIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
