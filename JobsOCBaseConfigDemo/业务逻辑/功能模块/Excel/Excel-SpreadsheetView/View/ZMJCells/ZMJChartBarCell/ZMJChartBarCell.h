//
//  ZMJChartBarCell.h
//  FM
//
//  Created by User on 7/27/24.
//

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

#import "ZMJCell+CustomView.h"

typedef NS_ENUM(NSInteger, ZMJDashlineDirection) {
    ZMJDashlineDirectionNone = 0,
    ZMJDashlineDirectionLeft ,
    ZMJDashlineDirectionRight,
};

NS_ASSUME_NONNULL_BEGIN

@interface ZMJChartBarCell : ZMJCell

Prop_strong()UIView *colorBarView;
Prop_strong()UIColor *color;
Prop_assign()ZMJDashlineDirection direction;

@end

NS_ASSUME_NONNULL_END
