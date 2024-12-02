//
//  JobsViewNavigator.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/3/24.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsViewNavigator : UIView

-(jobsByViewAndAnimatedBlock _Nonnull)pushView;
-(jobsByBOOLBlock _Nonnull)popViewAnimated;

@end

NS_ASSUME_NONNULL_END
