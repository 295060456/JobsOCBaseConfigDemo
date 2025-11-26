//
//  JobsCommentCoreVC.m
//  JobsComment
//
//  Created by Jobs on 2020/11/15.
//

#import "JobsCommentCoreVC.h"

@interface JobsCommentCoreVC ()
/// UI
Prop_strong()JobsCommentTitleHeaderView *titleHeaderView;
/// Data
Prop_strong()JobsCommentModel *mjModel;
Prop_strong()JobsCommentModel *yyModel;

@end

@implementation JobsCommentCoreVC

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}
#pragma mark - Lifecycle
-(instancetype)init{
    if (self = [super init]) {
//        [self loadData];
    }return self;
}

-(void)loadView{
    [super loadView];
    @jobs_weakify(self)
    [MainWindow actionObjBlock:^(id data) {
        @jobs_strongify(self)
        [self dismissViewControllerAnimated:YES completion:Nil];
    }];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsOrangeColor;
//    @jobs_weakify(self)
//    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.userHeadBtn));
//    });
//    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
////        data.add(UIBarButtonItem.initBy(self.deleteBtn));
//    });
//    self.makeNavByAlpha(1);
    self.isHiddenNavigationBar = YES;//禁用系统的导航栏
    self.gk_statusBarHidden = YES;
    self.gk_navigationBar.jobsVisible = YES;
    
    self.titleHeaderView.alpha = 1;
    self.tableView.reloadDatas();
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark —— 一些公有方法
-(void)setMJModel:(JobsCommentModel *)mjModel{
    self.mjModel = mjModel;
    self.tableView.endRefreshing(self.mjModel.listDataArr.count);
}

-(void)setYYModel:(JobsCommentModel *)yyModel{
    self.yyModel = yyModel;
    self.tableView.endRefreshing(self.mjModel.listDataArr.count);
}

-(JobsCommentTitleHeaderView *)getJobsCommentTitleHeaderView{
    return self.titleHeaderView;
}

-(UITableView *)getTableView{
    return self.tableView;
}
#pragma mark —— 一些私有方法
-(void)一级标题点击事件{
    self.jobsToastMsg(@"一级标题点击事件".tr);
}

-(void)二级标题点击事件{
    self.jobsToastMsg(@"二级标题点击事件".tr);
}
#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsLoadMoreTBVCell.cellHeightByModel(nil);//isFullShow
}

-(CGFloat)tableView:(UITableView *)tableView
heightForFooterInSectionByModel:(NSInteger)section{
    return 0.0f;
}

