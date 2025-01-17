//
//  JobsVerticalMenuVC@2.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "JobsVerticalMenuVC@2.h"

@interface JobsVerticalMenuVC_2 ()
/// UI
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
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
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
    
    self.loadData();
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
        data.add(UIBarButtonItem.initBy(self.msgBtn));
        data.add(UIBarButtonItem.initBy(self.customerServiceBtn));
    });
    self.makeNavByAlpha(1);
    
    self.searchView.alpha = 1;
    self.tableView.reloadDatas();
    self.editBtn.alpha = 1;
    self.collectionView.reloadDatas();
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

-(jobsByVoidBlock _Nonnull)loadData{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        /// 这里可以调用接口去获取一级目录分类的数据
        for (int i = 0; i < self.titleMutArr.count; i++){
            self.leftDataArray.add(self.createOneModel(i));
        }
    };
}
/// 最初默认的数据
-(NSMutableArray<UIViewModel *> *)makeTitleMutArr{
    @jobs_weakify(self)
    return jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
            data1.textModel.text = JobsInternationalization(@"收藏");
        }));
        data.addBy(self.makePopViewDataMutArr);
    });;
}

-(NSMutableArray<UIViewModel *> *)makePopViewDataMutArr{
    NSMutableArray <UIViewModel *>*titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
            data1.textModel.text = JobsInternationalization(@"收藏");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
            data1.textModel.text = JobsInternationalization(@"真人");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
            data1.textModel.text = JobsInternationalization(@"体育");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
            data1.textModel.text = JobsInternationalization(@"电子");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
            data1.textModel.text = JobsInternationalization(@"棋牌");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
            data1.textModel.text = JobsInternationalization(@"彩票");
        }));
    });return titleMutArr;
}

-(jobsByVoidBlock _Nonnull)refreshLeftView{
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
-(JobsReturnCGFloatByArrBlock _Nonnull)getCellHeight{
    @jobs_weakify(self)
    return ^(NSMutableArray *_Nullable data){
        @jobs_strongify(self)
        /// 获取cell 的高度
        return self.tempCell.getCollectionHeight(data);
    };
}
/// 根据一级目录的id 获取二三级的分类数据
-(jobsByStringBlock _Nonnull)getGoodsClassWithPid{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data){
        @jobs_strongify(self)
        self.rightDataArray.clean();
        /// 每个子页面的section个数
        for (int i = 0; i < self.imageDataMutArr.count; i++){
            self.rightDataArray.add(self.createTwoModel(i));
        }
        [self.collectionView reloadData];
        if (self.rightDataArray.count){
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                        atScrollPosition:UICollectionViewScrollPositionTop
                                                animated:NO];
        }
    };
}

-(JobsReturnGoodsClassModelByIntBlock _Nonnull)createOneModel{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(int iflag){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
            @jobs_strongify(self)
            model.idField = toStringByInt(iflag);
            model.pid = @"0";
            model.name = JobsInternationalization(@"一级目录").add(toStringByInt(iflag));
            model.textModel.text = self.titleMutArr[iflag].textModel.text;
        });
    };
}

-(JobsReturnGoodsClassModelByIntBlock _Nonnull)createTwoModel{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(int iFlag){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
            model.idField = toStringByInt(iFlag);
            model.pid = toStringByInt(iFlag);
            model.name = JobsInternationalization(@"随机").add(@"-").add(toStringByInt(iFlag));
            model.textModel.text = @"1234";
            model.subTextModel.text = toStringByInt(iFlag).add(JobsInternationalization(@"球桌球"));
            model.bgImage = self.imageDataMutArr[iFlag];
            JobsLog(@"%@",model.bgImage);
            @jobs_strongify(self)
            model.childrenList = jobsMakeMutArr(^(__kindof NSMutableArray <GoodsClassModel *>*_Nullable arr) {
                @jobs_strongify(self)
                /// 每个section里面的item数量
                for (int i = 0; i < 9; i++){
                    arr.add(self.createThreeModel(i));
                }
            });JobsLog(@"LKL = %ld",model.childrenList.count);
        });
    };
}

-(JobsReturnGoodsClassModelByIntBlock _Nonnull)createThreeModel{
    return ^__kindof GoodsClassModel *_Nullable(int iflag){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
            model.idField = toStringByInt(iflag);
            model.pid = toStringByInt(iflag);
            model.name = JobsInternationalization(@"三级目录").add(toStringByInt(iflag));
        });
    };
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
    cell.jobsRichElementsCellBy(viewModel);
    return cell;
}

