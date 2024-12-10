//
//  SlotCell.h
//  FM
//
//  Created by User on 7/30/24.
//

#import <ZMJGanttChart/ZMJGanttChart.h>

NS_ASSUME_NONNULL_BEGIN

@interface SlotCell : ZMJCell

@property(nonatomic,assign)NSInteger minutes;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *tableHighlight;

@end

NS_ASSUME_NONNULL_END
