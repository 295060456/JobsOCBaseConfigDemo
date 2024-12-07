//
//  ThreeClassCell.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import "ThreeClassCell.h"

@interface ThreeClassCell()
/// UI
/// Data
@property(nonatomic,assign)CGFloat sectionInsetTop;
@property(nonatomic,assign)CGFloat sectionInsetLeft;
@property(nonatomic,assign)CGFloat sectionInsetBottom;
@property(nonatomic,assign)CGFloat sectionInsetRight;
@property(nonatomic,assign)CGFloat minimumLineSpacing;/// 上下行间距
@property(nonatomic,assign)CGFloat minimumInteritemSpacing;/// 左右列间距
@property(nonatomic,strong)NSMutableArray *dataArray;/// 总共有多少个cell
@property(nonatomic,assign)CGFloat itemHeight;/// 一个cell 的高度
@property(nonatomic,assign)NSInteger columns;/// 一行有多少列
@property(nonatomic,assign)NSInteger rowCount;/// 一共有都是行
@property(nonatomic,strong)UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong)NSMutableArray <GoodsClassModel *>*dataMutArr;

@end

@implementation ThreeClassCell

#pragma mark —— BaseCellProtocol
+(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView
                         forIndexPath:(nonnull NSIndexPath *)indexPath{
    ThreeClassCell *cell = (ThreeClassCell *)[collectionView collectionViewCellClass:ThreeClassCell.class forIndexPath:indexPath];
    if (!cell) {
        collectionView.registerCollectionViewCellClass(ThreeClassCell.class,@"");
        cell = (ThreeClassCell *)[collectionView collectionViewCellClass:ThreeClassCell.class forIndexPath:indexPath];
    }
    cell.indexPath = indexPath;
    return cell;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.columns = 3;
        self.sectionInsetTop = JobsWidth(15.f);
        self.sectionInsetLeft = JobsWidth(15.f);
        self.sectionInsetBottom = JobsWidth(15.f);
        self.sectionInsetRight = JobsWidth(15.f);
        self.minimumLineSpacing = JobsWidth(17);
        self.minimumInteritemSpacing = JobsWidth(13);
        self.itemHeight = TreeClassItemCell.cellSizeByModel(nil).height;
        self.backgroundColor = self.contentView.backgroundColor = ThreeClassCellBgCor;
        self.jobsRichElementsCellBy(nil);
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsCellBy{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.dataMutArr = model;
        if (self.dataMutArr) {
            self.collectionView.reloadDatas();
        }
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)cellSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH() - TableViewWidth, JobsWidth(1000));
    };
}
#pragma mark —— 一些公有方法
-(JobsReturnCGFloatByArrBlock _Nonnull)getCollectionHeight{
    return ^CGFloat(NSMutableArray *_Nullable data){
        self.dataArray = data;
        NSInteger a = self.dataArray.count % self.columns;
        self.rowCount = a ? (self.dataArray.count / self.columns) + 1 : self.dataArray.count / self.columns;
        CGFloat collectionHeight = (self.rowCount * self.itemHeight) + ((self.rowCount - 1) * self.minimumLineSpacing) + self.sectionInsetTop + self.sectionInsetBottom;
        self.collectionView.height = collectionHeight;
        return collectionHeight;
    };
}

-(void)reloadData{
    [self.collectionView reloadData];
}
#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        @jobs_weakify(self)
        _flowLayout = jobsMakeVerticalCollectionViewFlowLayout(^(UICollectionViewFlowLayout * _Nullable data) {
            @jobs_strongify(self)
            data.minimumInteritemSpacing = self.minimumInteritemSpacing;
            data.minimumLineSpacing = self.minimumLineSpacing;
            data.itemSize = TreeClassItemCell.cellSizeByModel(nil);
            data.sectionInset = UIEdgeInsetsMake(self.sectionInsetTop,
                                                 self.sectionInsetLeft,
                                                 self.sectionInsetBottom,
                                                 self.sectionInsetRight);
        });
    }return _flowLayout;
}
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView){
        _collectionView = UICollectionView.initByLayout(self.flowLayout);
        _collectionView.frame = CGRectMake(JobsWidth(8.76),
                                           0,
                                           self.frame.size.width - JobsWidth(17.52),
                                           self.frame.size.height);
        _collectionView.scrollEnabled = NO;
        _collectionView.dataLink(self);

        _collectionView.backgroundColor = ThreeClassCellBgCor;
        _collectionView.layer.backgroundColor = ThreeClassCellBgCor.CGColor;
        _collectionView.layer.shadowColor = RGBA_COLOR(0, 0, 0, 0.08).CGColor;
        _collectionView.layer.shadowOffset = CGSizeZero;
        _collectionView.layer.shadowOpacity = 1;
        _collectionView.layer.shadowRadius = JobsWidth(5);
        _collectionView.layer.masksToBounds = NO;
        _collectionView.contentInset = UIEdgeInsetsMake(JobsWidth(10), 0, 0, 0);
        _collectionView.registerCollectionViewCellClass(TreeClassItemCell.class,@"");
        [self.contentView addSubview:_collectionView];
    }return _collectionView;
}
#pragma mark —— UICollectionViewDelegate,UICollectionViewDataSource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TreeClassItemCell *cell = [TreeClassItemCell cellWithCollectionView:self.collectionView forIndexPath:indexPath];
    /// 针对数据源第一个数据不是我们需要的
    cell.jobsRichElementsCellBy(self.dataMutArr[indexPath.item]);
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

-(void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.objectBlock) self.objectBlock([self.dataArray objectAtIndex:indexPath.row]);

}

@end
