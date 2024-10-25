//
//  JobsCustomTabBar.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsCustomTabBarConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCustomTabBar : UIView

-(jobsByVoidBlock _Nonnull)setup;
-(jobsByViewBlock _Nonnull)configMasonryBy;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsCustomTabBar *_Nonnull jobsMakeCustomTabBar(jobsByCustomTabBarBlock _Nonnull block){
    JobsCustomTabBar *data = JobsCustomTabBar.alloc.init;
    if (block) block(data);
    return data;
}
