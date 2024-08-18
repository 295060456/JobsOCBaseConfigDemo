//
//  TopHeadView.m
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "TopHeadView.h"

@interface TopHeadView()

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel;

@end

@implementation TopHeadView

- (void)dealloc{
    [self.viewModel removeObserver:self forKeyPath:HorizontalScrollBegin];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.collectionView.alpha = 1;
    }return self;
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(XZExcelConfigureViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        [self.viewModel addObserver:self
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
    
    XZExcelConfigureViewModel *viewModel = (XZExcelConfigureViewModel *)object;
    if ([keyPath isEqualToString:HorizontalScrollBegin]) {
        self.collectionView.contentOffset = viewModel.HorizontalScrollValue.CGPointValue;
    }
}
#pragma mark —— UICollectionView 代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopViewITem *cell = [TopViewITem cellWithCollectionView:collectionView
                                               forIndexPath:indexPath];
    cell.backgroundColor = JobsBlueColor;
    cell.jobsRichElementsInCellWithModel(self.viewModel);
    cell.jobsRichElementsInCellWithModel2(self.viewModel.topHeaderDatas[indexPath.row]);
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.viewModel.itemW, self.viewModel.itemH);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.viewModel.jobsKVC(HorizontalScrollBegin,[NSValue valueWithCGPoint:scrollView.contentOffset]);
    /// 防止在初始情况下，无意义的往右拉动
    if (scrollView.contentOffset.x < 0) {
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    }
    NSLog(@"TopHeadView - scrollView.contentOffset.x = %f",scrollView.contentOffset.x)// 1242
    if(scrollView.contentOffset.x > 1242){
        scrollView.contentOffset = CGPointMake(1242, scrollView.contentOffset.y);
    }
}
#pragma mark —— getter and setter
-(UICollectionViewFlowLayout *)layout{
    if(!_layout){
        _layout = UICollectionViewFlowLayout.new;
        _layout.itemSize = CGSizeMake(self.viewModel.itemW, self.viewModel.itemH);
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
    }return _layout;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [UICollectionView.alloc initWithFrame:self.bounds
                                           collectionViewLayout:self.layout];
        _collectionView.backgroundColor = JobsWhiteColor;
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
