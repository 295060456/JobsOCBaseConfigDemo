//
//  ZMJGanttListVC.m
//  FM
//
//  Created by User on 7/29/24.
//

#import "ZMJGanttListVC.h"

@interface ZMJGanttListVC ()
/// UI
@property(nonatomic,strong)SpreadsheetView *spreadsheetView;
@property(nonatomic,strong)ZMJTipView *tipView;
@property(nonatomic,strong)ZMJPreferences *preferences;
@property(nonatomic,strong)ZMJTaskView *taskView;
/// Data
@property(nonatomic,assign)ZMJDisplayMode displayMode;
@property(nonatomic,strong)NSDate *startDate;
@property(nonatomic,strong)NSDate *endDate;
@property(nonatomic,strong)NSMutableArray<NSDate *> *years;
@property(nonatomic,strong)NSMutableArray<NSDate *> *weeks;
@property(nonatomic,strong)NSMutableArray<NSDate *> *months;
@property(nonatomic,strong)NSMutableArray<NSDate *> *days;
@property(nonatomic,strong)NSMutableArray<ZMJTask *> *tasks;
@property(nonatomic,strong)NSMutableArray<UIColor *> *colors;

@end

@implementation ZMJGanttListVC

- (void)dealloc{
    JobsNotificationCenter.remove(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = JobsInternationalization(@"ZMJGanttList");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
//    [self.bgImageView removeFromSuperview];
    self.spreadsheetView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self updateStatusBarCor:JobsOrangeColor];/// 在具体子类实现，不要写在父类
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self restoreStatusBarCor];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)setDisplayMode:(ZMJDisplayMode)displayMode {
    _displayMode = displayMode;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//       [self.spreadsheetView reloadDataIfNeeded];
    });
}
/// 获取当月的天数
- (NSInteger)getNumberOfDaysInMonth:(NSDate *)theDay {
    NSAssert(theDay != nil, @"theDay is null.");

    NSCalendar * calendar = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法 NSGregorianCalendar - ios 8
    NSDate * currentDate = NSDate.date;
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay  //NSDayCalendarUnit - ios 8
                                   inUnit:NSCalendarUnitMonth //NSMonthCalendarUnit - ios 8
                                  forDate:currentDate];
    return range.length;
}
/// 获取当月中所有天数是周几
- (NSArray<NSString *> *)getAllDaysWithCalender:(NSDate *)theDay {
    NSAssert(theDay != nil, @"theDay is null.");
    NSUInteger dayCount = [self getNumberOfDaysInMonth:theDay]; //一个月的总天数
    static NSDateFormatter *formatter = nil;
    if (!formatter) {
        formatter = NSDateFormatter.new;
    }
    formatter.dateFormat = @"yyyy-MM";
    NSString * str = [formatter stringFromDate:theDay];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSMutableArray <NSString *>*allDaysArray = NSMutableArray.array;
    for (NSInteger i = 1; i <= dayCount; i++) {
        NSString *sr = str.add(str).add(@"-").add(toStringByNSInteger(i));
        NSDate *suDate = [formatter dateFromString:sr];
        allDaysArray.add([NSString stringWithFormat:@"%02ld %@", i, [self getweekDayWithDate:suDate]]);
    }
    NSLog(@"allDaysArray %@",allDaysArray);
    return allDaysArray.copy;
}
/// 获得某天的数据
/// 获取指定的日期是星期几
- (NSString *)getweekDayWithDate:(NSDate *)date{
    NSCalendar * calendar = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    // 1 是周日，2是周一 3.以此类推
    return [self translationArabicNum:comps.weekday];
}
/// 获取指定的日期当前月的第几周
- (NSInteger)getweekdayOrdinalWithDate:(NSDate *)date{
    NSCalendar * calendar = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear fromDate:date];
    return comps.weekdayOrdinal;
}
/// 获取指定的日期当年的第几月
- (NSInteger)getmonthOrdinalWithDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitMonth fromDate:date];
    return comps.month;
}
/// 将阿拉伯数字转换为中文数字
- (NSString *)translationArabicNum:(NSInteger)arabicNum {
    NSString *arabicNumStr = [NSString stringWithFormat:@"%ld",(long)arabicNum];
    NSArray *arabicNumeralsArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chineseNumeralsArray = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chineseNumeralsArray forKeys:arabicNumeralsArray];
    if (arabicNum < 20 && arabicNum > 9) {
        if (arabicNum == 10) {
            return @"十";
        }else{
            NSString *subStr1 = [arabicNumStr substringWithRange:NSMakeRange(1, 1)];
            NSString *a1 = dictionary.valueForKey(subStr1);
            NSString *chinese1 = @"十".add(a1);
            return chinese1;
        }
    }else{
        NSMutableArray *sums = NSMutableArray.array;
        for (int i = 0; i < arabicNumStr.length; i ++){
            NSString *substr = [arabicNumStr substringWithRange:NSMakeRange(i, 1)];
            NSString *a = dictionary.valueForKey(substr);
            NSString *b = digits[arabicNumStr.length -i-1];
            if(a){
                NSString *sum = a.add(b);
                if ([a isEqualToString:chineseNumeralsArray[9]]){
                    if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]]){
                        sum = b;
                        if ([sums.lastObject isEqualToString:chineseNumeralsArray[9]]){
                            [sums removeLastObject];
                        }
                    }else{
                        sum = chineseNumeralsArray[9];
                    }
                    
                    if ([sums.lastObject isEqualToString:sum]){
                        continue;
                    }
                }sums.add(sum);
            }
        }
        NSString *sumStr = [sums componentsJoinedByString:@""];
        NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
        return chinese;
    }
}
/// yyyy-MM
- (NSString *)formateMonthLimmited:(NSDate *)theDay {
    NSAssert(theDay != nil, @"theDay is null.");
    static NSDateFormatter * formatter = nil;
    if (!formatter) {
        formatter = NSDateFormatter.new;
        formatter.dateFormat = @"yyyy-MM";
    }return [formatter stringFromDate:theDay];
}
/// yyyy
- (NSString *)formateYearLimmited:(NSDate *)theDay {
    NSAssert(theDay != nil, @"theDay is null.");
    static NSDateFormatter *formatter = nil;
    if (!formatter) {
        formatter = NSDateFormatter.new;
        formatter.dateFormat = @"yyyy";
    }return [formatter stringFromDate:theDay];
}
/// 获取两个日期之间的所有日期，精确到天
- (NSArray<NSDate *> *)getDayArrayLeftDate:(NSDate *)aLeftDate rightDate:(NSDate *)aRightDate {
//    NSAssert(aLeftDate < aRightDate, @"aLeftDate must less equal aRightDate!");
    NSAssert([aLeftDate compare:aRightDate] == NSOrderedAscending, @"aLeftDate must be earlier than aRightDate!");
    
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = NSDateFormatter.new;
        dateFormatter.dateFormat = @"yyyy年MM月dd日";
    }
    
    NSMutableArray<NSDate *> *results  = NSMutableArray.array;
    NSCalendar *gregorian        = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *currentDate          = aLeftDate;
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                fromDate:currentDate];
    while (currentDate <= aRightDate) {
        NSDate *tDate = [gregorian dateFromComponents:components];
        currentDate = tDate;
        results.add(tDate);
        components.day = components.day + 1;
    }return results.copy;
}
/// 获取两个日期之间的距离
- (NSInteger)getDistanceLeftDate:(NSDate *)aLeftDate rightDate:(NSDate *)aRightDate {
//    NSAssert(aLeftDate <= aRightDate, @"aLeftDate must less equal aRightDate!");
    NSAssert([aLeftDate compare:aRightDate] != NSOrderedDescending, @"aLeftDate must be earlier than or equal to aRightDate!");
    
    if (aLeftDate == aRightDate) {
        return  0;
    }

    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = NSDateFormatter.new;
        dateFormatter.dateFormat = @"yyyy年MM月dd日";
    }
    
    NSCalendar *gregorian        = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *currentDate          = aLeftDate;
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                fromDate:currentDate];
    NSInteger result = 0;
    while (currentDate < aRightDate) {
        result += 1;
        components.day += 1;//自增
        currentDate = [gregorian dateFromComponents:components];
    }return result;
}
/// 日和星期几拼接
- (NSString *)dailyAppendWeaklyForDate:(NSDate *)date {
    static NSDateFormatter *formatter = nil;
    if (!formatter) {
        formatter = NSDateFormatter.new;
        formatter.dateFormat = @"dd";
    }return [formatter stringFromDate:date].add([formatter stringFromDate:date]).add(@" ").add([self getweekDayWithDate:date]);
}

