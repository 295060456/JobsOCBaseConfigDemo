//
//  MainTableViewCell.m
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "MainTableViewCell.h"

@interface MainTableViewCell()
/// Data
@property(nonatomic,strong)JobsExcelConfigureViewModel *viewModel_;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)NSMutableArray <UIButtonModel *>*model;

@end

@implementation MainTableViewCell

+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    @jobs_weakify(self)
    return ^(UITableView * _Nonnull tableView) {
        @jobs_strongify(self)
        MainTableViewCell *cell = (MainTableViewCell *)tableView.tableViewCellClass(self.class,@"");
        if (!cell) {
            cell = [self initTableViewCell:self
                                 withStyle:UITableViewCellStyleValue1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
            cell.collectionView.alpha = 1;
        }return cell;
    };
}
#pragma mark —— BaseCellProtocol
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable viewModel) {
        @jobs_strongify(self)
        self.viewModel_ = viewModel;
    };
}

-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel2{
    @jobs_weakify(self)
    return ^(NSMutableArray <UIButtonModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.model = model;
        [self.collectionView reloadData];
    };
}

- (void)scrollerItemWithContentOffset:(CGPoint)contentOffset{
    self.collectionView.contentOffset = contentOffset;
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    /// 防止在初始情况下，无意义的往右拉动
    CGFloat d = (self.viewModel_.rowNumber * self.viewModel_.itemW - self.viewModel_.XZExcelW) + self.viewModel_.itemW;
    NSLog(@"MainTableViewCell - scrollView.contentOffset.x = %f",scrollView.contentOffset.x)
    if (scrollView.contentOffset.x >= 0) {
        /// 防止在数据拉完的情况下，无意义的往左拉动
        if(scrollView.contentOffset.x <= d){
            @jobs_weakify(self)
            self.delegate.jobsDelegate(@"mianTableViewCellScrollerDid:",^(){
                @jobs_strongify(self)
                [self.delegate mianTableViewCellScrollerDid:scrollView];
            });
        }else scrollView.contentOffset = CGPointMake(d, scrollView.contentOffset.y);
    }else scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
}
#pragma mark —— lazyLoadUICollectionView 代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return self.model.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCellItem *cell = [MainTableViewCellItem cellWithCollectionView:collectionView
                                                                   forIndexPath:indexPath];
    cell.backgroundColor = cell.contentView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
    NSLog(@"KKK1 = %ld-%@",self.indexPath.row + 1,self.model[0].text);
    cell.jobsRichElementsInCellWithModel(self.viewModel_);
    cell.jobsRichElementsInCellWithModel2(self.model[indexPath.row]);
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.viewModel_.itemW, self.viewModel_.itemH);
}
#pragma mark —— lazyLoad
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [UICollectionView.alloc initWithFrame:self.bounds collectionViewLayout:self.layout];
        _collectionView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _collectionView.dataLink(self);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _collectionView;
}

-(UICollectionViewFlowLayout *)layout{
    if(!_layout){
        _layout = UICollectionViewFlowLayout.new;
        _layout.itemSize = CGSizeMake(self.viewModel_.itemW,
                                      self.viewModel_.itemH);
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
    }return _layout;
}

@end
