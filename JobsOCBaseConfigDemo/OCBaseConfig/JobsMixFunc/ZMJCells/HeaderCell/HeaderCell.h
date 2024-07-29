//
//  HeaderCell.h
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

NS_ASSUME_NONNULL_BEGIN

@interface HeaderCell : ZMJCell

@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UILabel *sortArrow;/// 排序的箭头

@end

NS_ASSUME_NONNULL_END
