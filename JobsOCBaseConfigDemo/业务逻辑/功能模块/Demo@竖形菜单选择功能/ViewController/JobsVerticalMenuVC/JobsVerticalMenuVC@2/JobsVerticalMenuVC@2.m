//
//  JobsVerticalMenuVC@2.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "JobsVerticalMenuVC@2.h"

@interface JobsVerticalMenuVC_2 ()
/// UI
Prop_strong()BaseButton *editBtn;
Prop_strong()ThreeClassCell *tempCell;
Prop_strong()JobsSearchBar *searchView;
Prop_strong()BaiShaETProjPopupView10 *popupView;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*titleMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*popupViewDataMutArr;
Prop_strong()NSMutableArray <GoodsClassModel *>*leftDataArray;/// 左边的数据源
Prop_strong()NSMutableArray <GoodsClassModel *>*rightDataArray;/// 右边的数据源
Prop_strong()GoodsClassModel *rightViewCurrentSelectModel;
Prop_strong()UIViewModel *leftViewCurrentSelectModel;
Prop_strong()NSMutableArray <UIButtonModel *>*cellDataMutArr;
Prop_strong()NSMutableArray <NSString *>*cellTitleMutArr;
Prop_assign()NSUInteger thisIndex;

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
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = @"启动页SLOGAN".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
    
    self.loadData();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.aboutBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(BaseButton.jobsInit()
                                        .jobsResetBtnImage(@"消息".img)
                                        .onClickBy(^(UIButton *x){
                                            @jobs_strongify(self)
                                            if (self.objBlock) self.objBlock(x);
                                        }).onLongPressGestureBy(^(id data){
                                            JobsLog(@"");
                                        })));
        data.add(UIBarButtonItem.initBy(BaseButton.jobsInit()
                                        .bgColorBy(JobsWhiteColor)
                                        .jobsResetBtnImage(@"人工客服".img)
                                        .onClickBy(^(UIButton *x){
                                            @jobs_strongify(self)
                                            if (self.objBlock) self.objBlock(x);
                                        }).onLongPressGestureBy(^(id data){
                                            JobsLog(@"");
                                        })));
    });
    self.makeNavByAlpha(1);
    
    self.searchView.alpha = 1;
    self.tableView.reloadDatas();
    self.editBtn.alpha = 1;
    self.collectionView.reloadDatas();
    self.refreshLeftView();
    [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    self.actionBy(0);
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
-(jobsByMutArrBlock _Nonnull)makeCellData{
    @jobs_weakify(self)
    return ^(__kindof NSMutableArray <__kindof UIButtonModel *>*_Nullable arr){
        @jobs_strongify(self)
        for (int i = 0; i < self.thisIndex + 1; i++) {
            arr.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
                model.backgroundImage = self.cellTitleMutArr[self.thisIndex].add(已点击.img);
                model.titleCor = HEXCOLOR(0xC4C4C4);
                model.titleFont = UIFontWeightRegularSize(12);
                model.baseBackgroundColor = JobsRedColor;
                model.imagePadding = JobsWidth(5);
            }));
        }
    };
}

-(JobsReturnButtonModelByString _Nonnull)makeLeftCellData{
//    @jobs_weakify(self)
    return ^__kindof UIButtonModel *_Nullable(__kindof NSString *_Nullable data){
//        @jobs_strongify(self)
        return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.backgroundImage = data.add(未点击.img);
            model.title = @"";
            model.subTitle = @"";
            model.baseBackgroundColor = JobsClearColor;
        });
    };
}

