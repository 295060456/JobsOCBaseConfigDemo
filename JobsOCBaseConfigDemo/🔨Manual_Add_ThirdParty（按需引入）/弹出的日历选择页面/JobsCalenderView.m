//
//  JobsCalenderView.m
//  FM
//
//  Created by User on 9/13/24.
//

#import "JobsCalenderView.h"

@interface JobsCalenderView ()
/// UI
@property(nonatomic,strong)FSCalendar *calendar;
/// Data

@end

@implementation JobsCalenderView

#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.calendar.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(450), JobsWidth(340));
    };
}
#pragma mark —— FSCalendarDataSource
//-(nullable NSString *)calendar:(FSCalendar *)calendar
//                  titleForDate:(NSDate *)date{
//    return @"";
//}

//-(nullable NSString *)calendar:(FSCalendar *)calendar 
//               subtitleForDate:(NSDate *)date{
//    
//}

//-(nullable UIImage *)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date{
//    
//}

//-(NSDate *)minimumDateForCalendar:(FSCalendar *)calendar{
//    
//}

-(NSDate *)maximumDateForCalendar:(FSCalendar *)calendar{
    return NSDate.date;
}

//-(__kindof FSCalendarCell *)calendar:(FSCalendar *)calendar 
//                         cellForDate:(NSDate *)date
//                     atMonthPosition:(FSCalendarMonthPosition)position{
//    
//}

//-(NSInteger)calendar:(FSCalendar *)calendar
//numberOfEventsForDate:(NSDate *)date{
//    
//}
#pragma mark —— FSCalendarDelegate
//-(BOOL)calendar:(FSCalendar *)calendar
//shouldSelectDate:(NSDate *)date
//atMonthPosition:(FSCalendarMonthPosition)monthPosition{
//    
//}

-(void)calendar:(FSCalendar *)calendar
  didSelectDate:(NSDate *)date
atMonthPosition:(FSCalendarMonthPosition)monthPosition{
    if(self.objectBlock) self.objectBlock(date);
}

//-(BOOL)calendar:(FSCalendar *)calendar 
//shouldDeselectDate:(NSDate *)date
//atMonthPosition:(FSCalendarMonthPosition)monthPosition{
//    
//}

-(void)calendar:(FSCalendar *)calendar
didDeselectDate:(NSDate *)date
atMonthPosition:(FSCalendarMonthPosition)monthPosition{
    if(self.objectBlock) self.objectBlock(date);
}

-(void)calendar:(FSCalendar *)calendar
boundingRectWillChange:(CGRect)bounds
       animated:(BOOL)animated{
//    [calendar mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@(bounds.size.height));
//        // Do other updates
//    }];
//    [self layoutIfNeeded];
}

-(void)calendar:(FSCalendar *)calendar
willDisplayCell:(FSCalendarCell *)cell
        forDate:(NSDate *)date
atMonthPosition:(FSCalendarMonthPosition)monthPosition{
    
}

-(void)calendarCurrentPageDidChange:(FSCalendar *)calendar{
    
}
#pragma mark —— lazyLoad
-(FSCalendar *)calendar{
    if(!_calendar){
        _calendar = FSCalendar.new;
        _calendar.dataSource = self;
        _calendar.delegate = self;
        _calendar.appearance.headerMinimumDissolvedAlpha = 0;
        _calendar.appearance.caseOptions = FSCalendarCaseOptionsHeaderUsesUpperCase;
        [self addSubview:_calendar];
        [_calendar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _calendar;
}

@end
