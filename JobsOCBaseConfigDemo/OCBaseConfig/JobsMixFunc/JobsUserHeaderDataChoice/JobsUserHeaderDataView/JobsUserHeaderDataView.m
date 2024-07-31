//
//  JobsUserHeaderDataView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/19.
//

#import "JobsUserHeaderDataView.h"

@interface JobsUserHeaderDataView ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
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
+(instancetype)sharedInstance{
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
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
//    self.viewModel.usesTableViewHeaderView = YES;// 这个属性在外面设置
    MakeDataNull
    self.tableView.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    model = model ? : UIViewModel.new;
//    model.usesTableViewHeaderView = YES;// 这个属性在外面设置
    return CGSizeMake(JobsMainScreen_WIDTH(),
                      (model.usesTableViewHeaderView ? [JobsUserHeaderDataViewForHeaderInSection viewHeightWithModel:nil] : 0 ) +
                      JobsBottomSafeAreaHeight() +
                      JobsWidth(31) +
                      [JobsUserHeaderDataViewTBVCell cellHeightWithModel:nil] * JobsUserHeaderDataView.createDataMutArr.count);
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [JobsUserHeaderDataViewTBVCell cellHeightWithModel:Nil];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.objectBlock) self.objectBlock([tableView cellForRowAtIndexPath:indexPath]);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsUserHeaderDataViewTBVCell *cell = [JobsUserHeaderDataViewTBVCell cellStyleValue2WithTableView:tableView];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    NSLog(@"%d",self.viewModel.usesTableViewHeaderView);
    return self.viewModel.usesTableViewHeaderView ? [JobsUserHeaderDataViewForHeaderInSection viewHeightWithModel:nil] : 0;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (nullable UIView *)tableView:(UITableView *)tableView
        viewForHeaderInSection:(NSInteger)section{
    if (self.viewModel.usesTableViewHeaderView) {
        JobsUserHeaderDataViewForHeaderInSection *headerView = tableView.tableViewHeaderFooterView(JobsUserHeaderDataViewForHeaderInSection.class,@"");
        headerView.section = section;
        [headerView richElementsInViewWithModel:nil];
        @jobs_weakify(self)
        [headerView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
        }];return headerView;
    }return nil;
}


#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsClearColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        _tableView.dataLink(self);
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
//        _tableView.contentInset = UIEdgeInsetsMake(JobsWidth(20), 0, 0, 0);
//        [_tableView registerTableViewClass];
        _tableView.registerHeaderFooterViewClass(JobsUserHeaderDataViewForHeaderInSection.class,@"");
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = JobsInternationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.loadBlock = ^id _Nullable(id  _Nullable data) {
                @jobs_strongify(self)
                [self feedbackGenerator];//震动反馈
                return nil;
            };

            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = JobsInternationalization(@"");
            refreshConfigFooter.pullingTitle = JobsInternationalization(@"");
            refreshConfigFooter.refreshingTitle = JobsInternationalization(@"");
            refreshConfigFooter.willRefreshTitle = JobsInternationalization(@"");
            refreshConfigFooter.noMoreDataTitle = JobsInternationalization(@"");
            refreshConfigFooter.loadBlock = ^id _Nullable(id  _Nullable data) {
                @jobs_strongify(self)
                [self endRefreshing:self.tableView];
                return nil;
            };

            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;

            _tableView.mj_header = self.mjRefreshNormalHeader;
            _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
        }
        
    }return _tableView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = JobsUserHeaderDataView.createDataMutArr;
    }return _dataMutArr;
}

@end