NSDate *dateFromString(NSString *dateStr) {
    static NSDateFormatter *formatter = nil;
    if (!formatter) {
        formatter = NSDateFormatter.new;
        formatter.dateFormat = @"yyyy-MM-dd";
    }return [formatter dateFromString:dateStr];
}

NSString *date2String(NSDate *date) {
    static NSDateFormatter *formatter = nil;
    if (!formatter) {
        formatter = NSDateFormatter.new;
        formatter.dateFormat = @"yyyy-MM-dd hh:mm";
    }return [formatter stringFromDate:date];
}

NSInteger getMinIndex(NSInteger begin, NSInteger offset) {
    for (NSInteger i = offset; i >= 0; i--) {
        if (begin - offset >= 0) {
            return begin - offset;
        }
    }return 0;
}
#pragma mark —— Generate ZMJCellRanges
- (NSArray<ZMJCellRange *> *)yearCellRangesWithRow:(NSInteger)row {
    static NSMutableArray<ZMJCellRange *> *_yearCellRanges = nil;
    if (_yearCellRanges == nil) {
        _yearCellRanges = NSMutableArray.array;
    }
    if (_yearCellRanges.count != 0) {
        return _yearCellRanges.copy;
    }
    Location *fromLocation = nil;
    Location *toLocation   = nil;
    for (NSDate *fristDayOfYear in self.years) {
        for (NSDate *date in self.days) {
            if ([date isEqualToDate:fristDayOfYear] ||
                ([date isEqualToDate:self.days.lastObject] && [fristDayOfYear isEqualToDate:self.years.lastObject])) {
                if ([self.days indexOfObject:date] > 0) {
                    toLocation = [Location locationWithRow:row column:[self.days indexOfObject:date] - 1];
                }
                BOOL addFlag = NO;
                if (fromLocation && toLocation) {
                    [_yearCellRanges addObject:[ZMJCellRange cellRangeFrom:fromLocation
                                                                        to:toLocation]];
                    toLocation = nil;
                    addFlag    = YES;
                }
                fromLocation = [Location locationWithRow:row column:[self.days indexOfObject:date]];
                if (addFlag && ![fristDayOfYear isEqualToDate:self.years.lastObject]) {
                    break;
                }
            }
        }
    }return _yearCellRanges.copy;
}

