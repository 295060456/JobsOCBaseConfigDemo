//
//  JobsSearchVC.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchVC.h"

@interface JobsSearchVC ()
/// UI
@property(nonatomic,strong)BaseButton *scanBtn;
@property(nonatomic,strong)JobsSearchBar *jobsSearchBar;
@property(nonatomic,strong)JobsDropDownListView *dropDownListView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*sectionTitleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*hotSearchMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*listViewData;
@property(nonatomic,strong)UIColor *bgColour;
@property(nonatomic,copy)NSString *titleStr;//标题
@property(nonatomic,assign)CGRect tableViewRect;
@property(nonatomic,assign)CGFloat gk_navigationBarHeight;
@property(nonatomic,assign)HotSearchStyle hotSearchStyle;

@end

@implementation JobsSearchVC

- (void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
    [self endDropDownListView];
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
    
    self.isHiddenNavigationBar = YES;
    self.isOpenLetterCase = YES;/// 模糊查询时，是否开启输入字母大小写检测？默认开启
    self.hotSearchStyle = HotSearchStyle_2;
    
    self.gk_interactivePopDisabled = NO;
    self.gk_fullScreenPopDisabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    @jobs_weakify(self)
//    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
//        @jobs_strongify(self)
////        data.add(UIBarButtonItem.initBy(self.aboutBtn));
//    });
//    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.scanBtn));
//    });
//    self.makeNavByAlpha(1);
    
    self.getTabBar.hidden = YES;
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
    /// 加在这里，否则要停顿一秒左右才移除
    [self endDropDownListView];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endDropDownListView];
}
#pragma mark —— 一些私有化方法
/// 移除掉这个下拉列表
-(void)endDropDownListView{
//    [self.view endEditing:YES];
    _dropDownListView.dropDownListViewDisappear(nil);
    _dropDownListView = nil;
}
/// 逐字搜索功能
//-(void)searchByString:(NSString *)string{
//    //每次都清数据
//    [self.listViewData removeAllObjects];
//    //在此可以网络请求
//    //也可以对本地的一个数据库文件进行遍历
//    NSDictionary *dic = @"假数据".readLocalFileWithName;
//    NSArray *arr = dic[@"data"];
//    for (NSString *str in arr) {
//        if (self.isOpenLetterCase ? [str.lowercaseString containsString:string.lowercaseString] : [str containsString:string]) {
//            UIViewModel *viewModel = UIViewModel.new;
//            viewModel.textModel.text = str;
//            [self.listViewData addObject:viewModel];
//        }
//    }
//}
/// 数据过滤。对照数据一样返回YES，反之返回NO
/// @param viewModel 准备取这个数据源对象里的某个属性值
/// @param dataArr 需要进行对照检查的数据源数组
/// @param propertyName 需要检查的属性名
-(BOOL)filtrationData:(UIViewModel *)viewModel
            atDataArr:(NSArray <UIViewModel *>*)dataArr
       byPropertyName:(NSString *)propertyName{
    NSString *str1 = [self checkTargetObj:viewModel.textModel propertyName:propertyName];
    for (UIViewModel *vm in dataArr) {
        NSString *str2 = [self checkTargetObj:vm.textModel propertyName:propertyName];
        if ([str1 isEqualToString:str2]) {
            return YES;
        }
    }return NO;
}

-(void)cancelBtnEvent{
    if (isValue(self.titleStr)) {
        if (self.tableView.mj_y == self.gk_navigationBar.mj_y) {
            [self goUpAndDown:NO];
        }
    }else{
        if (self.tableView.mj_y == 0) {
            [self goUpAndDown:NO];
        }
    }
}

