//
//  JobsBitsMonitorSuspendLab.h
//  JobsBitsMonitor
//
//  Created by Jobs on 2020/12/13.
//

#if __has_include(<ZWPullMenuView/ZWPullMenuView.h>)
#import <ZWPullMenuView/ZWPullMenuView.h>
#else
#import "ZWPullMenuView.h"
#endif

#import "JobsSuspendLab.h"
#import "JobsNetWorkTools.h"
#import "NSObject+WHToast.h" /// 提示
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
#import "UILabel+Extra.h"

NS_ASSUME_NONNULL_BEGIN
/// 显示风格：普通字符串 / 富文本
typedef NS_ENUM(NSUInteger, JobsBitsMonitorDisplayStyle) {
    JobsBitsMonitorDisplayStylePlainText = 0,
    JobsBitsMonitorDisplayStyleRichText
};

@interface JobsBitsMonitorSuspendLab : JobsSuspendLab

Prop_assign()JobsBitsMonitorDisplayStyle displayStyle;

-(JobsRetLabelByText _Nonnull)byText;
-(JobsRetLabelByAttributedString _Nonnull)byAttributedString;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsBitsMonitorSuspendLab *_Nonnull jobsMakeBitsMonitorSuspendLab(jobsByBitsMonitorSuspendLabBlock _Nonnull block){
    JobsBitsMonitorSuspendLab *data = JobsBitsMonitorSuspendLab.alloc.init;
    if (block) block(data);
    return data;
}
