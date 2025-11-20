//
//  UIView+JobsNetworkListener.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/19/25.
//

#import "UIView+JobsNetworkListener.h"

@implementation UIView (JobsNetworkListener)
JobsKey(_kJobsNetworkListenerKey)
-(JobsBitsMonitorSuspendLab *)makeNetworkListener {
    JobsBitsMonitorSuspendLab *lab = Jobs_getAssociatedObject(_kJobsNetworkListenerKey);
    if (!lab) {
        lab = jobsMakeBitsMonitorSuspendLab(^(__kindof JobsBitsMonitorSuspendLab * _Nullable label) {
            label.byFrame(CGRectMake(self.bounds.size.width - 140 - 12,
                                     self.safeAreaInsets.top + 12,
                                     140,
                                     40));
            label.userInteractionEnabled = YES;
            [self addSubview:label];
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_kJobsNetworkListenerKey, lab)
    }return lab;
}

@end
