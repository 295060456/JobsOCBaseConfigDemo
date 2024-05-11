//
//  CustomTableViewCellVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/27.
//

#import "CustomTableViewCellVC.h"

@interface CustomTableViewCellVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation CustomTableViewCellVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
//        self.viewModel.textModel.text = Internationalization(@"充值");
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
    self.gk_navigationBar.jobsVisible = YES;
    self.collectionView.alpha = 1;
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
        [cell richElementsInCellWithModel:self.dataMutArr[indexPath.section]];
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
    return [self jobsCellPlanSizeForSectionAtIndexPath:indexPath
                                            cellBlock0:^CGSize{
        return [BaiShaETProjOrderDetailsCVCell cellSizeWithModel:self.dataMutArr[indexPath.section]];
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
/// 定义的是元素水平之间的间距。Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return jobsSameEdgeInset(16);
}
#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }return _layout;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero
                                           collectionViewLayout:self.layout];
        _collectionView.backgroundColor = HEXCOLOR(0xFCFBFB);
        [self dataLinkByCollectionView:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerCollectionViewClass];
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.bottom.equalTo(self.view).offset(JobsBottomSafeAreaHeight() + JobsWidth(64));
        }];
    }return _collectionView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            NSMutableArray <UIViewModel *>*mutArr = NSMutableArray.array;
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"存款金额");
                viewModel.subTextModel.text = Internationalization(@"10,000.00");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"存款方式");
                viewModel.subTextModel.text = Internationalization(@"虛擬幣充值");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"訂單編號");
                viewModel.subTextModel.text = Internationalization(@"YSF2025022302644565964");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"轉賬姓名");
                viewModel.subTextModel.text = Internationalization(@"張三 ");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"銀行賬號");
                viewModel.subTextModel.text = Internationalization(@"6230 5822 0031 5762 430");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = Internationalization(@"轉賬地址");
                viewModel.subTextModel.text = Internationalization(@"中國平安銀行");
                [mutArr addObject:viewModel];
            }
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.jobsDataMutArr = mutArr;
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}

@end
