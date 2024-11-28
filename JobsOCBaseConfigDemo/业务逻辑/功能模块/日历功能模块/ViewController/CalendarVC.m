//
//  CalendarVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Admin on 20/11/2024.
//

#import "CalendarVC.h"

@interface CalendarVC ()
/// UI
@property(nonatomic,strong)FSCalendar *calendar;

@end

@implementation CalendarVC

-(void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

-(instancetype)init{
    if (self = [super init]) {
        NSLog(@"");
    }return self;
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = JobsInternationalization(@"日历功能");
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
    /// 装填用户信息数据
    /// json生成器 ： https://www.site24x7.com/zhcn/tools/json-generator.html
    self.saveUserInfo(JobsUserModel.byData(@"UserData".readLocalFileWithName));// 保存全局唯一的一份用户档案
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    [self.calendar reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— FSCalendarDataSource
-(nullable NSString *)calendar:(FSCalendar *)calendar
                  titleForDate:(NSDate *)date{
    return [jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter){
        dateFormatter.dateFormat = @"dd";
    }) stringFromDate:date];
}

-(nullable NSString *)calendar:(FSCalendar *)calendar
               subtitleForDate:(NSDate *)date{
    // 格式化日期，获取具体的日期字符串
    NSString *dateString = [jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable dateFormatter) {
        dateFormatter.dateFormat = @"dd/MM";
    }) stringFromDate:date];
    // 节假日字典，key为日期，value为节日名称
    NSDictionary<NSString *, NSString *> *holidays = @{
        // 中国节假日
        @"01/01": JobsInternationalization(@"新年"),     // 元旦
        @"22/01": JobsInternationalization(@"春节"),     // 春节 (农历日期需特殊处理)
        @"05/04": JobsInternationalization(@"清明节"),   // 清明节
        @"01/05": JobsInternationalization(@"劳动节"),   // 劳动节
        @"04/06": JobsInternationalization(@"端午节"),   // 端午节 (农历日期需特殊处理)
        @"01/10": JobsInternationalization(@"国庆节"),   // 国庆节
        @"13/09": JobsInternationalization(@"中秋节"),   // 中秋节 (农历日期需特殊处理)
        // 菲律宾节假日
        @"25/12": JobsInternationalization(@"圣诞节"),   // 圣诞节
        @"30/11": JobsInternationalization(@"博尼法西奥日"), // 博尼法西奥日
        @"12/06": JobsInternationalization(@"独立日"),   // 独立日
        @"09/04": JobsInternationalization(@"勇士日"),   // 勇士日
        @"01/11": JobsInternationalization(@"万灵节"),   // 万灵节
        @"30/12": JobsInternationalization(@"黎刹日")    // 黎刹日
    };return holidays[dateString];// 根据日期字符串查找节假日名称
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
    if(self.objectBlock) self.objectBlock(date);
}

-(void)calendar:(FSCalendar *)calendar
boundingRectWillChange:(CGRect)bounds
       animated:(BOOL)animated{
    [calendar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(bounds.size.height));
        // Do other updates
    }];[self.view layoutIfNeeded];
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
        _calendar.appearance.headerDateFormat = @"yyyy"
            .add(JobsInternationalization(@"年"))
            .add(@"MM")
            .add(JobsInternationalization(@"月"));
        _calendar.appearance.caseOptions = FSCalendarCaseOptionsHeaderUsesUpperCase;
        _calendar.appearance.headerTitleFont = UIFontSystemFontOfSize(JobsWidth(20));
        _calendar.appearance.headerTitleColor = JobsBlackColor;
        _calendar.swipeToChooseGesture.enabled = YES;
        _calendar.allowsMultipleSelection = YES;
        
        [self.view addSubview:_calendar];
        [_calendar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.navBar.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(450), JobsWidth(340)));
        }];
        [_calendar setNeedsLayout];
        [_calendar layoutIfNeeded];
    }return _calendar;
}
@synthesize backBtnModel = _backBtnModel;
-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        @jobs_weakify(self)
        _backBtnModel = self.makeBackBtnModel;
        _backBtnModel.titleFont = bayonRegular(JobsWidth(18));
        _backBtnModel.titleCor = JobsRedColor;
        _backBtnModel.selected_titleCor = JobsWhiteColor;
        _backBtnModel.longPressGestureEventBlock = ^id(__kindof UIButton *x) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        };
        _backBtnModel.clickEventBlock = ^id(BaseButton *x){
            @jobs_strongify(self)
            self.jobsBackBtnClickEvent(x);
            self.popToRootVCBy(YES);
            return nil;
        };
    }return _backBtnModel;
}

@end
