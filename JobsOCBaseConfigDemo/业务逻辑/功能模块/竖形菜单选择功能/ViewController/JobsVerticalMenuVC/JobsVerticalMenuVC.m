//
//  JobsVerticalMenuVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import "JobsVerticalMenuVC.h"

@interface JobsVerticalMenuVC ()
/// UI
@property(nonatomic,strong)UITableView *tableView;///  左侧的标题
@property(nonatomic,strong)UICollectionView *collectionView; /// 右侧的内容
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong)UIButton *customerServiceBtn;
@property(nonatomic,strong)UIButton *msgBtn;
@property(nonatomic,strong)UIButton *editBtn;
@property(nonatomic,strong)ThreeClassCell *tempCell;
@property(nonatomic,strong)BaiShaETProjSearchView *searchView;
@property(nonatomic,strong)BaiShaETProjPopupView10 *popupView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*popupViewDataMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*leftDataArray;/// 左边的数据源
@property(nonatomic,strong)NSMutableArray <GoodsClassModel *>*rightDataArray;/// 右边的数据源
@property(nonatomic,strong)GoodsClassModel *rightViewCurrentSelectModel;
@property(nonatomic,strong)UIViewModel *leftViewCurrentSelectModel;
@property(nonatomic,strong)NSMutableArray <UIImage *>*imageDataMutArr;
@property(nonatomic,assign)NSUInteger thisIndex;

@end

@implementation JobsVerticalMenuVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    JobsRemoveNotification(self);;
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
    
    [self loadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.setGKNav(nil);
    self.setGKNavBackBtn(nil);
    
    self.gk_navigationBar.jobsVisible = YES;
    self.gk_navRightBarButtonItems = @[[UIBarButtonItem.alloc initWithCustomView:self.msgBtn],
                                       [UIBarButtonItem.alloc initWithCustomView:self.customerServiceBtn]];
    
    self.searchView.alpha = 1;
    self.tableView.alpha = 1;
    self.editBtn.alpha = 1;
    self.collectionView.alpha = 1;
    [self refreshLeftView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.collectionView setContentOffset:CGPointMake(0, JobsWidth(-5)) animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
-(NSUInteger)thisIndex{
    return self.leftViewCurrentSelectModel ? [self.leftDataArray indexOfObject:self.leftViewCurrentSelectModel] : 0;
}

-(void)loadData{
    /// 这里可以调用接口去获取一级目录分类的数据
    for (int i = 0; i < self.titleMutArr.count; i++){
        [self.leftDataArray addObject:[self createOneModel:i]];
    }
}
/// 最初默认的数据
-(NSMutableArray<UIViewModel *> *)makeTitleMutArr{
    NSMutableArray *titleMutArr = NSMutableArray.array;
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"收藏");
        [titleMutArr addObject:viewModel];
    }
    
    [titleMutArr addObjectsFromArray:self.makePopViewDataMutArr];
    return titleMutArr;
}

-(NSMutableArray<UIViewModel *> *)makePopViewDataMutArr{
    NSMutableArray *titleMutArr = NSMutableArray.array;
    
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"真人");
        [titleMutArr addObject:viewModel];
    }
    
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"体育");
        [titleMutArr addObject:viewModel];
    }
    
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"电子");
        [titleMutArr addObject:viewModel];
    }
    
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"棋牌");
        [titleMutArr addObject:viewModel];
    }
    
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"彩票");
        [titleMutArr addObject:viewModel];
    }return titleMutArr;
}

-(void)refreshLeftView{
    [self.tableView reloadData];
    if (self.leftDataArray.count){
        @jobs_weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            [self.tableView selectRowAtIndexPath:indexPath
                                        animated:NO
                                  scrollPosition:UITableViewScrollPositionNone];
            if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
                [self.tableView.delegate tableView:self.tableView
                           didSelectRowAtIndexPath:indexPath];
            }
        });
    }
}
/// 预算高度
-(CGFloat)getCellHeight:(NSMutableArray *)dataArray{
    //获取cell 的高度
    return [self.tempCell getCollectionHeight:dataArray];
}
/// 根据一级目录的id 获取二三级的分类数据
-(void)getGoodsClassWithPid:(NSString *)pId{
    [self.rightDataArray removeAllObjects];
    /// 每个子页面的section个数
    for (int i = 0; i < self.imageDataMutArr.count; i++){
        [self.rightDataArray addObject:[self createTwoModel:i]];
    }
    [self.collectionView reloadData];
    if (self.rightDataArray.count){
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                    atScrollPosition:UICollectionViewScrollPositionTop
                                            animated:NO];
    }
}

