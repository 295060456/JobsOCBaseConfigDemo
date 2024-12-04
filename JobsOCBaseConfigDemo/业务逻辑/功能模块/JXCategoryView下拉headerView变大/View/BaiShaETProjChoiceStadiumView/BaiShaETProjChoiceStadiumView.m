//
//  BaiShaETProjChoiceStadiumView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/9.
//

#import "BaiShaETProjChoiceStadiumView.h"

@interface BaiShaETProjChoiceStadiumTBVHeaderView ()

@property(nonatomic,strong)UIColor *cor;

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
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BaiShaETProjChoiceStadiumTBVHeaderView *tbvHeaderView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;
@property(nonatomic,strong)NSMutableArray <JobsBaseTableViewCell *>*tbvCellMutArr;

@end

@implementation BaiShaETProjChoiceStadiumView

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
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG真人");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG電子");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG彩票");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG棋牌");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
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
    
    if (self.objectBlock) self.objectBlock(self.dataMutArr[indexPath.row]);
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
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.row]);
    cell.textLabel.textColor = HEXCOLOR(0x757575);
    cell.textLabel.font = UIFontWeightRegularSize(16);
    cell.textLabelFrameOffsetX = JobsWidth(16);
    cell.imageViewFrameOffsetX = JobsMainScreen_WIDTH() - JobsWidth(50);
    cell.imageView.image = JobsIMG(@"红色的对勾");
    cell.imageView.jobsVisible = NO;
    
    cell.backgroundColor = cell.contentView.backgroundColor = HEXCOLOR(0xFFFCF7);
    return cell;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = UITableView.initWithStyleGrouped;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.scrollEnabled = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.tbvHeaderView;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        [_tableView registerTableViewClass];
        
        {
            _tableView.mj_header = self.MJRefreshNormalHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
                data.pullingTitle = JobsInternationalization(@"下拉可以刷新");
                data.refreshingTitle = JobsInternationalization(@"松开立即刷新");
                data.willRefreshTitle = JobsInternationalization(@"刷新数据中");
                data.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
                data.automaticallyChangeAlpha = YES;/// 根据拖拽比例自动切换透明度
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    self.feedbackGenerator();//震动反馈
                //    if (data.count) {
                //        self.endRefreshing(self->_tableView);
                //    }else{
                //        self.endRefreshingWithNoMoreData(self->_tableView);
                //    }
                    return nil;
                };
            }));
            _tableView.mj_footer = self.MJRefreshAutoNormalFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"");
                data.pullingTitle = JobsInternationalization(@"");
                data.refreshingTitle = JobsInternationalization(@"");
                data.willRefreshTitle = JobsInternationalization(@"");
                data.noMoreDataTitle = JobsInternationalization(@"");
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    self->_tableView.endRefreshing(YES);
                    return nil;
                };
            }));
        }
        
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
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
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            for (UIViewModel *viewModel in self.dataMutArr) {
                data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }
        });
    }return _tbvCellMutArr;
}

@end