- (NSArray<ZMJCellRange *> *)monthCellRanges {
    return [self monthCellRangesWithRow:0];
}

- (NSArray<ZMJCellRange *> *)monthCellRangesWithRow:(NSInteger)row {
    NSMutableArray<ZMJCellRange *> *_monthCellRanges = NSMutableArray.array;
    Location *fromLocation = nil;
    Location *toLocation   = nil;
    for (NSDate *fristDayOfmonth in self.months) {
        for (NSDate *date in self.days) {
            if ([date isEqualToDate:fristDayOfmonth] ||
                ([date isEqualToDate:self.days.lastObject] &&
                 [fristDayOfmonth isEqualToDate:self.months.lastObject])) {
                if ([self.days indexOfObject:date] > 0) {
                    toLocation = [Location locationWithRow:row column:[self.days indexOfObject:date] - 1];
                }
                if (fromLocation && toLocation) {
                    _monthCellRanges.add([ZMJCellRange cellRangeFrom:fromLocation to:toLocation]);
                    toLocation   = nil;
                }
                fromLocation = [Location locationWithRow:row column:[self.days indexOfObject:date]];
            }
        }
    }return _monthCellRanges.copy;
}

- (NSArray<ZMJCellRange *> *)weekCellRangesWithRow:(NSInteger)row {
    static NSMutableArray<ZMJCellRange *> *_weekCellRanges = nil;
    if (_weekCellRanges == nil) {
        _weekCellRanges = NSMutableArray.array;
    }
    if (_weekCellRanges.count != 0) {
        return _weekCellRanges.copy;
    }
    Location *fromLocation = nil;
    Location *toLocation   = nil;
    for (NSDate *fristDayOfWeek in self.weeks) {
        for (NSDate *date in self.days) {
            if ([date isEqualToDate:fristDayOfWeek] ||
                ([date isEqualToDate:self.days.lastObject] &&
                 [fristDayOfWeek isEqualToDate:self.weeks.lastObject])) {
                if ([self.days indexOfObject:date] > 0) {
                    toLocation = [Location locationWithRow:row column:[self.days indexOfObject:date] - 1];
                }
                BOOL addFlag = NO;
                if (fromLocation && toLocation) {
                    _weekCellRanges.add([ZMJCellRange cellRangeFrom:fromLocation to:toLocation]);
                    toLocation = nil;
                    addFlag    = YES;
                }
                fromLocation = [Location locationWithRow:row column:[self.days indexOfObject:date]];
                if (addFlag && ![fristDayOfWeek isEqualToDate:self.weeks.lastObject]) {
                    break;
                }
            }
        }
    }return _weekCellRanges.copy;
}
#pragma mark —— SpreadsheetViewDataSource
- (NSInteger)numberOfColumns:(SpreadsheetView *)spreadsheetView {
    return self.days.count - 1;
}

