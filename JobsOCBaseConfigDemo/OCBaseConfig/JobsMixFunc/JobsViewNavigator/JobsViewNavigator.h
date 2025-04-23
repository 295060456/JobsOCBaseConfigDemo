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

-(JobsReturnViewNavigatorByViewAndAnimatedBlock _Nonnull)pushView;
-(JobsReturnViewNavigatorByBOOLBlock _Nonnull)popViewAnimated;
-(JobsReturnViewNavigatorByBOOLBlock _Nonnull)popToRootViewAnimated;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsViewNavigator *_Nonnull jobsMakeViewNavigator(jobsByViewNavigatorBlock _Nonnull block){
    JobsViewNavigator *data = JobsViewNavigator.alloc.init;
    if (block) block(data);
    return data;
}