-(GoodsClassModel *)createOneModel:(int)iflag{
    GoodsClassModel *model = GoodsClassModel.new;
    model.idField = [NSString stringWithFormat:@"%d", iflag];
    model.pid = @"0";
    model.name = [NSString stringWithFormat:@"一级目录 %d", iflag];
    model.textModel.text = self.titleMutArr[iflag].textModel.text;
    return model;
}

-(GoodsClassModel *)createTwoModel:(int)iFlag{
    GoodsClassModel *model = GoodsClassModel.new;
    model.idField = [NSString stringWithFormat:@"%d", iFlag];
    model.pid = [NSString stringWithFormat:@"%d", iFlag];
    model.name = [NSString stringWithFormat:@"随机-%d", iFlag];
    model.textModel.text = @"1234";
    model.subTextModel.text = JobsInternationalization([NSString stringWithFormat:@"%d球桌球",iFlag]);
    model.bgImage = self.imageDataMutArr[iFlag];
    NSLog(@"%@",model.bgImage);
    NSMutableArray *arr = NSMutableArray.array;
    /// 每个section里面的item数量
    for (int i = 0; i < 9; i++){
        [arr addObject:[self createThreeModel:i]];
    }
    model.childrenList = arr;
    NSLog(@"LKL = %ld",model.childrenList.count);
    return model;
}

-(GoodsClassModel *)createThreeModel:(int)iflag{
    GoodsClassModel *model = GoodsClassModel.new;
    model.idField = [NSString stringWithFormat:@"%d", iflag];
    model.pid = [NSString stringWithFormat:@"%d", iflag];
    model.name = [NSString stringWithFormat:@"三级目录 %d", iflag];
    return model;
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.titleMutArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftCell *cell = LeftCell.cellStyleValue1WithTableView(tableView);
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.textModel.text = self.titleMutArr[indexPath.row].textModel.text;
    cell.jobsRichElementsInCellWithModel(viewModel);

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [LeftCell cellHeightWithModel:nil];
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    if (self.rightDataArray.count) {
        self.rightViewCurrentSelectModel = [self.rightDataArray objectAtIndex:indexPath.row];
    }
    if (self.leftDataArray.count) {
        self.leftViewCurrentSelectModel = [self.leftDataArray objectAtIndex:indexPath.row];
    }
    [self getGoodsClassWithPid:self.rightViewCurrentSelectModel.idField];
    [self.collectionView setContentOffset:CGPointMake(0, JobsWidth(-5)) animated:YES];
}
#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource ThreeTopBannerCell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ThreeClassCell *cell = [ThreeClassCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    self.rightViewCurrentSelectModel = [self.rightDataArray objectAtIndex:indexPath.section];
    [cell getCollectionHeight:(NSMutableArray *)self.rightViewCurrentSelectModel.childrenList];
    cell.jobsRichElementsInCellWithModel(self.rightDataArray);
    [cell reloadData];
//    @jobs_weakify(self)
    [cell actionObjectBlock:^(GoodsClassModel *model) {
//        @jobs_strongify(self)
        NSLog(@"pid : %@", model.idField);
        NSLog(@"选中id : %@", model.idField);
    }];return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.rightDataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        UICollectionReusableView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:UICollectionReusableView.class
                                                                                            forIndexPath:indexPath];
        UILabel *label = [headerView viewWithTag:666];
        if (!label){
            label = UILabel.new;
            label.frame = CGRectMake(10,
                                     20,
                                     headerView.width - 20.f,
                                     17.f);
            label.font = [UIFont systemFontOfSize:12.f];
            label.textColor = JobsGrayColor;
            label.tag = 666;
            [headerView addSubview:label];
        }
        
        GoodsClassModel *rightModel = [self.rightDataArray objectAtIndex:indexPath.section];
        label.text = rightModel.name ? : JobsInternationalization(@"");
        
        return headerView;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        // 底部视图
        UICollectionReusableView *footView = [collectionView UICollectionElementKindSectionFooterClass:UICollectionReusableView.class
                                                                                          forIndexPath:indexPath];
        return footView;
    }return nil;
}

