//
//  JXCategoryViewWithHeaderViewVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/10.
//

#import "JXCategoryViewWithHeaderViewVC.h"

@interface JXCategoryViewWithHeaderViewSubVC (){
    BaiShaETProjVIPSubCVCell_01 *cell01;
    BaiShaETProjVIPSubCVCell_02 *cell02;
    BaiShaETProjVIPSubCVCell_03 *cell03;
    BaiShaETProjVIPSubCVCell_04 *cell04;
    BaiShaETProjVIPSubCVCell_05 *cell05;
}
/// UI
Prop_strong()BaiShaETProjChoiceStadiumView *choiceStadiumView;
// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;
Prop_strong()NSMutableArray <NSMutableArray <__kindof UICollectionViewCell *>*>*cvcellMutArr;

@end

@implementation JXCategoryViewWithHeaderViewSubVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = @"返回".tr;
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = @"".tr;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = @"启动页SLOGAN".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(0);
    
    self.collectionView.byShow(self);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
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
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    self.popupParameter.dragEnable = YES;
    self.popupParameter.disuseBackgroundTouchHide = NO;
    [self.choiceStadiumView tf_showSlide:self.view
                               direction:PopupDirectionBottom
                              popupParam:self.popupParameter];
}
/// 部署策略
-(UICollectionViewCell *)planAtIndexPath:(nonnull NSIndexPath *)indexPath
                                  block1:(JobsRetIDByVoidBlock)block1
                                  block2:(JobsRetIDByVoidBlock)block2
                                  block3:(JobsRetIDByVoidBlock)block3
                                  block4:(JobsRetIDByVoidBlock)block4
                                  block5:(JobsRetIDByVoidBlock)block5{
    if (indexPath.section == 0) {
        if (block1) return block1();
    }else if (indexPath.section == 1){
        if (block2) return block2();
    }else if(indexPath.section == 2){
        if (block3) return block3();
    }else if(indexPath.section == 3) {
        if (block4) return block4();
    }else{
        if (block5) return block5();
    }return nil;
}

