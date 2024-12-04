//
//  LotteryVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/13/24.
//

#import "LotteryVC.h"

@interface LotteryVC ()
/// UI
/// Data
@property(nonatomic,strong)NSMutableArray <__kindof UITableViewCell *>*tbvSectionRowCellMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof UIViewModel *>*dataMutArr;

@end

@implementation LotteryVC

- (void)dealloc{
    JobsNotificationCenter.remove(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = JobsInternationalization(@"幸运轮盘");
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
    self.makeNavByAlpha(1);
//    [self.bgImageView removeFromSuperview];
    self.tableView.reloadDatas();
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
        self.comingToPushVCByRequestParams(self.dataMutArr[indexPath.row].cls.new,
                                           self.dataMutArr[indexPath.row]);
    }else self.jobsToastMsg(JobsInternationalization(@"尚未接入此功能"));
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

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)self.tbvSectionRowCellMutArr[indexPath.row];
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.row]);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return JobsWidth(10);
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSectionByModel:(NSInteger)section{
    return JobsWidth(10);
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    if (self.viewModel.usesTableViewHeaderView) {
        BaseTableViewHeaderFooterView *headerView = tableView.tableViewHeaderFooterView(BaseTableViewHeaderFooterView.class,@"");
//        {
//            /**
//             如果不是继承自BaseTableViewHeaderFooterView，那么在UITableViewHeaderFooterView的派生类中，添加：
//             @synthesize headerFooterViewStyle = _headerFooterViewStyle;
//             */
//            // 不写这三句有悬浮
//            headerView.headerFooterViewStyle = JobsHeaderViewStyle;
//            headerView.tableView = tableView;
//            headerView.section = section;
//        }
        headerView.jobsRichViewByModel(nil);
        @jobs_weakify(self)
        [headerView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
        }];return headerView;
    }return nil;
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (nullable __kindof UIView *)tableView:(UITableView *)tableView
                 viewForFooterInSection:(NSInteger)section{
    if(self.viewModel.usesTableViewFooterView){
        BaseTableViewHeaderFooterView *tbvFooterView = tableView.tableViewHeaderFooterView(BaseTableViewHeaderFooterView.class,@"");
        {
            // 不写这两句有悬浮
            tbvFooterView.tableView = tableView;
            tbvFooterView.section = section;
        }
        tbvFooterView.backgroundColor = HEXCOLOR(0xEAEBED);
        tbvFooterView.backgroundView.backgroundColor = HEXCOLOR(0xEAEBED);
        tbvFooterView.jobsRichViewByModel(nil);
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
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsBlueColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = HEXCOLOR(0xEEE2C8);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = YES;
        _tableView.dataLink(self);
        _tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
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
            }));
            _tableView.mj_footer = self.view.MJRefreshAutoNormalFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"");
                data.pullingTitle = JobsInternationalization(@"");
                data.refreshingTitle = JobsInternationalization(@"");
                data.willRefreshTitle = JobsInternationalization(@"");
                data.noMoreDataTitle = JobsInternationalization(@"");
            }));
        }
        
//        {// 设置tabAnimated相关属性
//            _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
//                                                                  cellHeight:JobsBaseTableViewCell.cellHeightByModel(nil)];
//            _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeBinAnimation;
//            _tableView.tabAnimated.canLoadAgain = YES;
////            _tableView.tabAnimated.animatedBackViewCornerRadius = JobsWidth(8);
////            _tableView.tabAnimated.animatedBackgroundColor = JobsRedColor;
//            [_tableView tab_startAnimation];   // 开启动画
//        }
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.equalTo(self.navBar.mas_bottom);
        }];
    }return _tableView;
}

-(NSMutableArray<__kindof UITableViewCell *> *)tbvSectionRowCellMutArr{
    if(!_tbvSectionRowCellMutArr){
        @jobs_weakify(self)
        _tbvSectionRowCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
        });
    }return _tbvSectionRowCellMutArr;
}

-(NSMutableArray<__kindof UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"方形转盘抽奖");
                model.subTitle = JobsInternationalization(@"中间有抽奖按钮");
                model.cls = LuckyDiskVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"圆形抽奖轮盘");
                model.subTitle = JobsInternationalization(@"中间有抽奖按钮");
                model.cls = LuckyRollVC.class;
            })));
        });
    }return _dataMutArr;
}

@end
