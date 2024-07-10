//
//  JXCategoryViewVerticalShowVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import "JXCategoryViewVerticalShowVC.h"

@interface JXCategoryViewVerticalShowVC ()
/// UI
@property(nonatomic,strong)JXCategoryTitleView *categoryView;/// 文字
@property(nonatomic,strong)JXCategoryIndicatorLineView *lineView;/// 跟随的指示器
@property(nonatomic,strong)JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewController *>*childVCMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
//@property(nonatomic,strong)NSMutableArray <NSString *>*imageNames;
//@property(nonatomic,strong)NSMutableArray <NSString *>*selectedImageNames;

@end

@implementation JXCategoryViewVerticalShowVC

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
    
    self.gk_navigationBar.jobsVisible = NO;
    
    self.categoryView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.view transformByRadians:1.5f];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self getCollectionViewCell];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
/// 只有在viewDidAppear才能获取到UICollectionViewCell
-(void)getCollectionViewCell{

//    JXCategoryBaseCell *cell = (JXCategoryBaseCell *)[self.categoryView.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0]];
//    NSArray <UICollectionViewCell *>*visibleCells = self.categoryView.collectionView.visibleCells;
    NSLog(@"");

    for (UICollectionViewCell *cell in self.categoryView.collectionView.visibleCells) {
        [cell transformByRadians:0.5f];
    }
}
#pragma mark JXCategoryTitleViewDataSource
//// 如果将JXCategoryTitleView嵌套进UITableView的cell，每次重用的时候，JXCategoryTitleView进行reloadData时，会重新计算所有的title宽度。所以该应用场景，需要UITableView的cellModel缓存titles的文字宽度，再通过该代理方法返回给JXCategoryTitleView。
//// 如果实现了该方法就以该方法返回的宽度为准，不触发内部默认的文字宽度计算。
//- (CGFloat)categoryTitleView:(JXCategoryTitleView *)titleView
//               widthForTitle:(NSString *)title{
//
//    return 10;
//}
#pragma mark JXCategoryListContainerViewDelegate
/**
 返回list的数量
 
 @param listContainerView 列表的容器视图
 @return list的数量
 */
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView{
    return self.titleMutArr.count;
}
/**
 根据index初始化一个对应列表实例，需要是遵从`JXCategoryListContentViewDelegate`协议的对象。
 如果列表是用自定义UIView封装的，就让自定义UIView遵从`JXCategoryListContentViewDelegate`协议，该方法返回自定义UIView即可。
 如果列表是用自定义UIViewController封装的，就让自定义UIViewController遵从`JXCategoryListContentViewDelegate`协议，该方法返回自定义UIViewController即可。
 
 @param listContainerView 列表的容器视图
 @param index 目标下标
 @return 遵从JXCategoryListContentViewDelegate协议的list实例
 */
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView
initListForIndex:(NSInteger)index{
    return self.childVCMutArr[index];
}
#pragma mark JXCategoryViewDelegate
///【点击的结果】点击选中的情况才会调用该方法。传递didClickSelectedItemAt事件给listContainerView
- (void)categoryView:(JXCategoryBaseView *)categoryView
didClickSelectedItemAtIndex:(NSInteger)index {
    [self.listContainerView didClickSelectedItemAtIndex:index];
}
///【点击选中或者滚动选中的结果】点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView
didSelectedItemAtIndex:(NSInteger)index {
    
}
///【滚动选中的结果】滚动选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView
didScrollSelectedItemAtIndex:(NSInteger)index{
    
}
/// 传递scrolling事件给listContainerView，必须调用！！！
- (void)categoryView:(JXCategoryBaseView *)categoryView
scrollingFromLeftIndex:(NSInteger)leftIndex
toRightIndex:(NSInteger)rightIndex
ratio:(CGFloat)ratio {
    NSLog(@"");
    //    [self.listContainerView scrollingFromLeftIndex:leftIndex
    //                                      toRightIndex:rightIndex
    //                                             ratio:ratio
    //                                     selectedIndex:categoryView.selectedIndex];
}
#pragma mark —— lazyLoad
-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTitleView.new;
        _categoryView.backgroundColor = UIColor.clearColor;
        _categoryView.titleSelectedColor = UIColor.redColor;
        _categoryView.titleColor = UIColor.redColor;
        _categoryView.titleFont = notoSansRegular(16);
        _categoryView.titleSelectedFont = notoSansBold(16);
        _categoryView.delegate = self;
        _categoryView.titles = self.titleMutArr;
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.indicators = @[self.lineView];//
        _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _categoryView.cellSpacing = JobsWidth(-20);
        // 关联cotentScrollView，关联之后才可以互相联动！！！
        _categoryView.contentScrollView = self.listContainerView.scrollView;//
        [self.view addSubview:_categoryView];
//        _categoryView.frame = CGRectMake(0, 0, JobsMainScreen_WIDTH(nil), listContainerViewDefaultOffset);
//        [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.view).offset(0);
//            make.left.right.equalTo(self.view);
//            make.height.mas_equalTo(listContainerViewDefaultOffset);
//        }];
//        [self.view layoutIfNeeded];
        
        /// 本来的值
        _categoryView.frame = CGRectMake(0,
                                         0,
                                         JobsMainScreen_HEIGHT(nil),
                                         listContainerViewDefaultOffset);
        
       
    }return _categoryView;
}

-(JXCategoryIndicatorLineView *)lineView{
    if (!_lineView) {
        _lineView = JXCategoryIndicatorLineView.new;
        _lineView.indicatorColor = JobsWhiteColor;
        _lineView.indicatorHeight = JobsWidth(4);
        _lineView.indicatorWidthIncrement = JobsWidth(10);
        _lineView.verticalMargin = 0;
    }return _lineView;
}
/// 此属性决定依附于此的viewController
-(JXCategoryListContainerView *)listContainerView{
    if (!_listContainerView) {
        _listContainerView = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                    delegate:self];
        _listContainerView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        [self.view addSubview:_listContainerView];
//        [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.equalTo(self.view).offset(listContainerViewDefaultOffset);
//            make.left.right.bottom.equalTo(self.view);
//
//        }];
//        [self.view layoutIfNeeded];
        
        _listContainerView.frame = CGRectMake(0,
                                              listContainerViewDefaultOffset,
                                              JobsMainScreen_HEIGHT(nil),
                                              JobsMainScreen_WIDTH(nil) - listContainerViewDefaultOffset);
        
        /// ❤️在需要的地方写❤️
        NSNumber *currentIndex = [self.listContainerView valueForKey:@"currentIndex"];
        NSLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",currentIndex.intValue);
        
    }return _listContainerView;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = NSMutableArray.array;
        [_titleMutArr addObject:JobsInternationalization(@"豆花")];
        [_titleMutArr addObject:JobsInternationalization(@"莲子羹")];
        [_titleMutArr addObject:JobsInternationalization(@"蒸肉")];
        [_titleMutArr addObject:JobsInternationalization(@"排骨")];
        [_titleMutArr addObject:JobsInternationalization(@"美女")];
        [_titleMutArr addObject:JobsInternationalization(@"豪车")];
    }return _titleMutArr;
}

-(NSMutableArray<UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        _childVCMutArr = NSMutableArray.array;
        for (NSString *str in self.titleMutArr) {
            [_childVCMutArr addObject:JXCategoryViewVerticalShowSubBaseVC.new];
        }
    }return _childVCMutArr;
}


@end