-(CGSize)planSizeAtIndexPath:(nonnull NSIndexPath *)indexPath
                      block1:(JobsRetCGSizeByVoidBlock)block1
                      block2:(JobsRetCGSizeByVoidBlock)block2
                      block3:(JobsRetCGSizeByVoidBlock)block3
                      block4:(JobsRetCGSizeByVoidBlock)block4
                      block5:(JobsRetCGSizeByVoidBlock)block5{
    if (indexPath.section == 0) {
        if (block1) return block1();
    }else if(indexPath.section == 1){
        if (block2) return block2();
    }else if(indexPath.section == 2){
        if (block3) return block3();
    }else if(indexPath.section == 3){
        if (block4) return block4();
    }else{
        if (block5) return block5();
    }return CGSizeZero;
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.cvcellMutArr.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    @jobs_weakify(self)
    return [self planAtIndexPath:indexPath
                          block1:^{
        @jobs_strongify(self)
        self->cell01 = (BaiShaETProjVIPSubCVCell_01 *)self.cvcellMutArr[indexPath.section][indexPath.item];
        self->cell01.jobsRichElementsCollectionViewCellBy(nil);
        return self->cell01;
    }block2:^{
        @jobs_strongify(self)
        self->cell02 = (BaiShaETProjVIPSubCVCell_02 *)self.cvcellMutArr[indexPath.section][indexPath.item];
        self->cell02.jobsRichElementsCollectionViewCellBy(nil);
        return self->cell02;
    }block3:^{
        @jobs_strongify(self)
        self->cell03 = (BaiShaETProjVIPSubCVCell_03 *)self.cvcellMutArr[indexPath.section][indexPath.item];
        self->cell03.jobsRichElementsCollectionViewCellBy(nil);
        return self->cell03;
    }block4:^{
        @jobs_strongify(self)
        self->cell04 = (BaiShaETProjVIPSubCVCell_04 *)self.cvcellMutArr[indexPath.section][indexPath.item];
        self->cell04.jobsRichElementsCollectionViewCellBy(nil);
        return self->cell04;
    }block5:^id{
        @jobs_strongify(self)
        self->cell05 = (BaiShaETProjVIPSubCVCell_05 *)self.cvcellMutArr[indexPath.section][indexPath.item];
        self->cell05.jobsRichElementsCollectionViewCellBy(nil);
        return self->cell05;
    }];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.cvcellMutArr[section].count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if (kind.isEqualToString(UICollectionElementKindSectionFooter)) {
        if (indexPath.section == self.cvcellMutArr.count - 1) {
            return [collectionView UICollectionElementKindSectionFooterClass:BaiShaETProjVIPSubCVFooterView.class
                                                                forIndexPath:indexPath].JobsRichViewByModel2(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = @"查看VIP規則".tr;
            }));
        }else return nil;
    }else{
        return [collectionView UICollectionElementKindSectionHeaderClass:BaseCollectionReusableView.class
                                                            forIndexPath:indexPath].JobsRichViewByModel2(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
        }));
    }
}
#pragma mark —— UICollectionViewDelegate
/// 允许选中时，高亮
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
    return YES;
}
/// 高亮完成后回调
-(void)collectionView:(UICollectionView *)collectionView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
}
/// 由高亮转成非高亮完成时的回调
-(void)collectionView:(UICollectionView *)collectionView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
}
/// 设置是否允许选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
    return YES;
}
/// 设置是否允许取消选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
    return YES;
}
/// 选中操作
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
}
/// 取消选中操作
-(void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
/// Footer 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section{
    if (section == self.cvcellMutArr.count - 1) {
        return BaiShaETProjVIPSubCVFooterView.collectionReusableViewSizeByModel(nil);
    }else return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self planSizeAtIndexPath:indexPath
                              block1:^CGSize{
        return BaiShaETProjVIPSubCVCell_01.cellSizeByModel(nil);
    }block2:^CGSize{
        return BaiShaETProjVIPSubCVCell_02.cellSizeByModel(nil);
    }block3:^CGSize{
        return BaiShaETProjVIPSubCVCell_03.cellSizeByModel(nil);
    }block4:^CGSize{
        return BaiShaETProjVIPSubCVCell_04.cellSizeByModel(nil);
    }block5:^CGSize{
        return BaiShaETProjVIPSubCVCell_05.cellSizeByModel(nil);
    }];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 1) {
        return JobsWidth(12);
    }return 0;
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 1) {
        return JobsWidth(15);
    }return 0;
}
///内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return jobsMakeSameEdgeInset(JobsWidth(8));
}
#pragma mark —— lazyLoad
-(BaiShaETProjChoiceStadiumView *)choiceStadiumView{
    if (!_choiceStadiumView) {
        _choiceStadiumView = BaiShaETProjChoiceStadiumView
            .BySize(BaiShaETProjChoiceStadiumView.viewSizeByModel(nil))
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id  _Nullable data) {
                
            });
    }return _choiceStadiumView;
}
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = UICollectionView.initByLayout(self.verticalLayout);
        _collectionView.dataLink(self);
        _collectionView.backgroundColor = RGB_SAMECOLOR(246);
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight() + JobsTabBarHeight(nil), 0);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.registerCollectionViewClass();
        [self.scrollView.addSubview(_collectionView) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }return _collectionView;
}

-(NSMutableArray <NSMutableArray<__kindof UICollectionViewCell *>*>*)cvcellMutArr{
    if (!_cvcellMutArr) {
        _cvcellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_weakify(self)
            data.add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data2) {
                @jobs_strongify(self)
                data2.add([BaiShaETProjVIPSubCVCell_01 cellWithCollectionView:self.collectionView forIndexPath:[self myIndexPath:(JobsIndexPath){0,0}]]);
            }))
            .add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data2) {
                @jobs_strongify(self)
                data2.add([BaiShaETProjVIPSubCVCell_02 cellWithCollectionView:self.collectionView forIndexPath:[self myIndexPath:(JobsIndexPath){1,0}]]);
            }))
            .add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data2) {
                @jobs_strongify(self)
                data2.add([BaiShaETProjVIPSubCVCell_03 cellWithCollectionView:self.collectionView forIndexPath:[self myIndexPath:(JobsIndexPath){2,0}]]);
            }))
            .add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data2) {
                @jobs_strongify(self)
                data2.add([BaiShaETProjVIPSubCVCell_04 cellWithCollectionView:self.collectionView forIndexPath:[self myIndexPath:(JobsIndexPath){3,0}]]);
            }))
            .add(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data2) {
                @jobs_strongify(self)
                data2.add([BaiShaETProjVIPSubCVCell_05 cellWithCollectionView:self.collectionView forIndexPath:[self myIndexPath:(JobsIndexPath){4,0}]]);
            }));
        });
    }return _cvcellMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            
        });
    }return _dataMutArr;
}

@end