-(void)goUpAndDown:(BOOL)isUpAndDown{
    /*
     *    使用弹簧的描述时间曲线来执行动画 ,当dampingRatio == 1 时,动画会平稳的减速到最终的模型值,而不会震荡.
     *    小于1的阻尼比在达到完全停止之前会震荡的越来越多.
     *    如果你可以使用初始的 spring velocity 来 指定模拟弹簧末端的对象在加载之前移动的速度.
     *    他是一个单位坐标系统,其中2被定义为在一秒内移动整个动画距离.
     *    如果你在动画中改变一个物体的位置,你想在动画开始前移动到 100 pt/s 你会超过0.5,
     *    dampingRatio 阻尼
     *    velocity 速度
     */
    @jobs_weakify(self)
    [UIView animateWithDuration:1
                          delay:0
         usingSpringWithDamping:1
          initialSpringVelocity:20
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        @jobs_strongify(self)
        if (isUpAndDown) {//顶上去
            if (isValue(self.titleStr)) {
                self.gk_navigationBar.mj_h = 0;
                self.gk_navBarAlpha = 0;
                
                self.tableView.mj_y = self.gk_navigationBar.mj_y;
            }else{
                self.tableView.mj_y = 0;
            }
        }else{//正常状态
            if (isValue(self.titleStr)) {
                self.gk_navigationBar.alpha = 1;
                self.gk_navigationBar.mj_h = self.gk_navigationBarHeight;
            }
            self.tableView.mj_y = self.tableViewRect.origin.y;
        }
    } completion:nil];
}
#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            switch (self.hotSearchStyle) {
                case HotSearchStyle_1:{
                    return JobsSearchShowHotwordsTBVCell.cellHeightByModel(self.hotSearchMutArr);
                }break;
                case HotSearchStyle_2:{
                    return JobsSearchTBVCell.cellHeightByModel(self.hotSearchMutArr);
                }break;
                    
                default:{
                    return 0;
                }break;
            }
        }break;
        case 1:{
            return JobsSearchShowHistoryDataTBVCell.cellHeightByModel(self.listViewData);
        }break;
        default:
            return 0;
            break;
    }
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.view endEditing:YES];
    JobsSearchShowHistoryDataTBVCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.jobsSearchBar.textField.text = cell.textLabel.text;
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return 1;
        }break;
        case 1:{
            return self.listViewData.count;
        }break;
        default:
            return 0;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    @jobs_weakify(self)
    switch (indexPath.section) {
        case 0:{/// 热门搜索
            switch (self.hotSearchStyle) {
                case HotSearchStyle_1:{
                    JobsSearchShowHotwordsTBVCell *cell = JobsSearchShowHotwordsTBVCell.cellStyleValue1WithTableView(tableView);
                    cell.indexPath = indexPath;
                    cell.jobsRichElementsInCellWithModel(self.hotSearchMutArr);
                    /// 点击的哪个btn？
                    [cell actionObjectBlock:^(JobsHotLabelByMultiLineCVCell *cell) {
                        @jobs_strongify(self)
                        self.jobsSearchBar.textField.text = cell.getViewModel.textModel.text;
                    }];return cell;
                }break;
                case HotSearchStyle_2:{
                    JobsSearchTBVCell *cell = JobsSearchTBVCell.cellStyleValue1WithTableView(tableView);
                    cell.indexPath = indexPath;
                    cell.jobsRichElementsInCellWithModel(self.hotSearchMutArr);
                    [cell actionObjectBlock:^(UIViewModel *data) {
                        @jobs_strongify(self)
                        self.jobsSearchBar.textField.text = data.textModel.text;
                        /// 点选了推荐，则映入输入框＋存入历史
                        /// 防止相同的元素存入
                        if (![self filtrationData:data
                                        atDataArr:self.listViewData
                                   byPropertyName:@"text"]) {
                            self.listViewData.add(data);
                        }
                        [self endDropDownListView];
                    }];return cell;
                }break;
                    
                default:{
                    return UITableViewCell.new;
                }break;
            }
        }break;
        case 1:{/// 搜索历史
            JobsSearchShowHistoryDataTBVCell *cell = JobsSearchShowHistoryDataTBVCell.cellStyleValue1WithTableView(tableView);
            cell.indexPath = indexPath;
            cell.jobsRichElementsInCellWithModel(self.listViewData[indexPath.row]);
            return cell;
        }break;
        default:
            return UITableViewCell.new;
            break;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionTitleMutArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return JobsSearchTableViewHeaderView.viewHeightByModel(nil);
}

