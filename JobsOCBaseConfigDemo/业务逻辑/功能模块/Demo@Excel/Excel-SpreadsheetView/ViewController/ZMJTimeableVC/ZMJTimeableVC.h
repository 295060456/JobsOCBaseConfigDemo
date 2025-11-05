//
//  ZMJTimeableVC.h
//  FM
//
//  Created by User on 7/29/24.
//

#import "BaseViewController.h"

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

#import "HourCell.h"
#import "ChannelCell.h"
#import "SlotCell.h"
#import "MyBlankCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMJTimeableVC : BaseViewController
<SpreadsheetViewDelegate, SpreadsheetViewDataSource>

@end

NS_ASSUME_NONNULL_END
