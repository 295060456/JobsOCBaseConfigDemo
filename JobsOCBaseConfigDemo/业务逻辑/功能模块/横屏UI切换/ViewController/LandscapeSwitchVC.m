//
//  LandscapeSwitchVC.m
//  JobsOCBaseConfig
//
//  Created by User on 6/29/24.
//

#import "LandscapeSwitchVC.h"

@interface LandscapeSwitchVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)BaseCollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation LandscapeSwitchVC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    @jobs_weakify(self)
    self.view.backgroundColor = JobsRandomColor;
    self.setGKNav(nil);
    self.setGKNavBackBtn(nil);
    self.gk_navigationBar.jobsVisible = YES;
    self.collectionView.alpha = 1;
    self.jobsBackBlock = ^id _Nullable(id _Nullable data) {
        @jobs_strongify(self)
        NSLog(@"退出页面的逻辑");
         JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskPortrait;/// 设备处于竖屏（Portrait）模式。
         JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationPortrait;/// 设备处于竖屏（Portrait）模式，即设备的顶部朝上
//        self.currentDeviceOrientation = UIDeviceOrientationPortrait;/// 设备竖直放置，设备底部的 Home 键在底部（设备顶部朝上）
        [self hx_rotateToInterfaceOrientation: JobsAppTool.currentInterfaceOrientation];/// 设备处于竖屏（Portrait）模式，即设备的顶部朝上
        return nil;
    };
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
/// UIViewController 的生命周期方法。这个方法会在设备方向即将变化时被调用
- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size
          withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // 在动画过渡中执行的操作，可以根据 size 和当前设备方向来调整界面布局
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // 过渡动画完成后的操作，如果需要的话
    }];
}
#pragma mark —— 屏幕旋转相关 在 UIViewController 中定义，子类需复写
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
/// 决定当前界面是否开启自动转屏，如果返回NO，后面两个方法也不会被调用，只是会支持默认的方向
-(BOOL)shouldAutorotate {
    /**
     typedef NS_OPTIONS(NSUInteger, UIInterfaceOrientationMask) {
         UIInterfaceOrientationMaskPortrait = (1 << UIInterfaceOrientationPortrait),/// 表示设备处于竖屏（Portrait）模式。
         UIInterfaceOrientationMaskLandscapeLeft = (1 << UIInterfaceOrientationLandscapeLeft),/// 表示设备处于左横屏（Landscape Left）模式。
         UIInterfaceOrientationMaskLandscapeRight = (1 << UIInterfaceOrientationLandscapeRight),/// 表示设备处于右横屏（Landscape Right）模式。
         UIInterfaceOrientationMaskPortraitUpsideDown = (1 << UIInterfaceOrientationPortraitUpsideDown),/// 表示设备处于倒竖屏（Portrait Upside Down）模式。
         UIInterfaceOrientationMaskLandscape = (UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight), /// 表示设备可以处于任意横屏（Landscape）模式，包括左横屏和右横屏。
         UIInterfaceOrientationMaskAll = (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortraitUpsideDown),/// 表示设备可以处于所有方向，包括竖屏、左横屏、右横屏和倒竖屏。
         UIInterfaceOrientationMaskAllButUpsideDown = (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight),/// 表示设备可以处于所有方向，但不包括倒竖屏。
     } API_UNAVAILABLE(tvos);
     
     
     typedef NS_ENUM(NSInteger, UIInterfaceOrientation) {
         UIInterfaceOrientationUnknown            = UIDeviceOrientationUnknown, /// 界面方向未知或不确定。这通常用于初始化或错误状态
         UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait, /// 设备处于竖屏（Portrait）模式，即设备的顶部朝上
         UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown,/// 设备处于倒竖屏（Portrait Upside Down）模式，即设备的顶部朝下
         UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight, /// 设备处于左横屏（Landscape Left）模式。❤️注意，这个方向对应于设备顶部向右（而不是向左），这与其名称可能引起的直观理解不同❤️
         UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft /// 设备处于右横屏（Landscape Right）模式。同样地，这个方向对应于设备顶部向左
     } API_UNAVAILABLE(tvos);
     
     typedef NS_ENUM(NSInteger, UIDeviceOrientation) {
         UIDeviceOrientationUnknown, /// 设备方向未知或不确定。这通常用于初始化或错误状态
         UIDeviceOrientationPortrait,            /// 设备竖直放置，设备底部的 Home 键在底部（设备顶部朝上）
         UIDeviceOrientationPortraitUpsideDown,  /// 设备竖直放置，设备底部的 Home 键在顶部（设备顶部朝下）
         UIDeviceOrientationLandscapeLeft,       /// 设备水平放置，设备底部的 Home 键在右侧（设备顶部朝左）
         UIDeviceOrientationLandscapeRight,      /// 设备水平放置，设备底部的 Home 键在左侧（设备顶部朝右）
         UIDeviceOrientationFaceUp,              /// 设备平放，屏幕朝上
         UIDeviceOrientationFaceDown             /// 设备平放，屏幕朝下
     } API_UNAVAILABLE(tvos);
     
     */
    return YES;
}
#pragma clang diagnostic pop
/// 设置当前界面支持的所有方向
/// iPad设备上，默认返回值UIInterfaceOrientationMaskAllButUpSideDwon
/// iPhone设备上，默认返回值是UIInterfaceOrientationMaskAll
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return self.currentInterfaceOrientationMask;
    return UIInterfaceOrientationMaskAll;
}
/// 设置进入界面默认支持的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [super preferredInterfaceOrientationForPresentation];
}
#pragma mark —— 一些私有方法
-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    
}
#pragma mark —— UICollectionViewCell 部署策略
//见 @interface NSObject (JobsDeployCellConfig)
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JobsBaseCollectionViewCell *cell = [JobsBaseCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.item]);
    cell.contentView.backgroundColor = JobsRandomColor;
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section {
    return self.dataMutArr.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
viewForSupplementaryElementOfKind:(NSString *)kind
atIndexPath:(NSIndexPath *)indexPath {
    if (kind.isEqualToString(UICollectionElementKindSectionHeader)) {
        ReturnBaseCollectionReusableHeaderView
    }else if (kind.isEqualToString(UICollectionElementKindSectionFooter)) {
        ReturnBaseCollectionReusableFooterView
    }else ReturnBaseCollectionReusableHeaderView
}
#pragma mark —— UICollectionViewDelegate
/// 允许选中时，高亮
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 高亮完成后回调
-(void)collectionView:(UICollectionView *)collectionView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
/// 由高亮转成非高亮完成时的回调
-(void)collectionView:(UICollectionView *)collectionView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
/// 设置是否允许选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 设置是否允许取消选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 选中操作
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    self.dataMutArr[indexPath.item].jobsBlock(nil);
    /**
     滚动到指定位置
     _collectionView.contentOffset = CGPointMake(0,-100);
     [_collectionView setContentOffset:CGPointMake(0, -200) animated:YES];// 只有在viewDidAppear周期 或者 手动触发才有效
     */
}
/// 取消选中操作
-(void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
/// header 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    return [JobsHeaderFooterView collectionReusableViewSizeWithModel:nil];
}
/// Footer 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section{
    return [JobsHeaderFooterView collectionReusableViewSizeWithModel:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(JobsMainScreen_WIDTH() / 2 - 20, JobsMainScreen_WIDTH() / 2 - 20);
//    return CGSizeMake(JobsMainScreen_WIDTH() / 3 - 20 * 2, JobsMainScreen_WIDTH() / 3 - 20 * 2);
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 12;
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }return _layout;
}

