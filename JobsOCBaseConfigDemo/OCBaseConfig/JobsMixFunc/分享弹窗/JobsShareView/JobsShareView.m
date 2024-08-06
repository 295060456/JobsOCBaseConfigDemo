//
//  JobsShareView.m
//  MataShop
//
//  Created by Jobs Hi on 10/16/23.
//

#import "JobsShareView.h"

@interface JobsShareView ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)BaseCollectionView *collectionView;
@property(nonatomic,strong)BaseButton *cancelBtn;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation JobsShareView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_shareViewOnceToken = 0;
    static_shareView = nil;
}

static JobsShareView *static_shareView = nil;
static dispatch_once_t static_shareViewOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_shareViewOnceToken, ^{
        static_shareView = JobsShareView.new;
    });return static_shareView;
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
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }
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
    JobsLock(self.size = [JobsShareView viewSizeWithModel:nil];)
    /// 内部指定圆切角
    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.size = [JobsShareView viewSizeWithModel:nil];
    self.collectionView.alpha = 1;
    self.cancelBtn.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(148));
}
#pragma mark —— 一些私有方法

#pragma mark —— UICollectionViewCell 部署策略
//见 @interface NSObject (JobsDeployCellConfig)
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataMutArr.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MSMineView6CVCell *cell = [MSMineView6CVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
numberOfItemsInSection:(NSInteger)section {
    return self.dataMutArr.count;
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
    UIViewModel *viewModel = self.dataMutArr[indexPath.item];
    [self jobsToastMsg:viewModel.textModel.text];

    {
        if(viewModel.textModel.text.isEqualToString(JobsInternationalization(@"个人资料"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(JobsInternationalization(@"意见反馈"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(JobsInternationalization(@"消息通知"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(JobsInternationalization(@"收货地址"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(JobsInternationalization(@"修改密码"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(JobsInternationalization(@"设置"))){
            
        }
        if(viewModel.textModel.text.isEqualToString(JobsInternationalization(@"购物车"))){
            
        }
    }
}
/// 取消选中操作
-(void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.cls = self.class;
    return [MSMineView6CVCell cellSizeWithModel:viewModel];
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
    return JobsWidth(15);
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
layout:(UICollectionViewLayout *)collectionViewLayout
insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(JobsWidth(6), JobsWidth(15), JobsWidth(6), JobsWidth(15));
}
#pragma mark —— lazyLoad
-(BaseButton *)cancelBtn{
    if(!_cancelBtn){
        @jobs_weakify(self)
        _cancelBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                       background:nil
                                       buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                    textAlignment:NSTextAlignmentCenter
                                                 subTextAlignment:NSTextAlignmentCenter
                                                      normalImage:nil
                                                   highlightImage:nil
                                                  attributedTitle:nil
                                          selectedAttributedTitle:nil
                                               attributedSubtitle:nil
                                                            title:JobsInternationalization(@"取消")
                                                         subTitle:nil
                                                        titleFont:UIFontWeightMediumSize(16)
                                                     subTitleFont:nil
                                                         titleCor:JobsCor(@"#333333")
                                                      subTitleCor:nil
                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                              baseBackgroundColor:JobsWhiteColor
                                                  backgroundImage:nil
                                                     imagePadding:JobsWidth(0)
                                                     titlePadding:JobsWidth(0)
                                                   imagePlacement:NSDirectionalRectEdgeNone
                                       contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                         contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                    contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                cornerRadiusValue:JobsWidth(0)
                                                  roundingCorners:UIRectCornerAllCorners
                                             roundingCornersRadii:CGSizeZero
                                                   layerBorderCor:nil
                                                      borderWidth:JobsWidth(0)
                                                    primaryAction:nil
                                       longPressGestureEventBlock:nil
                                                  clickEventBlock:^id(BaseButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            
            return nil;
        }];
        [self addSubview:_cancelBtn];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.collectionView.mas_bottom);
            make.left.right.bottom.equalTo(self);
        }];
    }return _cancelBtn;
}

-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }return _layout;
}

-(BaseCollectionView *)collectionView{
    if (!_collectionView) {
        @jobs_weakify(self)
        _collectionView = [BaseCollectionView.alloc initWithFrame:CGRectZero
                                             collectionViewLayout:self.layout];
        _collectionView.backgroundColor = JobsCor(@"#FFFFFF");
        _collectionView.dataLink(self);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;
        
        _collectionView.registerCollectionViewClass();
        _collectionView.registerCollectionViewCellClass(MSMineView6CVCell.class,@"");
        
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = JobsInternationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.loadBlock = ^id _Nullable(id  _Nullable data) {
                @jobs_strongify(self)
                [self feedbackGenerator];//震动反馈
                [self endRefreshing:self.collectionView];
                return nil;
            };

            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = JobsInternationalization(@"");
            refreshConfigFooter.pullingTitle = JobsInternationalization(@"");
            refreshConfigFooter.refreshingTitle = JobsInternationalization(@"");
            refreshConfigFooter.willRefreshTitle = JobsInternationalization(@"");
            refreshConfigFooter.noMoreDataTitle = JobsInternationalization(@"");
            refreshConfigFooter.loadBlock = ^id _Nullable(id  _Nullable data) {
                @jobs_strongify(self)
                [self endRefreshing:self.collectionView];
                return nil;
            };

            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;

            _collectionView.mj_header = self.mjRefreshNormalHeader;
            _collectionView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
        }
        
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo(JobsWidth(102));
        }];
    }return _collectionView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"钱包");
            viewModel.image = JobsIMG(@"钱包");
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"我的店铺");
            viewModel.image = JobsIMG(@"我的店铺");
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"我的团队");
            viewModel.image = JobsIMG(@"我的团队");
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"信用分数");
            viewModel.image = JobsIMG(@"信用分数");
            [_dataMutArr addObject:viewModel];
        }

    }return _dataMutArr;
}

@end
