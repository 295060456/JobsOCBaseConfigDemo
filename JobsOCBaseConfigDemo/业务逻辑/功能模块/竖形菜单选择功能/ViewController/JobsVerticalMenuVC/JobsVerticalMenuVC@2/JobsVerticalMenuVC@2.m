//
//  JobsVerticalMenuVC@2.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "JobsVerticalMenuVC@2.h"

@interface JobsVerticalMenuVC_2 ()
/// UI
@property(nonatomic,strong)UITableView *tableView;///  左侧的标题
@property(nonatomic,strong)UICollectionView *collectionView; /// 右侧的内容
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong)BaseButton *customerServiceBtn;
@property(nonatomic,strong)BaseButton *msgBtn;
@property(nonatomic,strong)BaseButton *editBtn;
@property(nonatomic,strong)ThreeClassCell *tempCell;
@property(nonatomic,strong)JobsSearchBar *searchView;
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

@implementation JobsVerticalMenuVC_2

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
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
    
    self.loadData();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
//        data.add(JobsBarButtonItem(self.aboutBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        data.add(JobsBarButtonItem(self.msgBtn));
        data.add(JobsBarButtonItem(self.customerServiceBtn));
    });
    self.makeNavByAlpha(1);
    
    self.searchView.alpha = 1;
    self.tableView.alpha = 1;
    self.editBtn.alpha = 1;
    self.collectionView.alpha = 1;
    self.refreshLeftView();
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
    return self.leftViewCurrentSelectModel ? self.leftDataArray.indexBy(self.leftViewCurrentSelectModel) : 0;
}

-(jobsByVoidBlock)loadData{
    return ^(){
        /// 这里可以调用接口去获取一级目录分类的数据
        for (int i = 0; i < self.titleMutArr.count; i++){
            self.leftDataArray.add([self createOneModel:i]);
        }
    };
}
/// 最初默认的数据
-(NSMutableArray<UIViewModel *> *)makeTitleMutArr{
    NSMutableArray <UIViewModel *>*titleMutArr = NSMutableArray.array;
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"收藏");
        titleMutArr.add(viewModel);
    }
    
    [titleMutArr addObjectsFromArray:self.makePopViewDataMutArr];
    return titleMutArr;
}

-(NSMutableArray<UIViewModel *> *)makePopViewDataMutArr{
    NSMutableArray <UIViewModel *>*titleMutArr = NSMutableArray.array;
    
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"真人");
        titleMutArr.add(viewModel);
    }
    
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"体育");
        titleMutArr.add(viewModel);
    }
    
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"电子");
        titleMutArr.add(viewModel);
    }
    
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"棋牌");
        titleMutArr.add(viewModel);
    }
    
    {
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"彩票");
        titleMutArr.add(viewModel);
    }return titleMutArr;
}

