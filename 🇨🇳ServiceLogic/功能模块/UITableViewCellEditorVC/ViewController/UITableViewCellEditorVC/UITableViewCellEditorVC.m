//
//  UITableViewCellEditorVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/6.
//

#import "UITableViewCellEditorVC.h"

@interface UITableViewCellEditorVC ()
/// UI
@property(nonatomic,strong)UIButton *editBtn;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)MsgEditBoardView *msgEditBoardView;
/// Data
@property(nonatomic,strong)NSMutableArray <JobsMsgDataModel *>*dataMutArr;
@property(nonatomic,strong)NSMutableArray <JobsMsgDataModel *>*selectedDataMutArr;

@end

@implementation UITableViewCellEditorVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setGKNav];
    [self setGKNavBackBtn];
    
    self.gk_navRightBarButtonItems = @[[UIBarButtonItem.alloc initWithCustomView:self.editBtn]];
    
    self.tableView.alpha = 1;
    self.msgEditBoardView.jobsVisible = YES;
    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— 一些私有方法
-(void)dataForUI{
    [self.tableView reloadData];
    [self.tableView setEditing:NO animated:YES];
    [self.selectedDataMutArr removeAllObjects];
    self.msgEditBoardView.getDeleteBtn.enabledBlock(self.selectedDataMutArr.count);
    self.msgEditBoardView.getMarkToReadBtn.enabledBlock(self.selectedDataMutArr.count);
    self.editBtn.selected = NO;
    self.editBtn.normalTitle = Internationalization(@"編輯");
    [self.msgEditBoardView disappearByView:self.view];
}
/// 全选的实现
-(void)allChoose{
    /// UI层
    for (int i = 0; i< self.dataMutArr.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.selected = YES;
        
        if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
            [self.tableView.delegate tableView:self.tableView didSelectRowAtIndexPath:indexPath];
        }
    }
    
    /// Data层
    [self.selectedDataMutArr removeAllObjects];
    [self.selectedDataMutArr addObjectsFromArray:self.dataMutArr];
}
/// 取消全选的实现
-(void)allCancelChoose{
    /// UI层
    for (int i = 0; i< self.dataMutArr.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.selected = NO;
    }
    /// Data层
    [self.selectedDataMutArr removeAllObjects];
}
/// 单行点击改变数据层
-(NSMutableArray<JobsMsgDataModel *> *)manuallyDataAtIndexPath:(NSIndexPath *)indexPath{
    [self.selectedDataMutArr containsObject:self.dataMutArr[indexPath.row]] ? [self.selectedDataMutArr removeObject:self.dataMutArr[indexPath.row]] : [self.selectedDataMutArr addObject:self.dataMutArr[indexPath.row]];
    return self.selectedDataMutArr;
}

-(MsgEditBoardView *)getMsgEditBoardView{
    return self.msgEditBoardView;
}

-(UITableView *)getTableView{
    return self.tableView;
}
/// 下拉刷新 （子类要进行覆写）
-(void)pullToRefresh{
    [self feedbackGenerator];//震动反馈
//    @jobs_weakify(self)
//    if (data.count) {
//        [self endRefreshing:self.tableView];
//    }else{
//        [self endRefreshingWithNoMoreData:self.tableView];
//    }
}
///上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView*)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath*)indexPath{
    
}
/// 开始进入编辑模式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView
          editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableView.editing) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.selected = YES;
        NSMutableArray<JobsMsgDataModel *> *dataMutArr = [self manuallyDataAtIndexPath:indexPath];
        self.msgEditBoardView.getDeleteBtn.enabledBlock(dataMutArr.count);
        self.msgEditBoardView.getMarkToReadBtn.enabledBlock(dataMutArr.count);
    }else{

        UIViewModel *viewModel = UIViewModel.new;
        viewModel.data = self.dataMutArr[indexPath.row];
        
        JobsMsgDetailVC *msgDetailVC = JobsMsgDetailVC.new;
        @jobs_weakify(self)
        [msgDetailVC actionObjectBlock:^(JobsMsgDataModel *data) {
            @jobs_strongify(self)
            [self.dataMutArr removeObject:data];
            [self.tableView reloadData];
        }];
        
        [self comingToPushVC:msgDetailVC
               requestParams:viewModel];
    }
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableView.editing) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.selected = NO;
        NSMutableArray<JobsMsgDataModel *> *dataMutArr = [self manuallyDataAtIndexPath:indexPath];
        self.msgEditBoardView.getDeleteBtn.enabledBlock(dataMutArr.count);
        self.msgEditBoardView.getMarkToReadBtn.enabledBlock(dataMutArr.count);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(60);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = (UITableViewCell *)[UITableViewCell cellStyleValue1WithTableView:tableView];
    return cell;
}
#pragma mark —— lazyLoad
-(UIButton *)editBtn{
    if (!_editBtn) {
        _editBtn = UIButton.new;
        _editBtn.normalTitle = Internationalization(@"編輯");
        _editBtn.titleFont = notoSansBold(12);
        _editBtn.normalTitleColor = HEXCOLOR(0x3D4A58);
        @jobs_weakify(self)
        [_editBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
//            toast(x.titleForNormalState);
            x.selected = !x.selected;
            x.normalTitle = x.selected ? Internationalization(@"完成") : Internationalization(@"編輯");
            [self.tableView setEditing:x.selected animated:YES];
            x.selected ? [self.getMsgEditBoardView appearByView:self.view] : [self.getMsgEditBoardView disappearByView:self.view];
            return nil;
        }];
    }return _editBtn;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