-(BaseCollectionView *)collectionView{
    if (!_collectionView) {
        @jobs_weakify(self)
        _collectionView = BaseCollectionView.initByLayout(self.layout);
        _collectionView.backgroundColor = JobsGreenColor;//RGB_SAMECOLOR(246);
        _collectionView.layoutSubviewsRectCorner = UIRectCornerTopLeft | UIRectCornerTopRight;
        _collectionView.layoutSubviewsRectCornerSize = CGSizeMake(JobsWidth(20), JobsWidth(20));
        _collectionView.dataLink(self);
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        _collectionView.bounces = NO;///设置为NO，使得collectionView只能上拉，不能下拉
        
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        //_collectionView.contentOffset = CGPointMake(0, -JobsWidth(250));//
        [_collectionView setContentOffset:CGPointMake(0, -400) animated:YES];// 这句最快在 viewWillLayoutSubviews 有效
        
        _collectionView.registerCollectionViewClass();
        
        _collectionView.registerCollectionViewCellClass(TMSWalletCollectionViewCell.class,@"");
        _collectionView.registerCollectionElementKindSectionHeaderClass(TMSWalletCollectionReusableView.class,@"");
        _collectionView.registerCollectionElementKindSectionFooterClass(TMSWalletCollectionReusableView.class,@"");
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = JobsInternationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.loadBlock = ^id _Nullable(id  _Nullable data) {
                @jobs_strongify(self)
                NSObject.feedbackGenerator();//震动反馈
                [self withdrawBanklist:^(NSArray *data) {
                    @jobs_strongify(self)
                    if (data.count) {
                        self.endRefreshing(self->_collectionView);
                    }else{
                        self.endRefreshingWithNoMoreData(self->_collectionView);
                    }
                    /// 在reloadData后做的操作，因为reloadData刷新UI是在主线程上，那么就在主线程上等待
                    @jobs_weakify(self)
                    [self getMainQueue:^{
                        @jobs_strongify(self)
            //            [CollectionViewAnimationKit showWithAnimationType:XSCollectionViewAnimationTypeFall
            //                                               collectionView:self.collectionView];
                    }];
                }];return nil;
            };
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = JobsInternationalization(@"");
            refreshConfigFooter.pullingTitle = JobsInternationalization(@"");
            refreshConfigFooter.refreshingTitle = JobsInternationalization(@"");
            refreshConfigFooter.willRefreshTitle = JobsInternationalization(@"");
            refreshConfigFooter.noMoreDataTitle = JobsInternationalization(@"");
            refreshConfigFooter.loadBlock = ^id _Nullable(id  _Nullable data) {
                @jobs_strongify(self)
                self.endRefreshing(self->_collectionView);
                return nil;
            };
            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;
            
            _collectionView.mj_header = self.mjRefreshNormalHeader;
            _collectionView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
            
            _collectionView.mj_footer = self.mjRefreshAutoNormalFooter;
        }
        
        {
            _collectionView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:JobsInternationalization(@"暂无数据")
                                                                     titleStr:JobsInternationalization(@"暂无数据")
                                                                    detailStr:JobsInternationalization(@"")];
            
            _collectionView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _collectionView.ly_emptyView.contentViewOffset = JobsWidth(-180);
            _collectionView.ly_emptyView.titleLabFont = UIFontWeightMediumSize(16);
        }
        