-(jobsByVoidBlock)refreshLeftView{
    return ^(){
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
    };
}
/// 预算高度
-(CGFloat)getCellHeight:(NSMutableArray *)dataArray{
    //获取cell 的高度
    return [self.tempCell getCollectionHeight:dataArray];
}
/// 根据一级目录的id 获取二三级的分类数据
-(void)getGoodsClassWithPid:(NSString *)pId{
    self.rightDataArray.clean();
    /// 每个子页面的section个数
    for (int i = 0; i < self.imageDataMutArr.count; i++){
        self.rightDataArray.add([self createTwoModel:i]);
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
    model.idField = toStringByInt(iflag);
    model.pid = @"0";
    model.name = JobsInternationalization(@"一级目录").add(toStringByInt(iflag));
    model.textModel.text = self.titleMutArr[iflag].textModel.text;
    return model;
}

-(GoodsClassModel *)createTwoModel:(int)iFlag{
    GoodsClassModel *model = GoodsClassModel.new;
    model.idField = toStringByInt(iFlag);
    model.pid = toStringByInt(iFlag);
    model.name = JobsInternationalization(@"随机").add(@"-").add(toStringByInt(iFlag));
    model.textModel.text = @"1234";
    model.subTextModel.text = toStringByInt(iFlag).add(JobsInternationalization(@"球桌球"));
    model.bgImage = self.imageDataMutArr[iFlag];
    NSLog(@"%@",model.bgImage);
    NSMutableArray <GoodsClassModel *>*arr = NSMutableArray.array;
    /// 每个section里面的item数量
    for (int i = 0; i < 9; i++){
        arr.add([self createThreeModel:i]);
    }
    model.childrenList = arr;
    NSLog(@"LKL = %ld",model.childrenList.count);
    return model;
}

-(GoodsClassModel *)createThreeModel:(int)iflag{
    GoodsClassModel *model = GoodsClassModel.new;
    model.idField = toStringByInt(iflag);
    model.pid = toStringByInt(iflag);
    model.name = JobsInternationalization(@"三级目录").add(toStringByInt(iflag));
    return model;
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(__kindof UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.titleMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(__kindof UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftCell *cell = LeftCell.cellStyleDefaultWithTableView(tableView);
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.textModel.text = self.titleMutArr[indexPath.row].textModel.text;
    cell.jobsRichElementsInCellWithModel(viewModel);
    return cell;
}

-(CGFloat)tableView:(__kindof UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [LeftCell cellHeightWithModel:nil];
}

-(void)tableView:(__kindof UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    if (self.rightDataArray.count) {
        self.rightViewCurrentSelectModel = self.rightDataArray.objectAt(indexPath.row);
    }
    if (self.leftDataArray.count) {
        self.leftViewCurrentSelectModel = self.leftDataArray.objectAt(indexPath.row);
    }
    [self getGoodsClassWithPid:self.rightViewCurrentSelectModel.idField];
    [self.collectionView setContentOffset:CGPointMake(0, JobsWidth(-5)) animated:YES];
}
#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource ThreeTopBannerCell
-(__kindof UICollectionViewCell *)collectionView:(__kindof UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ThreeClassCell *cell = [ThreeClassCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    self.rightViewCurrentSelectModel = self.rightDataArray.objectAt(indexPath.section);
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

-(NSInteger)numberOfSectionsInCollectionView:(__kindof UICollectionView *)collectionView{
    return self.rightDataArray.count;
}

- (NSInteger)collectionView:(__kindof UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (__kindof UICollectionReusableView *)collectionView:(__kindof UICollectionView *)collectionView
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

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.collectionView.width, JobsWidth(40.f));
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section{
    return section == self.rightDataArray.count ? CGSizeMake(CGRectGetWidth(self.collectionView.frame), JobsWidth(40.f)) : CGSizeZero;
}

- (CGSize)collectionView:(__kindof UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.width, [self getCellHeight:(NSMutableArray *)[self.rightDataArray objectAtIndex:indexPath.section].childrenList]);
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView){
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = HEXCOLOR(0xFCFBFB);
        _tableView.dataLink(self);
        _tableView.frame = CGRectMake(0,
                                      JobsTopSafeAreaHeight() + JobsStatusBarHeight() + self.gk_navigationBar.mj_h,
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
        _collectionView.backgroundColor = JobsRandomColor;// ThreeClassCellBgCor;
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
        _tempCell.backgroundColor = JobsRedColor;
        _tempCell.frame = CGRectMake(0,
                                     0,
                                     [ThreeClassCell cellSizeWithModel:nil].width,
                                     [ThreeClassCell cellSizeWithModel:nil].height);
    }return _tempCell;
}

-(BaseButton *)customerServiceBtn{
    if (!_customerServiceBtn) {
        @jobs_weakify(self)
        _customerServiceBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                                background:nil
                                                buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                             textAlignment:NSTextAlignmentCenter
                                                          subTextAlignment:NSTextAlignmentCenter
                                                               normalImage:JobsIMG(@"人工客服")
                                                            highlightImage:nil
                                                           attributedTitle:nil
                                                   selectedAttributedTitle:nil
                                                        attributedSubtitle:nil
                                                                     title:nil
                                                                  subTitle:nil
                                                                 titleFont:nil
                                                              subTitleFont:nil
                                                                  titleCor:nil
                                                               subTitleCor:nil
                                                        titleLineBreakMode:NSLineBreakByWordWrapping
                                                     subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                       baseBackgroundColor:nil
                                                           backgroundImage:nil
                                                              imagePadding:JobsWidth(0)
                                                              titlePadding:JobsWidth(0)
                                                            imagePlacement:NSDirectionalRectEdgeNone
                                                contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                                  contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                             contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                         cornerRadiusValue:JobsWidth(0)
                                                           roundingCorners:UIRectCornerAllCorners
                                                      roundingCornersRadii:CGSizeZero
                                                            layerBorderCor:nil
                                                               borderWidth:JobsWidth(0)
                                                             primaryAction:nil
                                                longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                               id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                                           clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
    }return _customerServiceBtn;
}

-(BaseButton *)msgBtn{
    if (!_msgBtn) {
        @jobs_weakify(self)
        _msgBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                    background:nil
                                    buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                 textAlignment:NSTextAlignmentCenter
                                              subTextAlignment:NSTextAlignmentCenter
                                                   normalImage:JobsIMG(@"消息")
                                                highlightImage:nil
                                               attributedTitle:nil
                                       selectedAttributedTitle:nil
                                            attributedSubtitle:nil
                                                         title:nil
                                                      subTitle:nil
                                                     titleFont:nil
                                                  subTitleFont:nil
                                                      titleCor:nil
                                                   subTitleCor:nil
                                            titleLineBreakMode:NSLineBreakByWordWrapping
                                         subtitleLineBreakMode:NSLineBreakByWordWrapping
                                           baseBackgroundColor:nil
                                               backgroundImage:nil
                                                  imagePadding:JobsWidth(0)
                                                  titlePadding:JobsWidth(0)
                                                imagePlacement:NSDirectionalRectEdgeNone
                                    contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                      contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                 contentInsets:jobsSameDirectionalEdgeInsets(0)
                                             cornerRadiusValue:JobsWidth(0)
                                               roundingCorners:UIRectCornerAllCorners
                                          roundingCornersRadii:CGSizeZero
                                                layerBorderCor:nil
                                                   borderWidth:JobsWidth(0)
                                                 primaryAction:nil
                                    longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                   id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                               clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
    }return _msgBtn;
}

-(JobsSearchBar *)searchView{
    if (!_searchView) {
        _searchView = JobsSearchBar.new;
        _searchView.Size = CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40));
        _searchView.jobsRichElementsInViewWithModel(nil);
//        @jobs_weakify(self)
        [_searchView actionObjectBlock:^(NSString *data) {
//            @jobs_strongify(self)

        }];
        
        [self.gk_navigationBar addSubview:_searchView];
        [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40)));
            make.right.equalTo(self.gk_navigationBar).offset(JobsWidth(0));
            make.centerY.equalTo(self.gk_navigationBar);
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
    }return _searchView;
}

