//
//  SlotCell.h
//  FM
//
//  Created by User on 7/30/24.
//

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SlotCell : ZMJCell

Prop_assign()NSInteger minutes;
Prop_copy()NSString *title;
Prop_copy()NSString *tableHighlight;

@end

NS_ASSUME_NONNULL_END
