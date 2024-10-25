//
//  JobsCustomTabBarVC.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import <UIKit/UIKit.h>
#import "JobsCustomTabBar.h"
#import "JobsCustomTabBarConfig.h"
#import "MacroDef_Size.h"
#import "BaseProtocol.h"
#import "UIView+Measure.h"
#import "NSObject+AppTools.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCustomTabBarVC : UITabBarController<BaseProtocol>

-(void)customSelectIndex:(NSUInteger)index;
-(JobsCustomTabBar *)customTabBar;

@end

NS_ASSUME_NONNULL_END
