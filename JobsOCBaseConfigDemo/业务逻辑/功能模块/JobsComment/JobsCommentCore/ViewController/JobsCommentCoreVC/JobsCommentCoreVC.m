//
//  JobsCommentCoreVC.m
//  JobsComment
//
//  Created by Jobs on 2020/11/15.
//

#import "JobsCommentCoreVC.h"

@interface JobsCommentCoreVC ()
/// UI
@property(nonatomic,strong)JobsCommentTitleHeaderView *titleHeaderView;
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)JobsCommentModel *mjModel;
@property(nonatomic,strong)JobsCommentModel *yyModel;

@end

@implementation JobsCommentCoreVC

- (void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
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
    [NSObject.mainWindow() actionObjectBlock:^(id data) {
        @jobs_strongify(self)
        [self dismissViewControllerAnimated:YES
                                 completion:Nil];
    }];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsOrangeColor;
//    @jobs_weakify(self)
//    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
//        @jobs_strongify(self)
//        data.add(JobsBarButtonItem(self.userHeadBtn));
//    });
//    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
//        @jobs_strongify(self)
////        data.add(JobsBarButtonItem(self.deleteBtn));
//    });
//    self.makeNavByAlpha(1);
    self.isHiddenNavigationBar = YES;//禁用系统的导航栏
    self.gk_statusBarHidden = YES;
    self.gk_navigationBar.jobsVisible = YES;
    
    self.titleHeaderView.alpha = 1;
    self.tableView.alpha = 1;
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
    [self dataSource:self.mjModel.listDataArr contentView:self.tableView];
    self.tableView.endRefreshing();
}

-(void)setYYModel:(JobsCommentModel *)yyModel{
    self.yyModel = yyModel;
    [self dataSource:self.yyModel.listDataArr contentView:self.tableView];
    self.tableView.endRefreshing();
}

-(JobsCommentTitleHeaderView *)getJobsCommentTitleHeaderView{
    return self.titleHeaderView;
}

-(UITableView *)getTableView{
    return self.tableView;
}
#pragma mark —— 一些私有方法
-(void)一级标题点击事件{
    self.jobsToastMsg(JobsInternationalization(@"一级标题点击事件"));
}

