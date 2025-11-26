//
//  JobsCalenderView.m
//  FM
//
//  Created by User on 9/13/24.
//

#import "JobsCalenderView.h"

@interface JobsCalenderView ()
/// UI
Prop_strong()FSCalendar *calendar;
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
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            return CGSizeMake(JobsWidth(450), JobsWidth(340));
        }else{
            return CGSizeMake(JobsWidth(340), JobsWidth(450));
        }
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
        return @"新年".tr; // 元旦
    } else if (dateString.containsString(@"22/01")) {
        return @"春节".tr; // 春节（需要农历日期处理，这里使用2024年的示例日期）
    } else if (dateString.containsString(@"05/04")) {
        return @"清明节".tr; // 清明节
    } else if (dateString.containsString(@"01/05")) {
        return @"劳动节".tr; // 劳动节
    } else if (dateString.containsString(@"04/06")) {
        return @"端午节".tr; // 端午节（需要农历日期处理）
    } else if (dateString.containsString(@"13/09")) {
        return @"中秋节".tr; // 中秋节（需要农历日期处理）
    } else if (dateString.containsString(@"01/10")) {
        return @"国庆节".tr; // 国庆节
    } else if (dateString.containsString(@"25/12")) {
        return @"圣诞节".tr; // 圣诞节
    } else if (dateString.containsString(@"30/11")) {
        return @"博尼法西奥日".tr; // 博尼法西奥日
    } else if (dateString.containsString(@"12/06")) {
        return @"独立日".tr; // 独立日
    } else if (dateString.containsString(@"09/04")) {
        return @"勇士日".tr; // 勇士日
    } else if (dateString.containsString(@"01/11")) {
        return @"万灵节".tr; // 万灵节
    } else if (dateString.containsString(@"30/12")) {
        return @"黎刹日".tr; // 黎刹日
    } else return nil; // 其他日期没有副标题
}

//-(nullable UIImage *)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date{
//
//}

-(NSDate *)minimumDateForCalendar:(FSCalendar *)calendar{
    return NSDate.dateSince(-平年一年的秒数);/// 一年前
}

-(NSDate *)maximumDateForCalendar:(FSCalendar *)calendar{
    return NSDate.dateSince(平年一年的秒数);/// 一年后
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
    if(self.objBlock) self.objBlock(date);
}

//-(BOOL)calendar:(FSCalendar *)calendar
//shouldDeselectDate:(NSDate *)date
//atMonthPosition:(FSCalendarMonthPosition)monthPosition{
//
//}

-(void)calendar:(FSCalendar *)calendar
didDeselectDate:(NSDate *)date
atMonthPosition:(FSCalendarMonthPosition)monthPosition{
//    if(self.objBlock) self.objBlock(date);
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
        @jobs_weakify(self)
        _calendar = self.addSubview(jobsMakeFSCalendar(^(__kindof FSCalendar * _Nullable calendar) {
            @jobs_strongify(self)
            calendar.dataSource = self;
            calendar.delegate = self;
            calendar.frame = CGRectMake(0, 0, self.width, self.height);
            calendar.calendarHeaderView.backgroundColor = JobsLightGrayColor.colorWithAlphaComponentBy(.1f);
            calendar.appearance.headerMinimumDissolvedAlpha = 1;
            calendar.appearance.headerDateFormat = @"yyyy年MM月";
            calendar.appearance.caseOptions = FSCalendarCaseOptionsHeaderUsesUpperCase;
            calendar.appearance.headerTitleFont = pingFangHKBold(JobsWidth(20));
            calendar.appearance.headerTitleColor = JobsBlackColor;
            calendar.swipeToChooseGesture.enabled = YES;
            calendar.allowsMultipleSelection = YES;
//            calendar.calendarHeaderView.backgroundColor = JobsRedColor;
//            calendar.calendarWeekdayView.backgroundColor = JobsYellowColor;
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            @jobs_strongify(self)
            make.edges.equalTo(self);
        }).on();
    }return _calendar;
}

@end