-(CGFloat)tableView:(__kindof UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return LeftCell.cellHeightByModel(nil);
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
    self.getGoodsClassWithPid(self.rightViewCurrentSelectModel.idField);
    [self.collectionView setContentOffset:CGPointMake(0, JobsWidth(-5)) animated:YES];
}
#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource ThreeTopBannerCell
-(__kindof UICollectionViewCell *)collectionView:(__kindof UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ThreeClassCell *cell = [ThreeClassCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    self.rightViewCurrentSelectModel = self.rightDataArray.objectAt(indexPath.section);
    cell.getCollectionHeight(self.rightViewCurrentSelectModel.childrenList);
    cell.jobsRichElementsCellBy(self.rightDataArray);
    [cell reloadData];
//    @jobs_weakify(self)
    [cell actionObjBlock:^(GoodsClassModel *model) {
//        @jobs_strongify(self)
        JobsLog(@"pid : %@", model.idField);
        JobsLog(@"选中id : %@", model.idField);
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
            label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label.frame = CGRectMake(10,
                                         20,
                                         headerView.width - 20.f,
                                         17.f);
                label.font = [UIFont systemFontOfSize:12.f];
                label.textColor = JobsGrayColor;
                label.tag = 666;
            });headerView.addSubview(label);
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
    return CGSizeMake(self.collectionView.width,
                      self.getCellHeight([self.rightDataArray objectAtIndex:indexPath.section].childrenList));
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView){
        _tableView = UITableView.initWithStylePlain;
        _tableView.dataLink(self);
        _tableView.backgroundColor = HEXCOLOR(0xFCFBFB);
        _tableView.frame = CGRectMake(0,
                                      JobsTopSafeAreaHeight() + JobsStatusBarHeight() + self.gk_navigationBar.mj_h,
                                      TableViewWidth,
                                      JobsMainScreen_HEIGHT() - JobsTopSafeAreaHeight() - JobsStatusBarHeight() - JobsTabBarHeight(AppDelegate.tabBarVC) - EditBtnHeight);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }return _tableView;
}
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView){
        _collectionView = UICollectionView.initByLayout(jobsMakeVerticalCollectionViewFlowLayout(^(UICollectionViewFlowLayout * _Nullable data) {
            
        }));
        _collectionView.dataLink(self);
        _collectionView.frame = CGRectMake(self.tableView.right,
                                           self.tableView.top,
                                           JobsMainScreen_WIDTH() - self.tableView.width,
                                           self.tableView.height + EditBtnHeight);
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
                                     ThreeClassCell.cellSizeByModel(nil).width,
                                     ThreeClassCell.cellSizeByModel(nil).height);
    }return _tempCell;
}

-(BaseButton *)customerServiceBtn{
    if (!_customerServiceBtn) {
        @jobs_weakify(self)
        _customerServiceBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnImage(JobsIMG(@"人工客服"))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
    }return _customerServiceBtn;
}

-(BaseButton *)msgBtn{
    if (!_msgBtn) {
        @jobs_weakify(self)
        _msgBtn = BaseButton.jobsInit()
            .jobsResetBtnImage(JobsIMG(@"消息"))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });;
    }return _msgBtn;
}

-(JobsSearchBar *)searchView{
    if (!_searchView) {
        _searchView = JobsSearchBar.new;
        _searchView.sizer = CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40));
        _searchView.jobsRichViewByModel(nil);
//        @jobs_weakify(self)
        [_searchView actionObjBlock:^(NSString *data) {
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
//                            JobsLog(@"data = %@",data);
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
        _editBtn = BaseButton.jobsInit()
            .bgColorBy(HEXCOLOR(0xFCFBFB))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(JobsWidth(5.75))
            .jobsResetBtnBgImage(JobsIMG(@"编辑"))
            .jobsResetBtnTitleCor(HEXCOLOR(0xB0B0B0))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"编辑"))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
    //            toast(JobsInternationalization(@"编辑"));
                self.popupParameter.dragEnable = YES;
                self.popupParameter.disuseBackgroundTouchHide = NO;
                [self.popupView tf_showSlide:MainWindow
                                   direction:PopupDirectionBottom
                                  popupParam:self.popupParameter];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
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
        _popupView.sizer = BaiShaETProjPopupView10.viewSizeByModel(nil);
        @jobs_weakify(self)
        [_popupView tf_observerDelegateProcess:^(UIView *pop, DelegateProcess pro) {
            @strongify(self)
            if (pro == DelegateProcessWillHide) {
                self.popupView.shakeCell(NO);
            }
        }];
        [_popupView actionObjBlock:^(id data) {
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
                JobsLog(@"%@",mutArr);
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
    JobsLog(@"self.thisIndex = %ld",self.thisIndex);
    
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.index = self.thisIndex;
    viewModel.data = self.popupViewDataMutArr;
    
    _popupView.jobsRichViewByModel(viewModel);
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
