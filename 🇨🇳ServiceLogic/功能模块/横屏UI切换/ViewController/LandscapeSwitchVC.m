//
//  LandscapeSwitchVC.m
//  JobsOCBaseConfig
//
//  Created by User on 6/29/24.
//

#import "LandscapeSwitchVC.h"

@interface LandscapeSwitchVC ()
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)BaseCollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation LandscapeSwitchVC

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    NSLog(@"%@",JobsLocalFunc);
    [NSNotificationCenter.defaultCenter removeObserver:self
                                                  name:UIDeviceOrientationDidChangeNotification
                                                object:nil];
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
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(deviceOrientationDidChange:)
                                               name:UIDeviceOrientationDidChangeNotification
                                             object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
    self.collectionView.alpha = 1;
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{

}
#pragma mark —— 屏幕旋转相关
/// UIDeviceOrientationDidChangeNotification 通知方法
- (void)deviceOrientationDidChange:(NSNotification *)notification {
    UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
    switch (orientation) {
        // 处理竖屏方向的逻辑
        case UIDeviceOrientationPortrait:/// 设备竖直向上，Home 按钮在下方
            NSLog(@"系统通知：↓");
            break;
        case UIDeviceOrientationPortraitUpsideDown:/// 设备竖直向下，Home 按钮在上方
            NSLog(@"系统通知：↑");
            break;
        // 处理横屏方向的逻辑
        case UIDeviceOrientationLandscapeLeft:/// 设备水平，Home 按钮在右侧
            NSLog(@"系统通知：→");
            break;
        case UIDeviceOrientationLandscapeRight:/// 设备水平，Home 按钮在左侧
            NSLog(@"系统通知：←");
            break;
        default:
            break;
    }
}
/// 决定视图控制器是否支持自动旋转
-(BOOL)shouldAutorotate {
    return YES;
}
/// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.currentInterfaceOrientationMask;
}
/// 检测屏幕方向
-(void)checkScreenOrientation{
    /**
     界面方向（UIInterfaceOrientation）与设备方向（UIDeviceOrientation）对应关系：
     界面方向（UIInterfaceOrientation）用于描述应用界面的期望方向，通常在应用中设置和管理。（开发中常用）
     设备方向（UIDeviceOrientation）描述了设备在物理空间中的方向，可以通过设备的传感器获取。
 
     UIInterfaceOrientationUnknown            = UIDeviceOrientationUnknown, // 通常用于表示界面方向未知或无法确定的情况
     UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait,
     UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown,
     UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight,
     UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft
 
     【界面】竖屏方向
     UIInterfaceOrientationPortraitUpsideDown：设备竖直向下，Home 按钮在上方。
     UIInterfaceOrientationPortrait：设备竖直向上，Home 按钮在下方。
     【界面】横屏方向
     UIInterfaceOrientationLandscapeLeft：设备水平，Home 按钮在左侧
     UIInterfaceOrientationLandscapeRight：设备水平，Home 按钮在右侧

     【设备】竖屏方向
     UIDeviceOrientationPortrait：设备竖直向上，Home 按钮在下方。
     UIDeviceOrientationPortraitUpsideDown：设备竖直向下，Home 按钮在上方。
     【设备】竖屏方向
     UIDeviceOrientationLandscapeRight：设备水平，Home 按钮在左侧
     UIDeviceOrientationLandscapeLeft：设备水平，Home 按钮在右侧
     */
    UIInterfaceOrientation currentOrientation = UIInterfaceOrientationUnknown;
    if (@available(iOS 13.0, *)) {
        // 获取当前窗口的场景
        UIWindowScene *windowScene = self.view.window.windowScene;
        // 获取当前窗口场景的界面方向
        currentOrientation = windowScene.interfaceOrientation;
    } else {
        SuppressWdeprecatedDeclarationsWarning(currentOrientation = UIApplication.sharedApplication.statusBarOrientation;);
    }
    
    switch (currentOrientation) {
        ///【界面】竖屏方向
        case UIInterfaceOrientationPortraitUpsideDown:{
            NSLog(@"检测屏幕方向：设备竖直向下，Home 按钮在上方");
        }break;
        case UIInterfaceOrientationPortrait:{
            NSLog(@"检测屏幕方向：设备竖直向上，Home 按钮在下方");
        }break;
        ///【界面】横屏方向
        case UIInterfaceOrientationLandscapeLeft:{
            NSLog(@"检测屏幕方向：设备水平，Home 按钮在左侧");
        }break;
        case UIInterfaceOrientationLandscapeRight:{
            NSLog(@"检测屏幕方向：设备水平，Home 按钮在右侧");
        }default:
            break;
    }
}
#pragma mark —— 一些私有方法
/// 下拉刷新 （子类要进行覆写）
-(void)pullToRefresh{
    [self feedbackGenerator];//震动反馈
    @jobs_weakify(self)
    [self withdrawBanklist:^(NSArray *data) {
        @jobs_strongify(self)
        if (data.count) {
            [self endRefreshing:self.collectionView];
        }else{
            [self endRefreshingWithNoMoreData:self.collectionView];
        }
        /// 在reloadData后做的操作，因为reloadData刷新UI是在主线程上，那么就在主线程上等待
        @jobs_weakify(self)
        [self getMainQueue:^{
//            @jobs_strongify(self)
//            [CollectionViewAnimationKit showWithAnimationType:XSCollectionViewAnimationTypeFall
//                                               collectionView:self.collectionView];
        }];
    }];
}
/// 上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
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
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.item]];
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
        JobsHeaderFooterView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:JobsHeaderFooterView.class
                                                                                        forIndexPath:indexPath];
        
        NSMutableArray *mutArr = NSMutableArray.array;
        NSMutableArray *sectionMutArr = NSMutableArray.array;
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.textModel.text = JobsInternationalization(@"请快速选择金额(元)");
        [sectionMutArr addObject:viewModel];
        [mutArr addObject:sectionMutArr];
        [headerView richElementsInViewWithModel:mutArr[indexPath.section]];
        return headerView;
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
layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section{
    return [JobsHeaderFooterView collectionReusableViewSizeWithModel:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(JobsMainScreen_WIDTH() / 2, JobsMainScreen_WIDTH() / 2);
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
    return 0;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
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
        _collectionView = [BaseCollectionView.alloc initWithFrame:CGRectZero
                                             collectionViewLayout:self.layout];
        _collectionView.backgroundColor = RGB_SAMECOLOR(246);
        _collectionView.layoutSubviewsRectCorner = UIRectCornerTopLeft | UIRectCornerTopRight;
        _collectionView.layoutSubviewsRectCornerSize = CGSizeMake(JobsWidth(20), JobsWidth(20));
        [self dataLinkByCollectionView:_collectionView];
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        _collectionView.bounces = NO;///设置为NO，使得collectionView只能上拉，不能下拉
        
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        //_collectionView.contentOffset = CGPointMake(0, -JobsWidth(250));//
        [_collectionView setContentOffset:CGPointMake(0, -400) animated:YES];// 这句最快在 viewWillLayoutSubviews 有效
        
        [_collectionView registerCollectionViewClass];
        
        [_collectionView registerCollectionViewCellClass:TMSWalletCollectionViewCell.class];
        [_collectionView registerCollectionElementKindSectionHeaderClass:TMSWalletCollectionReusableView.class];
        [_collectionView registerCollectionElementKindSectionFooterClass:TMSWalletCollectionReusableView.class];
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = JobsInternationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = JobsInternationalization(@"");
            refreshConfigFooter.pullingTitle = JobsInternationalization(@"");;
            refreshConfigFooter.refreshingTitle = JobsInternationalization(@"");;
            refreshConfigFooter.willRefreshTitle = JobsInternationalization(@"");;
            refreshConfigFooter.noMoreDataTitle = JobsInternationalization(@"");;
            
            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;
            
            _collectionView.mj_header = self.mjRefreshNormalHeader;
            _collectionView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
            
            _collectionView.mj_footer = self.mjRefreshAutoNormalFooter;
        }
        
        {
            _collectionView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"暂无数据"
                                                                     titleStr:JobsInternationalization(@"暂无数据")
                                                                    detailStr:JobsInternationalization(@"")];
            
            _collectionView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _collectionView.ly_emptyView.contentViewOffset = JobsWidth(-180);
            _collectionView.ly_emptyView.titleLabFont = UIFontWeightMediumSize(16);
        }
        
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
            textModel.text = JobsInternationalization(@"1、设备竖直向上\n Home 按钮在下方");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param) {
                @jobs_strongify(self)
//                NSLog(@"按钮点击：设备竖直向上，Home 按钮在下方");
//                UIDevice.currentDevice.jobsKVC(@"orientation",@(UIInterfaceOrientationPortrait));/// 设备竖直向上，Home 按钮在下方
                [self hx_rotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown];
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"2、设备竖直向下\n Home 按钮在上方");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
//                NSLog(@"按钮点击：设备竖直向下，Home 按钮在上方");
//                UIDevice.currentDevice.jobsKVC(@"orientation",@(UIInterfaceOrientationPortraitUpsideDown));/// 设备竖直向下，Home 按钮在上方
                [self hx_rotateToInterfaceOrientation:UIInterfaceOrientationPortraitUpsideDown];
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"3、设备水平\n Home 按钮在右侧");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
//                NSLog(@"按钮点击：设备水平，Home 按钮在右侧");
//                UIDevice.currentDevice.jobsKVC(@"orientation",@(UIInterfaceOrientationLandscapeRight));/// 设备水平，Home 按钮在右侧
                NSLog(@"按钮点击：强制旋转到横屏");
                self.currentInterfaceOrientationMask = UIInterfaceOrientationMaskAllButUpsideDown;
                [self hx_rotateToInterfaceOrientation:UIInterfaceOrientationLandscapeRight];
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"4、设备水平\n Home 按钮在左侧");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
//                NSLog(@"按钮点击：设备水平，Home 按钮在左侧");
//                UIDevice.currentDevice.jobsKVC(@"orientation",@(UIInterfaceOrientationLandscapeLeft));/// 设备水平，Home 按钮在左侧
                self.currentInterfaceOrientationMask = UIInterfaceOrientationMaskAllButUpsideDown;
                [self hx_rotateToInterfaceOrientation:UIInterfaceOrientationLandscapeLeft];
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"5、锁定横屏");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
                NSLog(@"解除锁定");
                self.currentInterfaceOrientationMask = UIInterfaceOrientationMaskAllButUpsideDown;
                [self hx_setNeedsUpdateOfSupportedInterfaceOrientations];
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UITextModel *textModel = UITextModel.new;
            textModel.text = JobsInternationalization(@"6、解除锁定");
            textModel.textCor = JobsRedColor;
            textModel.textAlignment = NSTextAlignmentCenter;
            
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel = textModel;
            viewModel.jobsBlock = ^id(id param){
                @jobs_strongify(self)
                NSLog(@"解除锁定");
                self.currentInterfaceOrientationMask = UIInterfaceOrientationMaskAllButUpsideDown;
                [self hx_setNeedsUpdateOfSupportedInterfaceOrientations];
                return nil;
            };
            [_dataMutArr addObject:viewModel];
        }
        
    }return _dataMutArr;
}

@end

