//
//  ZMJClassDataVC.m
//  FM
//
//  Created by User on 7/29/24.
//

#import "ZMJClassDataVC.h"

@interface ZMJClassDataVC ()
/// UI
@property(nonatomic,strong)SpreadsheetView *spreadsheetView;
@property(nonatomic,assign)SortedColumn sortedColumn;
/// data
@property(nonatomic,strong)NSArray<NSString *> *header;
@property(nonatomic,strong)NSMutableArray <NSArray<NSString *> *>*excelData;
@property(nonatomic,strong)NSMutableArray <NSArray<NSString *> *>*original_excelData;
@property(nonatomic,copy)NSString *content;

@end

@implementation ZMJClassDataVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (instancetype)init{
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
        self.viewModel.textModel.text = JobsInternationalization(@"相关功能列表");
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
        // self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
    
    self.sortedColumn = (SortedColumn){0, ZMJAscending};
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
    
    self.spreadsheetView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.gk_navigationBar.hidden = YES;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— SpreadsheetViewDataSource
- (NSInteger)numberOfColumns:(SpreadsheetView *)spreadsheetView {
    return self.header.count;
}

- (NSInteger)numberOfRows:(SpreadsheetView *)spreadsheetView {
    return self.excelData.count + 1;
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView
            widthForColumn:(NSInteger)column {
    return 140;
}

- (CGFloat)spreadsheetView:(SpreadsheetView *)spreadsheetView
              heightForRow:(NSInteger)row {
    return row == 0 ? 60 : 40;
}

- (NSInteger)frozenRows:(SpreadsheetView *)spreadsheetView {
    return 1;
}

- (NSInteger)frozenColumns:(SpreadsheetView *)spreadsheetView{
    return 1;
}

- (ZMJCell *)spreadsheetView:(SpreadsheetView *)spreadsheetView
               cellForItemAt:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        HeaderCell *cell = (HeaderCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(HeaderCell.class)
                                                                                    forIndexPath:indexPath];
        cell.label.text = self.header[indexPath.column];
        if (indexPath.column == self.sortedColumn.column) {
            cell.sortArrow.text = getSymbol(self.sortedColumn.sorting);
        } else {
            cell.sortArrow.text = @"";
        }return cell;
    } else {
        TextCell *cell = (TextCell *)[spreadsheetView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(TextCell.class)
                                                                                forIndexPath:indexPath];
        cell.label.text = self.original_excelData.copy[indexPath.row - 1][indexPath.column];
        return cell;
    }
}
#pragma mark —— SpreadsheetViewDelegate
- (void)spreadsheetView:(SpreadsheetView *)spreadsheetView
        didSelectItemAt:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        if (self.sortedColumn.column == indexPath.column) {
            SortedColumn sc = self.sortedColumn;
            sc.sorting = self.sortedColumn.sorting == ZMJAscending ? ZMJDsescending : ZMJAscending;
            self.sortedColumn = sc;
        } else {
            self.sortedColumn = (SortedColumn){indexPath.column, ZMJAscending};
        }
        @jobs_weakify(self)
        self.excelData = (NSMutableArray *)[self.excelData sortedArrayUsingComparator:^NSComparisonResult(NSArray<NSString *>*  _Nonnull obj1,
                                                                                                          NSArray<NSString *>*  _Nonnull obj2){
            @jobs_strongify(self)
            NSComparisonResult ascending = [obj1[self.sortedColumn.column] compare:obj2[self.sortedColumn.column]];
            return self.sortedColumn.sorting == ZMJAscending ?
            (ascending == NSOrderedAscending ? ascending : NSOrderedDescending) :
            (ascending == NSOrderedAscending ? NSOrderedDescending : ascending);
        }];
        [self.spreadsheetView reloadData];
    }
}
#pragma mark —— LazyLoad
- (SpreadsheetView *)spreadsheetView {
    if (!_spreadsheetView) {
        _spreadsheetView = SpreadsheetView.new;
        _spreadsheetView.dataSource = self;
        _spreadsheetView.delegate = self;
        _spreadsheetView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_spreadsheetView registerClass:HeaderCell.class forCellWithReuseIdentifier:NSStringFromClass(HeaderCell.class)];
        [_spreadsheetView registerClass:TextCell.class forCellWithReuseIdentifier:NSStringFromClass(TextCell.class)];
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

-(NSString *)content{
    if(!_content){
        NSError *error;
        _content = [NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"data" withExtension:@"tsv"]
                                            encoding:NSUTF8StringEncoding
                                               error:&error];
        if (!error){
            NSLog(@"error = %@",error);
        }
    }return _content;
}

-(NSArray<NSString *> *)header{
    if(!_header){
        _header = self.original_excelData[0];
    }return _header;
}

-(NSMutableArray <NSArray<NSString *>*>*)excelData{
    if(!_excelData){
        [self.original_excelData removeObjectAtIndex:0];
        _excelData = self.original_excelData.copy;
    }return _excelData;
}

-(NSMutableArray<NSArray<NSString *> *> *)original_excelData{
    if(!_original_excelData){
        _original_excelData = [[self.content componentsSeparatedByString:@"\r\n"] wbg_map:^NSArray<NSString *> * _Nullable(NSString * _Nonnull stuff) {
            return [stuff componentsSeparatedByString:@"\t"];
        }].mutableCopy;
    }return _original_excelData;
}

@end