-(jobsByNSUIntegerBlock _Nonnull)actionBy{
    @jobs_weakify(self)
    return ^(NSUInteger index){
        @jobs_strongify(self)
        self.thisIndex = index;
        self.getGoodsClassByPid(self.rightViewCurrentSelectModel.idField,index);
        if (self.rightDataArray.count) self.rightViewCurrentSelectModel = self.rightDataArray.objectAt(index);
        if (self.leftDataArray.count) self.leftViewCurrentSelectModel = self.leftDataArray.objectAt(index);
        [self.collectionView setContentOffset:CGPointMake(0, JobsWidth(-5)) animated:YES];
    };
}
/// 最初默认的数据
-(NSMutableArray<UIViewModel *> *)makeTitleMutArr{
    @jobs_weakify(self)
    return jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
            data1.textModel.text = JobsInternationalization(@"收藏");
        }))
        .addBy(self.makePopViewDataMutArr);
    });;
}

-(NSMutableArray<UIViewModel *> *)makePopViewDataMutArr{
   return jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewModel *>* _Nullable data) {
       data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.text = JobsInternationalization(@"收藏");
       }))
       .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.text = JobsInternationalization(@"真人");
       }))
       .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.text = JobsInternationalization(@"体育");
       }))
       .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.text = JobsInternationalization(@"电子");
       }))
       .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.text = JobsInternationalization(@"棋牌");
       }))
       .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
           data1.textModel.text = JobsInternationalization(@"彩票");
       }));
   });
}

-(jobsByVoidBlock _Nonnull)refreshLeftView{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.tableView.reloadDatas();
        if (self.leftDataArray.count){
            @jobs_weakify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                NSIndexPath *indexPath = jobsMakeIndexPathZero();
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
-(JobsRetCGFloatByArrBlock _Nonnull)getCellHeight{
    @jobs_weakify(self)
    return ^(NSMutableArray *_Nullable data){
        @jobs_strongify(self)
        /// 获取cell 的高度
        return self.tempCell.getCollectionHeight(data);
    };
}
/// 根据一级目录的id 获取二三级的分类数据
-(jobsByStringAndNSUIntegerBlock _Nonnull)getGoodsClassByPid{
    @jobs_weakify(self)
    return ^(__kindof NSString *_Nullable data1,NSUInteger data2){
        @jobs_strongify(self)
        self.rightDataArray.clean();
        self.cellDataMutArr.clean();
        self.cellDataMutArr = nil;
        /// 每个子页面的section个数
        for (int i = 0; i < self.cellDataMutArr.count; i++){
            self.rightDataArray.add(self.createTwoModel(data2,i));
        }
        [self.collectionView reloadData];
        if (self.rightDataArray.count){
            [self.collectionView scrollToItemAtIndexPath:jobsMakeIndexPathZero()
                                        atScrollPosition:UICollectionViewScrollPositionTop
                                                animated:NO];
        }
    };
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

-(JobsReturnGoodsClassModelByIntBlock _Nonnull)createOneModel{
//    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(int iflag){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
//            @jobs_strongify(self)
            model.idField = toStringByInt(iflag);
            model.pid = @"0";
            model.name = JobsInternationalization(@"一级目录").add(toStringByInt(iflag));
            model.textModel.text = @"";
        });
    };
}

