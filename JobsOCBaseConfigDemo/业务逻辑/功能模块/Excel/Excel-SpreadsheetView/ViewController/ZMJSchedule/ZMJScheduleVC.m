//
//  ZMJScheduleVC.m
//  FM
//
//  Created by User on 7/29/24.
//

#import "ZMJScheduleVC.h"

@interface ZMJScheduleVC ()

@property(nonatomic,strong)SpreadsheetView *spreadsheetView;
@property(nonatomic,strong)NSMutableArray<NSString *> *dates;
@property(nonatomic,strong)NSMutableArray<NSString *> *days;
@property(nonatomic,strong)NSMutableArray<UIColor *>  *dayColors;
@property(nonatomic,strong)NSMutableArray<NSString *> *hours;
@property(nonatomic,strong)NSMutableArray<NSArray<NSString *> *> *datas;
@property(nonatomic,strong)UIColor *evenRowColor; //偶数
@property(nonatomic,strong)UIColor *oddRowColor;  //奇数

@end

@implementation ZMJScheduleVC

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
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
    self.viewModel.textModel.text = JobsInternationalization(@"ZMJSchedule");
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
    
    if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
        self.makeNavBarConfig(nil,nil);
        self.navBar.alpha = 1;
    }else{
        self.setGKNav(nil);
        self.setGKNavBackBtn(nil);
        self.gk_navigationBar.jobsVisible = NO;
    }
    
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
#pragma mark —— SpreadsheetViewDataSource
- (NSInteger)numberOfColumns:(SpreadsheetView *)spreadsheetView {
    return 1 + self.days.count;
}