- (CGSize)collectionView:(UICollectionView*)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.collectionView.width, JobsWidth(40.f));
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section{
    return section == self.rightDataArray.count ? CGSizeMake(CGRectGetWidth(self.collectionView.frame), JobsWidth(40.f)) : CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.width, [self getCellHeight:(NSMutableArray *)[self.rightDataArray objectAtIndex:indexPath.section].childrenList]);
}
#pragma mark —— lazyLoad
-(UIButton *)customerServiceBtn{
    if (!_customerServiceBtn) {
        _customerServiceBtn = UIButton.new;
        _customerServiceBtn.normalImage(JobsIMG(@"人工客服"));
    }return _customerServiceBtn;
}

-(UIButton *)msgBtn{
    if (!_msgBtn) {
        _msgBtn = UIButton.new;
        _msgBtn.normalImage(JobsIMG(@"消息"));
    }return _msgBtn;
}

-(BaiShaETProjSearchView *)searchView{
    if (!_searchView) {
        _searchView = [BaiShaETProjSearchView.alloc initWithSize:CGSizeZero];
        [_searchView richElementsInViewWithModel:nil];
        [self.gk_navigationBar addSubview:_searchView];
        [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([BaiShaETProjSearchView viewSizeWithModel:nil]);
            make.left.equalTo(self.gk_navigationBar).offset(JobsWidth(16));
            make.bottom.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(-5));
        }];
    }return _searchView;
}

-(UIButton *)editBtn{
    if (!_editBtn) {
        _editBtn = UIButton.new;
        _editBtn.backgroundColor = HEXCOLOR(0xFCFBFB);
        _editBtn.normalTitle(JobsInternationalization(@"编辑"));
        _editBtn.normalTitleColor(HEXCOLOR(0xB0B0B0));
        _editBtn.titleFont(UIFontWeightRegularSize(12));
        _editBtn.normalImage(JobsIMG(@"编辑"));
        [_editBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading
                                     imagePadding:JobsWidth(5.75)];
        @jobs_weakify(self)
        [_editBtn jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
//            toast(JobsInternationalization(@"编辑"));
            self.popupParameter.dragEnable = YES;
            self.popupParameter.disuseBackgroundTouchHide = NO;
            [self.popupView tf_showSlide:jobsGetMainWindow()
                               direction:PopupDirectionBottom
                              popupParam:self.popupParameter];
            return nil;
        }];
        [self.view addSubview:_editBtn];
        [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.top.equalTo(self.tableView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(TableViewWidth, EditBtnHeight));
        }];
    }return _editBtn;
}

-(UITableView *)tableView{
    if (!_tableView){
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = HEXCOLOR(0xFCFBFB);
        _tableView.dataLink(self);
        _tableView.frame = CGRectMake(0,
                                      JobsTopSafeAreaHeight() + JobsStatusBarHeight(),
                                      TableViewWidth,
                                      JobsMainScreen_HEIGHT() - JobsTopSafeAreaHeight() - JobsStatusBarHeight() - JobsTabBarHeight(AppDelegate.tabBarVC) - EditBtnHeight);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }return _tableView;
}

-(UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = UICollectionViewFlowLayout.new;
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }return _flowLayout;
}

-(UICollectionView *)collectionView{
    if (!_collectionView){
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectMake(self.tableView.right,
                                                                           self.tableView.top,
                                                                           JobsMainScreen_WIDTH() - self.tableView.width,
                                                                           self.tableView.height + EditBtnHeight)
                                           collectionViewLayout:self.flowLayout];
        _collectionView.dataLink(self);
        _collectionView.backgroundColor = ThreeClassCellBgCor;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.registerCollectionViewClass();
//        collectionView.registerCollectionViewCellClass(ThreeClassCell.class);
//        collectionView.registerCollectionElementKindSectionHeaderClass(UICollectionReusableView.class);
//        collectionView.registerCollectionElementKindSectionFooterClass(UICollectionReusableView.class);
        [self.view addSubview:_collectionView];
    }return _collectionView;
}

-(ThreeClassCell *)tempCell{
    if (!_tempCell){
        _tempCell = ThreeClassCell.new;
        _tempCell.frame = CGRectMake(0,
                                     0,
                                     [ThreeClassCell cellSizeWithModel:nil].width,
                                     [ThreeClassCell cellSizeWithModel:nil].height);
    }return _tempCell;
}

-(NSMutableArray<UIViewModel *> *)leftDataArray{
    if (!_leftDataArray) {
        _leftDataArray = NSMutableArray.array;
    }return _leftDataArray;
}

