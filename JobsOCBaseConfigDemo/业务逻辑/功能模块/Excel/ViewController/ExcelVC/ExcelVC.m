//
//  ExcelVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "ExcelVC.h"

@interface ExcelVC ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)NSMutableArray <UITableViewCell *>*tbvCellMutArr;
@property(nonatomic,strong)NSMutableArray <NSMutableArray <UITableViewCell *>*>*tbvSectionRowCellMutArr;


@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation ExcelVC
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
    self.viewModel.textModel.text = JobsInternationalization(@"消息详情页");
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
//    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
//    self.setGKNav(nil);
//    self.setGKNavBackBtn(nil);
//    self.gk_navigationBar.jobsVisible = NO;
    
    self.makeNavBarConfig(nil,nil);
    self.navBar.alpha = 1;
    
//    [self.bgImageView removeFromSuperview];
    self.tableView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类
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
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataMutArr[indexPath.row].cls) {
        [self comingToPushVC:self.dataMutArr[indexPath.row].cls.new
               requestParams:self.dataMutArr[indexPath.row]];
    }else{
        [WHToast jobsToastMsg:JobsInternationalization(@"尚未接入此功能")];
    }
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(44);
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

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return section ? [BaseTableViewHeaderFooterView heightForHeaderInSection:nil] : JobsWidth(10);
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return section ? [BaseTableViewHeaderFooterView heightForFooterInSection:nil] : JobsWidth(10);
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    if (self.viewModel.usesTableViewHeaderView) {
        BaseTableViewHeaderFooterView *headerView = tableView.tableViewHeaderFooterView(BaseTableViewHeaderFooterView.class,@"");
        headerView.section = section;// 不写这一句有悬浮
        [headerView richElementsInViewWithModel:nil];
        @jobs_weakify(self)
        [headerView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
        }];return headerView;
    }return nil;
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (nullable UIView *)tableView:(UITableView *)tableView
        viewForFooterInSection:(NSInteger)section{
    if(self.viewModel.usesTableViewFooterView){
        BaseTableViewHeaderFooterView *tbvFooterView = tableView.tableViewHeaderFooterView(BaseTableViewHeaderFooterView.class,@"");
        tbvFooterView.section = section;// 不写这一句有悬浮
        tbvFooterView.backgroundColor = HEXCOLOR(0xEAEBED);
        tbvFooterView.backgroundView.backgroundColor = HEXCOLOR(0xEAEBED);
        
        [tbvFooterView richElementsInViewWithModel:nil];
        @jobs_weakify(self)
        [tbvFooterView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
        }];return tbvFooterView;
    }return nil;
}
/**
 ❤️如果单独的对每一个row对应的UITableViewCell的边距有缩进则使用下列方法❤️
 如果这个TableViewCell是BaseTableViewCell则不需要复写-(void)setFrame:(CGRect)frame；否则是需要：
 
 直接影响:
 cell.offsetXForEach = JobsWidth(8);
 cell.offsetYForEach = JobsWidth(6);
 
 // 在具体的子类去实现,分类调用异常
 -(void)setFrame:(CGRect)frame{
     NSLog(@"self.offsetXForEach = %f",self.offsetXForEach);
     NSLog(@"self.offsetYForEach = %f",self.offsetYForEach);
     frame.origin.x += self.offsetXForEach;
     frame.origin.y += self.offsetYForEach;
     frame.size.height -= self.offsetYForEach * 2;
     frame.size.width -= self.offsetXForEach * 2;
     [super setFrame:frame];
 }

 ❤️ 如果对每一section的cell进行缩进，则在外层协议：❤️
 - (void)tableView:(UITableView *)tableView
   willDisplayCell:(UITableViewCell *)cell
 forRowAtIndexPath:(NSIndexPath *)indexPath{

 [cell cutFirstAndLastTableViewCellWithBackgroundCor:HEXCOLOR(0xFFFFFF)
                                       bottomLineCor:HEXCOLOR(0xFFFFFF)
                                      cellOutLineCor:HEXCOLOR(0xEEE2C8)
                                    cornerRadiusSize:CGSizeMake(JobsWidth(8), JobsWidth(8))
                                         borderWidth:JobsWidth(10) dx:JobsWidth(0) dy:JobsWidth(0)];
 }
 */
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
    cell.img = JobsIMG(@"向右的箭头（大）");
    @jobs_weakify(self)
    [cell customAccessoryView:^(id data) {
        @jobs_strongify(self)
        JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)data;
        NSLog(@"MMM - %ld",cell.index);
    }];
    
    [cell cutFirstAndLastTableViewCellWithBackgroundCor:HEXCOLOR(0xFFFFFF)
                                          bottomLineCor:HEXCOLOR(0xFFFFFF)
                                         cellOutLineCor:HEXCOLOR(0xEEE2C8)
                                       cornerRadiusSize:CGSizeMake(JobsWidth(8), JobsWidth(8))
                                            borderWidth:JobsWidth(10) dx:JobsWidth(0) dy:JobsWidth(0)];
    
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStyleGrouped;
        _tableView.backgroundColor = JobsBlueColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = YES;
        _tableView.dataLink(self);
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        [_tableView registerTableViewClass];
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
        }
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = JobsInternationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = JobsInternationalization(@"");
            refreshConfigFooter.pullingTitle = JobsInternationalization(@"");;
            refreshConfigFooter.refreshingTitle = JobsInternationalization(@"");;
            refreshConfigFooter.willRefreshTitle = JobsInternationalization(@"");;
            refreshConfigFooter.noMoreDataTitle = JobsInternationalization(@"");;
            
            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;
            
            _tableView.mj_header = self.mjRefreshNormalHeader;
            _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
        }
        
        {
            _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"暂无数据"
                                                                titleStr:JobsInternationalization(@"暂无数据")
                                                               detailStr:JobsInternationalization(@"")];
            
            _tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _tableView.ly_emptyView.contentViewOffset = JobsWidth(-180);
            _tableView.ly_emptyView.titleLabFont = UIFontWeightLightSize(16);
        }
        
