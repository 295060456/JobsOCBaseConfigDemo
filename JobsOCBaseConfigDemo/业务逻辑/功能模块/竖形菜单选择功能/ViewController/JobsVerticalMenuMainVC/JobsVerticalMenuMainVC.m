//
//  JobsVerticalMenuMainVC.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "JobsVerticalMenuMainVC.h"

@interface JobsVerticalMenuMainVC ()
/// Data
Prop_copy()NSMutableArray <NSMutableArray <__kindof UITableViewCell *>*>*tbvSectionRowCellMutArr;
Prop_copy()NSMutableArray <NSMutableArray <__kindof UIViewModel *>*>*dataMutArr;

@end

@implementation JobsVerticalMenuMainVC

- (void)dealloc{
    JobsNotificationCenter.remove(self);
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
    self.viewModel.textModel.text = JobsInternationalization(@"JobsVerticalMenuMainVC");
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
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataMutArr[indexPath.section][indexPath.row].cls) {
        self.comingToPushVCByRequestParams(self.dataMutArr[indexPath.section][indexPath.row].cls.new,
                                           self.dataMutArr[indexPath.section][indexPath.row]);
    }else self.jobsToastMsg(JobsInternationalization(@"尚未接入此功能"));
}
/// 编辑模式下，点击取消左边已选中的cell的按钮
- (void)tableView:(UITableView *)tableView
didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataMutArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(44);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr[section].count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.tbvSectionRowCellMutArr[indexPath.section][indexPath.row]
        .JobsRichViewByModel2((self.dataMutArr[indexPath.section][indexPath.row]));;
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
        @jobs_weakify(self)
        BaseTableViewHeaderFooterView *headerView = tableView.tableViewHeaderFooterView(BaseTableViewHeaderFooterView.class,@"")
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id  _Nullable data) {
                @jobs_strongify(self)
            });
//        /**
//         如果不是继承自BaseTableViewHeaderFooterView，那么在UITableViewHeaderFooterView的派生类中，添加：
//         @synthesize headerFooterViewStyle = _headerFooterViewStyle;
//         */
//        // 不写这三句有悬浮
//        headerView.headerFooterViewStyle = JobsHeaderViewStyle;
//        headerView.tableView = tableView;
//        headerView.section = section;
        return headerView;
    }return nil;
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (nullable __kindof UIView *)tableView:(UITableView *)tableView
                 viewForFooterInSection:(NSInteger)section{
    if(self.viewModel.usesTableViewFooterView){
        @jobs_weakify(self)
        BaseTableViewHeaderFooterView *tbvFooterView = tableView.tableViewHeaderFooterView(BaseTableViewHeaderFooterView.class,@"")
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id  _Nullable data) {
            @jobs_strongify(self)
        });
        {
            // 不写这两句有悬浮
            tbvFooterView.tableView = tableView;
            tbvFooterView.section = section;
        }
        tbvFooterView.backgroundColor = HEXCOLOR(0xEAEBED);
        tbvFooterView.backgroundView.backgroundColor = HEXCOLOR(0xEAEBED);
        return tbvFooterView;
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
     JobsLog(@"self.offsetXForEach = %f",self.offsetXForEach);
     JobsLog(@"self.offsetYForEach = %f",self.offsetYForEach);
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
    [tableView hideSeparatorLineAtLast:indexPath cell:cell];
    cell.img = JobsIMG(@"向右的箭头（大）");
//    @jobs_weakify(self)
    [cell customAccessoryView:^(id data) {
//        @jobs_strongify(self)
        JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)data;
        JobsLog(@"MMM - %ld",cell.index);
    }];
    cell.accessoryView.resetWidth(10);
    [cell cutFirstAndLastTableViewCellWithBackgroundCor:HEXCOLOR(0xFFFFFF)
                                          bottomLineCor:HEXCOLOR(0xFFFFFF)
                                         cellOutLineCor:HEXCOLOR(0xEEE2C8)
                                       cornerRadiusSize:CGSizeMake(JobsWidth(8), JobsWidth(8))
                                            borderWidth:JobsWidth(10)
                                                     dx:JobsWidth(0)
                                                     dy:JobsWidth(0)];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.backgroundColor = JobsBlueColor;
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            tableView.separatorColor = HEXCOLOR(0xEEE2C8);
            tableView.showsVerticalScrollIndicator = NO;
            tableView.scrollEnabled = YES;
            tableView.dataLink(self);
            tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
                /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
            });
            tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
                /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
            });
            tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
            [tableView registerTableViewClass];
            if(@available(iOS 11.0, *)) {
                tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }else{
                SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
            }
            
            {
                tableView.mj_header = self.view.MJRefreshNormalHeaderBy([self refreshHeaderDataBy:^id _Nullable(id  _Nullable data) {
                    tableView.endRefreshing(YES);
                    return nil;
                }]);
                tableView.mj_footer = self.view.MJRefreshFooterBy([self refreshFooterDataBy:^id _Nullable(id  _Nullable data) {
                    tableView.endRefreshing(YES);
                    return nil;
                }]);
            }

    //        {// 设置tabAnimated相关属性
    //            tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
    //                                                                  cellHeight:JobsBaseTableViewCell.cellHeightByModel(nil)];
    //            tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeBinAnimation;
    //            tableView.tabAnimated.canLoadAgain = YES;
    ////            _tableView.tabAnimated.animatedBackViewCornerRadius = JobsWidth(8);
    ////            _tableView.tabAnimated.animatedBackgroundColor = JobsRedColor;
    //            [tableView tab_startAnimation];   // 开启动画
    //        }
    
            self.view.addSubview(tableView);
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(self.view);
                make.top.equalTo(self.navBar.mas_bottom);
            }];
        });
    }return _tableView;
}

-(NSMutableArray<NSMutableArray<__kindof UITableViewCell *> *> *)tbvSectionRowCellMutArr{
    if(!_tbvSectionRowCellMutArr){
        @jobs_weakify(self)
        _tbvSectionRowCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UITableViewCell *>* _Nullable data1) {
                @jobs_strongify(self)
                data1.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView))
                .add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView))
                .add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView))
                .add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }));
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UITableViewCell *>*_Nullable data1) {
                @jobs_strongify(self)
                data1.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }));
        });
    }return _tbvSectionRowCellMutArr;
}

-(NSMutableArray<NSMutableArray<__kindof UIViewModel *> *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data1) {
                @jobs_strongify(self)
                data1.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.title = JobsInternationalization(@"右边的架构是UIViewController");
                    model.subTitle = JobsInternationalization(@"正常");
                    model.cls = JobsVerticalMenuVC_1.class;
                })))
                .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.title = JobsInternationalization(@"右边的架构是UICollectionView");
                    model.subTitle = JobsInternationalization(@"正常");
                    model.cls = JobsVerticalMenuVC_2.class;
                })));
            }));
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data1) {
                @jobs_strongify(self)
                data1.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.title = JobsInternationalization(@"右边的架构是JobsVerticalMenuVC_0");
                    model.subTitle = JobsInternationalization(@"JobsVerticalMenuVC_0");
                    model.cls = JobsVerticalMenuVC_0.class;
                })));
            }));
        });
    }return _dataMutArr;
}

@end
