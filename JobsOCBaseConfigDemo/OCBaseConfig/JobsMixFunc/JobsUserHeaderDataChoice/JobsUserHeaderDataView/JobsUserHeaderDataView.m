//
//  JobsUserHeaderDataView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/19.
//

#import "JobsUserHeaderDataView.h"

@interface JobsUserHeaderDataView ()
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation JobsUserHeaderDataView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_choiceUserHeaderDataViewOnceToken = 0;
    static_choiceUserHeaderDataView = nil;
}

static JobsUserHeaderDataView *static_choiceUserHeaderDataView = nil;
static dispatch_once_t static_choiceUserHeaderDataViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_choiceUserHeaderDataViewOnceToken, ^{
        static_choiceUserHeaderDataView = JobsUserHeaderDataView.new;
    });return static_choiceUserHeaderDataView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
//        [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
//                                            cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
//                                            cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
//        [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
//                                            cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
+(NSMutableArray<UIViewModel *> *)createDataMutArr{

    NSMutableArray *dataMutArr = NSMutableArray.array;
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"拍照");
        viewModel.textModel.font = [UIFont systemFontOfSize:JobsWidth(18) weight:UIFontWeightRegular];
        viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        [dataMutArr addObject:viewModel];
    }

    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"从相册中选取");
        viewModel.textModel.font = [UIFont systemFontOfSize:JobsWidth(18) weight:UIFontWeightRegular];
        viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        [dataMutArr addObject:viewModel];
    }

    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"取消");
        viewModel.textModel.font = [UIFont systemFontOfSize:JobsWidth(18) weight:UIFontWeightRegular];
        viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        [dataMutArr addObject:viewModel];
    }

    return dataMutArr;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
    //    self.viewModel.usesTableViewHeaderView = YES;// 这个属性在外面设置
        MakeDataNull
        self.tableView.reloadDatas();
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(UIViewModel *_Nullable data){
        data = data ? : UIViewModel.new;
    //    model.usesTableViewHeaderView = YES;// 这个属性在外面设置
        return CGSizeMake(JobsMainScreen_WIDTH(),
                          (data.usesTableViewHeaderView ? JobsUserHeaderDataViewForHeaderInSection.viewHeightByModel(nil) : 0 ) +
                          JobsBottomSafeAreaHeight() +
                          JobsWidth(31) +
                          JobsUserHeaderDataViewTBVCell.cellHeightByModel(nil) * JobsUserHeaderDataView.createDataMutArr.count);
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsUserHeaderDataViewTBVCell.cellHeightByModel(nil);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.objectBlock) self.objectBlock([tableView cellForRowAtIndexPath:indexPath]);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsUserHeaderDataViewTBVCell *cell = JobsUserHeaderDataViewTBVCell.cellStyleValue2WithTableView(tableView);
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.row]);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    NSLog(@"%d",self.viewModel.usesTableViewHeaderView);
    return self.viewModel.usesTableViewHeaderView ? JobsUserHeaderDataViewForHeaderInSection.viewHeightByModel(nil) : 0;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (nullable __kindof UIView *)tableView:(UITableView *)tableView
        viewForHeaderInSection:(NSInteger)section{
    if (self.viewModel.usesTableViewHeaderView) {
        JobsUserHeaderDataViewForHeaderInSection *headerView = tableView.tableViewHeaderFooterView(JobsUserHeaderDataViewForHeaderInSection.class,@"");
        headerView.section = section;
        headerView.jobsRichViewByModel(nil);
        @jobs_weakify(self)
        [headerView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
        }];return headerView;
    }return nil;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsClearColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        _tableView.dataLink(self);
        _tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
//        _tableView.contentInset = UIEdgeInsetsMake(JobsWidth(20), 0, 0, 0);
//        [_tableView registerTableViewClass];
        _tableView.registerHeaderFooterViewClass(JobsUserHeaderDataViewForHeaderInSection.class,@"");
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
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
                    self.feedbackGenerator();/// 震动反馈
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
                    self->_tableView.endRefreshing(self.dataMutArr.count);
                    return nil;
                };
            }));
        }
    }return _tableView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = JobsUserHeaderDataView.createDataMutArr;
    }return _dataMutArr;
}

@end
