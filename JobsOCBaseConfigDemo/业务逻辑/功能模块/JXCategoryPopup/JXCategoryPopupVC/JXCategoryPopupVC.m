//
//  JXCategoryPopupVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/5/29.
//

#import "JXCategoryPopupVC.h"

@interface JXCategoryPopupVC ()
/// UI
@property(nonatomic,strong)JXCategoryTitleView *categoryView;
@property(nonatomic,strong)JXCategoryIndicatorLineView *lineView;/// 跟随的指示器
@property(nonatomic,strong)JXCategoryListContainerView *listContainerView;/// 此属性决定依附于此的viewController
@property(nonatomic,strong)BaseButton *filterBtn;
@property(nonatomic,strong)BaseButton *customBtn;
@property(nonatomic,weak)UIView *popUpFiltrationView;
@property(nonatomic,weak)UIView *popUpCustomView;
@property(nonatomic,weak)NSNumber *currentIndex;
@property(nonatomic,weak)JXCategoryPopupSubVC *vc;
/// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <__kindof UIViewController *>*childVCMutArr;

@end

@implementation JXCategoryPopupVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
    }
//    self.viewModel.textModel.text = JobsInternationalization(@"JXCategoryPopupVC");
    self.bgImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.makeNavByAlpha(1);
    
    self.categoryView.alpha = 1;
    self.filterBtn.alpha = 1;
    self.customBtn.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
//传递scrolling事件给listContainerView，必须调用！！！
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
#pragma mark —— TFPopupDelegate
/// 在 tf_hide 之后执行
- (BOOL)tf_popupViewWillHide:(UIView *)popup{
    if (self.filterBtn.selected) {
        [self.filterBtn changeAction: 0];
        self.filterBtn.selected = !self.filterBtn.selected;
    }return YES;
}

- (BOOL)tf_popupViewWillShow:(UIView *)popup{
    [self.popUpFiltrationView showDefaultBackground];
    return YES;
}
#pragma mark —— LazyLoad
-(JXCategoryTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = JXCategoryTitleView.new;
        _categoryView.backgroundColor = JobsClearColor;
        _categoryView.titleSelectedColor = JobsRandomColor;
        _categoryView.titleColor = JobsRandomColor;
        _categoryView.titleFont = [UIFont systemFontOfSize:18 weight:UIFontWeightRegular];
        _categoryView.titleSelectedFont = [UIFont systemFontOfSize:28 weight:UIFontWeightRegular];
        _categoryView.delegate = self;
        _categoryView.titles = self.titleMutArr;
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.indicators = @[self.lineView];//
        _categoryView.defaultSelectedIndex = 1;// 默认从第二个开始显示
        _categoryView.cellSpacing = JobsWidth(-20);
        // 关联cotentScrollView，关联之后才可以互相联动！！！
        _categoryView.contentScrollView = self.listContainerView.scrollView;//
        [self.view addSubview:_categoryView];
        [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view).offset(JobsWidth(-48 * 2));
            make.height.mas_equalTo(listContainerViewDefaultOffset);
        }];
        [self.view layoutIfNeeded];
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
        [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(listContainerViewDefaultOffset);
            make.left.right.bottom.equalTo(self.view);
        }];
        [self.view layoutIfNeeded];
        /// ❤️在需要的地方写❤️
        NSNumber *currentIndex = self.listContainerView.valueForKey(@"currentIndex");
        NSLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",currentIndex.intValue);
    }return _listContainerView;
}

-(NSMutableArray<NSString *> *)titleMutArr{
    if (!_titleMutArr) {
        _titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(JobsInternationalization(@"全部游戏"));
            data.add(JobsInternationalization(@"真人"));
            data.add(JobsInternationalization(@"体育"));
            data.add(JobsInternationalization(@"电子"));
            data.add(JobsInternationalization(@"棋牌"));
            data.add(JobsInternationalization(@"彩票"));
        });
    }return _titleMutArr;
}

-(NSMutableArray<__kindof UIViewController *> *)childVCMutArr{
    if (!_childVCMutArr) {
        @jobs_weakify(self)
        _childVCMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            for (NSString *str in self.titleMutArr) {
                data.add(JXCategoryPopupSubVC.new);
            }
        });
    }return _childVCMutArr;
}

-(BaseButton *)filterBtn{
    if (!_filterBtn) {
        @jobs_weakify(self)
        _filterBtn = BaseButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetImagePlacement(NSDirectionalRectEdgeTrailing)
            .jobsResetImagePadding(JobsWidth(6))
            .jobsResetBtnImage(JobsIMG(@"筛选箭头（向下）"))
            .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
            .jobsResetBtnTitleFont(fontName(@"NotoSans-Bold", 12))
            .jobsResetBtnTitle(JobsInternationalization(@"篩選"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                x.selected = !x.selected;
                self.jobsToastMsg(JobsInternationalization(@"篩選"));
                [x changeAction:x.selected];
                self.currentIndex = self.listContainerView.valueForKey(@"currentIndex");
                NSLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",self.currentIndex.intValue);
                self.vc = (JXCategoryPopupSubVC *)self.childVCMutArr[self.currentIndex.intValue];
                [self.vc hidePopupView:self.popUpCustomView];
                if (x.selected) {
                    self.customBtn.selected = NO;
                    self.popUpFiltrationView = self.vc.popUpFiltrationView;
                    self.popUpFiltrationView.popupDelegate = self;
                }else{
                    [self.vc hidePopupView:self.popUpFiltrationView];
                }
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.view addSubview:_filterBtn];
        [_filterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.view);
            make.top.bottom.equalTo(self.categoryView);
        }];
        _filterBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _filterBtn;
}

-(BaseButton *)customBtn{
    if (!_customBtn) {
        @jobs_weakify(self)
        _customBtn = BaseButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetBtnTitleCor(HEXCOLOR(0x3D4A58))
            .jobsResetBtnTitleFont(fontName(@"NotoSans-Bold", 12))
            .jobsResetBtnTitle(JobsInternationalization(@"自定义"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                x.selected = !x.selected;
                x.jobsResetBtnTitleCor(x.selected ? HEXCOLOR(0xAE8330) : HEXCOLOR(0x3D4A58));
                self.jobsToastMsg(JobsInternationalization(@"自定义"));
                self.currentIndex = self.listContainerView.valueForKey(@"currentIndex");
                NSLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",self.currentIndex.intValue);
                self.vc = (JXCategoryPopupSubVC *)self.childVCMutArr[self.currentIndex.intValue];
                self.popUpFiltrationView = self.vc.popUpFiltrationView;
                [self.vc hidePopupView:self.popUpFiltrationView];
                [self.filterBtn changeAction:self.filterBtn.selected];
                if (x.selected) {
                    self.filterBtn.selected = NO;
                    self.popUpCustomView = self.vc.popUpCustomView;
    //                self.popUpCustomView.popupDelegate = self;
                }else{
                    [self.vc hidePopupView:self.popUpCustomView];
                }
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        _customBtn.selectedTitleColor(HEXCOLOR(0xAE8330));
        [self.view addSubview:_customBtn];
        [_customBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.filterBtn.mas_left).offset(JobsWidth(-8));
            make.top.bottom.equalTo(self.categoryView);
            make.left.equalTo(self.categoryView.mas_right);
        }];
    }return _customBtn;
}

@end