-(JobsReturnGoodsClassModelByInt2Block _Nonnull)createTwoModel{
    @jobs_weakify(self)
    return ^__kindof GoodsClassModel *_Nullable(NSUInteger data1,int iFlag){
        return jobsMakeGoodsClassModel(^(GoodsClassModel * _Nullable model) {
            @jobs_strongify(self)
            model.idField = toStringByInt(iFlag);
            model.pid = toStringByInt(iFlag);
            model.name = JobsInternationalization(@"随机").add(JobsDash).add(toStringByInt(iFlag));
            model.textModel.text = @"1234";
            model.subTextModel.text = toStringByInt(iFlag).add(JobsInternationalization(@"球桌球"));
            model.bgImage = self.cellDataMutArr[iFlag].backgroundImage;
            model.title = self.cellTitleMutArr[data1];
            JobsLog(@"%@",model.bgImage);
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
    @jobs_weakify(self)
    return LeftCell.cellStyleDefaultWithTableView(tableView)
        .jobsRichElementsTableViewCellBy(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            @jobs_strongify(self)
            viewModel.textModel.text = self.titleMutArr[indexPath.row].textModel.text;
        }));
}

-(CGFloat)tableView:(__kindof UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return LeftCell.cellHeightByModel(nil);
}

-(void)tableView:(__kindof UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    self.actionBy(indexPath.row);
}
#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource ThreeTopBannerCell
-(__kindof UICollectionViewCell *)collectionView:(__kindof UICollectionView *)collectionView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ThreeClassCell *cell = [ThreeClassCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    self.rightViewCurrentSelectModel = self.rightDataArray.objectAt(indexPath.section);
    cell.getCollectionHeight((NSMutableArray <NSObject *>*)self.rightViewCurrentSelectModel.childrenList);
    cell.jobsRichElementsTableViewCellBy(self.rightDataArray)
        .JobsBlock1(^(GoodsClassModel *model) {
        JobsLog(@"pid : %@", model.idField);
        JobsLog(@"选中id : %@", model.idField);
    });return cell.reloadDatas();
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
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)){
        UICollectionReusableView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:UICollectionReusableView.class
                                                                                            forIndexPath:indexPath];
        UILabel *label = headerView.viewWithTag(666);
        if (!label){
            label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label.frame = CGRectMake(10,
                                         20,
                                         headerView.width - 20.f,
                                         17.f);
                label.font = JobsFontBold(JobsWidth(12));
                label.textColor = JobsGrayColor;
                label.tag = 666;
            });headerView.addSubview(label);
        }
        
        GoodsClassModel *rightModel = self.rightDataArray.objectAt(indexPath.section);
        label.text = rightModel.name ? : JobsInternationalization(@"");
        
        return headerView;
    }else if (kind.isEqualToString(UICollectionElementKindSectionFooter)){
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
                      self.getCellHeight((NSMutableArray <NSObject *>*)[self.rightDataArray objectAtIndex:indexPath.section].childrenList));
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView){
        @jobs_weakify(self)
        _tableView = self.view.addSubview(jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.bounces = NO;
            tableView.backgroundColor = JobsClearColor;
            tableView.showsVerticalScrollIndicator = NO;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView.frame = CGRectMake(0,
                                         JobsTopSafeAreaHeight() + JobsStatusBarHeight() + self.gk_navigationBar.mj_h,
                                         TableViewWidth,
                                         JobsMainScreen_HEIGHT() - JobsTopSafeAreaHeight() - JobsStatusBarHeight() - JobsTabBarHeight(AppDelegate.tabBarVC) - EditBtnHeight);
        })).dataLink(self);/// dataLink(self)不能写在Block里面，会出问题
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
        _tempCell = jobsMakeThreeClassCell(^(__kindof ThreeClassCell * _Nullable cell) {
            cell.backgroundColor = JobsRedColor;
            cell.frame = CGRectMake(0,
                                    0,
                                    ThreeClassCell.cellSizeByModel(nil).width,
                                    ThreeClassCell.cellSizeByModel(nil).height);
        });
    }return _tempCell;
}

-(JobsSearchBar *)searchView{
    if (!_searchView) {
        @jobs_weakify(self)
        _searchView = jobsMakeSearchBar(^(__kindof JobsSearchBar * _Nullable searchBar) {
            @jobs_strongify(self)
            searchBar
                .bySize(CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40)))
                .JobsRichViewByModel2(nil)
                .JobsBlock1(^(id  _Nullable data) {
                    
                });
            [self.gk_navigationBar.addSubview(searchBar) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40)));
                make.right.equalTo(self.gk_navigationBar).offset(JobsWidth(0));
                make.centerY.equalTo(self.gk_navigationBar);
            }];
            