-(nullable UIView *)tableView:(UITableView *)tableView
       viewForHeaderInSection:(NSInteger)section{
    JobsSearchTableViewHeaderView *header = tableView.tableViewHeaderFooterView(JobsSearchTableViewHeaderView.class,@"");
    header.jobsRichViewByModel(self.sectionTitleMutArr[section]);
    if (section == 1) {
        header.getDelBtn.jobsVisible = YES;
        @jobs_weakify(self)
        [header actionObjectBlock:^(id data) {
            @jobs_strongify(self)
//            [self.view endEditing:YES];
            [self.tableView ww_foldSection:section
                                      fold:![self.tableView ww_isSectionFolded:section]];//设置可折叠
            /// 删除历史过往记录
            [self.listViewData removeAllObjects];

//            NSUserDefaults.updateWithModel(jobsMakeUserDefaultModel(^(UserDefaultModel * _Nonnull data) {
//                data.key = JobsSearchHistoryData;
//                data.obj = self.historySearchMutArr;
//            }));
//
//            if (self.historySearchMutArr.count == 0) {
//                [self.sectionTitleMutArr removeAllObjects];
//                self->_sectionTitleMutArr = nil;
//            }
//
//            [self.tableView reloadData];
        }];
    }

    self.scrollViewClass = BaseTableView.class;//这一属性决定UITableViewHeaderFooterView是否悬停
    return header;

//    {
//        Class headerClass = self.isHoveringHeaderView ? JobsSearchHoveringHeaderView.class : JobsSearchTableViewHeaderView.class;
//        UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(headerClass)];
//        return header;
//    }

}
/// cell的生命周期:将要出现的cell【实现以下方法,以替换系统默认的右侧小箭头】
/// @param tableView tableView
/// @param cell willDisplayCell
/// @param indexPath forRowAtIndexPath
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.img = JobsIMG(@"删除");
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(BaseTableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        /// 值得注意：只能用这样的初始化方式传入UITableViewStyleGrouped进行
        /// 否则viewForHeaderInSection 和 tableHeaderView 之间会有一段距离
        _tableView = BaseTableView.initWithStyleGrouped;
        _tableView.backgroundColor = self.bgColour;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableHeaderView = self.jobsSearchBar;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.ww_foldable = YES;//设置可折叠
        [_tableView registerTableViewClass];

        {
            _tableView.mj_header = self.view.MJRefreshNormalHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
                data.pullingTitle = JobsInternationalization(@"下拉可以刷新");
                data.refreshingTitle = JobsInternationalization(@"松开立即刷新");
                data.willRefreshTitle = JobsInternationalization(@"刷新数据中");
                data.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
                data.automaticallyChangeAlpha = YES;/// 根据拖拽比例自动切换透明度
                data.loadBlock = ^id _Nullable(id _Nullable data) {
                    @jobs_strongify(self)
                    self.feedbackGenerator();//震动反馈
                    self->_tableView.endRefreshing(YES);
    //                self.endRefreshingWithNoMoreData(self->_tableView);
                    return nil;
                };
            }));
            _tableView.mj_footer = self.view.MJRefreshAutoNormalFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"");
                data.pullingTitle = JobsInternationalization(@"");
                data.refreshingTitle = JobsInternationalization(@"");
                data.willRefreshTitle = JobsInternationalization(@"");
                data.noMoreDataTitle = JobsInternationalization(@"");
                data.loadBlock = ^id _Nullable(id _Nullable data) {
                    @jobs_strongify(self)
                    self->_tableView.endRefreshing(YES);
                    return nil;
                };
            }));
        }
        
        [_tableView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            [self endDropDownListView];
        }];
        
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
        }

        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            if (self.gk_navBarAlpha &&
                !self.gk_navigationBar.hidden &&
                isNull(self.titleStr)) {//显示
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
            }else{
                make.top.equalTo(self.view);
            }
            make.bottom.equalTo(self.view);
        }];
        [self.view layoutIfNeeded];
        self.tableViewRect = _tableView.frame;
    }return _tableView;
}

