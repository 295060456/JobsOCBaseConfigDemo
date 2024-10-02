//
//  ZMJTimeableVC.m
//  FM
//
//  Created by User on 7/29/24.
//

#import "ZMJTimeableVC.h"

@interface ZMJTimeableVC ()

@property(nonatomic,strong)SpreadsheetView *spreadsheetView;
@property(nonatomic,strong)NSMutableArray<NSString *> *channels;
@property(nonatomic,assign)NSInteger numberOfRows;
@property(nonatomic,strong)NSMutableDictionary<NSIndexPath *, NSArray<NSNumber *> *> *slotInfo;
@property(nonatomic,strong)NSDateFormatter *hourFormatter;
@property(nonatomic,strong)NSDateFormatter *twelveHourFormatter;

@end

@implementation ZMJTimeableVC

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
    self.viewModel.textModel.text = JobsInternationalization(@"ZMJTimeable");
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
#pragma mark —— SpreadsheetViewDataSource
- (NSInteger)numberOfColumns:(SpreadsheetView *)spreadsheetView {
    return self.channels.count + 1;
}

- (NSInteger)numberOfRows:(SpreadsheetView *)spreadsheetView {
    return self.numberOfRows;
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView widthForColumn:(NSInteger)column {
    return column == 0 ? 30 : 130;
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView heightForRow:(NSInteger)row {
    return row == 0 ? 44 : 2;
}

- (NSInteger)frozenColumns:(SpreadsheetView *)spreadsheetView {
    return 1;
}

- (NSInteger)frozenRows:(SpreadsheetView *)spreadsheetView {
    return 1;
}

- (NSArray<ZMJCellRange *> *)mergedCells:(SpreadsheetView *)spreadsheetView {
    __block NSMutableArray<ZMJCellRange *> *mergedCells = NSMutableArray.array;
    for (int row = 0; row < 24; row++) {
        mergedCells.add([ZMJCellRange cellRangeFrom:[Location locationWithRow:60 * row + 1 column:0]
                                                           to:[Location locationWithRow:60 * (row + 1) column:0]]);
    }
    NSArray<NSNumber *> *seeds = @[@5, @10, @20, @20, @30, @30, @30, @30, @40, @40, @50, @50, @60, @60, @60, @60, @90, @90, @90, @90, @120, @120, @120];
    @jobs_weakify(self)
    [self.channels enumerateObjectsUsingBlock:^(NSString * _Nonnull channel,
                                                NSUInteger index,
                                                BOOL * _Nonnull stop) {
        @jobs_strongify(self)
        NSInteger minutes = 0;
        while (minutes < 24 * 60) {
            NSInteger duration = seeds[arc4random_uniform((uint32_t)seeds.count)].integerValue;
            if (minutes + duration + 1 >= weak_self.numberOfRows) {
                mergedCells.add([ZMJCellRange cellRangeFrom:[Location locationWithRow:minutes + 1 column:index + 1]
                                                                   to:[Location locationWithRow:weak_self.numberOfRows - 1 column:index + 1]]);
                break;
            }
            ZMJCellRange *cellRange = [ZMJCellRange cellRangeFrom:[Location locationWithRow:minutes + 1 column:index + 1]
                                                               to:[Location locationWithRow:minutes + duration + 1 column:index + 1]];
            mergedCells.add(cellRange);
            [weak_self.slotInfo setObject:@[@(minutes), @(duration)] forKey:[NSIndexPath indexPathWithRow:cellRange.from.row column:cellRange.from.column]];
            minutes += duration + 1;
        }
    }];return mergedCells;
}

- (ZMJCell *)spreadsheetView:(SpreadsheetView *)spreadsheetView
               cellForItemAt:(NSIndexPath *)indexPath {
    if (indexPath.column == 0 && indexPath.row == 0) {
        return nil;
    }
    
    if (indexPath.column == 0 && indexPath.row > 0) {
        HourCell *cell = (HourCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(HourCell.class) forIndexPath:indexPath];
        cell.label.text = [self.hourFormatter stringFromDate:[self.twelveHourFormatter dateFromString:[NSString stringWithFormat:@"%ld", (long)(indexPath.row / 60 % 24)]]];
        cell.gridlines.top = [GridStyle style:GridStyle_solid width:1 color:JobsWhiteColor];
        cell.gridlines.bottom = [GridStyle style:GridStyle_solid width:1 color:JobsWhiteColor];
        return cell;
    }
    
    if (indexPath.column > 0 && indexPath.row == 0) {
        ChannelCell *cell = (ChannelCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(ChannelCell.class) forIndexPath:indexPath];
        cell.label.text = self.channels[indexPath.column - 1];
        cell.gridlines.top = [GridStyle style:GridStyle_solid width:1 color:JobsBlackColor];
        cell.gridlines.bottom = [GridStyle style:GridStyle_solid width:1 color:JobsWhiteColor];
        cell.gridlines.left = [GridStyle style:GridStyle_solid width:1 / UIScreen.mainScreen.scale color:[UIColor colorWithWhite:.3 alpha:1]];
        cell.gridlines.right = cell.gridlines.left;
        return cell;
    }
    
    NSArray<NSNumber *> *minutesDuration = self.slotInfo[indexPath];
    if (minutesDuration) {
        NSInteger minutes = minutesDuration[0].integerValue;
        NSInteger duration = minutesDuration[1].integerValue;
        SlotCell *cell = (SlotCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(SlotCell.class) forIndexPath:indexPath];
        cell.minutes = minutes % 60;
        cell.title = @"Dummy Text";
        cell.tableHighlight = duration > 20 ? @"Lorem ipsum dolor sit amet, consectetur adipiscing elit" : @"";
        return cell;
    }return [spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(MyBlankCell.class) forIndexPath:indexPath];
}
#pragma mark —— SpreadsheetViewDelegate
- (void)spreadsheetView:(SpreadsheetView *)spreadsheetView
        didSelectItemAt:(NSIndexPath *)indexPath {
    NSLog(@"Selected: (row: (%ld), column: (%ld)", indexPath.row, indexPath.column);
}
#pragma mark —— lazyLoad
-(NSMutableArray<NSString *> *)channels{
    if(!_channels){
        _channels = NSMutableArray.array;
        _channels.add(@"ABC");
        _channels.add(@"NNN");
        _channels.add(@"BBC");
        _channels.add(@"J-Sports");
        _channels.add(@"OK News");
        _channels.add(@"SSS");
        _channels.add(@"Apple");
        _channels.add(@"CUK");
        _channels.add(@"KKR");
        _channels.add(@"APAR");
        _channels.add(@"SU");
        _channels.add(@"CCC");
        _channels.add(@"Game");
        _channels.add(@"Anime");
        _channels.add(@"Tokyo NX");
        _channels.add(@"NYC");
        _channels.add(@"SAN");
        _channels.add(@"Drama");
        _channels.add(@"Hobby");
        _channels.add(@"Music");
    }return _channels;
}

-(NSInteger)numberOfRows{
    if (!_numberOfRows) {
        _numberOfRows = 24 * 60 + 1;
    }return _numberOfRows;
}

-(NSMutableDictionary<NSIndexPath *,NSArray<NSNumber *> *> *)slotInfo{
    if(!_slotInfo){
        _slotInfo = NSMutableDictionary.dictionary;
    }return _slotInfo;
}

-(NSDateFormatter *)hourFormatter{
    if(!_hourFormatter){
        _hourFormatter = jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable data) {
            data.calendar = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            data.locale = [NSLocale.alloc initWithLocaleIdentifier:@"en_US_POSIX"];
            data.dateFormat = @"h\na";
        });
    }return _hourFormatter;
}