//        {
//
//            NSArray *classArray = @[
//                                    DDCollectionViewCell_Style2.class,
//                                    DDCollectionViewCell_Style3.class,
//                                    DDCollectionViewCell_Style4.class,
//                                    ];
//            NSArray *sizeArray = @[
//                                   [NSValue valueWithCGSize:[DDCollectionViewCell_Style2 cellSizeWithModel:nil]],
//                                   [NSValue valueWithCGSize:[DDCollectionViewCell_Style3 cellSizeWithModel:nil]],
//                                   [NSValue valueWithCGSize:[DDCollectionViewCell_Style4 cellSizeWithModel:nil]]
//                                   ];
//
//            _collectionView.tabAnimated = [TABCollectionAnimated animatedWithCellClassArray:classArray
//                                                                              cellSizeArray:sizeArray
//                                                                         animatedCountArray:@[@(1),@(1),@(1)]];
//
//            [_collectionView.tabAnimated addHeaderViewClass:BaseCollectionReusableView_Style1.class
//                                                   viewSize:[BaseCollectionReusableView_Style1 collectionReusableViewSizeWithModel:nil]
//                                                  toSection:0];
//            [_collectionView.tabAnimated addHeaderViewClass:BaseCollectionReusableView_Style1.class
//                                                   viewSize:[BaseCollectionReusableView_Style2 collectionReusableViewSizeWithModel:nil]
//                                                  toSection:2];
//
//            _collectionView.tabAnimated.containNestAnimation = YES;
//            _collectionView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//            _collectionView.tabAnimated.canLoadAgain = YES;
//            [_collectionView tab_startAnimation];   // 开启动画
//        }
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }return _collectionView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        @jobs_weakify(self)
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"检测当前屏幕方向");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
                NSLog(@"检测当前屏幕方向");
                [self checkScreenOrientation_UIInterfaceOrientation:^CGSize(NSInteger data) {
                    return CGSizeZero;
                }];
                [self checkScreenOrientation_UIInterfaceOrientationMask:^CGSize(NSUInteger data) {
                    return CGSizeZero;
                }];return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"锁定横屏:\n设备可以处于任意横屏（Landscape）模式，包括左横屏和右横屏");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
                NSLog(@"锁定横屏:设备可以处于任意横屏模式，包括左横屏和右横屏");
