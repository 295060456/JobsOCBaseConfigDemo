//
//  BaiShaETProjVIPVC.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/7.
//

#import "JXCategoryViewWithHeaderViewVC.h"

@interface JXCategoryViewWithHeaderViewVC ()
/// UI
Prop_strong()BaseButton *ruleBtn;
Prop_strong()JXCategoryTitleView *categoryView;/// 文字
Prop_strong()JXPagerView *pagerView;
Prop_strong()BaiShaETProjCollectionHeaderView *collectionHeaderView;
/// Data
Prop_copy()NSMutableArray <NSString *>*titleMutArr;
Prop_copy()NSMutableArray <__kindof UIViewController *>*childVCMutArr;

@end

@implementation JXCategoryViewWithHeaderViewVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
//        self.viewModel.textModel.text = JobsInternationalization(@"VIP俱乐部");
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
    
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.aboutBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(self.ruleBtn));
    });
    
    self.gk_navItemRightSpace = JobsWidth(16);
    self.makeNavByAlpha(1);
    
    self.topLineLab.alpha = 0;
    self.categoryView.alpha = 1;
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
    JobsLog(@"contentOffsetY = %f",scrollView.contentOffset.y);
    
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
    + BaiShaETProjCollectionHeaderView.viewSizeByModel(nil).height;
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
        _pagerView = jobsMakeCategoryPagerView(self);
        self.view.addSubview(_pagerView);
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
                                                 BaiShaETProjCollectionHeaderView.viewSizeByModel(nil).width,
                                                 BaiShaETProjCollectionHeaderView.viewSizeByModel(nil).height);
        _collectionHeaderView.isZoom = YES;
        _collectionHeaderView.jobsRichViewByModel(nil);
    }return _collectionHeaderView;
}

-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        @jobs_weakify(self)
        _categoryView = jobsMakeCategoryTitleView(^(JXCategoryTitleView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = JobsClearColor;
            view.titleSelectedColor = JobsWhiteColor;
            view.titleColor = JobsWhiteColor;
            view.titleFont = UIFontWeightRegularSize(JobsWidth(18));
            view.titleSelectedFont = UIFontWeightRegularSize(JobsWidth(28));
            view.delegate = self;
            view.titles = self.titleMutArr;
            view.titleColorGradientEnabled = YES;
            /// 跟随的指示器
            view.indicators = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                arr.add(jobsMakeCategoryIndicatorLineView(^(JXCategoryIndicatorLineView * _Nullable view) {
                    view.indicatorColor = HEXCOLOR(0xFFEABA);
                    view.indicatorHeight = JobsWidth(4);
                    view.indicatorWidthIncrement = JobsWidth(10);
                    view.verticalMargin = 0;
                }));
            });
            view.defaultSelectedIndex = 1;// 默认从第二个开始显示
            view.cellSpacing = JobsWidth(-20);
            view.listContainer = (id<JXCategoryViewListContainer>)self.pagerView.listContainerView;
            self.view.addSubview(view);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(0);
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(listContainerViewDefaultOffset);
            }];[self.view layoutIfNeeded];
        });

    }return _categoryView;
}

-(BaseButton *)ruleBtn{
    if (!_ruleBtn) {
        @jobs_weakify(self)
        _ruleBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"VIP規則"))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                toast(JobsInternationalization(@"VIP規則"));
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
    }return _ruleBtn;
}

-(NSMutableArray<NSString *>*)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            for (int i = 0; i <= 5; i++) {
                data.add(JobsInternationalization(@"Lv".add(toStringByInt(i))));
            }
        });
    }return _titleMutArr;
}

-(NSMutableArray<__kindof UIViewController *>*)childVCMutArr{
    if (!_childVCMutArr) {
        @jobs_weakify(self)
        _childVCMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIViewController *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSString *str in self.titleMutArr) {
                JXCategoryViewWithHeaderViewSubVC *vipSubVC = JXCategoryViewWithHeaderViewSubVC.new;
                vipSubVC.jobsTag = [self.titleMutArr indexOfObject:str];
                data.add(vipSubVC);
            }
        });
    }return _childVCMutArr;
}

@end