//        _tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        [_tableView registerTableViewClass];
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
        }
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = Internationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = Internationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = Internationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = Internationalization(@"下拉可以刷新");
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = @"";
            refreshConfigFooter.pullingTitle = @"";
            refreshConfigFooter.refreshingTitle = @"";
            refreshConfigFooter.willRefreshTitle = @"";
            refreshConfigFooter.noMoreDataTitle = @"";
            
            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;
            
            _tableView.mj_header = self.mjRefreshNormalHeader;
            _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
        }
        
        {
            _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"暂无数据"
                                                                titleStr:Internationalization(@"暂无数据")
                                                               detailStr:Internationalization(@"")];
            
            _tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _tableView.ly_emptyView.contentViewOffset = -JobsWidth(180);
            _tableView.ly_emptyView.titleLabFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightMedium];
        }
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }return _tableView;
}

-(MsgEditBoardView *)msgEditBoardView{
    if (!_msgEditBoardView) {
        _msgEditBoardView = MsgEditBoardView.new;
        _msgEditBoardView.frame = [MsgEditBoardView viewFrameWithModel:nil];
        [_msgEditBoardView richElementsInViewWithModel:nil];
        _msgEditBoardView.getDeleteBtn.enabledBlock(self.selectedDataMutArr.count);
        @jobs_weakify(self)
        [_msgEditBoardView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:UIButton.class]) {
                UIButton *btn = (UIButton *)data;
                if ([btn.normalTitle isEqualToString:Internationalization(@"全選")]) {
                    btn.selected ? [self allChoose] : [self allCancelChoose];
                }else if ([btn.normalTitle isEqualToString:Internationalization(@"標記為已讀")]){
                    
                    for (JobsMsgDataModel *model in self.selectedDataMutArr) {//dataMutArr
                        model.isRead = YES;
                        NSUInteger index = [self.dataMutArr indexOfObject:model];
                        [self.dataMutArr replaceObjectAtIndex:index withObject:model];
                    }
                    [self dataForUI];
                }else if ([btn.normalTitle isEqualToString:Internationalization(@"删除")]){
                    NSLog(@"%@",self.selectedDataMutArr);
                    [self.dataMutArr removeObjectsInArray:self.selectedDataMutArr];
                    [self dataForUI];
                }else{}
            }
        }];
    }return _msgEditBoardView;
}

-(NSMutableArray<JobsMsgDataModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            JobsMsgDataModel *viewModel = JobsMsgDataModel.new;
            viewModel.msgStyle = JobsMsgType_Notify;/// 通知
            viewModel.textModel.text = Internationalization(@"6月1日13:00點整，英超焦點賽月1日13:00點整，英超焦點賽");
            viewModel.subTextModel.text = Internationalization(@"夏季聯賽火熱來襲，全體會員虛擬幣存...夏季聯賽火熱來襲，全體會員虛擬幣存");
            viewModel.time = Internationalization(@"05-13 18:20");
            viewModel.isDraw = NO;
            viewModel.isRead = NO;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            JobsMsgDataModel *viewModel = JobsMsgDataModel.new;
            viewModel.msgStyle = JobsMsgType_Activity;/// 活动
            viewModel.textModel.text = Internationalization(@"6月1日13:00點");
            viewModel.subTextModel.text = Internationalization(@"夏季聯賽火熱來襲，全體會員虛擬幣存...");
            viewModel.time = Internationalization(@"05-13 18:20");
            viewModel.isDraw = YES;
            viewModel.isRead = YES;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            JobsMsgDataModel *viewModel = JobsMsgDataModel.new;
            viewModel.msgStyle = JobsMsgType_Notice;/// 公告
            viewModel.textModel.text = Internationalization(@"6月1日");
            viewModel.subTextModel.text = Internationalization(@"夏季聯賽火熱來襲，全體會員虛擬幣存...");
            viewModel.time = Internationalization(@"05-13 18:20");
            viewModel.isDraw = NO;
            viewModel.isRead = NO;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            JobsMsgDataModel *viewModel = JobsMsgDataModel.new;
            viewModel.msgStyle = JobsMsgType_Bonus;/// 红利
            viewModel.textModel.text = Internationalization(@"wowowowowo");
            viewModel.subTextModel.text = Internationalization(@"夏季聯賽火熱來襲，全體會員虛擬幣存...");
            viewModel.time = Internationalization(@"05-13 18:20");
            viewModel.isDraw = YES;
            viewModel.isRead = YES;
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}

-(NSMutableArray<JobsMsgDataModel *> *)selectedDataMutArr{
    if (!_selectedDataMutArr) {
        _selectedDataMutArr = NSMutableArray.array;
    }return _selectedDataMutArr;
}

@end