-(nullable __kindof UIView *)tableView:(UITableView *)tableView
                viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self 二级标题点击事件];
}
/// 二级评论
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    @jobs_weakify(self)
    return jobsMakeFirstCommentCustomCofigModel(^(__kindof JobsFirstCommentCustomCofigModel * _Nullable model) {
        @jobs_strongify(self)
        model.childDataArr = self.mjModel.listDataArr[section].childDataArr;
    }).firstShowNum;
}
/// 二级评论数据 展示在cellForRowAtIndexPath
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsFirstCommentModel *firstCommentModel = (JobsFirstCommentModel *)self.mjModel.listDataArr[indexPath.section];//一级评论数据 展示在viewForHeaderInSection
    JobsChildCommentModel *childCommentModel = firstCommentModel.childDataArr[indexPath.row];//二级评论数据 展示在cellForRowAtIndexPath
    JobsFirstCommentCustomCofigModel *customCofigModel = jobsMakeFirstCommentCustomCofigModel(^(__kindof JobsFirstCommentCustomCofigModel * _Nullable model) {
        model.childDataArr = firstCommentModel.childDataArr;
    });
    if (customCofigModel.isFullShow) {
        JobsInfoTBVCell *cell = JobsInfoTBVCell.cellStyleValue1WithTableView(tableView);
        cell.jobsRichElementsTableViewCellBy(childCommentModel)
            .JobsBlock1(^(id _Nullable data) {
            
        });return cell;
    }else{
        if (indexPath.row <= customCofigModel.firstShowNum) {
            // 二级评论展示...
            JobsInfoTBVCell *cell = JobsInfoTBVCell.cellStyleValue1WithTableView(tableView);
            cell.jobsRichElementsTableViewCellBy(childCommentModel)
                .JobsBlock1(^(id _Nullable data) {
                
            });return cell;
        }else{
            // 加载更多...
            JobsLoadMoreTBVCell *cell = JobsLoadMoreTBVCell.cellStyleValue1WithTableView(tableView);
            cell.jobsRichElementsTableViewCellBy(nil)
                .JobsBlock1(^(id _Nullable data) {
                
            });return cell;
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    JobsLog(@"一级评论的个数 = %ld",self.mjModel.listDataArr.count);
    return self.mjModel.listDataArr.count;/// 一级评论👌
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{///  👌
    return JobsCommentPopUpView_viewForHeaderInSection.viewHeightByModel(nil);
}
/// 一级评论数据 展示在viewForHeaderInSection
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (nullable __kindof UIView *)tableView:(UITableView *)tableView
        viewForHeaderInSection:(NSInteger)section{
    @jobs_weakify(self)
    return JobsCommentPopUpView_viewForHeaderInSection
        .JobsRichViewByModel(self.mjModel.listDataArr[section])/// 一级评论数据 展示在viewForHeaderInSection
        .JobsBlock1(^(id _Nullable data) {/// 一级标题点击事件
            @jobs_strongify(self)
            [self 一级标题点击事件];
    });
}
#pragma mark —— lazyLoad
-(JobsCommentTitleHeaderView *)titleHeaderView{
    if (!_titleHeaderView) {
        @jobs_weakify(self)
        _titleHeaderView = JobsCommentTitleHeaderView
            .JobsRichViewByModel(nil)
            .JobsBlock1(^(id _Nullable data) {/// 一级标题点击事件
                @jobs_strongify(self)
                self.backViewControllerCore(self);
        });
        [self.view.addSubview(_titleHeaderView) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.height.mas_equalTo(JobsWidth(50));
        }];
    }return _titleHeaderView;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        /// UITableViewStyleGrouped 取消悬停效果
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.backgroundColor = HEXCOLOR(0x242A37);
            tableView.dataLink(self);
            tableView.showsVerticalScrollIndicator = NO;
            tableView.showsHorizontalScrollIndicator = NO;
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
            tableView.mj_header = self.mjRefreshGifHeader;
            tableView.mj_footer = self.mjRefreshBackNormalFooter;
            tableView.mj_footer.hidden = NO;
            tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
                /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
            });
            tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
                /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
            });
            tableView.contentInset = UIEdgeInsetsMake(0, 0, self.popUpHeight, 0);
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView.separatorColor = JobsWhiteColor;
            
            {
                tableView.buttonModelEmptyData = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.title = @"没有评论".tr;
                    data.subTitle = @"来发布第一条吧".tr;
                    data.titleCor = JobsWhiteColor;
                    data.titleFont = bayonRegular(JobsWidth(30));
                    data.normalImage = @"暂无数据".img;
                    data.baseBackgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
                });
            }
            {
                // 用值
                tableView.mj_header = self.view.LOTAnimationMJRefreshHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                    data.stateIdleTitle = @"下拉刷新数据".tr;
                    data.pullingTitle = @"下拉刷新数据".tr;
                    data.refreshingTitle = @"正在刷新数据".tr;
                    data.willRefreshTitle = @"刷新数据中".tr;
                    data.noMoreDataTitle = @"下拉刷新数据".tr;
                    data.loadBlock = ^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        /// 装载本地假数据
                        NSDictionary *dic = @"CommentData".readLocalFileWithName;
                        self.mjModel = [JobsCommentModel mj_objectWithKeyValues:dic[@"data"]];
                    //    self.yyModel = [MKCommentModel yy_modelWithDictionary:dic[@"data"]];
                        JobsLog(@"self.mjModel = %@",self.mjModel);
                        self.tableView.endRefreshing(self.mjModel.listDataArr.count);
                        // 特别说明：pagingEnabled = YES 在此会影响Cell的偏移量，原作者希望我们在这里临时关闭一下，刷新完成以后再打开
                        self.tableView.pagingEnabled = NO;
                        self.tableView.mj_footer.state = MJRefreshStateIdle;
                        self.tableView.mj_footer.hidden = YES;
                        self.tableView.pagingEnabled = YES;
                        
                        return nil;
                    };
                }));
                tableView.mj_footer = self.view.MJRefreshAutoGifFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                    data.stateIdleTitle = @"".tr;
                    data.pullingTitle = @"".tr;
                    data.refreshingTitle = @"".tr;
                    data.willRefreshTitle = @"".tr;
                    data.noMoreDataTitle = @"".tr;
                    data.loadBlock = ^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        JobsLog(@"上拉加载更多");
                        self.tableView.endRefreshing(self.mjModel.listDataArr.count);
                        return nil;
                    };
                }));
                tableView.mj_footer.backgroundColor = JobsRedColor;
                self.view.mjRefreshTargetView = tableView;
            }
            [self.view.addSubview(tableView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleHeaderView.mas_bottom);
                make.bottom.left.right.equalTo(self.view);
            }];
        });
    }return _tableView;
}

@end
