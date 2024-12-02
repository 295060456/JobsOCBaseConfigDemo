//
//  PicToStrStoreVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import "PicToStrStoreVC.h"

@interface PicToStrStoreVC ()
/// UI
@property(nonatomic,strong)UILabel *tableFooterView;
/// Data
@property(nonatomic,strong)NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof UIViewModel *>*dataMutArr;

@end

@implementation PicToStrStoreVC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }

    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
    self.tableView.reloadDatas();
//    [self.bgImageView removeFromSuperview];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类。父类只做提示
    if (_dataMutArr.count) {
        [self.dataMutArr removeAllObjects];
        _dataMutArr = nil;
    }
    [self.tableView.mj_header beginRefreshing];
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
//    self.restoreStatusBarCor(nil);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}
#pragma mark —— 一些私有方法
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsBaseTableViewCell.cellHeightByModel(self.dataMutArr[indexPath.row]) * 2;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.dataMutArr[indexPath.row].requestParams isKindOfClass:NSNumber.class]) {
        self.comingToPushVCByRequestParams(PicToStrStoreSubVC.new,
                                           self.dataMutArr[indexPath.row]);
    }else self.jobsToastMsg(JobsInternationalization(@"尚未接入此功能"));
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)self.tbvCellMutArr[indexPath.row];
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.row]);
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self )
            tableView.backgroundColor = JobsWhiteColor;
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            tableView.showsVerticalScrollIndicator = NO;
            tableView.dataLink(self);
            tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
            tableView.tableFooterView = self.tableFooterView;/// 这里接入的就是一个UIView的派生类
            tableView.separatorColor = HEXCOLOR(0xEEEEEE);
            tableView.contentInset = UIEdgeInsetsMake(JobsWidth(0),
                                                      JobsWidth(0),
                                                      JobsWidth(100),
                                                      JobsWidth(0));
            {
                tableView.mj_header = self.view.MJRefreshNormalHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                    data.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
                    data.pullingTitle = JobsInternationalization(@"下拉可以刷新");
                    data.refreshingTitle = JobsInternationalization(@"松开立即刷新");
                    data.willRefreshTitle = JobsInternationalization(@"刷新数据中");
                    data.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
                    data.automaticallyChangeAlpha = YES;/// 根据拖拽比例自动切换透明度
                    data.loadBlock = ^id _Nullable(id  _Nullable data) {
                        @jobs_strongify(self)
                        self.feedbackGenerator();//震动反馈
                        self->_tableView.endRefreshing(YES);
                        return nil;
                    };
                }));
                tableView.mj_footer = self.view.MJRefreshAutoNormalFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
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
            [self.view addSubview:tableView];
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                if (self.setupNavigationBarHidden && self.gk_statusBarHidden) {// 系统、GK均隐藏
                    make.edges.equalTo(self.view);
                }else{
                    if (!self.setupNavigationBarHidden && self.gk_statusBarHidden) {// 用系统的导航栏
                        make.top.equalTo(self.view).offset(JobsNavigationBarAndStatusBarHeight(nil));
                    }
                    if (self.setupNavigationBarHidden && !self.gk_statusBarHidden) {// 用GK的导航栏
                        make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    }make.left.right.bottom.equalTo(self.view);
                }
            }];
        });
    }return _tableView;
}

-(UILabel *)tableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.text = JobsInternationalization(@"- 没有更多的内容了 -");
            label.font = UIFontWeightRegularSize(12);
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = HEXCOLOR(0xB0B0B0);
    //        label.size = CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(48));
            label.makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _tableFooterView;
}

-(NSMutableArray<__kindof UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            [self.dataMutArr enumerateObjectsUsingBlock:^(__kindof UIViewModel *_Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL *_Nonnull stop) {
                @jobs_strongify(self)
                 data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }];
        });
    }return _tbvCellMutArr;
}

-(NSMutableArray<__kindof UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用十六进制字符串进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_Hexadecimal);
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用Base16编码进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_Base16);
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用Base32编码进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_Base32);
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用Base64编码进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_Base64);
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用Base85编码进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_Base85);
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用MIME编码进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_MIME);
            })));
        });
    }return _dataMutArr;
}

@end