//                self.currentInterfaceOrientationMask = UIInterfaceOrientationMaskLandscape;/// 设备可以处于任意横屏（Landscape）模式，包括左横屏和右横屏
                 JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;/// 设备可以处于任意横屏（Landscape）模式，包括左横屏和右横屏
//                self.currentDeviceOrientation = UIDeviceOrientationUnknown;/// 设备方向未知或不确定
                [self hx_setNeedsUpdateOfSupportedInterfaceOrientations];
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"解除锁定:\n设备可以处于所有方向，包括竖屏、左横屏、右横屏和倒竖屏");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
                NSLog(@"解除锁定:设备可以处于所有方向，包括竖屏、左横屏、右横屏和倒竖屏");
                JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskAll;/// 设备可以处于所有方向，包括竖屏、左横屏、右横屏和倒竖屏
                JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationPortrait |
                                                   UIInterfaceOrientationPortraitUpsideDown |
                                                   UIInterfaceOrientationLandscapeLeft |
                                                   UIInterfaceOrientationLandscapeRight;/// 设备可以处于所有方向，包括竖屏、左横屏、右横屏和倒竖屏
//                self.currentDeviceOrientation = UIDeviceOrientationUnknown;/// 设备方向未知或不确定
                [self hx_setNeedsUpdateOfSupportedInterfaceOrientations];
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"设备左横屏");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
                NSLog(@"设备处于左横屏模式");
                JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskLandscapeLeft;/// 设备处于左横屏（Landscape Left）模式
                JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationLandscapeLeft;/// 设备处于左横屏（Landscape Left）模式
//                self.currentDeviceOrientation = UIDeviceOrientationUnknown;/// 设备方向未知或不确定
                [self hx_rotateToInterfaceOrientation:JobsAppTool.currentInterfaceOrientation];/// 设备处于竖屏（Portrait）模式，即设备的顶部朝上
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"设备右横屏");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
                NSLog(@"设备处于右横屏模式");
                JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskLandscapeRight;/// 设备处于右横屏（Landscape Right）模式
                JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationLandscapeRight;/// 设备处于右横屏（Landscape Right）模式
//                self.currentDeviceOrientation = UIDeviceOrientationUnknown;/// 设备方向未知或不确定
                [self hx_rotateToInterfaceOrientation:JobsAppTool.currentInterfaceOrientation];/// 设备处于竖屏（Portrait）模式，即设备的顶部朝上
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"设备竖直向上\n Home 按钮在下方");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param) {
                @jobs_strongify(self)
                NSLog(@"设备处于竖屏模式");
                JobsAppTool.currentInterfaceOrientationMask = UIInterfaceOrientationMaskPortrait;/// 设备处于竖屏（Portrait）模式。
                JobsAppTool.currentInterfaceOrientation = UIInterfaceOrientationPortrait;/// 设备处于竖屏（Portrait）模式，即设备的顶部朝上
//                self.currentDeviceOrientation = UIDeviceOrientationPortrait;/// 设备竖直放置，设备底部的 Home 键在底部（设备顶部朝上）
                [self hx_rotateToInterfaceOrientation:JobsAppTool.currentInterfaceOrientation];/// 设备处于竖屏（Portrait）模式，即设备的顶部朝上
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }

//        {
//            UITextModel *textModel = UITextModel.new;
//            textModel.text = JobsInternationalization(@"设备竖直向下\n Home 按钮在上方");
//            textModel.textCor = JobsRedColor;
//            textModel.textAlignment = NSTextAlignmentCenter;
//
//            UIViewModel *viewModel = UIViewModel.new;
//            viewModel.textModel = textModel;
//            viewModel.jobsBlock = ^id(id param){
//                @jobs_strongify(self)
//                NSLog(@"设备处于倒竖屏模式。可能设备不支持");
//                self.currentInterfaceOrientationMask = UIInterfaceOrientationMaskPortraitUpsideDown;/// 设备处于竖屏（Portrait）模式。
//                self.currentInterfaceOrientation = UIInterfaceOrientationPortraitUpsideDown;/// 设备处于竖屏（Portrait）模式，即设备的顶部朝上
////                self.currentDeviceOrientation = UIDeviceOrientationUnknown;/// 设备方向未知或不确定
//                [self hx_rotateToInterfaceOrientation:self.currentInterfaceOrientation];/// 设备处于竖屏（Portrait）模式，即设备的顶部朝上
//                return nil;
//            };
//            [_dataMutArr addObject:viewModel];
//        }
        
    }return _dataMutArr;
}

@end

