//
//  JobsSearchVC.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchVC.h"

@interface JobsSearchVC ()
/// UI
@property(nonatomic,strong)UIButton *scanBtn;
@property(nonatomic,strong)BaseTableView *tableView;
@property(nonatomic,strong)JobsSearchBar *jobsSearchBar;
@property(nonatomic,strong)JobsDropDownListView *dropDownListView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*sectionTitleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*hotSearchMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*listViewData;
@property(nonatomic,strong)UIColor *bgColour;
@property(nonatomic,assign)NSString *titleStr;//标题
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
    
    self.setupNavigationBarHidden = YES;
    self.isHiddenNavigationBar = YES;
    self.isOpenLetterCase = YES;/// 模糊查询时，是否开启输入字母大小写检测？默认开启
    self.hotSearchStyle = HotSearchStyle_2;
    
    self.gk_interactivePopDisabled = NO;
    self.gk_fullScreenPopDisabled = NO;
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    
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
    self.gk_navRightBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:self.scanBtn];
    self.getTabBar.hidden = YES;
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
    [_dropDownListView dropDownListViewDisappear:nil];
    _dropDownListView = nil;
}
///下拉刷新 （子类要进行覆写）
-(void)pullToRefresh{
    [self feedbackGenerator];//震动反馈
    [self endRefreshing:self.tableView];
//    [self endRefreshingWithNoMoreData:self.tableView];
}
///上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
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
    if (!self.titleStr.nullString) {
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
            if (!self.titleStr.nullString) {
                self.gk_navigationBar.mj_h = 0;
                self.gk_navBarAlpha = 0;
                
                self.tableView.mj_y = self.gk_navigationBar.mj_y;
            }else{
                self.tableView.mj_y = 0;
            }
        }else{//正常状态
            if (!self.titleStr.nullString) {
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
                    return [JobsSearchShowHotwordsTBVCell cellHeightWithModel:self.hotSearchMutArr];
                }break;
                case HotSearchStyle_2:{
                    return [JobsSearchTBVCell cellHeightWithModel:self.hotSearchMutArr];
                }break;
                    
                default:{
                    return 0;
                }break;
            }
        }break;
        case 1:{
            return [JobsSearchShowHistoryDataTBVCell cellHeightWithModel:self.listViewData];
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
    self.jobsSearchBar.getTextField.text = cell.textLabel.text;
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
                    JobsSearchShowHotwordsTBVCell *cell = [JobsSearchShowHotwordsTBVCell cellStyleValue1WithTableView:tableView];
                    cell.indexPath = indexPath;
                    [cell richElementsInCellWithModel:self.hotSearchMutArr];
                    /// 点击的哪个btn？
                    [cell actionObjectBlock:^(JobsHotLabelWithMultiLineCVCell *cell) {
                        @jobs_strongify(self)
                        self.jobsSearchBar.getTextField.text = cell.getViewModel.textModel.text;

                    }];return cell;
                }break;
                case HotSearchStyle_2:{
                    JobsSearchTBVCell *cell = [JobsSearchTBVCell cellStyleValue1WithTableView:tableView];
                    cell.indexPath = indexPath;
                    [cell richElementsInCellWithModel:self.hotSearchMutArr];
                    [cell actionObjectBlock:^(UIViewModel *data) {
                        @jobs_strongify(self)
                        self.jobsSearchBar.getTextField.text = data.textModel.text;
                        /// 点选了推荐，则映入输入框＋存入历史
                        /// 防止相同的元素存入
                        if (![self filtrationData:data
                                        atDataArr:self.listViewData
                                   byPropertyName:@"text"]) {
                            [self.listViewData addObject:data];
                        }
                        [self endDropDownListView];
                    }];
                    return cell;
                }break;
                    
                default:{
                    return UITableViewCell.new;
                }break;
            }
        }break;
        case 1:{/// 搜索历史
            JobsSearchShowHistoryDataTBVCell *cell = [JobsSearchShowHistoryDataTBVCell cellStyleValue1WithTableView:tableView];
            cell.indexPath = indexPath;
            [cell richElementsInCellWithModel:self.listViewData[indexPath.row]];
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
    return [JobsSearchTableViewHeaderView viewHeightWithModel:nil];
}