-(BaseButton *)editBtn{
    if (!_editBtn) {
        @jobs_weakify(self)
        _editBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                     background:nil
                                     buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                  textAlignment:NSTextAlignmentCenter
                                               subTextAlignment:NSTextAlignmentCenter
                                                    normalImage:JobsIMG(@"编辑")
                                                 highlightImage:nil
                                                attributedTitle:nil
                                        selectedAttributedTitle:nil
                                             attributedSubtitle:nil
                                                          title:JobsInternationalization(@"编辑")
                                                       subTitle:nil
                                                      titleFont:UIFontWeightRegularSize(12)
                                                   subTitleFont:nil
                                                       titleCor:HEXCOLOR(0xB0B0B0)
                                                    subTitleCor:nil
                                             titleLineBreakMode:NSLineBreakByWordWrapping
                                          subtitleLineBreakMode:NSLineBreakByWordWrapping
                                            baseBackgroundColor:HEXCOLOR(0xFCFBFB)
                                                backgroundImage:nil
                                                   imagePadding:JobsWidth(5.75)
                                                   titlePadding:JobsWidth(0)
                                                 imagePlacement:NSDirectionalRectEdgeLeading
                                     contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                       contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                  contentInsets:jobsSameDirectionalEdgeInsets(0)
                                              cornerRadiusValue:JobsWidth(0)
                                                roundingCorners:UIRectCornerAllCorners
                                           roundingCornersRadii:CGSizeZero
                                                 layerBorderCor:nil
                                                    borderWidth:JobsWidth(0)
                                                  primaryAction:nil
                                     longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                    id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                                clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
//            toast(JobsInternationalization(@"编辑"));
            self.popupParameter.dragEnable = YES;
            self.popupParameter.disuseBackgroundTouchHide = NO;
            [self.popupView tf_showSlide:NSObject.mainWindow()
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
        _imageDataMutArr.clean();
    }else _imageDataMutArr = NSMutableArray.array;
    /// 装载假数据
    if (self.thisIndex == 0) {
        for (int i = 1; i < 9; i++) {
            _imageDataMutArr.add(JobsIMG(@"体育".add(@"0").add(toStringByInt(i))));
        }
    }else if (self.thisIndex == 1){
        for (int i = 1; i < 8; i++) {
            _imageDataMutArr.add(JobsIMG(@"体育".add(@"0").add(toStringByInt(i))));
        }
    }else if (self.thisIndex == 2){
        for (int i = 1; i < 7; i++) {
            _imageDataMutArr.add(JobsIMG(@"体育".add(@"0").add(toStringByInt(i))));
        }
    }else if (self.thisIndex == 3){
        for (int i = 1; i < 6; i++) {
            _imageDataMutArr.add(JobsIMG(@"体育".add(@"0").add(toStringByInt(i))));
        }
    }else if (self.thisIndex == 4){
        for (int i = 1; i < 5; i++) {
            _imageDataMutArr.add(JobsIMG(@"体育".add(@"0").add(toStringByInt(i))));
        }
    }else if (self.thisIndex == 5){
        for (int i = 1; i < 4; i++) {
            _imageDataMutArr.add(JobsIMG(@"体育".add(@"0").add(toStringByInt(i))));
        }
    }else{
        for (int i = 1; i < 3; i++) {
            _imageDataMutArr.add(JobsIMG(@"体育".add(@"0").add(toStringByInt(i))));
        }
    }return _imageDataMutArr;
}

-(BaiShaETProjPopupView10 *)popupView{
    if (!_popupView) {
        _popupView = BaiShaETProjPopupView10.new;
        _popupView.Size = [BaiShaETProjPopupView10 viewSizeWithModel:nil];
        @jobs_weakify(self)
        [_popupView tf_observerDelegateProcess:^(UIView *pop, DelegateProcess pro) {
            @strongify(self)
            if (pro == DelegateProcessWillHide) {
                self.popupView.shakeCell(NO);
            }
        }];
        [_popupView actionObjectBlock:^(id data) {
            @strongify(self)
            if ([data isKindOfClass:NSMutableArray.class]) {
                NSMutableArray <UIViewModel *>*dataMutArr = NSMutableArray.array;
                dataMutArr.add(self.titleMutArr[0]);
                [dataMutArr addObjectsFromArray:(NSMutableArray *)data];
#ifdef DEBUG
                NSMutableArray <NSString *>*mutArr = NSMutableArray.array;
                for (UIViewModel *viewModel in dataMutArr) {
                    mutArr.add(viewModel.textModel.text);
                }
                NSLog(@"%@",mutArr);
#endif
                self.titleMutArr = dataMutArr;
            }else if ([data isKindOfClass:UIButton.class]){
                UIButton *btn = (UIButton *)data;
                if (btn.titleForNormalState.isEqualToString(JobsInternationalization(@"恢复默认"))) {
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
    
    _popupView.jobsRichElementsInViewWithModel(viewModel);
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