- (NSInteger)numberOfRows:(SpreadsheetView *)spreadsheetView {
    return 2 + self.hours.count;
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView widthForColumn:(NSInteger)column {
    if (0 == column) {
        return 70.f;
    } else {
        return 120.f;
    }
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView heightForRow:(NSInteger)row {
    if (0 == row) {
        return 24;
    } else if (1 == row) {
        return 32;
    } else {
        return 40;
    }
}

- (NSInteger)frozenColumns:(SpreadsheetView *)spreadsheetView {
    return 1;
}

- (NSInteger)frozenRows:(SpreadsheetView *)spreadsheetView {
    return 2;
}

- (ZMJCell *)spreadsheetView:(SpreadsheetView *)spreadsheetView cellForItemAt:(NSIndexPath *)indexPath {
    if ((indexPath.column >= 1 && indexPath.row <= self.dates.count + 1) &&
        (indexPath.row    == 0)){
        DateCell *cell  = (DateCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(DateCell.class)
                                                                                 forIndexPath:indexPath];
        cell.label.text = self.dates[indexPath.column - 1];
        return cell;
    } else if ((indexPath.column >= 1 && indexPath.column <= self.days.count + 1) &&
               (indexPath.row    == 1)){
        DayTitleCell *cell = (DayTitleCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(DayTitleCell.class)
                                                                                        forIndexPath:indexPath];
        cell.label.text      = self.days[indexPath.column - 1];
        cell.label.textColor = self.dayColors[indexPath.column - 1];
        return cell;
    } else if ((indexPath.column == 0) &&
               (indexPath.row    == 1)){
        TimeTitleCell *cell = (TimeTitleCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(TimeTitleCell.class)
                                                                                          forIndexPath:indexPath];
        cell.label.text     = @"TIME";
        return cell;
    } else if ((indexPath.column == 0) &&
               (indexPath.row    >= 2 && indexPath.row <= self.hours.count + 2)){
        TimeCell *cell = (TimeCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(TimeCell.class)
                                                                                forIndexPath:indexPath];
        cell.label.text      = self.hours[indexPath.row - 2];
        cell.backgroundColor = indexPath.row % 2 == 0 ? self.evenRowColor : self.oddRowColor;
        return cell;
    } else if ((indexPath.column >= 1 && indexPath.column <= self.days.count + 1) &&
               (indexPath.row    >= 2 && indexPath.row <= self.hours.count + 2)){
        ScheduleCell *cell = (ScheduleCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(ScheduleCell.class)
                                                                                        forIndexPath:indexPath];
        NSString *text = self.datas[indexPath.column - 1][indexPath.row - 2];
        if (text && text.length != 0) {
            cell.label.text = text;
            UIColor *color  = self.dayColors[indexPath.column - 1];
            cell.label.textColor = color;
            cell.color           = [color colorWithAlphaComponent:.2];
            cell.borders.top     = [BorderStyle.alloc initWithStyle:BorderStyle_solid width:2 color:color];
            cell.borders.bottom  = [BorderStyle.alloc initWithStyle:BorderStyle_solid width:2 color:color];
        } else {
            cell.label.text     = nil;
            cell.color          = indexPath.row % 2 == 0 ? self.evenRowColor : self.oddRowColor;
            cell.borders.top    = BorderStyle.borderStyleNone;
            cell.borders.bottom = BorderStyle.borderStyleNone;
        }return cell;
    }return nil;
}
#pragma mark —— SpreadsheetViewDelegate
- (void)spreadsheetView:(SpreadsheetView *)spreadsheetView
        didSelectItemAt:(NSIndexPath *)indexPath {
    NSLog(@"Selected: (Row: %ld, Column: %ld", (long)indexPath.row, (long)indexPath.column);
}
#pragma mark —— lazyLoad
-(NSMutableArray<NSString *> *)dates{
    if(!_dates){
        _dates = NSMutableArray.array;
        _dates.add(@"7/10/2017");
        _dates.add(@"7/11/2017");
        _dates.add(@"7/12/2017");
        _dates.add(@"7/13/2017");
        _dates.add(@"7/14/2017");
        _dates.add(@"7/15/2017");
        _dates.add(@"7/16/2017");
    }return _dates;
}

-(NSMutableArray<NSString *> *)days{
    if(!_days){
        _days = NSMutableArray.array;
        _days.add(@"MONDAY");
        _days.add(@"TUESDAY");
        _days.add(@"WEDNSDAY");
        _days.add(@"THURSDAY");
        _days.add(@"FRIDAY");
        _days.add(@"SATURDAY");
        _days.add(@"SUNDAY");
    }return _days;
}

-(NSMutableArray<UIColor *> *)dayColors{
    if(!_dayColors){
        _dayColors = NSMutableArray.array;
        _dayColors.add([UIColor colorWithRed:0.918 green:0.224 blue:0.153 alpha:1]);
        _dayColors.add([UIColor colorWithRed:0.106 green:0.541 blue:0.827 alpha:1]);
        _dayColors.add([UIColor colorWithRed:0.200 green:0.620 blue:0.565 alpha:1]);
        _dayColors.add([UIColor colorWithRed:0.953 green:0.498 blue:0.098 alpha:1]);
        _dayColors.add([UIColor colorWithRed:0.400 green:0.584 blue:0.141 alpha:1]);
        _dayColors.add([UIColor colorWithRed:0.835 green:0.655 blue:0.051 alpha:1]);
        _dayColors.add([UIColor colorWithRed:0.153 green:0.569 blue:0.835 alpha:1]);
    }return _dayColors;
}

-(NSMutableArray<NSString *> *)hours{
    if(!_hours){
        _hours = NSMutableArray.array;
        _hours.add(@"6:00 AM");
        _hours.add(@"7:00 AM");
        _hours.add(@"8:00 AM");
        _hours.add(@"9:00 AM");
        _hours.add(@"10:00 AM");
        _hours.add(@"11:00 AM");
        _hours.add(@"12:00 AM");
        _hours.add(@"13:00 AM");
        _hours.add(@"14:00 AM");
        _hours.add(@"15:00 AM");
        _hours.add(@"16:00 AM");
        _hours.add(@"17:00 AM");
        _hours.add(@"18:00 AM");
        _hours.add(@"19:00 AM");
        _hours.add(@"20:00 AM");
        _hours.add(@"21:00 AM");
        _hours.add(@"22:00 AM");
        _hours.add(@"23:00 AM");
        _hours.add(@"24:00 AM");
    }return _hours;
}

-(UIColor *)evenRowColor{
    if(!_evenRowColor){
        _evenRowColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1];
    }return _evenRowColor;
}

-(UIColor *)oddRowColor{
    if(!_oddRowColor){
        _oddRowColor = JobsWhiteColor;
    }return _oddRowColor;
}

-(NSMutableArray<NSArray<NSString *> *> *)datas{
    if(!_datas){
        _datas = NSMutableArray.array;
        _datas.add(@[@"", @"", @"Take medicine", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"Movie with family", @"", @"", @"", @"", @"", @""]);
        _datas.add(@[@"Leave for cabin", @"", @"", @"", @"", @"Lunch with Tim", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""]);
        _datas.add(@[@"", @"", @"", @"", @"Downtown parade", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""]);
        _datas.add(@[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"Fireworks show", @"", @"", @""]);
        _datas.add(@[@"", @"", @"", @"", @"", @"Family BBQ", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""]);
        _datas.add(@[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""]);
        _datas.add(@[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"Return home", @"", @"", @"", @"", @"", @""]);
    }return _datas;
}

-(SpreadsheetView *)spreadsheetView{
    if(!_spreadsheetView){
        
        _spreadsheetView = SpreadsheetView.new;
        _spreadsheetView.delegate   = self;
        _spreadsheetView.dataSource = self;
        _spreadsheetView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _spreadsheetView.contentInset = UIEdgeInsetsMake(4, 0, 4, 0);
        _spreadsheetView.intercellSpacing = CGSizeMake(4, 1);
        _spreadsheetView.gridStyle = GridStyle.borderStyleNone;
        [_spreadsheetView registerClass:DateCell.class forCellWithReuseIdentifier:NSStringFromClass(DateCell.class)];
        [_spreadsheetView registerClass:TimeTitleCell.class forCellWithReuseIdentifier:NSStringFromClass(TimeTitleCell.class)];
        [_spreadsheetView registerClass:TimeCell.class forCellWithReuseIdentifier:NSStringFromClass(TimeCell.class)];
        [_spreadsheetView registerClass:DayTitleCell.class forCellWithReuseIdentifier:NSStringFromClass(DayTitleCell.class)];
        [_spreadsheetView registerClass:ScheduleCell.class forCellWithReuseIdentifier:NSStringFromClass(ScheduleCell.class)];
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

@end