-(NSMutableArray<GoodsClassModel *> *)rightDataArray{
    if (!_rightDataArray) {
        _rightDataArray = NSMutableArray.array;
    }return _rightDataArray;
}

-(NSMutableArray<UIImage *> *)imageDataMutArr{
    if (_imageDataMutArr) {
        [_imageDataMutArr removeAllObjects];
    }else{
        _imageDataMutArr = NSMutableArray.array;
    }
    /// 装载假数据
    if (self.thisIndex == 0) {
        for (int i = 1; i < 10; i++) {
            [_imageDataMutArr addObject:JobsIMG([@"体育" stringByAppendingString:[NSString stringWithFormat:@"0%d",i]])];
        }
    }else if (self.thisIndex == 1){
        for (int i = 1; i < 10; i++) {
            [_imageDataMutArr addObject:JobsIMG([@"真人" stringByAppendingString:[NSString stringWithFormat:@"0%d",i]])];
        }
    }else if (self.thisIndex == 2){
        for (int i = 1; i < 10; i++) {
            [_imageDataMutArr addObject:JobsIMG([@"体育" stringByAppendingString:[NSString stringWithFormat:@"0%d",i]])];
        }
    }else if (self.thisIndex == 3){
        for (int i = 1; i < 10; i++) {
            [_imageDataMutArr addObject:JobsIMG([@"体育" stringByAppendingString:[NSString stringWithFormat:@"0%d",i]])];
        }
    }else if (self.thisIndex == 4){
        for (int i = 1; i < 10; i++) {
            [_imageDataMutArr addObject:JobsIMG([@"体育" stringByAppendingString:[NSString stringWithFormat:@"0%d",i]])];
        }
    }else if (self.thisIndex == 5){
        for (int i = 1; i < 10; i++) {
            [_imageDataMutArr addObject:JobsIMG([@"体育" stringByAppendingString:[NSString stringWithFormat:@"0%d",i]])];
        }
    }else{
        for (int i = 1; i < 10; i++) {
            [_imageDataMutArr addObject:JobsIMG([@"体育" stringByAppendingString:[NSString stringWithFormat:@"0%d",i]])];
        }
    }return _imageDataMutArr;
}

-(BaiShaETProjPopupView10 *)popupView{
    if (!_popupView) {
        _popupView = BaiShaETProjPopupView10.new;
        _popupView.size = [BaiShaETProjPopupView10 viewSizeWithModel:nil];
        @jobs_weakify(self)
        [_popupView tf_observerDelegateProcess:^(UIView *pop, DelegateProcess pro) {
            @strongify(self)
            if (pro == DelegateProcessWillHide) {
                [self.popupView shakeCell:NO];
            }
        }];
        [_popupView actionObjectBlock:^(id data) {
            @strongify(self)
            if ([data isKindOfClass:NSMutableArray.class]) {
                NSMutableArray *dataMutArr = NSMutableArray.array;
                [dataMutArr addObject:self.titleMutArr[0]];
                [dataMutArr addObjectsFromArray:(NSMutableArray *)data];
#ifdef DEBUG
                NSMutableArray *mutArr = NSMutableArray.array;
                for (UIViewModel *viewModel in dataMutArr) {
                    [mutArr addObject:viewModel.textModel.text];
                }
                NSLog(@"%@",mutArr);
#endif
                self.titleMutArr = dataMutArr;
            }else if ([data isKindOfClass:UIButton.class]){
                UIButton *btn = (UIButton *)data;
                if ([btn.titleForNormalState isEqualToString:JobsInternationalization(@"恢复默认")]) {
                    self.titleMutArr = self.makeTitleMutArr;
                }
            }else{}
            
            [self.tableView reloadData];
            [self.collectionView reloadData];
        }];
    }
    NSLog(@"self.thisIndex = %ld",self.thisIndex);
    
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.index = self.thisIndex;
    viewModel.data = self.popupViewDataMutArr;
    
    [_popupView richElementsInViewWithModel:viewModel];
    return _popupView;
}

-(NSMutableArray<UIViewModel *> *)popupViewDataMutArr{
    if (!_popupViewDataMutArr) {
        _popupViewDataMutArr = self.makePopViewDataMutArr;
    }return _popupViewDataMutArr;
}

-(NSMutableArray<UIViewModel *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = self.makeTitleMutArr;
    }return _titleMutArr;
}

@end
