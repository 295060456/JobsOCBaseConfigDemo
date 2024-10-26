//
//  JobsWalletVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/7/6.
//

#import "JobsWalletVC.h"

@interface JobsWalletVC ()
/// UI

/// Data
@property(nonatomic,strong)TMSCollectionViewLayout *tms_layout;
@property(nonatomic,strong)NSMutableArray <NSMutableArray <UIViewModel *>*>*dataSourceMutArr;/// Cell的数据源
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*sectionHeaderDataSource;/// sectionHeader的数据源
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*sectionFooterDataSource;/// sectionFooter的数据源

@end

@implementation JobsWalletVC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];

    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
//        self.viewModel.textModel.text = JobsInternationalization(@"JobsWallet");
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.backgroundColor = JobsOrangeColor;
    self.collectionView.reloadDatas();
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— 一些私有方法

#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource
-(CGFloat)collectionView:(UICollectionView *)collectionView
resuableHeaderViewHeightForIndexPath:(NSIndexPath *)indexPath {
//    return indexPath.section == 0 ? 30 : 0;
    if (indexPath.section == self.dataSourceMutArr.count - 1) {
        JobsWidth(45);
    }return JobsWidth(30);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView
resuableFooterViewHeightForIndexPath:(NSIndexPath *)indexPath {
//    return 30;
    return 0;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSourceMutArr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    NSArray *sectionArray = self.dataSourceMutArr[section];
    return sectionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == self.dataSourceMutArr.count - 1) {
        JobsBtnStyleCVCell *cell = [collectionView collectionViewCellClass:JobsBtnStyleCVCell.class forIndexPath:indexPath];
        cell.jobsRichElementsInCellWithModel(self.dataSourceMutArr[indexPath.section][indexPath.item]);
        return cell;
    }else{
        BaiShaETProjBankAccMgmtCVCell *cell = [collectionView collectionViewCellClass:BaiShaETProjBankAccMgmtCVCell.class forIndexPath:indexPath];
        cell.jobsRichElementsInCellWithModel(self.dataSourceMutArr[indexPath.section][indexPath.item]);
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataSourceMutArr enumerateObjectsUsingBlock:^(NSArray *sectionArray,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
        [sectionArray enumerateObjectsUsingBlock:^(UIViewModel *model,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
            if (indexPath.item != idx) {
                model.jobsSelected = NO;
            } else {
                model.jobsSelected = !model.jobsSelected;
                if (indexPath.item != sectionArray.count - 1) {
                    [self.tms_layout didClickWithIndexPath:indexPath isExpand:model.jobsSelected];
                } else {
                    [self.tms_layout didClickWithIndexPath:indexPath isExpand:NO];
                }
            }
        }];
    }];
    [collectionView reloadData];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    TMSWalletCollectionReusableView *reusableView = nil;
    reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass(TMSWalletCollectionReusableView.class) forIndexPath:indexPath];
    if (kind == TMSCollectionViewSectionHeader) {
        UIViewModel *viewModel = self.sectionHeaderDataSource[indexPath.section];
        viewModel.textModel.text = [NSString stringWithFormat:@"Section Header:%zd-%zd", indexPath.section, indexPath.item];
        reusableView.jobsRichViewByModel(viewModel);
    }

    if (kind == TMSCollectionViewSectionFooter) {
        UIViewModel *viewModel = self.sectionFooterDataSource[indexPath.section];
        viewModel.textModel.text = [NSString stringWithFormat:@"Section Header:%zd-%zd", indexPath.section, indexPath.item];
        reusableView.jobsRichViewByModel(viewModel);
    }return reusableView;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = UICollectionView.initByLayout(self.tms_layout);
        _collectionView.backgroundColor = JobsClearColor;
        
        {
            _collectionView.registerCollectionViewClass();
            
            _collectionView.registerCollectionElementKindSectionHeaderClass(TMSWalletCollectionReusableView.class,@"");
            _collectionView.registerCollectionElementKindSectionFooterClass(TMSWalletCollectionReusableView.class,@"");
            
            _collectionView.registerCollectionViewCellClass(TMSWalletCollectionViewCell.class,@"");
            _collectionView.registerCollectionViewCellClass(BaiShaETProjBankAccMgmtCVCell.class,@"");
            
        }

        _collectionView.dataLink(self);
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self.view addSubview:_collectionView];
        [self fullScreenConstraintTargetView:_collectionView topViewOffset:0];
    }return _collectionView;
}

-(TMSCollectionViewLayout *)tms_layout{
    if (!_tms_layout) {
        _tms_layout = TMSCollectionViewLayout.new;
        _tms_layout.padding = JobsWidth(15);
        _tms_layout.layout_delegate = self;
    }return _tms_layout;
}

-(NSMutableArray<NSMutableArray<UIViewModel *> *> *)dataSourceMutArr{
    if (!_dataSourceMutArr) {
        _dataSourceMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSMutableArray<UIViewModel *>*>* _Nullable data) {
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable data1) {
                data1.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2.textModel.text = JobsInternationalization(@"上海银行");
                    data2.subTextModel.text = JobsInternationalization(@"**** 7895");
                    data2.image = JobsIMG(@"第一银行");
                }));
                data1.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2.textModel.text = JobsInternationalization(@"国泰世华");
                    data2.subTextModel.text = JobsInternationalization(@"**** 2345");
                    data2.image = JobsIMG(@"国泰世华");
                }));
                data1.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data2.textModel.text = JobsInternationalization(@"台湾银行");
                    data2.subTextModel.text = JobsInternationalization(@"**** 7654");
                    data2.image = JobsIMG(@"台湾银行");
                }));
            }));
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable data1) {
                data1.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data2) {
                    data1.textModel.text = JobsInternationalization(@"＋添加新的銀行卡");
                    data1.textModel.font = UIFontWeightRegularSize(16);
                    data1.textModel.textCor = HEXCOLOR(0x757575);
                }));
            }));
        });
    }return _dataSourceMutArr;
}

-(NSMutableArray<UIViewModel *> *)sectionHeaderDataSource{
    if (!_sectionHeaderDataSource) {
        _sectionHeaderDataSource = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"我是头部");
            }));
        });
    }return _sectionHeaderDataSource;
}

-(NSMutableArray<UIViewModel *> *)sectionFooterDataSource{
    if (!_sectionFooterDataSource) {
        _sectionFooterDataSource = jobsMakeMutArr(^(__kindof NSMutableArray <UIViewModel *>* _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"我是尾部");
            }));
        });
    }return _sectionFooterDataSource;
}

@end
