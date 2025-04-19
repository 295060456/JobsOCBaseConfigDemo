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

@property(nonatomic,assign)NSInteger minutes;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *tableHighlight;

@end

NS_ASSUME_NONNULL_END
