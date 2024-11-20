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
        [self.calendar reloadData];
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(450), JobsWidth(340));
    };
}
#pragma mark —— FSCalendarDataSource
-(nullable NSString *)calendar:(FSCalendar *)calendar
                  titleForDate:(NSDate *)date{
    return [jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter){
        dateFormatter.dateFormat = @"dd";
    }) stringFromDate:date];
}

-(nullable NSString *)calendar:(FSCalendar *)calendar
               subtitleForDate:(NSDate *)date {
    // 格式化日期，获取具体的日期字符串
    NSString *dateString = [jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
        dateFormatter.dateFormat = @"dd/MM";
    }) stringFromDate:date];
    if (dateString.containsString(@"01/01")) {
        return JobsInternationalization(@"新年"); // 元旦
    } else if (dateString.containsString(@"22/01")) {
        return JobsInternationalization(@"春节"); // 春节（需要农历日期处理，这里使用2024年的示例日期）
    } else if (dateString.containsString(@"05/04")) {
        return JobsInternationalization(@"清明节"); // 清明节
    } else if (dateString.containsString(@"01/05")) {
        return JobsInternationalization(@"劳动节"); // 劳动节
    } else if (dateString.containsString(@"04/06")) {
        return JobsInternationalization(@"端午节"); // 端午节（需要农历日期处理）
    } else if (dateString.containsString(@"13/09")) {
        return JobsInternationalization(@"中秋节"); // 中秋节（需要农历日期处理）
    } else if (dateString.containsString(@"01/10")) {
        return JobsInternationalization(@"国庆节"); // 国庆节
    } else if (dateString.containsString(@"25/12")) {
        return JobsInternationalization(@"圣诞节"); // 圣诞节
    } else if (dateString.containsString(@"30/11")) {
        return JobsInternationalization(@"博尼法西奥日"); // 博尼法西奥日
    } else if (dateString.containsString(@"12/06")) {
        return JobsInternationalization(@"独立日"); // 独立日
    } else if (dateString.containsString(@"09/04")) {
        return JobsInternationalization(@"勇士日"); // 勇士日
    } else if (dateString.containsString(@"01/11")) {
        return JobsInternationalization(@"万灵节"); // 万灵节
    } else if (dateString.containsString(@"30/12")) {
        return JobsInternationalization(@"黎刹日"); // 黎刹日
    } else return nil; // 其他日期没有副标题
}

//-(nullable UIImage *)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date{
//
//}

-(NSDate *)minimumDateForCalendar:(FSCalendar *)calendar{
    return [NSDate dateWithTimeIntervalSinceNow:-365*24*60*60]; // 一年前
}

-(NSDate *)maximumDateForCalendar:(FSCalendar *)calendar{
//    return NSDate.date;
    return [NSDate dateWithTimeIntervalSinceNow:365*24*60*60]; // 一年后
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
/// 选中日期
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
//    if(self.objectBlock) self.objectBlock(date);
}

-(void)calendar:(FSCalendar *)calendar
boundingRectWillChange:(CGRect)bounds
       animated:(BOOL)animated{
    [calendar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(bounds.size.height));
        // Do other updates
    }];[self layoutIfNeeded];
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
        _calendar = [FSCalendar.alloc initWithFrame:CGRectZero];
//        _calendar.calendarHeaderView.backgroundColor = JobsRedColor;
//        _calendar.calendarWeekdayView.backgroundColor = JobsYellowColor;
        _calendar.dataSource = self;
        _calendar.delegate = self;
        _calendar.calendarHeaderView.backgroundColor = [JobsLightGrayColor colorWithAlphaComponent:0.1];
        _calendar.appearance.headerMinimumDissolvedAlpha = 1;
        _calendar.appearance.headerDateFormat = @"yyyy年MM月";
        _calendar.appearance.caseOptions = FSCalendarCaseOptionsHeaderUsesUpperCase;
        _calendar.appearance.headerTitleFont = [UIFont boldSystemFontOfSize:20];
        _calendar.appearance.headerTitleColor = [UIColor blackColor];
        _calendar.swipeToChooseGesture.enabled = YES;
        _calendar.allowsMultipleSelection = YES;
        
        [self addSubview:_calendar];
        [_calendar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [_calendar setNeedsLayout];
        [_calendar layoutIfNeeded];
    }return _calendar;
}

@end
