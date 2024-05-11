//
//  ZMJCells.h
//  ZMJGanttChart_Example
//
//  Created by Jason on 2018/1/29.
//  Copyright © 2018年 keshiim. All rights reserved.
//

#import "UIKit/UIKit.h"

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

#pragma mark —— ZMJHeaderCell
@interface ZMJHeaderCell : ZMJCell
@end
#pragma mark —— ZMJTextCell
@interface ZMJTextCell : ZMJCell
@end
#pragma mark —— ZMJTaskCell
@interface ZMJTaskCell : ZMJCell
@end
#pragma mark —— ZMJChartBarCell
@interface ZMJChartBarCell : ZMJCell
@end