- (NSInteger)numberOfRows:(SpreadsheetView *)spreadsheetView {
    return 2 + self.tasks.count;
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView widthForColumn:(NSInteger)column {
    switch (self.displayMode) {
        case ZMJDisplayMode_daily:
            return 50.f;
            break;
        case ZMJDisplayMode_weekly:
            return 50.f/3;
            break;
        case ZMJDisplayMode_monthly:
            return 50.f/6;
            break;
    }
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView heightForRow:(NSInteger)row {
    if (row >= 0 && row <= 1) {
        return 30.f;
    } else {
        return 34.f;
    }
}

- (NSInteger)frozenColumns:(SpreadsheetView *)spreadsheetView {
    return 0;
}

- (NSInteger)frozenRows:(SpreadsheetView *)spreadsheetView {
    return 2;
}

- (NSArray<ZMJCellRange *> *)mergedCells:(SpreadsheetView *)spreadsheetView {
    NSMutableArray<ZMJCellRange *> *result = NSMutableArray.array;
    switch (self.displayMode) {
        case ZMJDisplayMode_daily:{
            NSArray<ZMJCellRange *> *titleHeader = [self monthCellRangesWithRow:0];
            @jobs_weakify(self)
            NSArray<ZMJCellRange *> *charts = [self.tasks wbg_mapWithIndex:^id _Nullable(ZMJTask * _Nonnull task,
                                                                                         NSUInteger index) {
                @jobs_strongify(self)
                ZMJCellRange *cellRange = nil;
                if (task.startDate && task.dueDate) {
                    cellRange = [ZMJCellRange cellRangeFrom:[Location locationWithRow:index + 2
                                                                               column:[self getDistanceLeftDate:self.startDate rightDate:task.startDate]]
                                                         to:[Location locationWithRow:index + 2
                                                                               column:[self getDistanceLeftDate:self.startDate rightDate:task.dueDate]]];
                } else {
                    cellRange = [ZMJCellRange cellRangeFrom:[Location locationWithRow:index + 2
                                                                               column:[self getDistanceLeftDate:self.startDate rightDate:task.startDate ?: task.dueDate]]
                                                         to:[Location locationWithRow:index + 2
                                                                               column:[self getDistanceLeftDate:self.startDate rightDate:task.startDate ?: task.dueDate]]];
                }return cellRange;
            }];
            [result addObjectsFromArray:titleHeader];
            [result addObjectsFromArray:charts];
        }break;
        case ZMJDisplayMode_weekly:{
            NSArray<ZMJCellRange *> *titleHeader     = [self monthCellRangesWithRow:0];
            NSArray<ZMJCellRange *> *weekTitleHeader = [self weekCellRangesWithRow:1];
            @jobs_weakify(self)
            NSArray<ZMJCellRange *> *charts = [self.tasks wbg_mapWithIndex:^id _Nullable(ZMJTask * _Nonnull task,
                                                                                         NSUInteger index) {
                @jobs_strongify(self)
                ZMJCellRange *cellRange = nil;
                if (task.startDate && task.dueDate) {
                    cellRange = [ZMJCellRange cellRangeFrom:[Location locationWithRow:index + 2
                                                                               column:[self getDistanceLeftDate:self.startDate rightDate:task.startDate]]
                                                         to:[Location locationWithRow:index + 2
                                                                               column:[self getDistanceLeftDate:self.startDate rightDate:task.dueDate]]];
                } else {
                    if (task.startDate) { //startDate not nil
                        cellRange = [ZMJCellRange cellRangeFrom:[Location locationWithRow:index + 2
                                                                                   column:[self getDistanceLeftDate:self.startDate rightDate:task.startDate]]
                                                             to:[Location locationWithRow:index + 2
                                                                                   column:[self getDistanceLeftDate:self.startDate rightDate:task.startDate] + 2]];
                    } else { //dueDate not nil
                        NSInteger start = getMinIndex([self getDistanceLeftDate:self.startDate rightDate:task.dueDate], 2);
                        cellRange = [ZMJCellRange cellRangeFrom:[Location locationWithRow:index + 2
                                                                                   column:start]
                                                             to:[Location locationWithRow:index + 2
                                                                                   column:[self getDistanceLeftDate:self.startDate rightDate:task.dueDate]]];
                    }
                }return cellRange;
            }];
            [result addObjectsFromArray:titleHeader];
            [result addObjectsFromArray:weekTitleHeader];
            [result addObjectsFromArray:charts];
        }break;
        case ZMJDisplayMode_monthly:{
            NSArray<ZMJCellRange *> *titleHeader      = [self yearCellRangesWithRow:0];
            NSArray<ZMJCellRange *> *monthTitleHeader = [self monthCellRangesWithRow:1];
            @jobs_weakify(self)
            NSArray<ZMJCellRange *> *charts = [self.tasks wbg_mapWithIndex:^id _Nullable(ZMJTask * _Nonnull task,
                                                                                         NSUInteger index) {
                @jobs_strongify(self)
                ZMJCellRange *cellRange = nil;
                if (task.startDate && task.dueDate) {
                    cellRange = [ZMJCellRange cellRangeFrom:[Location locationWithRow:index + 2
                                                                               column:[self getDistanceLeftDate:self.startDate rightDate:task.startDate]]
                                                         to:[Location locationWithRow:index + 2
                                                                               column:[self getDistanceLeftDate:self.startDate rightDate:task.dueDate]]];
                } else {
                    if (task.startDate) { //startDate not nil
                        cellRange = [ZMJCellRange cellRangeFrom:[Location locationWithRow:index + 2
                                                                                   column:[self getDistanceLeftDate:self.startDate rightDate:task.startDate]]
                                                             to:[Location locationWithRow:index + 2
                                                                                   column:[self getDistanceLeftDate:self.startDate rightDate:task.startDate] + 5]];
                    } else { //dueDate not nil
                        NSInteger start = getMinIndex([self getDistanceLeftDate:self.startDate rightDate:task.dueDate], 5);
                        cellRange = [ZMJCellRange cellRangeFrom:[Location locationWithRow:index + 2
                                                                                   column:start]
                                                             to:[Location locationWithRow:index + 2
                                                                                   column:[self getDistanceLeftDate:self.startDate rightDate:task.dueDate]]];
                    }
                }return cellRange;
            }];
            [result addObjectsFromArray:titleHeader];
            [result addObjectsFromArray:monthTitleHeader];
            [result addObjectsFromArray:charts];
        }break;
    }return result.copy;
}

- (ZMJCell *)spreadsheetView:(SpreadsheetView *)spreadsheetView
               cellForItemAt:(NSIndexPath *)indexPath {
    NSInteger column = indexPath.column;
    NSInteger row    = indexPath.row;
    if (row < 2) {
        ZMJHeaderCell *cell = (ZMJHeaderCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:ZMJHeaderCell.description forIndexPath:indexPath];
        @jobs_weakify(self)
        if (row == 0) {
            switch (self.displayMode) {
                case ZMJDisplayMode_daily:
                case ZMJDisplayMode_weekly:{
                    NSDate *(^getVilabelDateBlock)(NSInteger r, NSInteger c) = ^NSDate *(NSInteger r, NSInteger c) {
                        @jobs_strongify(self)
                        for (ZMJCellRange *range in [self monthCellRangesWithRow:r]) {
                            if (range.from.row == r && range.from.column == c) {
                                return self.months[[[self monthCellRangesWithRow:r] indexOfObject:range]];
                            }
                        }return nil;
                    };
                    cell.label.text = [self formateMonthLimmited:getVilabelDateBlock(row, column)];
                }break;
                case ZMJDisplayMode_monthly:{
                    NSDate *(^getVilabelDateBlock)(NSInteger r, NSInteger c) = ^NSDate *(NSInteger r, NSInteger c) {
                        @jobs_strongify(self)
                        for (ZMJCellRange *range in [self yearCellRangesWithRow:r]) {
                            if (range.from.row == r && range.from.column == c) {
                                return self.years[[[self yearCellRangesWithRow:r] indexOfObject:range]];
                            }
                        }return nil;
                    };
                    cell.label.text = [self formateYearLimmited:getVilabelDateBlock(row, column)];
                }break;
            }
        } else {
            switch (self.displayMode) {
                case ZMJDisplayMode_daily:
                    cell.label.text = [self dailyAppendWeaklyForDate:self.days[column]];
                    break;
                case ZMJDisplayMode_weekly:{
                    NSInteger(^getVilabelIdxBlock)(NSInteger r, NSInteger c) = ^NSInteger(NSInteger r, NSInteger c) {
                        @jobs_strongify(self)
                        for (NSInteger idx = 0; idx < [self weekCellRangesWithRow:r].count; idx++) {
                            ZMJCellRange *range = [self weekCellRangesWithRow:r][idx];
                            if (range.from.row == r && range.from.column == c) {
                                return idx;
                            }
                        }return 0;
                    };
                    cell.label.text = @"第".add([self translationArabicNum:[self getweekdayOrdinalWithDate:self.weeks[getVilabelIdxBlock(row, column)]]]).add(@"周");
                }break;
                case ZMJDisplayMode_monthly:{
                    NSInteger(^getVilabelIdxBlock)(NSInteger r, NSInteger c) = ^NSInteger(NSInteger r, NSInteger c) {
                        @jobs_strongify(self)
                        for (NSInteger idx = 0; idx < [self monthCellRangesWithRow:r].count; idx++) {
                            ZMJCellRange *range = [self monthCellRangesWithRow:r][idx];
                            if (range.from.row == r && range.from.column == c) {
                                return idx;
                            }
                        }return 0;
                    };
                    cell.label.text = [NSString stringWithFormat:@"第%@月", [self translationArabicNum:[self getmonthOrdinalWithDate:self.years[getVilabelIdxBlock(row, column)]]]];
                }break;
            }
        }
        cell.gridlines.left  = [GridStyle style:GridStyle_default width:0 color:nil];
        cell.gridlines.right = [GridStyle style:GridStyle_default width:0 color:nil];
        return cell;
    } else {
        ZMJChartBarCell *cell = (ZMJChartBarCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:ZMJChartBarCell.description forIndexPath:indexPath];
        ZMJTask *task = self.tasks[row - 2];
        NSInteger start = [self getDistanceLeftDate:self.startDate rightDate:task.startDate ?: task.dueDate];
        if (task.startDate == nil) {
            switch (self.displayMode) {
                case ZMJDisplayMode_daily:
                    break;
                case ZMJDisplayMode_weekly:{
                    start = getMinIndex([self getDistanceLeftDate:self.startDate rightDate:task.dueDate], 2);
                }break;
                case ZMJDisplayMode_monthly:{
                    start = getMinIndex([self getDistanceLeftDate:self.startDate rightDate:task.dueDate], 5);
                }break;
            }
        }
        if (start == column) {
            cell.label.text = self.tasks[row - 2].taskName;
            NSInteger colorIndex = arc4random() % 3;
            cell.color = self.colors[colorIndex];
            
            if (task.startDate == nil) {
                cell.direction = ZMJDashlineDirectionLeft;
            } else if (task.dueDate == nil) {
                cell.direction = ZMJDashlineDirectionRight;
            } else {
                cell.direction = ZMJDashlineDirectionNone;
            }
            
            if (self.displayMode != ZMJDisplayMode_daily) {
                cell.gridlines.right   = GridStyle.borderStyleNone;
            }
        } else {
            cell.label.text = @"";
            cell.color = JobsClearColor;
            cell.gridlines.right   = [GridStyle style:GridStyle_default width:0 color:nil];
        }
        cell.gridlines.bottom  = GridStyle.borderStyleNone;
        cell.gridlines.top     = GridStyle.borderStyleNone;
        
        @jobs_weakify(self)
        switch (self.displayMode) {
            case ZMJDisplayMode_daily:
                break;
            case ZMJDisplayMode_weekly:{
                BOOL(^enableLeftGridlineBlock)(NSInteger r, NSInteger c) = ^BOOL(NSInteger r, NSInteger c) {
                    @jobs_strongify(self)
                    for (ZMJCellRange *range in [self weekCellRangesWithRow:1]) {
                        if (range.from.column == c) {
                            return YES;
                        }
                    }return NO;
                };
                cell.gridlines.left = enableLeftGridlineBlock(row, column) ? [GridStyle style:GridStyle_default width:0 color:nil] : GridStyle.borderStyleNone;
            }break;
            case ZMJDisplayMode_monthly:{
                BOOL(^enableLeftGridlineBlock)(NSInteger r, NSInteger c) = ^BOOL(NSInteger r, NSInteger c) {
                    @jobs_strongify(self)
                    for (ZMJCellRange *range in [self monthCellRangesWithRow:1]) {
                        if (range.from.column == c) {
                            return YES;
                        }
                    }return NO;
                };
                cell.gridlines.left = enableLeftGridlineBlock(row, column) ? [GridStyle style:GridStyle_default width:0 color:nil] : GridStyle.borderStyleNone;
            }break;
        }return cell;
    }return nil;
}
/// Delegate
- (void)spreadsheetView:(SpreadsheetView *)spreadsheetView
        didSelectItemAt:(NSIndexPath *)indexPath {
    NSLog(@"Selected: (row: %ld, column: %ld)", (long)indexPath.row, (long)indexPath.column);
    ZMJCell *cell = [spreadsheetView cellForItemAt:indexPath];
    if (![cell isKindOfClass:ZMJChartBarCell.class]) {[self.tipView dismissWithCompletion:nil]; return;}
    ZMJTask *task = self.tasks[indexPath.row - 2];
    NSInteger start = [self getDistanceLeftDate:self.startDate rightDate:task.startDate ?: task.dueDate];
    if (task.startDate == nil) {
        switch (self.displayMode) {
            case ZMJDisplayMode_daily:
                break;
            case ZMJDisplayMode_weekly:{
                start = getMinIndex([self getDistanceLeftDate:self.startDate rightDate:task.dueDate], 2);
            }break;
            case ZMJDisplayMode_monthly:{
                start = getMinIndex([self getDistanceLeftDate:self.startDate rightDate:task.dueDate], 5);
            }break;
        }
    }
    
    if (start != indexPath.column) {
        [self.tipView dismissWithCompletion:nil];
        return;
    }
    if (!self.tipView.isShowing) {
        ZMJTaskView *taskview = (ZMJTaskView *)self.tipView.fakeView;
        taskview.taskTitle = task.taskName;
        taskview.startTime = date2String(task.startDate) ?: @"--";
        taskview.endTime   = date2String(task.dueDate) ?: @"--";
        [self.tipView showAnimated:YES forView:cell withinSuperview:nil];
        spreadsheetView.scrollEnabled = NO;
    }
}
#pragma mark —— ZMJTipViewDelegate
-(void)tipViewDidDimiss:(ZMJTipView *)tipView{
    self.spreadsheetView.scrollEnabled = YES;
}

-(void)tipViewDidSelected:(ZMJTipView *)tipView{
    
}
#pragma mark —— lazyLoad
-(NSMutableArray<ZMJTask *> *)tasks{
    if(!_tasks){
        _tasks = NSMutableArray.array;
        _tasks.add([ZMJTask taskWithName:@"Office itinerancy" startDate:dateFromString(@"2017-12-7") endDate:dateFromString(@"2017-12-15")]);
        _tasks.add([ZMJTask taskWithName:@"Office facingy" startDate:dateFromString(@"2017-12-8") endDate:dateFromString(@"2017-12-12")]);
        _tasks.add([ZMJTask taskWithName:@"Office itinerancy" startDate:dateFromString(@"2017-12-10") endDate:dateFromString(@"2017-12-12")]);
        _tasks.add([ZMJTask taskWithName:@"Interior office" startDate:dateFromString(@"2018-1-1") endDate:dateFromString(@"2018-1-3")]);
        _tasks.add([ZMJTask taskWithName:@"Air condition check" startDate:dateFromString(@"2017-12-7") endDate:dateFromString(@"2017-12-19")]);
        _tasks.add([ZMJTask taskWithName:@"Office itinerancy" startDate:dateFromString(@"2017-12-24") endDate:dateFromString(@"2017-12-30")]);
        _tasks.add([ZMJTask taskWithName:@"Office facingy" startDate:dateFromString(@"2017-12-18") endDate:dateFromString(@"2018-1-2")]);
        _tasks.add([ZMJTask taskWithName:@"Office facingy" startDate:nil endDate:dateFromString(@"2017-12-8")]);
    }return _tasks;
}

-(NSMutableArray<UIColor *> *)colors{
    if(!_colors){
        _colors = NSMutableArray.array;
        _colors.add([UIColor colorWithRed:72/255.f green:194/255.f blue:169/255.f alpha:1]);
        _colors.add([UIColor colorWithRed:255/255.f green:121/255.f blue:121/255.f alpha:1]);
        _colors.add([UIColor colorWithRed:204/255.f green:204/255.f blue:204/255.f alpha:1]);
    }return _colors;
}

-(SpreadsheetView *)spreadsheetView{
    if(!_spreadsheetView){
        _spreadsheetView = SpreadsheetView.new;
        _spreadsheetView.dataSource = self;
        _spreadsheetView.delegate = self;
        _spreadsheetView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        CGFloat hairline = 1 / UIScreen.mainScreen.scale;
        _spreadsheetView.intercellSpacing = CGSizeMake(hairline, hairline);
        _spreadsheetView.gridStyle = [GridStyle.alloc initWithStyle:GridStyle_solid width:hairline color:UIColor.grayColor];
        [_spreadsheetView registerClass:ZMJHeaderCell.class forCellWithReuseIdentifier:ZMJHeaderCell.description];
        [_spreadsheetView registerClass:ZMJTaskCell.class forCellWithReuseIdentifier:ZMJTaskCell.description];
        [_spreadsheetView registerClass:ZMJChartBarCell.class forCellWithReuseIdentifier:ZMJChartBarCell.description];
        [self.view addSubview:_spreadsheetView];
        [_spreadsheetView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.navBar.mas_bottom);
        }];
//        if (@available(iOS 11.0, *)) {
//            _spreadsheetView.frame = self.view.safeAreaLayoutGuide.layoutFrame;
//        } else {
//            _spreadsheetView.frame = self.view.bounds;
//        }
        [_spreadsheetView flashScrollIndicators];
    }return _spreadsheetView;
}

