//
//  JobsHotLabelWithMultiLine.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/15.
//

#import "JobsHotLabelWithMultiLine.h"

@interface JobsHotLabelWithMultiLine ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <UICollectionViewCell *>*cvcellMutArr;
@property(nonatomic,strong)JobsHotLabelWithMultiLineModel *dataModel;

@end

@implementation JobsHotLabelWithMultiLine
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_hotLabelWithMultiLineOnceToken = 0;
    static_hotLabelWithMultiLine = nil;
}

static JobsHotLabelWithMultiLine *static_hotLabelWithMultiLine = nil;
static dispatch_once_t static_hotLabelWithMultiLineOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_hotLabelWithMultiLineOnceToken, ^{
        static_hotLabelWithMultiLine = JobsHotLabelWithMultiLine.new;
    });return static_hotLabelWithMultiLine;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(0xFFFFFF);
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HEXCOLOR(0xFFFFFF);
    }return self;
}
/// 必须有frame的前提下才会进行绘制
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(JobsHotLabelWithMultiLineModel * _Nullable)model{
    self.dataModel = model;
    self.backgroundColor = self.dataModel.bgCor;
    if (self.dataModel.viewModelMutArr.count) {
        [self.collectionView reloadData];
    }
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(JobsHotLabelWithMultiLineModel * _Nullable)model{
    NSMutableArray <UIViewModel *>*viewModelMutArr = model.viewModelMutArr;
    CGFloat width = hotLabLeft + hotLabRight;
    CGFloat height = 0;
    int row = 1;
    for (UIViewModel *viewModel in viewModelMutArr) {
        CGSize size = [UILabel sizeWithText:viewModel.textModel.text
                                       font:[UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightRegular]
                                    maxSize:CGSizeZero];
        width += size.width + hotLabOffsetX;
        height = size.height;
        if (width >= JobsSearchShowHotwordsTBVCellWidth) {
            width = hotLabLeft + hotLabRight;
            row += 1;
        }
    }
    CGFloat offset = JobsWidth(3);// 从何而来？
    return CGSizeMake(model.jobsWidth,
                      (height + hotLabOffsetY) * row + (hotLabTop + hotLabBottom) + offset);
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JobsHotLabelWithMultiLineCVCell *cell = (JobsHotLabelWithMultiLineCVCell *)self.cvcellMutArr[indexPath.item];
    cell.richElementsInCellWithModel(self.dataModel.viewModelMutArr[indexPath.item]);
    CGSize itemSize = jobsZeroSizeValue(self.dataModel.cellSize) ? [JobsHotLabelWithMultiLineCVCell cellSizeWithModel:self.dataModel.viewModelMutArr[indexPath.item]] : self.dataModel.cellSize;
    cell.cornerCutToCircleWithCornerRadius(itemSize.height / 2);
    cell.contentView.cornerCutToCircleWithCornerRadius(itemSize.height / 2);
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.getTextLab.textColor = HEXCOLOR(0xAE8330);
        cell.getTextLab.backgroundColor = HEXCOLOR(0xFFEABA);
    }return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.dataModel.viewModelMutArr.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        JobsHeaderFooterView *headerView = [collectionView UICollectionElementKindSectionHeaderClass:JobsHeaderFooterView.class
                                                                                                       forIndexPath:indexPath];
        [headerView richElementsInViewWithModel:self.dataModel.headerViewModel];
        return headerView;
    }else if (kind == UICollectionElementKindSectionFooter) {
        JobsHeaderFooterView *footerView = [collectionView UICollectionElementKindSectionFooterClass:JobsHeaderFooterView.class
                                                                                                       forIndexPath:indexPath];
        [footerView richElementsInViewWithModel:self.dataModel.footerViewModel];
        return footerView;
    }else ReturnBaseCollectionReusableHeaderView;
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
-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    JobsHotLabelWithMultiLineCVCell *_cell = (JobsHotLabelWithMultiLineCVCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    [WHToast jobsToastSuccessMsg:_cell.getViewModel.textModel.text];
    
    for (JobsHotLabelWithMultiLineCVCell *cell in collectionView.visibleCells) {
        cell.getTextLab.backgroundColor = HEXCOLOR(0xF3F3F3);
        cell.getTextLab.textColor = HEXCOLOR(0x757575);
    }
    _cell.getTextLab.textColor = HEXCOLOR(0xAE8330);
    _cell.getTextLab.backgroundColor = HEXCOLOR(0xFFEABA);
    
    if (self.objectBlock) self.objectBlock(_cell);
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
    /// ❤️外部传入配置优先❤️
    if (self.dataModel.headerViewModel.useHeaderView) {
        return jobsZeroSizeValue(self.dataModel.headerViewModel.jobsSize) ? [JobsHeaderFooterView collectionReusableViewSizeWithModel:nil] : self.dataModel.headerViewModel.jobsSize;
    }return CGSizeZero;
}
/// footer 大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section {
    /// ❤️外部传入配置优先❤️
    if (self.dataModel.footerViewModel.useFooterView) {
        return jobsZeroSizeValue(self.dataModel.footerViewModel.jobsSize) ? [JobsHeaderFooterView collectionReusableViewSizeWithModel:nil] : self.dataModel.headerViewModel.jobsSize;
    }return CGSizeZero;
}
/// item/cell 的大小
-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout *)collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    /// ❤️外部传入配置优先❤️
    return jobsZeroSizeValue(self.dataModel.cellSize) ? [JobsHotLabelWithMultiLineCVCell cellSizeWithModel:self.dataModel.viewModelMutArr[indexPath.item]] : self.dataModel.cellSize;
}
/// 定义的是元素垂直之间的间距
-(CGFloat)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return hotLabOffsetY;
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
-(CGFloat)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return hotLabOffsetX;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return jobsSameEdgeInset(5);
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
        _collectionView.backgroundColor = JobsClearColor;
        _collectionView.dataLink(self);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = NO;
        
        _collectionView.registerCollectionViewClass();
        
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(jobsSameEdgeInset(JobsWidth(2)));
        }];
    }return _collectionView;
}