-(NSDateFormatter *)twelveHourFormatter{
    if(!_twelveHourFormatter){
        _twelveHourFormatter = jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable data) {
            data.calendar = [NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            data.locale = [NSLocale.alloc initWithLocaleIdentifier:@"en_US_POSIX"];
            data.dateFormat = @"H";
        });
    }return _twelveHourFormatter;
}

-(SpreadsheetView *)spreadsheetView{
    if(!_spreadsheetView){
        _spreadsheetView = SpreadsheetView.new;
        _spreadsheetView.dataSource = self;
        _spreadsheetView.delegate   = self;
        _spreadsheetView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_spreadsheetView registerClass:HourCell.class forCellWithReuseIdentifier:NSStringFromClass(HourCell.class)];
        [_spreadsheetView registerClass:ChannelCell.class forCellWithReuseIdentifier:NSStringFromClass(ChannelCell.class)];
        [_spreadsheetView registerClass:SlotCell.class forCellWithReuseIdentifier:NSStringFromClass(SlotCell.class)];
        [_spreadsheetView registerClass:MyBlankCell.class forCellWithReuseIdentifier:NSStringFromClass(MyBlankCell.class)];
        _spreadsheetView.backgroundColor = [UIColor.lightTextColor colorWithAlphaComponent:.7];
        CGFloat hairline = 1 / UIScreen.mainScreen.scale;
        _spreadsheetView.intercellSpacing = CGSizeMake(hairline, hairline);
        _spreadsheetView.gridStyle = [GridStyle style:GridStyle_solid width:hairline color:UIColor.lightGrayColor];
        _spreadsheetView.circularScrolling = [CircularScrollingConfigurationBuilder configurationBuilderWithCircularScrollingState:ZMJCircularScrolling_horizontally_rowHeaderStartsFirstColumn];
        [self.view addSubview:_spreadsheetView];
        [_spreadsheetView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.navBar.mas_bottom);
        }];
        [_spreadsheetView flashScrollIndicators];
    }return _spreadsheetView;
}

@end
