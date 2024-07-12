//
//  JobsMenuView.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/10/24.
//

#import "JobsMenuView.h"

@interface JobsMenuView ()
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

@implementation JobsMenuView
BaseViewProtocol_synthesize
static JobsMenuView *JobsMenuViewInstance = nil;
static dispatch_once_t JobsMenuViewOnceToken;
+ (instancetype)sharedManager {
    dispatch_once(&JobsMenuViewOnceToken, ^{
        JobsMenuViewInstance = [super allocWithZone:NULL].init;
    });return JobsMenuViewInstance;
}
/// 单例的销毁
+ (void)destroyInstance {
    JobsMenuViewOnceToken = 0;
    JobsMenuViewInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    dispatch_once(&JobsMenuViewOnceToken, ^{
        JobsMenuViewInstance = [super allocWithZone:zone];
    });return JobsMenuViewInstance;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return self;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        @jobs_weakify(self)
        JobsAddNotification(self,
                        selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                  id _Nullable arg){
            NSNotification *notification = (NSNotification *)arg;
            @jobs_strongify(self)
            NSLog(@"通知传递过来的 = %@",notification.object);
            return nil;
        },nil, self),JobsLanguageSwitchNotification,nil);
//        [self netWorking];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsGreenColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
//    self.viewModel = model ? : UIViewModel.new;
//    MakeDataNull
    self.backgroundColor = JobsGreenColor;
    self.categoryView.alpha = 1;
    [self transformByRadians:1.5f];
    [self getCollectionViewCell];
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(self.jobsMainScreen_WIDTH / 2 + JobsRectOfStatusbar(),
                      self.jobsMainScreen_HEIGHT);
}

-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return [self.class viewSizeWithModel:model];
}
#pragma mark —— 一些私有方法
/// 只有在viewDidAppear才能获取到UICollectionViewCell
-(void)getCollectionViewCell{

//    JXCategoryBaseCell *cell = (JXCategoryBaseCell *)[self.categoryView.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0]];
//    NSArray <UICollectionViewCell *>*visibleCells = self.categoryView.collectionView.visibleCells;
    NSLog(@"");

    for (UICollectionViewCell *cell in self.categoryView.collectionView.visibleCells) {
        [cell transformByRadians:1];
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
        [self addSubview:_categoryView];
//        _categoryView.frame = CGRectMake(0, 0, JobsMainScreen_WIDTH(), listContainerViewDefaultOffset);
//        [_categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.view).offset(0);
//            make.left.right.equalTo(self.view);
//            make.height.mas_equalTo(listContainerViewDefaultOffset);
//        }];
//        [self.view layoutIfNeeded];
        
        /// 本来的值
        _categoryView.frame = CGRectMake(0,
                                         0,
                                         JobsMainScreen_HEIGHT(),
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
        [self addSubview:_listContainerView];
//        [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.equalTo(self.view).offset(listContainerViewDefaultOffset);
//            make.left.right.bottom.equalTo(self.view);
//
//        }];
//        [self.view layoutIfNeeded];
        
        _listContainerView.frame = CGRectMake(0,
                                              listContainerViewDefaultOffset,
                                              JobsMainScreen_HEIGHT(),
                                              JobsMainScreen_WIDTH() - listContainerViewDefaultOffset);
        
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
            [_childVCMutArr addObject:HomeMenuSubBaseVC.new];
        }
    }return _childVCMutArr;
}

@end