-(JobsSearchBar *)jobsSearchBar{
    if (!_jobsSearchBar) {
        _jobsSearchBar = JobsSearchBar.new;
        _jobsSearchBar.sizer = JobsSearchBar.viewSizeByModel(nil);
        _jobsSearchBar.jobsRichViewByModel(nil);
        @jobs_weakify(self)
        [_jobsSearchBar actionObjectBlock:^(NSString *data) {
            @jobs_strongify(self)

        }];
        
//        [_jobsSearchBar actionNSIntegerBlock:^(UITextFieldFocusType data) {
//            @jobs_strongify(self)
//            switch (data) {
//                case UITextFieldGetFocus:{/// 输入框获得焦点
//                    if (self.listViewData.count) {
//                        /// 必须先移除，否则反复添加无法正常移除
//                        self.dropDownListView = [self motivateFromView:weak_self.jobsSearchBar
//                                                                  data:self.listViewData
//                                                    motivateViewOffset:JobsWidth(5)
//                                                           finishBlock:^(UIViewModel *data) {
//                            NSLog(@"data = %@",data);
//                        }];
//                    }
//                }break;
//                case UITextFieldLoseFocus:{/// 输入框失去焦点
//                    [self endDropDownListView];
//                }break;
//                default:
//                    break;
//            }
//        }];
    }return _jobsSearchBar;
}

-(BaseButton *)scanBtn{
    if (!_scanBtn) {
        @jobs_weakify(self)
        _scanBtn = BaseButton
            .initByNormalImage(JobsIMG(@"扫描"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                toast(JobsInternationalization(@"此功能尚未开发"));
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
    }return _scanBtn;
}

-(UIColor *)bgColour{
    if (!_bgColour) {
        _bgColour = self.byPatternImage(JobsBuddleIMG(nil, @"Telegram",nil, @"1"));
    }return _bgColour;
}

-(NSMutableArray<UIViewModel *> *)listViewData{
    if (!_listViewData) {
        _listViewData = NSMutableArray.new;
    }return _listViewData;
}

-(NSMutableArray<UIViewModel *> *)sectionTitleMutArr{
    if (!_sectionTitleMutArr) {
        @jobs_weakify(self)
        _sectionTitleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"热门搜索");
                viewModel.textModel.textCor = JobsLightGrayColor;
                viewModel.bgCor = JobsWhiteColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            @jobs_strongify(self)
            if (self.listViewData.count) {
                data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                    viewModel.textModel.text = JobsInternationalization(@"搜索历史");
                    viewModel.textModel.textCor = JobsLightGrayColor;
                    viewModel.bgCor = JobsWhiteColor;
                    viewModel.textModel.font = JobsFontRegular(20);
                }));
            }
        });
    }return _sectionTitleMutArr;
}

-(NSMutableArray<UIViewModel *> *)hotSearchMutArr{
    if (!_hotSearchMutArr) {
        _hotSearchMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"Java");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"Python");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"Objective-C");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"Swift");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"C");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"C++");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"C#");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"PHP");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"Perl");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"Go");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"JavaScript");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"Ruby");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"R");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"MATLAB");
                viewModel.textModel.textCor = JobsRandomColor;
                viewModel.bgCor = JobsRandomColor;
                viewModel.textModel.font = JobsFontRegular(20);
            }));
        });
    }return _hotSearchMutArr;
}

@end
