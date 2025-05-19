//
//  ExcelVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "ExcelVC.h"

@interface ExcelVC ()
/// Data
Prop_copy()NSMutableArray <NSMutableArray <__kindof UITableViewCell *>*>*tbvSectionRowCellMutArr;
Prop_copy()NSMutableArray <NSMutableArray <__kindof UIViewModel *>*>*dataMutArr;

@end

@implementation ExcelVC

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
    self.viewModel.textModel.text = JobsInternationalization(@"Excel");
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
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.section][indexPath.row])
        .JobsBlock1(^(id _Nullable data) {
                     
        });
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
/// tableView.registerHeaderFooterViewClass(BaseTableViewHeaderFooterView.class,@"");
- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section{
    if (self.viewModel.usesTableViewHeaderView) {
        @jobs_weakify(self)
        /// 什么不配置就是悬浮
        /// JobsHeaderFooterViewStyleNone 还是悬浮
        /// JobsHeaderViewStyle 不是悬浮
        return BaseTableViewHeaderFooterView.initByReuseIdentifier(tableView,@"")
            .byStyle(JobsHeaderViewStyle)/// 悬浮开关
            .bySection(section)/// 悬浮配置
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id _Nullable data) {
                
            });
    }return nil;
}
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
/// tableView.registerHeaderFooterViewClass(BaseTableViewHeaderFooterView.class,@"");
- (nullable __kindof UIView *)tableView:(UITableView *)tableView
                 viewForFooterInSection:(NSInteger)section{
    if(self.viewModel.usesTableViewFooterView){
        @jobs_weakify(self)
        /// 什么不配置就是悬浮
        /// JobsHeaderFooterViewStyleNone 还是悬浮
        /// JobsHeaderViewStyle 不是悬浮
        BaseTableViewHeaderFooterView *tbvFooterView = BaseTableViewHeaderFooterView.initByReuseIdentifier(tableView,@"")
            .byStyle(JobsHeaderViewStyle)/// 悬浮开关
            .bySection(section)/// 悬浮配置
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id _Nullable data) {
                
            });
        tbvFooterView.backgroundColor = HEXCOLOR(0xEAEBED);
        tbvFooterView.backgroundView.backgroundColor = HEXCOLOR(0xEAEBED);
        /// tbvFooterView.backgroundColor 和  tbvFooterView.contentView.backgroundColor 均是无效操作❌
        /// 只有 tbvFooterView.backgroundView.backgroundColor 是有效操作✅
        tbvFooterView.contentView.backgroundColor = HEXCOLOR(0xFFFFFF);
        return tbvFooterView;
    }return nil;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    /// 隐藏最后一个单元格的分界线
    [tableView hideSeparatorLineAtLast:indexPath cell:cell];
    /// 自定义 UITableViewCell 的箭头
    cell.img = JobsIMG(@"向右的箭头（大）");
//    @jobs_weakify(self)
    [cell customAccessoryView:^(id data) {
//        @jobs_strongify(self)
        JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)data;
        JobsLog(@"MMM - %ld",cell.index);
    }];
    cell.accessoryView.resetWidth(10);
    /// 以 section 为单位，仅对每个 section 的最后一行 cell 做圆角处理（cell 之间没有分割线）
    [cell roundedCornerLastCellByTableView:tableView
                                 indexPath:indexPath
                               layerConfig:jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
        model.roundingCornersRadii = CGSizeMake(JobsWidth(10.0), JobsWidth(10.0));
        model.borderWidth = 1;
        model.layerBorderCor = JobsGrayColor;
    })];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.dataLink(self);
            tableView.backgroundColor = JobsBlueColor;
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            tableView.separatorColor = HEXCOLOR(0xEEE2C8);
            tableView.showsVerticalScrollIndicator = NO;
            tableView.scrollEnabled = YES;
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
            [self.view.addSubview(tableView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(self.view);
                make.top.equalTo(self.navBar.mas_bottom);
            }];
        });
    }return _tableView;
}

-(NSMutableArray<NSMutableArray<__kindof UITableViewCell *> *> *)tbvSectionRowCellMutArr{
    if(!_tbvSectionRowCellMutArr){
        @jobs_weakify(self)
        _tbvSectionRowCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSMutableArray<__kindof UITableViewCell *> *>* _Nullable data) {
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UITableViewCell *>* _Nullable rowCellMutArr) {
                @jobs_strongify(self)
                rowCellMutArr.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView))
                .add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView))
                .add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView))
                .add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }));
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable rowCellMutArr) {
                @jobs_strongify(self)
                rowCellMutArr.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }));
        });
    }return _tbvSectionRowCellMutArr;
}

-(NSMutableArray<NSMutableArray<__kindof UIViewModel *>*>*)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSMutableArray<__kindof UIViewModel *> *>*_Nullable data) {
            @jobs_strongify(self)
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewModel *>* _Nullable data1) {
                @jobs_strongify(self)
                data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.title = JobsInternationalization(@"ZMJClassData");
                    model.subTitle = JobsInternationalization(@"正常");
                    model.cls = ZMJClassDataVC.class;
                })))
                .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.title = JobsInternationalization(@"ZMJTimeable");
                    model.subTitle = JobsInternationalization(@"正常");
                    model.cls = ZMJTimeableVC.class;
                })))
                .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.title = JobsInternationalization(@"ZMJSchedule");
                    model.subTitle = JobsInternationalization(@"正常");
                    model.cls = ZMJScheduleVC.class;
                })))
                .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.title = JobsInternationalization(@"ZMJGanttList");
                    model.subTitle = JobsInternationalization(@"有崩溃，需要修复");
                    model.cls = ZMJGanttListVC.class;
                })));
            }));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsExcel");
                model.subTitle = JobsInternationalization(@"JobsExcel");
                model.cls = JobsExcelVC.class;
            })));
        });
    }return _dataMutArr;
}

@end
