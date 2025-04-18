//
//  JobsBitsMonitorSuspendLab.h
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#import "JobsSuspendLab.h"

#if __has_include(<ZWPullMenuView/ZWPullMenuView.h>)
#import <ZWPullMenuView/ZWPullMenuView.h>
#else
#import "ZWPullMenuView.h"
#endif

#import "JobsBitsMonitorCore.h"
#import "NSObject+WHToast.h" /// 提示
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
#import "UILabel+Extra.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsBitsMonitorSuspendLab : JobsSuspendLab

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsBitsMonitorSuspendLab *_Nonnull jobsMakeBitsMonitorSuspendLab(jobsByBitsMonitorSuspendLabBlock _Nonnull block){
    JobsBitsMonitorSuspendLab *data = JobsBitsMonitorSuspendLab.alloc.init;
    if (block) block(data);
    return data;
}
