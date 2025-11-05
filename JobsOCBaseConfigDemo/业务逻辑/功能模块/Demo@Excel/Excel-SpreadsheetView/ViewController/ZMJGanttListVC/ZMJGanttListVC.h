//
//  ZMJGanttListVC.h
//  FM
//
//  Created by User on 7/29/24.
//

#import "BaseViewController.h"

#if __has_include(<ZMJTipView/ZMJTipView.h>)
#import <ZMJTipView/ZMJTipView.h>
#else
#import "ZMJTipView.h"
#endif

#import "ZMJTask.h"

#import "ZMJHeaderCell.h"
#import "ZMJChartBarCell.h"
#import "ZMJTaskCell.h"
#import "ZMJTaskView.h"

typedef NS_ENUM(NSInteger, ZMJTimeUnit) {
    ZMJTimeUnit_week,
    ZMJTimeUnit_month,
    ZMJTimeUnit_year,
};

typedef NS_ENUM(NSInteger, ZMJDisplayMode) {
    ZMJDisplayMode_daily,
    ZMJDisplayMode_weekly,
    ZMJDisplayMode_monthly,
};

NS_ASSUME_NONNULL_BEGIN

@interface ZMJGanttListVC : BaseViewController
<
SpreadsheetViewDelegate
,SpreadsheetViewDataSource
,ZMJTipViewDelegate
>


@end

NS_ASSUME_NONNULL_END
