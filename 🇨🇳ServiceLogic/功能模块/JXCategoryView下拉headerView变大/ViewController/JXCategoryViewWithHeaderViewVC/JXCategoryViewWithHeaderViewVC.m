//
//  BaiShaETProjVIPVC.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/7.
//

#import "JXCategoryViewWithHeaderViewVC.h"

@interface JXCategoryViewWithHeaderViewVC ()
/// UI
@property(nonatomic,strong)UIButton *ruleBtn;
@property(nonatomic,strong)JXCategoryTitleView *categoryView;/// 文字
@property(nonatomic,strong)JXCategoryIndicatorLineView *lineView;/// 跟随的指示器
@property(nonatomic,strong)JXPagerView *pagerView;
@property(nonatomic,strong)BaiShaETProjCollectionHeaderView *collectionHeaderView;
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewController *>*childVCMutArr;

@end

@implementation JXCategoryViewWithHeaderViewVC

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
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
//        self.viewModel.textModel.text = JobsInternationalization(@"VIP俱乐部");
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
    self.gk_navItemRightSpace = JobsWidth(16);
    self.gk_navRightBarButtonItems = @[[UIBarButtonItem.alloc initWithCustomView:self.ruleBtn]];
    self.topLineLab.alpha = 0;
    self.categoryView.alpha = 1;
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
#pragma mark - JXPagingViewDelegate
- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.collectionHeaderView;
}
/**
    页面朝上走 crollView.contentOffset.y 为正值
    页面朝下走 crollView.contentOffset.y 为负值
    初始态是0
 */
- (void)pagerView:(JXPagerView *)pagerView
mainTableViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"contentOffsetY = %f",scrollView.contentOffset.y);
    
    self.gk_navigationBar.alpha = scrollView.contentOffset.y / 200;
    self.gk_navigationBar.hidden = NO;
    self.gk_navigationBar.alpha = scrollView.contentOffset.y / 200;
    
    self.topLineLab.alpha = scrollView.contentOffset.y / 200;
    
    [self.collectionHeaderView scrollViewDidScrollWithContentOffsetY:scrollView.contentOffset.y];
}
/// 
- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return JobsStatusBarHeight()
//    + self.gk_navigationBar.height
    + JobsNavigationBarAndStatusBarHeight(nil)
    + [BaiShaETProjCollectionHeaderView viewSizeWithModel:nil].height;
}
/// JXCategoryTitleView *categoryView 的高度
- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return listContainerViewDefaultOffset;
}

- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.categoryView;
}

- (NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    return self.titleMutArr.count;
}

- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView
                             initListAtIndex:(NSInteger)index {
    return self.childVCMutArr[index];
}
#pragma mark —— lazyLoad
-(JXPagerView *)pagerView{
    if (!_pagerView) {
        _pagerView = [JXPagerView.alloc initWithDelegate:self];
        [self.view addSubview:_pagerView];
        _pagerView.frame = CGRectMake(0,
                                      JobsNavigationBarAndStatusBarHeight(nil) + self.getTopLineLabSize.height,
                                      JobsMainScreen_WIDTH(),
                                      JobsMainScreen_HEIGHT());
        _pagerView.pinSectionHeaderVerticalOffset = JobsWidth(0);/// 额外的偏移量
    }return _pagerView;
}

-(BaiShaETProjCollectionHeaderView *)collectionHeaderView{
    if (!_collectionHeaderView) {
        _collectionHeaderView = BaiShaETProjCollectionHeaderView.new;
        _collectionHeaderView.frame = CGRectMake(0,
                                                 JobsNavigationBarAndStatusBarHeight(nil),
                                                 [BaiShaETProjCollectionHeaderView viewSizeWithModel:nil].width,
                                                 [BaiShaETProjCollectionHeaderView viewSizeWithModel:nil].height);
        _collectionHeaderView.isZoom = YES;
        [_collectionHeaderView richElementsInViewWithModel:nil];
    }return _collectionHeaderView;
}

-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTitleView.new;
        _categoryView.backgroundColor = UIColor.clearColor;
        _categoryView.titleSelectedColor = HEXCOLOR(0xAE8330);
        _categoryView.titleColor = HEXCOLOR(0x757575);
        _categoryView.titleFont = notoSansBold(12);
        _categoryView.titleSelectedFont = notoSansBold(12);
        _categoryView.delegate = self;
        _categoryView.titles = self.titleMutArr;
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.indicators = @[self.lineView];//
        _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _categoryView.cellSpacing = JobsWidth(-20);
        _categoryView.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
        [self.view addSubview:_categoryView];
        [self.view layoutIfNeeded];
    }return _categoryView;
}

-(JXCategoryIndicatorLineView *)lineView{
    if (!_lineView) {
        _lineView = JXCategoryIndicatorLineView.new;
        _lineView.indicatorColor = HEXCOLOR(0xAE8330);
        _lineView.indicatorHeight = JobsWidth(4);
        _lineView.indicatorWidthIncrement = JobsWidth(10);
        _lineView.verticalMargin = 0;
    }return _lineView;
}

-(UIButton *)ruleBtn{
    if (!_ruleBtn) {
        _ruleBtn = UIButton.new;
        _ruleBtn.normalTitleColor = HEXCOLOR(0x3D4A58);
        _ruleBtn.normalTitle = JobsInternationalization(@"VIP規則");
        _ruleBtn.titleFont = notoSansRegular(12);
        [_ruleBtn jobsBtnClickEventBlock:^id(id data) {
            toast(JobsInternationalization(@"VIP規則"));
            return nil;
        }];
    }return _ruleBtn;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = NSMutableArray.array;
        for (int i = 0; i <= 5; i++) {
            [_titleMutArr addObject:JobsInternationalization([@"Lv" stringByAppendingString:[NSString stringWithFormat:@"%d",i]])];
        }
    }return _titleMutArr;
}

-(NSMutableArray<UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        _childVCMutArr = NSMutableArray.array;
        for (NSString *str in self.titleMutArr) {
            JXCategoryViewWithHeaderViewSubVC *vipSubVC = JXCategoryViewWithHeaderViewSubVC.new;
            vipSubVC.jobsTag = [self.titleMutArr indexOfObject:str];
            [_childVCMutArr addObject:vipSubVC];
        }
    }return _childVCMutArr;
}

@end



