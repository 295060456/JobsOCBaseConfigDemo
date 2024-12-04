//
//  UITableViewCellEditorVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/6.
//

#import "UITableViewCellEditorVC.h"

@interface UITableViewCellEditorVC ()
/// UI
@property(nonatomic,strong)BaseButton *editBtn;
@property(nonatomic,strong)MsgEditBoardView *msgEditBoardView;
/// Data
@property(nonatomic,strong)NSMutableArray <JobsMsgDataModel *>*dataMutArr;
@property(nonatomic,strong)NSMutableArray <JobsMsgDataModel *>*selectedDataMutArr;

@end

@implementation UITableViewCellEditorVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.aboutBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(self.editBtn));
    });
    self.makeNavByAlpha(1);
    
    self.tableView.reloadDatas();
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
    self.editBtn.jobsResetBtnTitle(JobsInternationalization(@"編輯"));
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
    @jobs_weakify(self)
    if (self.tableView.editing) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.selected = YES;
        NSMutableArray<JobsMsgDataModel *> *dataMutArr = [self manuallyDataAtIndexPath:indexPath];
        self.msgEditBoardView.getDeleteBtn.enabledBlock(dataMutArr.count);
        self.msgEditBoardView.getMarkToReadBtn.enabledBlock(dataMutArr.count);
    }else{
        JobsMsgDetailVC *msgDetailVC = JobsMsgDetailVC.new;
        @jobs_weakify(self)
        [msgDetailVC actionObjectBlock:^(JobsMsgDataModel *data) {
            @jobs_strongify(self)
            [self.dataMutArr removeObject:data];
            [self.tableView reloadData];
        }];
        self.comingToPushVCByRequestParams(msgDetailVC,jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            @jobs_strongify(self)
            viewModel.data = self.dataMutArr[indexPath.row];
        }));
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

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = UITableViewCell.cellStyleValue1WithTableView(tableView);
    return cell;
}
#pragma mark —— lazyLoad
-(BaseButton *)editBtn{
    if (!_editBtn) {
        @jobs_weakify(self)
        _editBtn = BaseButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(12))
            .jobsResetBtnTitle(JobsInternationalization(@"編輯"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
    //            toast(x.titleForNormalState);
                x.selected = !x.selected;
                x.jobsResetBtnTitle(x.selected ? JobsInternationalization(@"完成") : JobsInternationalization(@"編輯"));
                [self.tableView setEditing:x.selected animated:YES];
                x.selected ? [self.getMsgEditBoardView appearByView:self.view] : [self.getMsgEditBoardView disappearByView:self.view];
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
    }return _editBtn;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
//        _tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        [_tableView registerTableViewClass];
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
        }
        
        {
            _tableView.mj_header = self.view.MJRefreshNormalHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
                data.pullingTitle = JobsInternationalization(@"下拉可以刷新");
                data.refreshingTitle = JobsInternationalization(@"松开立即刷新");
                data.willRefreshTitle = JobsInternationalization(@"刷新数据中");
                data.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
                data.automaticallyChangeAlpha = YES;/// 根据拖拽比例自动切换透明度
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    self->_tableView.endRefreshing(YES);
                    return nil;
                };
            }));
            _tableView.mj_footer = self.view.MJRefreshFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
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
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }return _tableView;
}

-(MsgEditBoardView *)msgEditBoardView{
    if (!_msgEditBoardView) {
        _msgEditBoardView = MsgEditBoardView.new;
        _msgEditBoardView.frame = MsgEditBoardView.viewFrameByModel(nil);
        _msgEditBoardView.jobsRichViewByModel(nil);
        _msgEditBoardView.getDeleteBtn.enabledBlock(self.selectedDataMutArr.count);
        @jobs_weakify(self)
        [_msgEditBoardView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:UIButton.class]) {
                UIButton *btn = (UIButton *)data;
                if ([btn.jobsResetBtnTitle isEqualToString:JobsInternationalization(@"全選")]) {
                    btn.selected ? [self allChoose] : [self allCancelChoose];
                }else if ([btn.jobsResetBtnTitle isEqualToString:JobsInternationalization(@"標記為已讀")]){
                    
                    for (JobsMsgDataModel *model in self.selectedDataMutArr) {//dataMutArr
                        model.isRead = YES;
                        NSUInteger index = [self.dataMutArr indexOfObject:model];
                        [self.dataMutArr replaceObjectAtIndex:index withObject:model];
                    }
                    [self dataForUI];
                }else if ([btn.jobsResetBtnTitle isEqualToString:JobsInternationalization(@"删除")]){
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
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeMsgDataModel(^(__kindof JobsMsgDataModel * _Nullable viewModel) {
                viewModel.msgStyle = JobsMsgType_Notify;/// 通知
                viewModel.textModel.text = JobsInternationalization(@"6月1日13:00點整，英超焦點賽月1日13:00點整，英超焦點賽");
                viewModel.subTextModel.text = JobsInternationalization(@"夏季聯賽火熱來襲，全體會員虛擬幣存...夏季聯賽火熱來襲，全體會員虛擬幣存");
                viewModel.time = JobsInternationalization(@"05-13 18:20");
                viewModel.isDraw = NO;
                viewModel.isRead = NO;
            }));
            data.add(jobsMakeMsgDataModel(^(__kindof JobsMsgDataModel * _Nullable viewModel) {
                viewModel.msgStyle = JobsMsgType_Activity;/// 活动
                viewModel.textModel.text = JobsInternationalization(@"6月1日13:00點");
                viewModel.subTextModel.text = JobsInternationalization(@"夏季聯賽火熱來襲，全體會員虛擬幣存...");
                viewModel.time = JobsInternationalization(@"05-13 18:20");
                viewModel.isDraw = YES;
                viewModel.isRead = YES;
            }));
            data.add(jobsMakeMsgDataModel(^(__kindof JobsMsgDataModel * _Nullable viewModel) {
                viewModel.msgStyle = JobsMsgType_Notice;/// 公告
                viewModel.textModel.text = JobsInternationalization(@"6月1日");
                viewModel.subTextModel.text = JobsInternationalization(@"夏季聯賽火熱來襲，全體會員虛擬幣存...");
                viewModel.time = JobsInternationalization(@"05-13 18:20");
                viewModel.isDraw = NO;
                viewModel.isRead = NO;
            }));
            data.add(jobsMakeMsgDataModel(^(__kindof JobsMsgDataModel * _Nullable viewModel) {
                viewModel.msgStyle = JobsMsgType_Bonus;/// 红利
                viewModel.textModel.text = JobsInternationalization(@"wowowowowo");
                viewModel.subTextModel.text = JobsInternationalization(@"夏季聯賽火熱來襲，全體會員虛擬幣存...");
                viewModel.time = JobsInternationalization(@"05-13 18:20");
                viewModel.isDraw = YES;
                viewModel.isRead = YES;
            }));
        });
    }return _dataMutArr;
}

-(NSMutableArray<JobsMsgDataModel *> *)selectedDataMutArr{
    if (!_selectedDataMutArr) {
        _selectedDataMutArr = NSMutableArray.array;
    }return _selectedDataMutArr;
}

@end
