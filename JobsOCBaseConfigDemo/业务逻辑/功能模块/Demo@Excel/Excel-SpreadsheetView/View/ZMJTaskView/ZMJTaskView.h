//
//  ZMJTaskView.h
//  ZMJTipView_Example
//
//  Created by Jason on 2018/2/11.
//  Copyright © 2018年 keshiim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Measure.h"

#if __has_include(<ZMJTipView/ZMJTipView.h>)
#import <ZMJTipView/ZMJTipView.h>
#else
#import "ZMJTipView.h"
#endif

@interface ZMJTaskView : UIView<ZMJTipCustomViewProtocol>

Prop_copy()NSString *taskTitle;
Prop_copy()NSString *startTime;
Prop_copy()NSString *endTime;

@end
