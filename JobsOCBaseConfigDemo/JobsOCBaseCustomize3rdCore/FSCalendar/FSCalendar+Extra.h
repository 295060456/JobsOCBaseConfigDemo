//
//  FSCalendar+Extra.h
//  FM
//
//  Created by Admin on 28/12/2024.
//

#import "FSCalendar.h"

#if __has_include(<FSCalendar/FSCalendar.h>)
#import <FSCalendar/FSCalendar.h>
#else
#import "FSCalendar.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FSCalendar (Extra)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FSCalendar *_Nonnull jobsMakeFSCalendar(jobsByFSCalendarBlock _Nonnull block){
    FSCalendar *data = [FSCalendar.alloc initWithFrame:CGRectZero];
    if (block) block(data);
    return data;
}
