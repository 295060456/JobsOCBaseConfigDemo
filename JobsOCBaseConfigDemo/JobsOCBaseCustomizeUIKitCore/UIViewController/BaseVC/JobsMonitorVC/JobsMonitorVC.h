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
