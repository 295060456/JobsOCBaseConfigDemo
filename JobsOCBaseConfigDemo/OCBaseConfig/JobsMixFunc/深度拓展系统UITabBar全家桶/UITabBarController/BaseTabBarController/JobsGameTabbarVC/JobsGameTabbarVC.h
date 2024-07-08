//
//  JobsGameTabbarVC.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/8/24.
//

#import <UIKit/UIKit.h>
#import "UITabbarConfigProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsGameTabbarVC : UITabBarController
<
UITabBarControllerDelegate,
UIGestureRecognizerDelegate,
UITabbarConfigProtocol
>

@end

NS_ASSUME_NONNULL_END
