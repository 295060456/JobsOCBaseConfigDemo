//
//  JobsShareView.m
//  MataShop
//
//  Created by Jobs Hi on 10/16/23.
//

#import "JobsShareView.h"

@interface JobsShareView ()
/// UI
//@property(nonatomic,strong)BaseCollectionView *collectionView;
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
+(instancetype)sharedManager{
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
        [self addNotificationName:语言切换
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:NSNumber.class]){
                NSNumber *b = notification.object;
                NSLog(@"SSS = %d",b.boolValue);
            }
            NSLog(@"通知传递过来的 = %@",notification.object);
        }];
//        [self netWorking];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    JobsLock(self.sizer = JobsShareView.viewSizeByModel(nil);)
    /// 内部指定圆切角
    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.sizer = JobsShareView.viewSizeByModel(nil);
        self.collectionView.reloadDatas();
        self.cancelBtn.alpha = 1;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(148));
    };
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
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.row]);
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
    self.jobsToastMsg(viewModel.textModel.text);

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
    return MSMineView6CVCell.cellSizeByModel(viewModel);
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
    return jobsMakeEdgeInsetsByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        data.jobsTop = JobsWidth(6);
        data.jobsLeft = JobsWidth(15);
        data.jobsBottom = JobsWidth(6);
        data.jobsRight = JobsWidth(15);
    });
}
#pragma mark —— lazyLoad
-(BaseButton *)cancelBtn{
    if(!_cancelBtn){
        @jobs_weakify(self)
        _cancelBtn = BaseButton
            .initByStyle1(JobsInternationalization(@"取消"),
                                       UIFontWeightMediumSize(16),
                                       JobsCor(@"#333333"))
            .bgColor(JobsWhiteColor)
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self addSubview:_cancelBtn];
        [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.collectionView.mas_bottom);
            make.left.right.bottom.equalTo(self);
        }];
    }return _cancelBtn;
}
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(BaseCollectionView *)collectionView{
    if (!_collectionView) {
        @jobs_weakify(self)
        _collectionView = BaseCollectionView.initByLayout(self.verticalLayout);
        _collectionView.backgroundColor = JobsCor(@"#FFFFFF");
        _collectionView.dataLink(self);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;
        
        _collectionView.registerCollectionViewClass();
        _collectionView.registerCollectionViewCellClass(MSMineView6CVCell.class,@"");
        
        {
            _collectionView.mj_header = self.MJRefreshNormalHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
                data.pullingTitle = JobsInternationalization(@"下拉可以刷新");
                data.refreshingTitle = JobsInternationalization(@"松开立即刷新");
                data.willRefreshTitle = JobsInternationalization(@"刷新数据中");
                data.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
                data.automaticallyChangeAlpha = YES; /// 根据拖拽比例自动切换透明度
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    self.feedbackGenerator();//震动反馈
                    self->_collectionView.endRefreshing(YES);
                    return nil;
                };
            }));
            _collectionView.mj_footer = self.MJRefreshBackNormalFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"");
                data.pullingTitle = JobsInternationalization(@"");
                data.refreshingTitle = JobsInternationalization(@"");
                data.willRefreshTitle = JobsInternationalization(@"");
                data.noMoreDataTitle = JobsInternationalization(@"");
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    self->_collectionView.endRefreshing(YES);
                    return nil;
                };
            }));
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
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"钱包");
                data1.image = JobsIMG(@"钱包");
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"我的店铺");
                data1.image = JobsIMG(@"我的店铺");
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"我的团队");
                data1.image = JobsIMG(@"我的团队");
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"信用分数");
                data1.image = JobsIMG(@"信用分数");
            }));
        });
    }return _dataMutArr;
}

@end
