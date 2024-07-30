//
//  ChannelCell.h
//  FM
//
//  Created by User on 7/30/24.
//

#import <ZMJGanttChart/ZMJGanttChart.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChannelCell : ZMJCell

@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)NSString *channel;

@end

NS_ASSUME_NONNULL_END