-(NSMutableArray<UICollectionViewCell *> *)cvcellMutArr{
    if (!_cvcellMutArr) {
        _cvcellMutArr = NSMutableArray.array;
        for (UIViewModel *viewModel in self.dataModel.viewModelMutArr) {
            NSUInteger index = [self.dataModel.viewModelMutArr indexOfObject:viewModel];
            [_cvcellMutArr addObject:[JobsHotLabelWithMultiLineCVCell cellWithCollectionView:self.collectionView
                                                                                forIndexPath:[self myIndexPath:(JobsIndexPath){0,index}]]];
        }
    }return _cvcellMutArr;
}

@end

@implementation JobsHotLabelWithMultiLineModel

-(JobsHeaderFooterViewModel *)headerViewModel{
    if (!_headerViewModel) {
        _headerViewModel = JobsHeaderFooterViewModel.new;
//        _headerViewModel.textModel.text = JobsInternationalization(@"独家情报");
//        _headerViewModel.bgCor = JobsGreenColor;
/// 结构体虽然分配了空间，但是里面的成员的值是随机的，特别是如果里面有指针的话，如果不初始化而直接访问，则会造成读取非法的内存地址的错误。
        _headerViewModel.jobsSize = CGSizeZero;
        _headerViewModel.cellSize = CGSizeZero;
        _headerViewModel.tableHeaderViewSize = CGSizeZero;
        _headerViewModel.tableFooterViewSize = CGSizeZero;
        _headerViewModel.cornerRadii = CGSizeZero;
        _headerViewModel.jobsRect = CGRectZero;
        _headerViewModel.jobsPoint = CGPointZero;
    }return _headerViewModel;
}

-(JobsHeaderFooterViewModel *)footerViewModel{
    if (!_footerViewModel) {
        _footerViewModel = JobsHeaderFooterViewModel.new;
//        _footerViewModel.textModel.text = JobsInternationalization(@"查看详情");
//        _footerViewModel.bgCor = JobsBlueColor;
/// 结构体虽然分配了空间，但是里面的成员的值是随机的，特别是如果里面有指针的话，如果不初始化而直接访问，则会造成读取非法的内存地址的错误。
        _footerViewModel.jobsSize = CGSizeZero;
        _footerViewModel.cellSize = CGSizeZero;
        _footerViewModel.tableHeaderViewSize = CGSizeZero;
        _footerViewModel.tableFooterViewSize = CGSizeZero;
        _footerViewModel.cornerRadii = CGSizeZero;
        _footerViewModel.jobsRect = CGRectZero;
        _footerViewModel.jobsPoint = CGPointZero;
    }return _footerViewModel;
}

@end
