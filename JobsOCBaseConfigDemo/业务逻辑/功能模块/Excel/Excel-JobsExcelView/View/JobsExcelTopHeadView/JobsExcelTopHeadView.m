//
//  JobsExcelTopHeadView.m
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "JobsExcelTopHeadView.h"

@interface JobsExcelTopHeadView()

//@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)JobsExcelConfigureViewModel *vm;

@end

@implementation JobsExcelTopHeadView

- (void)dealloc{
    [self.vm removeObserver:self forKeyPath:HorizontalScrollBegin];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.collectionView.reloadDatas();
    }return self;
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.vm = model;
        [self.vm addObserver:self
                  forKeyPath:HorizontalScrollBegin
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:nil];
    };
}
#pragma mark —— KVO 监听
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context{
    JobsExcelConfigureViewModel *data = (JobsExcelConfigureViewModel *)object;
    if ([keyPath isEqualToString:HorizontalScrollBegin]) {
        self.collectionView.contentOffset = data.HorizontalScrollValue.CGPointValue;
    }
}
#pragma mark —— UICollectionView 代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return self.vm.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JobsTopViewItem *cell = [JobsTopViewItem cellWithCollectionView:collectionView
                                                       forIndexPath:indexPath];
    cell.backgroundColor = self.vm.cor3;
    cell.jobsRichElementsInCellWithModel(self.vm);
    cell.jobsRichElementsInCellWithModel2(self.vm.topHeaderDatas[indexPath.row]);
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.vm.itemW, self.vm.itemH);
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.vm.jobsKVC(HorizontalScrollBegin,[NSValue valueWithCGPoint:scrollView.contentOffset]);
    NSLog(@"JobsExcelTopHeadView - scrollView.contentOffset.x = %f",scrollView.contentOffset.x)
    /// 防止在初始情况下，无意义的往右拉动👉🏻
    if (scrollView.contentOffset.x < 0) scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    /// 防止在初始情况下，无意义的往左拉动👈🏻
    CGFloat d = (self.vm.rowNumber * self.vm.itemW - self.vm.XZExcelW) + self.vm.itemW + self.vm.scrollOffsetX;
    if(scrollView.contentOffset.x > d) scrollView.contentOffset = CGPointMake(d, scrollView.contentOffset.y);
}
#pragma mark —— getter and setter
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        @jobs_weakify(self)
        _collectionView = [UICollectionView.alloc initWithFrame:self.bounds
                                           collectionViewLayout:jobsMakeHorizontalCollectionViewFlowLayout(^(UICollectionViewFlowLayout * _Nullable data) {
            data.itemSize = jobsMakeCGSizeByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
                @jobs_strongify(self)
                data.jobsWidth = self.vm.itemW;
                data.jobsHeight = self.vm.itemH;
            });
            data.minimumLineSpacing = 0;
            data.minimumInteritemSpacing = 0;
        })];
        _collectionView.backgroundColor = JobsClearColor;
        _collectionView.dataLink(self);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _collectionView;
}

@end