-(NSDate *)startDate{
    if(!_startDate){
        static NSDateFormatter *formatter = nil;
        if (!formatter) {
            formatter = NSDateFormatter.new;
            formatter.dateFormat = @"yyyy-MM-dd";
        }
        _startDate = [formatter dateFromString:@"2017-12-07"];
    }return _startDate;
}

- (NSDate *)endDate {
    if (!_endDate) {
        static NSDateFormatter *formatter = nil;
        if (!formatter) {
            formatter = NSDateFormatter.new;
            formatter.dateFormat = @"yyyy-MM-dd";
        }
        _endDate = [formatter dateFromString:@"2018-01-07"];
    }return _endDate;
}

- (NSArray<NSDate *> *)days {
    if (self.startDate && self.endDate) {
        return [self getDayArrayLeftDate:self.startDate rightDate:self.endDate];
    }return nil;
}

- (NSArray<NSDate *> *)years {
    return [self fetchDateAccordingTimeUnit:ZMJTimeUnit_year];
}

- (NSArray<NSDate *> *)months {
    return [self fetchDateAccordingTimeUnit:ZMJTimeUnit_month];
}

- (NSArray<NSDate *> *)weeks {
    return [self fetchDateAccordingTimeUnit:ZMJTimeUnit_week];
}

