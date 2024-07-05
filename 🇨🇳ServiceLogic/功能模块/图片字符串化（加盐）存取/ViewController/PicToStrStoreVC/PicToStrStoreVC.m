//
//  PicToStrStoreVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import "PicToStrStoreVC.h"

@interface PicToStrStoreVC ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *tableFooterView;
@property(nonatomic,strong)UIButton *userHeadBtn;
/// Data
@property(nonatomic,strong)NSMutableArray <UITableViewCell *>*tbvCellMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation PicToStrStoreVC

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
    self.tableView.alpha = 1;
//    [self.bgImageView removeFromSuperview];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self updateStatusBarCor:JobsOrangeColor];/// 在具体子类实现，不要写在父类
    if (_dataMutArr.count) {
        [self.dataMutArr removeAllObjects];
        _dataMutArr = nil;
    }
    [self.tableView.mj_header beginRefreshing];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(JobsInternationalization(@""));
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(JobsInternationalization(@""));
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    [self restoreStatusBarCor];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}
#pragma mark —— 一些私有方法
#pragma mark —— BaseViewProtocol
/// 下拉刷新 （子类要进行覆写）
-(void)pullToRefresh{
    [self feedbackGenerator];//震动反馈
    [self endRefreshing:self.tableView];
}
/// 上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [JobsBaseTableViewCell cellHeightWithModel:self.dataMutArr[indexPath.row]] * 2;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.dataMutArr[indexPath.row].requestParams isKindOfClass:NSNumber.class]) {
        [self comingToPushVC:PicToStrStoreSubVC.new
               requestParams:self.dataMutArr[indexPath.row]];
    }else{
        [WHToast jobsToastMsg:JobsInternationalization(@"尚未接入此功能")];
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)self.tbvCellMutArr[indexPath.row];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        [self dataLinkByTableView:_tableView];
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = self.tableFooterView;/// 这里接入的就是一个UIView的派生类
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        _tableView.contentInset = UIEdgeInsetsMake(JobsWidth(0),
                                                   JobsWidth(0),
                                                   JobsWidth(100),
                                                   JobsWidth(0));
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = JobsInternationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = JobsInternationalization(JobsInternationalization(@""));
            refreshConfigFooter.pullingTitle = JobsInternationalization(JobsInternationalization(@""));
            refreshConfigFooter.refreshingTitle = JobsInternationalization(JobsInternationalization(@""));
            refreshConfigFooter.willRefreshTitle = JobsInternationalization(JobsInternationalization(@""));
            refreshConfigFooter.noMoreDataTitle = JobsInternationalization(JobsInternationalization(@""));
            
            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;
            
            _tableView.mj_header = self.mjRefreshNormalHeader;
            _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
        }
        
        {
            _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:JobsInternationalization(@"暂无数据")
                                                                titleStr:JobsInternationalization(JobsInternationalization(@"暂无数据"))
                                                               detailStr:JobsInternationalization(JobsInternationalization(@""))];
            
            _tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _tableView.ly_emptyView.contentViewOffset = -JobsWidth(180);
            _tableView.ly_emptyView.titleLabFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightMedium];
        }
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self.setupNavigationBarHidden && self.gk_statusBarHidden) {// 系统、GK均隐藏
                make.edges.equalTo(self.view);
            }else{
                if (!self.setupNavigationBarHidden && self.gk_statusBarHidden) {// 用系统的导航栏
                    make.top.equalTo(self.view).offset(JobsNavigationBarAndStatusBarHeight(nil));
                }
                
                if (self.setupNavigationBarHidden && !self.gk_statusBarHidden) {// 用GK的导航栏
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                }
                
                make.left.right.bottom.equalTo(self.view);
            }
        }];
    }return _tableView;
}

-(UILabel *)tableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = UILabel.new;
        _tableFooterView.text = JobsInternationalization(@"- 没有更多的内容了 -");
        _tableFooterView.font = UIFontWeightRegularSize(12);
        _tableFooterView.textAlignment = NSTextAlignmentCenter;
        _tableFooterView.textColor = HEXCOLOR(0xB0B0B0);
//        _tableFooterView.size = CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(48));
        [_tableFooterView makeLabelByShowingType:UILabelShowingType_03];
    }return _tableFooterView;
}

-(NSMutableArray<UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        _tbvCellMutArr = NSMutableArray.array;
        for (UIViewModel *viewModel in self.dataMutArr) {
            [_tbvCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
        }
    }return _tbvCellMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;

        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"利用十六进制字符串进行存取")
                                                           attributeSubTitle:JobsInternationalization(JobsInternationalization(@""))];
            viewModel.requestParams = @(PicToStrStyle_Hexadecimal);
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"利用Base16编码进行存取")
                                                           attributeSubTitle:JobsInternationalization(JobsInternationalization(@""))];
            viewModel.requestParams = @(PicToStrStyle_Base16);
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"利用Base32编码进行存取")
                                                           attributeSubTitle:JobsInternationalization(JobsInternationalization(@""))];
            viewModel.requestParams = @(PicToStrStyle_Base32);
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"利用Base64编码进行存取")
                                                           attributeSubTitle:JobsInternationalization(JobsInternationalization(@""))];
            viewModel.requestParams = @(PicToStrStyle_Base64);
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"利用Base85编码进行存取")
                                                           attributeSubTitle:JobsInternationalization(JobsInternationalization(@""))];
            viewModel.requestParams = @(PicToStrStyle_Base85);
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"利用MIME编码进行存取")
                                                           attributeSubTitle:JobsInternationalization(JobsInternationalization(@""))];
            viewModel.requestParams = @(PicToStrStyle_MIME);
            [_dataMutArr addObject:viewModel];
        }
        
    }return _dataMutArr;
}

@end
