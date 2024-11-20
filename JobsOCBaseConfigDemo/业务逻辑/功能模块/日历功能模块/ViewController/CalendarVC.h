//
//  CalendarVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 20/11/2024.
//

#import "BaseViewController.h"
#import <EventKit/EventKit.h> /// 用来读取，修改和创建日历上的事件

#if __has_include(<FSCalendar/FSCalendar.h>)
#import <FSCalendar/FSCalendar.h>
#else
#import "FSCalendar.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface CalendarVC : BaseViewController
<
FSCalendarDataSource
,FSCalendarDelegate
,FSCalendarDelegateAppearance
>

@end

NS_ASSUME_NONNULL_END