- (NSArray<NSDate *> *)fetchDateAccordingTimeUnit:(ZMJTimeUnit)timeUnit {
    NSCalendarUnit calendarUnit =   NSCalendarUnitYear |
                                    NSCalendarUnitMonth |
                                    NSCalendarUnitDay |
                                    NSCalendarUnitHour |
                                    NSCalendarUnitMinute |
                                    NSCalendarUnitSecond |
                                    NSCalendarUnitWeekOfMonth |
                                    NSCalendarUnitWeekday |
                                    NSCalendarUnitWeekdayOrdinal |
                                    NSCalendarUnitWeekOfMonth |
                                    NSCalendarUnitWeekOfYear;
    NSCalendar *greCalendar = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger  previousDate = -1;
    NSMutableArray<NSDate *> *_months = NSMutableArray.array;
    for (NSDate *date in self.days) {
        NSDateComponents *dateComponents = [greCalendar components:calendarUnit
                                                          fromDate:date];
        long long dateComponentTimeUnitValue = NSIntegerMin;
        switch (timeUnit) {
            case ZMJTimeUnit_week:
                dateComponentTimeUnitValue = dateComponents.weekdayOrdinal;
                break;
            case ZMJTimeUnit_month:
                dateComponentTimeUnitValue = dateComponents.month;
                break;
            case ZMJTimeUnit_year:
                dateComponentTimeUnitValue = dateComponents.year;
                break;
        }
        if ([date isEqualToDate:self.days.firstObject] || (previousDate != dateComponentTimeUnitValue)) {
            [_months addObject:date];
            previousDate = dateComponentTimeUnitValue;
        }
    }return _months.copy;
}

- (ZMJTipView *)tipView {
    if (!_tipView) {
        ZMJTipView.globalPreferences = self.preferences;
        _tipView = [ZMJTipView.alloc initWithText:nil preferences:nil delegate:self];
        _tipView.fakeView = self.taskView;
    }return _tipView;
}

-(ZMJTaskView *)taskView{
    if(!_taskView){
        _taskView = ZMJTaskView.new;
        _taskView.width = self.tipView.preferences.positioning.maxWidth;
        _taskView.taskTitle = @"ZMJTipView show task!";
        _taskView.startTime = @"2018-02-10 15:33:22";
        _taskView.endTime = @"2019-02-10 15:33:22";
    }return _taskView;
}

-(ZMJPreferences *)preferences{
    if(!_preferences){
        _preferences = ZMJPreferences.new;
        _preferences.drawing.font = [UIFont fontWithName:@"Futura-Medium" size:13];
        _preferences.drawing.foregroundColor = JobsWhiteColor;
        _preferences.drawing.backgroundColor = JobsWhiteColor;
    }return _preferences;
}

@end