//        {/// 设置tabAnimated相关属性
//            // 可以不进行手动初始化，将使用默认属性
//            _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
//                                                                  cellHeight:[JobsBaseTableViewCell cellHeightWithModel:nil]];
//            _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            [_tableView tab_startAnimation];   // 开启动画
//        }
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.navBar.mas_bottom);
        }];
        
    }return _tableView;
}

-(NSMutableArray<UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        _tbvCellMutArr = NSMutableArray.array;
        for (UIViewModel *viewModel in self.dataMutArr) {
            [_tbvCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
        }
    }return _tbvCellMutArr;
}

-(NSMutableArray<NSMutableArray<UITableViewCell *> *> *)tbvSectionRowCellMutArr{
    if(!_tbvSectionRowCellMutArr){
        _tbvSectionRowCellMutArr = NSMutableArray.array;
        {
            NSMutableArray *rowCellMutArr = NSMutableArray.array;
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [_tbvSectionRowCellMutArr addObject:rowCellMutArr];
        }
        
        {
            NSMutableArray *rowCellMutArr = NSMutableArray.array;
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [_tbvSectionRowCellMutArr addObject:rowCellMutArr];
        }
        
        {
            NSMutableArray *rowCellMutArr = NSMutableArray.array;
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [rowCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
            [_tbvSectionRowCellMutArr addObject:rowCellMutArr];
        }
        
    }return _tbvSectionRowCellMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"ZMJClassData")
                                                           attributeSubTitle:JobsInternationalization(@"正常")];
            viewModel.cls = ZMJClassDataVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"ZMJTimeable")
                                                           attributeSubTitle:JobsInternationalization(@"正常")];
            viewModel.cls = ZMJTimeableVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"ZMJSchedule")
                                                           attributeSubTitle:JobsInternationalization(@"正常")];
            viewModel.cls = ZMJScheduleVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"ZMJGanttList")
                                                           attributeSubTitle:JobsInternationalization(@"有崩溃，需要修复")];
            viewModel.cls = ZMJGanttListVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
    }return _dataMutArr;
}

@end