-(void)二级标题点击事件{
    self.jobsToastMsg(JobsInternationalization(@"二级标题点击事件"));
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
    JobsFirstCommentModel *firstCommentModel = (JobsFirstCommentModel *)self.mjModel.listDataArr[section];
    JobsFirstCommentCustomCofigModel *customCofigModel = JobsFirstCommentCustomCofigModel.new;
    customCofigModel.childDataArr = firstCommentModel.childDataArr;
    return customCofigModel.firstShowNum;
}
/// 二级评论数据 展示在cellForRowAtIndexPath
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsFirstCommentModel *firstCommentModel = (JobsFirstCommentModel *)self.mjModel.listDataArr[indexPath.section];//一级评论数据 展示在viewForHeaderInSection
    JobsChildCommentModel *childCommentModel = firstCommentModel.childDataArr[indexPath.row];//二级评论数据 展示在cellForRowAtIndexPath
    JobsFirstCommentCustomCofigModel *customCofigModel = JobsFirstCommentCustomCofigModel.new;
    customCofigModel.childDataArr = firstCommentModel.childDataArr;

    if (customCofigModel.isFullShow) {
        JobsInfoTBVCell *cell = JobsInfoTBVCell.cellStyleValue1WithTableView(tableView);
        cell.jobsRichElementsInCellWithModel(childCommentModel);
//        @jobs_weakify(self)
        [cell actionObjectBlock:^(id data) {
//            @jobs_strongify(self)
        }];return cell;
    }else{
        if (indexPath.row <= customCofigModel.firstShowNum) {
            // 二级评论展示...
            JobsInfoTBVCell *cell = JobsInfoTBVCell.cellStyleValue1WithTableView(tableView);
            cell.jobsRichElementsInCellWithModel(childCommentModel);
//            @jobs_weakify(self)
            [cell actionObjectBlock:^(id data) {
//                @jobs_strongify(self)
            }];return cell;
        }else{
            // 加载更多...
            JobsLoadMoreTBVCell *cell = JobsLoadMoreTBVCell.cellStyleValue1WithTableView(tableView);
            cell.jobsRichElementsInCellWithModel(nil);
            return cell;
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"一级评论的个数 = %ld",self.mjModel.listDataArr.count);
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
    JobsCommentPopUpView_viewForHeaderInSection *header = JobsCommentPopUpView_viewForHeaderInSection.new;
    header.jobsRichViewByModel(self.mjModel.listDataArr[section]);/// 一级评论数据 展示在viewForHeaderInSection
    @jobs_weakify(self)
    // 一级标题点击事件
    [header actionObjectBlock:^(id data) {
        @jobs_strongify(self)
        [self 一级标题点击事件];
    }];return header;
}
#pragma mark —— lazyLoad
-(JobsCommentTitleHeaderView *)titleHeaderView{
    if (!_titleHeaderView) {
        _titleHeaderView = JobsCommentTitleHeaderView.new;
        _titleHeaderView.jobsRichViewByModel(nil);
        @jobs_weakify(self)
        [_titleHeaderView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            [self dismissViewControllerAnimated:YES
                                     completion:Nil];
        }];
        [self.view addSubview:_titleHeaderView];
        [_titleHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.height.mas_equalTo(JobsWidth(50));
        }];
    }return _titleHeaderView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        // UITableViewStyleGrouped 取消悬停效果
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = HEXCOLOR(0x242A37);
        _tableView.dataLink(self);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.mj_header = self.mjRefreshGifHeader;
        _tableView.mj_footer = self.mjRefreshBackNormalFooter;
        _tableView.mj_footer.hidden = NO;
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, self.popUpHeight, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorColor = JobsWhiteColor;
        _tableView.ly_emptyView = [EmptyView emptyViewWithImageStr:@"Indeterminate Spinner - Small"
                                                          titleStr:JobsInternationalization(@"没有评论")
                                                         detailStr:JobsInternationalization(@"来发布第一条吧")];
        {
            // 创建自定义值，用model管理
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉刷新数据");
            refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉刷新数据");
            refreshConfigHeader.refreshingTitle = JobsInternationalization(@"正在刷新数据");
            refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉刷新数据");
            refreshConfigHeader.loadBlock = ^id _Nullable(id _Nullable data) {
                @jobs_strongify(self)
                /// 装载本地假数据
                NSDictionary *dic = @"CommentData".readLocalFileWithName;
                self.mjModel = [JobsCommentModel mj_objectWithKeyValues:dic[@"data"]];
            //    self.yyModel = [MKCommentModel yy_modelWithDictionary:dic[@"data"]];

                NSLog(@"self.mjModel = %@",self.mjModel);
                [self dataSource:self.mjModel.listDataArr contentView:self.tableView];
                self->_tableView.endRefreshing();
                // 特别说明：pagingEnabled = YES 在此会影响Cell的偏移量，原作者希望我们在这里临时关闭一下，刷新完成以后再打开
                self.tableView.pagingEnabled = NO;
                self.tableView.mj_footer.state = MJRefreshStateIdle;
                self.tableView.mj_footer.hidden = YES;
                self.tableView.pagingEnabled = YES;
                
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
                NSLog(@"上拉加载更多");
                self->_tableView.endRefreshing();
                return nil;
            };
            // 赋值
            self.lotAnimMJRefreshHeader.refreshConfigModel = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;//数据赋值
            // 用值
            _tableView.mj_header = self.lotAnimMJRefreshHeader;
            _tableView.mj_footer = self.mjRefreshAutoGifFooter;
            _tableView.mj_footer.backgroundColor = JobsRedColor;
            self.view.mjRefreshTargetView = _tableView;
        }
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleHeaderView.mas_bottom);
            make.bottom.left.right.equalTo(self.view);
        }];
    }return _tableView;
}

@end
