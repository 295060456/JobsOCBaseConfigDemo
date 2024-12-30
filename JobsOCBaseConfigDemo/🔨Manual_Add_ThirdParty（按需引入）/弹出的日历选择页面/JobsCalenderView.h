//
//  JobsCalenderView.h
//  FM
//
//  Created by User on 9/13/24.
//

#import "BaseView.h"
#import <EventKit/EventKit.h> /// 用来读取，修改和创建日历上的事件
#import "NSDate+Extra.h"

#if __has_include(<FSCalendar/FSCalendar.h>)
#import <FSCalendar/FSCalendar.h>
#else
#import "FSCalendar.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCalenderView : BaseView
<
FSCalendarDataSource
,FSCalendarDelegate
>

@end

NS_ASSUME_NONNULL_END
