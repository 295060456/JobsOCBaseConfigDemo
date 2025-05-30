//
//  PicToStrStoreVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import "PicToStrStoreVC.h"

@interface PicToStrStoreVC ()
/// Data
Prop_copy()NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
Prop_copy()NSMutableArray <__kindof UIViewModel *>*dataMutArr;

@end

@implementation PicToStrStoreVC

- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
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
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
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
    return (JobsBaseTableViewCell *)self.tbvCellMutArr[indexPath.row]
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row]);
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath cell:cell];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self )
            tableView.dataLink(self);
            tableView.backgroundColor = JobsWhiteColor;
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            tableView.showsVerticalScrollIndicator = NO;
            tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
                /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
            });
            tableView.tableFooterView = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label.byText(JobsInternationalization(@"- 没有更多的内容了 -"))
                    .byFont(UIFontWeightRegularSize(12))
                    .byTextCor(HEXCOLOR(0xB0B0B0))
                    .byTextAlignment(NSTextAlignmentCenter);
//                label.size = CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(48));
                label.makeLabelByShowingType(UILabelShowingType_03);
            });/// 这里接入的就是一个UIView的派生类
            tableView.separatorColor = HEXCOLOR(0xEEEEEE);
            tableView.contentInset = UIEdgeInsetsMake(JobsWidth(0),
                                                      JobsWidth(0),
                                                      JobsWidth(100),
                                                      JobsWidth(0));
            {
                tableView.mj_header = self.view.MJRefreshNormalHeaderBy([self refreshHeaderDataBy:^id _Nullable(id  _Nullable data) {
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    tableView.endRefreshing(YES);
                    return nil;
                }]);
                tableView.mj_footer = self.view.MJRefreshFooterBy([self refreshFooterDataBy:^id _Nullable(id  _Nullable data) {
                    tableView.endRefreshing(YES);
                    return nil;
                }]);
            }
            [self.view.addSubview(tableView) mas_makeConstraints:^(MASConstraintMaker *make) {
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
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用Base16编码进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_Base16);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用Base32编码进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_Base32);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用Base64编码进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_Base64);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用Base85编码进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_Base85);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"利用MIME编码进行存取");
                model.subTitle = JobsInternationalization(@"");
                model.requestParams = @(PicToStrStyle_MIME);
            })));
        });
    }return _dataMutArr;
}

@end