-(nullable UIView *)tableView:(UITableView *)tableView
       viewForHeaderInSection:(NSInteger)section{
    JobsSearchTableViewHeaderView *header = JobsSearchTableViewHeaderView.jobsInitWithReuseIdentifier;
    [header richElementsInViewWithModel:self.sectionTitleMutArr[section]];
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

//            UserDefaultModel *userDefaultModel = UserDefaultModel.new;
//            userDefaultModel.key = JobsSearchHistoryData;
//            userDefaultModel.obj = self.historySearchMutArr;
//
//            [NSUserDefaults updateWithModel:userDefaultModel];
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
-(BaseTableView *)tableView{
    if (!_tableView) {
        /// 值得注意：只能用这样的初始化方式传入UITableViewStyleGrouped进行
        /// 否则viewForHeaderInSection 和 tableHeaderView 之间会有一段距离
        _tableView = [BaseTableView.alloc initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = self.bgColour;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableHeaderView = self.jobsSearchBar;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.ww_foldable = YES;//设置可折叠
        [_tableView registerTableViewClass];

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
        
        @jobs_weakify(self)
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
                self.titleStr.nullString) {//显示
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
        _jobsSearchBar.size = [JobsSearchBar viewSizeWithModel:nil];
        [_jobsSearchBar richElementsInViewWithModel:nil];
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

-(UIButton *)scanBtn{
    if (!_scanBtn) {
        _scanBtn = UIButton.new;
        [_scanBtn normalBackgroundImage:JobsIMG(@"扫描")];
        [_scanBtn jobsBtnClickEventBlock:^id(id data) {
            toast(Internationalization(@"此功能尚未开发"));
            return nil;
        }];
    }return _scanBtn;
}

-(UIColor *)bgColour{
    if (!_bgColour) {
        _bgColour = [UIColor colorWithPatternImage:JobsBuddleIMG(nil, @"Telegram",nil, @"1")];
    }return _bgColour;
}

-(NSMutableArray<UIViewModel *> *)listViewData{
    if (!_listViewData) {
        _listViewData = NSMutableArray.new;
    }return _listViewData;
}

-(NSMutableArray<UIViewModel *> *)sectionTitleMutArr{
    if (!_sectionTitleMutArr) {
        _sectionTitleMutArr = NSMutableArray.array;
    
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = Internationalization(@"热门搜索");
        viewModel.textModel.textCor = JobsLightGrayColor;
        viewModel.bgCor = JobsWhiteColor;
        viewModel.textModel.font = JobsFontRegular(20);
        
        [_sectionTitleMutArr addObject:viewModel];
        
        if (self.listViewData.count) {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"搜索历史");
            viewModel.textModel.textCor = JobsLightGrayColor;
            viewModel.bgCor = JobsWhiteColor;
            viewModel.textModel.font = JobsFontRegular(20);
            
            [_sectionTitleMutArr addObject:viewModel];
        }
    }return _sectionTitleMutArr;
}

-(NSMutableArray<UIViewModel *> *)hotSearchMutArr{
    if (!_hotSearchMutArr) {
        _hotSearchMutArr = NSMutableArray.array;
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"Java");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"Python");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"Objective-C");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"Swift");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"C");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"C++");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"PHP");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"C#");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"Perl");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"Go");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"JavaScript");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"Ruby");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"R");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = Internationalization(@"MATLAB");
            viewModel.textModel.textCor = JobsRandomColor;
            viewModel.bgCor = JobsRandomColor;
            viewModel.textModel.font = JobsFontRegular(20);
            [_hotSearchMutArr addObject:viewModel];
        }
    }return _hotSearchMutArr;
}

@end
