//
//  JobsShowObjInfoVC.m
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#import "JobsShowObjInfoVC.h"

@interface JobsShowObjInfoVC ()
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation JobsShowObjInfoVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
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
    self.viewModel.backBtnTitleModel.textCor = JobsRedColor;
    self.viewModel.textModel.textCor = JobsGreenColor;
    self.viewModel.textModel.text = JobsInternationalization(@"用户信息展示(开发测试专用)");
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = @"启动页SLOGAN".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.tableView.reloadDatas();
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tableView.mj_beginRefreshing_header();
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsBaseTableViewCell.cellHeightByModel(self.dataMutArr[indexPath.row]);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIPasteboard.generalPasteboard.string = self.dataMutArr[indexPath.row].subTextModel.text;
    self.jobsToastMsg(JobsInternationalization(@"复制")
                      .add(self.dataMutArr[indexPath.row].textModel.text)
                      .add(JobsInternationalization(@"成功")));
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = JobsBaseTableViewCell.cellStyleValue1WithTableView(tableView)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
            .JobsBlock1(^(id _Nullable data) {
             
            });
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.textColor = JobsBrownColor;
    cell.textLabel.textColor = JobsBlackColor;

    return cell;
}

-(void)tableView:(UITableView *)tableView
 willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.alpha = self.isVisible;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(BaseTableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeBaseTableViewByPlain(^(__kindof BaseTableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.dataLink(self);
            tableView.backgroundColor = JobsWhiteColor;
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            tableView.showsVerticalScrollIndicator = NO;
            tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
                /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
            });
            tableView.separatorColor = HEXCOLOR(0xEEEEEE);
            {
                tableView.mj_header = self.view.MJRefreshNormalHeaderBy([self refreshHeaderDataBy:^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    if (self.dataMutArr.count) [self.dataMutArr removeAllObjects];
                    /// 装载数据
                    if ([self.viewModel.requestParams isKindOfClass:NSObject.class]) {
                        NSObject *requestParams = (NSObject *)self.viewModel.requestParams;
                        NSMutableArray <NSString *>*propertyList = requestParams.propertyList;
                        for (NSString *propertyName in propertyList) {
                            NSString *text = propertyName;
                            id subtext = requestParams.valueForKey(propertyName);
                            /// 防崩溃处理：
                            if([subtext isKindOfClass:NSString.class] &&
                               [text isKindOfClass:NSString.class]){
                                self.dataMutArr.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                                    viewModel.textModel.text = propertyName;
                                    viewModel.subTextModel.text = requestParams.valueForKey(propertyName);
                                    viewModel.textModel.textCor = JobsBlueColor;
                                    viewModel.textModel.font = UIFontSystemFontOfSize(10);
                                    viewModel.textModel.subTextCor = JobsRedColor;
                                    viewModel.textModel.subFont = UIFontSystemFontOfSize(8);
                                }));
                            }
                        }
                    }
                    self.isVisible = YES;
                    if (self.dataMutArr.count) {
                        self->_tableView.endRefreshing(self.dataMutArr.count);
                    }else{
                        self->_tableView.endRefreshingWithNoMoreData(self.dataMutArr.count);
                    }
                    /// 在reloadData后做的操作，因为reloadData刷新UI是在主线程上，那么就在主线程上等待
                    @jobs_weakify(self)
                    [self getMainQueue:^{
                        @jobs_strongify(self)
                        [self.tableView alphaAnimWithSortingType:(SortingType)SortingType_Positive
                                                  animationBlock:nil
                                                 completionBlock:nil];
                    }];return nil;
                }]);
                tableView.mj_footer = self.view.MJRefreshFooterBy([self refreshFooterDataBy:^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    self->_tableView.endRefreshing(self.dataMutArr.count);
                    return nil;
                }]);
            }
            self.view.addSubview(tableView);
            [self fullScreenConstraintTargetView:tableView topViewOffset:0];
        });
    }return _tableView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
    }return _dataMutArr;
}

@end
