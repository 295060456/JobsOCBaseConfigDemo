//
//  BaiShaETProjChoiceStadiumView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/9.
//

#import "BaiShaETProjChoiceStadiumView.h"

@interface BaiShaETProjChoiceStadiumTBVHeaderView ()

Prop_strong()UIColor *cor;

@end

@implementation BaiShaETProjChoiceStadiumTBVHeaderView

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = self.cor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = self.cor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(),JobsWidth(46));
    };
}
#pragma mark —— lazyLoad
-(UIColor *)cor{
    if (!_cor) {
        _cor = self.byPatternImage(JobsIMG(@"选择场馆上拉列表背景"));/// 用@2x@3x会有偏移异常
        /// 👇🏻下面有偏移
//        [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xF2CD7A),HEXCOLOR(0xFFEABA)]]
//                            startPoint:CGPointMake(100, 100)
//                              endPoint:CGPointZero
//                                opaque:NO
//                        targetViewRect:CGRectMake(0,
//                                                  0,
//                                                  JobsMainScreen_WIDTH(),
//                                                  JobsWidth(46))];
    }return _cor;
}

@end

@interface BaiShaETProjChoiceStadiumView ()
/// UI
Prop_strong()UITableView *tableView;
Prop_strong()BaiShaETProjChoiceStadiumTBVHeaderView *tbvHeaderView;
/// Data
Prop_copy()NSMutableArray <UIViewModel *>*dataMutArr;
Prop_copy()NSMutableArray <JobsBaseTableViewCell *>*tbvCellMutArr;

@end

@implementation BaiShaETProjChoiceStadiumView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_choiceStadiumViewOnceToken = 0;
    static_choiceStadiumView = nil;
}

static BaiShaETProjChoiceStadiumView *static_choiceStadiumView = nil;
static dispatch_once_t static_choiceStadiumViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_choiceStadiumViewOnceToken, ^{
        static_choiceStadiumView = BaiShaETProjChoiceStadiumView.new;
    });return static_choiceStadiumView;
}

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
        MakeDataNull
        self.tableView.reloadDatas();
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(JobsMainScreen_WIDTH()), JobsWidth(46) * [BaiShaETProjChoiceStadiumView createDataMutArr].count + JobsWidth(44) + JobsBottomSafeAreaHeight());
    };
}
#pragma mark —— 一些私有方法
+(NSMutableArray<UIViewModel *> *)createDataMutArr{
    NSMutableArray <UIViewModel *>*dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG體育");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG真人");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG電子");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG彩票");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG棋牌");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }))
        .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DA電子");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
    });return dataMutArr;
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (JobsBaseTableViewCell *cell in self.tbvCellMutArr) {
        cell.imageView.jobsVisible = NO;
    }
    
    JobsBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.imageView.jobsVisible = !cell.imageView.jobsVisible;
    
    if (self.objBlock) self.objBlock(self.dataMutArr[indexPath.row]);
    [self tf_hide:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(46);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = self.tbvCellMutArr[indexPath.row];
    cell.jobsRichElementsCellBy(self.dataMutArr[indexPath.row]);
    cell.textLabel.textColor = HEXCOLOR(0x757575);
    cell.textLabel.font = UIFontWeightRegularSize(16);
    cell.imageView.image = JobsIMG(@"红色的对勾");
    cell.imageView.jobsVisible = NO;
    cell.backgroundColor = cell.contentView.backgroundColor = HEXCOLOR(0xFFFCF7);
    cell.textLabelFrameOffsetX = JobsWidth(16);
    cell.imageViewFrameOffsetX = JobsMainScreen_WIDTH() - JobsWidth(50);
    return cell;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView){
            @jobs_strongify(self)
            tableView.backgroundColor = JobsWhiteColor;
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            tableView.scrollEnabled = NO;
            tableView.showsVerticalScrollIndicator = NO;
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.tableHeaderView = self.tbvHeaderView;/// 这里接入的就是一个UIView的派生类
            tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
                /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
            });
            tableView.separatorColor = HEXCOLOR(0xEEEEEE);
            tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
            [tableView registerTableViewClass];
            
            {
                tableView.mj_header = self.MJRefreshNormalHeaderBy([self refreshHeaderDataBy:^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self )
                    JobsLog(@"下拉刷新");
                    self.currentPage = @(1);
                    return nil;
                }]);
                tableView.mj_footer = self.MJRefreshFooterBy([self refreshFooterDataBy:^id _Nullable(id  _Nullable data) {
                    JobsLog(@"上拉加载更多");
                    tableView.endRefreshing(YES);
                    return nil;
                }]);tableView.mj_footer.hidden = NO;
            }
            
            if(@available(iOS 11.0, *)) {
                tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
            self.addSubview(tableView);
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        });
    }return _tableView;
}

-(BaiShaETProjChoiceStadiumTBVHeaderView *)tbvHeaderView{
    if (!_tbvHeaderView) {
        _tbvHeaderView = BaiShaETProjChoiceStadiumTBVHeaderView.new;
        _tbvHeaderView.sizer = BaiShaETProjChoiceStadiumTBVHeaderView.viewSizeByModel(nil);
        _tbvHeaderView.text = JobsInternationalization(@"選擇場館");
        _tbvHeaderView.textColor = HEXCOLOR(0x3D4A58);
        _tbvHeaderView.font = UIFontWeightBoldSize(16);
        _tbvHeaderView.textAlignment = NSTextAlignmentCenter;
        
    }return _tbvHeaderView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = [BaiShaETProjChoiceStadiumView createDataMutArr];
    }return _dataMutArr;
}

-(NSMutableArray<JobsBaseTableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <JobsBaseTableViewCell *>* _Nullable data) {
            @jobs_strongify(self)
            for (UIViewModel *viewModel in self.dataMutArr) {
                data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }
        });
    }return _tbvCellMutArr;
}

@end
