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

@property(nonatomic,copy)NSString *taskTitle;
@property(nonatomic,copy)NSString *startTime;
@property(nonatomic,copy)NSString *endTime;

@end