//            [searchBar actionNSIntegerBlock:^(UITextFieldFocusType data) {
//                @jobs_strongify(self)
//                switch (data) {
//                    case UITextFieldGetFocus:{/// 输入框获得焦点
//                        if (self.listViewData.count) {
//                            /// 必须先移除，否则反复添加无法正常移除
//                            self.dropDownListView = [self motivateFromView:weak_self.jobsSearchBar
//                                                                      data:self.listViewData
//                                                        motivateViewOffset:JobsWidth(5)
//                                                               finishBlock:^(UIViewModel *data) {
//                                JobsLog(@"data = %@",data);
//                            }];
//                        }
//                    }break;
//                    case UITextFieldLoseFocus:{/// 输入框失去焦点
//                        [self endDropDownListView];
//                    }break;
//                    default:
//                        break;
//                }
//            }];
        });
    }return _searchView;
}

-(BaseButton *)editBtn{
    if (!_editBtn) {
        @jobs_weakify(self)
        _editBtn = BaseButton.jobsInit()
            .bgColorBy(HEXCOLOR(0xFCFBFB))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(JobsWidth(5.75))
            .jobsResetBtnBgImage(@"编辑".img)
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
        [self.view.addSubview(_editBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.top.equalTo(self.tableView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(TableViewWidth, EditBtnHeight));
        }];
    }return _editBtn;
}

-(NSMutableArray<UIButtonModel *> *)cellDataMutArr{
    if (!_cellDataMutArr) {
        /// 装载假数据
        @jobs_weakify(self)
        _cellDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            @jobs_strongify(self)
            self.makeCellData(arr);
        });
    }return _cellDataMutArr;
}

-(BaiShaETProjPopupView10 *)popupView{
    if (!_popupView) {
        @jobs_weakify(self)
        _popupView = BaiShaETProjPopupView10.BySize(BaiShaETProjPopupView10.viewSizeByModel(nil))
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id _Nullable data) {
                @strongify(self)
                if ([data isKindOfClass:NSMutableArray.class]) {
                    NSMutableArray <UIViewModel *>*dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                        @strongify(self)
                        arr.add(self.titleMutArr[0]);
                        arr.addBy(data);
                    });
#ifdef DEBUG
                    JobsLog(@"%@",jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
                        for (UIViewModel *viewModel in dataMutArr) {
                            arr.add(viewModel.textModel.text);
                        }
                    }));
#endif
                    self.titleMutArr = dataMutArr;
                }else if ([data isKindOfClass:UIButton.class]){
                    UIButton *btn = (UIButton *)data;
                    if (btn.titleForNormalState.isEqualToString(JobsInternationalization(@"恢复默认"))) {
                        self.titleMutArr = self.makeTitleMutArr;
                    }
                }else{}
                self.tableView.reloadDatas();
                self.collectionView.reloadDatas();
            });
        [_popupView tf_observerDelegateProcess:^(UIView *pop, DelegateProcess pro) {
            @strongify(self)
            if (pro == DelegateProcessWillHide) self.popupView.shakeCell(NO);
        }];
    }
    JobsLog(@"self.thisIndex = %ld",self.thisIndex);
    @jobs_weakify(self)
    _popupView.jobsRichViewByModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
        @jobs_strongify(self)
        viewModel.index = self.thisIndex;
        viewModel.data = self.popupViewDataMutArr;
    }));return _popupView;
}

-(NSMutableArray<NSString *> *)cellTitleMutArr{
    if(!_cellTitleMutArr){
        _cellTitleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
            arr.add(@"BTG")
                .add(@"SA")
                .add(@"RTG")
                .add(@"RedTiger")
                .add(@"PP")
                .add(@"PG")
                .add(@"NLC")
                .add(@"NE")
                .add(@"KA")
                .add(@"JILI")
                .add(@"JDB")
                .add(@"FP")
                .add(@"FC")
                .add(@"Ezugi")
                .add(@"EVO")
                .add(@"CQ9");
        });
    }return _cellTitleMutArr;
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

-(NSMutableArray<GoodsClassModel *> *)leftDataArray{
    if (!_leftDataArray) {
        _leftDataArray = NSMutableArray.array;
    }return _leftDataArray;
}

-(NSMutableArray<GoodsClassModel *> *)rightDataArray{
    if (!_rightDataArray) {
        _rightDataArray = NSMutableArray.array;
    }return _rightDataArray;
}

@end
