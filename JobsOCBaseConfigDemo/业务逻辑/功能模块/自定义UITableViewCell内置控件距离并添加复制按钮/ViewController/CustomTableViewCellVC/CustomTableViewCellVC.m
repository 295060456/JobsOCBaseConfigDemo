//
//  CustomTableViewCellVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/27.
//

#import "CustomTableViewCellVC.h"

@interface CustomTableViewCellVC ()
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation CustomTableViewCellVC

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
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
//        self.viewModel.textModel.text = JobsInternationalization(@"充值");
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
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
    self.collectionView.reloadDatas();
}
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataMutArr.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    @jobs_weakify(self)
    return [self jobsCollectionViewCellPlanAtIndexPath:indexPath
                                        collectionView:collectionView
                              collectionViewCellBlock0:^UICollectionViewCell * _Nullable{
        @jobs_strongify(self)
        BaiShaETProjOrderDetailsCVCell *cell = [BaiShaETProjOrderDetailsCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
        cell.jobsRichElementsCollectionViewCellBy(self.dataMutArr[indexPath.section]);
        return cell;
    }
                              collectionViewCellBlock1:nil
                              collectionViewCellBlock2:nil
                              collectionViewCellBlock3:nil
                              collectionViewCellBlock4:nil];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 1;
}
#pragma mark —— UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self jobsCellPlanSizeForSectionAtIndexPath:indexPath.section
                                            cellBlock0:^CGSize{
        return BaiShaETProjOrderDetailsCVCell.cellSizeByModel(self.dataMutArr[indexPath.section]);
    }
                                            cellBlock1:nil
                                            cellBlock2:nil
                                            cellBlock3:nil
                                            cellBlock4:nil];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(12);
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return jobsMakeSameEdgeInset(JobsWidth(16));
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = UICollectionView.initByLayout(self.verticalLayout);
        _collectionView.dataLink(self);
        _collectionView.backgroundColor = HEXCOLOR(0xFCFBFB);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.registerCollectionViewClass();
        [self.view.addSubview(_collectionView) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.bottom.equalTo(self.view).offset(JobsBottomSafeAreaHeight() + JobsWidth(64));
        }];
    }return _collectionView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.jobsDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data2) {
                    data2.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data3) {
                        data3.textModel.text = JobsInternationalization(@"存款金额");
                        data3.subTextModel.text = JobsInternationalization(@"10,000.00");
                    }))
                    .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data3) {
                        data3.textModel.text = JobsInternationalization(@"存款方式");
                        data3.subTextModel.text = JobsInternationalization(@"虛擬幣充值");
                    }))
                    .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data3) {
                        data3.textModel.text = JobsInternationalization(@"訂單編號");
                        data3.subTextModel.text = JobsInternationalization(@"YSF2025022302644565964");
                    }))
                    .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data3) {
                        data3.textModel.text = JobsInternationalization(@"轉賬姓名");
                        data3.subTextModel.text = JobsInternationalization(@"張三 ");
                    }))
                    .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data3) {
                        data3.textModel.text = JobsInternationalization(@"銀行賬號");
                        data3.subTextModel.text = JobsInternationalization(@"6230 5822 0031 5762 430");
                    }))
                    .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data3) {
                        data3.textModel.text = JobsInternationalization(@"轉賬地址");
                        data3.subTextModel.text = JobsInternationalization(@"中國平安銀行");
                    }));
                });
            }));
        });
    }return _dataMutArr;
}

@end
