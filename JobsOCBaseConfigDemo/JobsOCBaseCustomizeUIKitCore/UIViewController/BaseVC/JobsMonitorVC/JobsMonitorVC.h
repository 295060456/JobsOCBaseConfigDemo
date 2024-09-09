//
//  JobsMonitorVC.h
//  FM
//
//  Created by User on 9/9/24.
//

#import "JobsBaseDataSettingVC.h"
#import "JobsBlock.h"
#import "NSObject+Extras.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMonitorVC : JobsBaseDataSettingVC

-(jobsByVoidBlock _Nonnull)语言切换的监听;
-(jobsByVoidBlock _Nonnull)设备方向的监听;

@end

NS_ASSUME_NONNULL_END
/**
    加入键盘监听者 和 停止MJ_Refresh刷新 移到了NSObject 分类层，定位于 @interface NSObject (Extras)。这么做是考虑到调用类可能不仅仅局限于UIViewController

    -(void)keyboard;//加入键盘通知的监听者
    -(void)endRefreshing:(UIScrollView *_Nonnull)targetScrollView; 停止刷新
 */
