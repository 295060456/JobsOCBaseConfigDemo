//
//  ZMJCell+CustomView.h
//  Casino
//
//  Created by Jobs on 2021/12/8.
//

#import <UIKit/UIKit.h>

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface ZMJCell (CustomView)

@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UIView *colorBarView;
@property(nonatomic,strong)UIColor *color;

@end

NS_ASSUME_NONNULL_END
