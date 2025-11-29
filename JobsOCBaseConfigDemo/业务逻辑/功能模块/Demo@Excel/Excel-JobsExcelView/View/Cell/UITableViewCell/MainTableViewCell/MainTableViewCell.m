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
Prop_strong()JobsExcelConfigureViewModel *excelConfigureData;
Prop_strong()NSMutableArray <UIButtonModel *>*datas;

@end

@implementation MainTableViewCell

+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    @jobs_weakify(self)
    return ^(UITableView * _Nonnull tableView) {
        @jobs_strongify(self)
        MainTableViewCell *cell = (MainTableViewCell *)tableView.tableViewCellClass(self.class,@"");
        if (!cell) {
            cell = [self initTableViewCell:self
                                 withStyle:UITableViewCellStyleValue1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
            cell.collectionView.alpha = 1;
        }return cell;
    };
}
#pragma mark —— BaseCellProtocol
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable viewModel) {
        @jobs_strongify(self)
        self.excelConfigureData = viewModel.data;
        self.datas = viewModel.buttonModels;
        self.collectionView.byShow(self);
        return self;
    };
}

-(jobsByPointBlock _Nonnull)scrollerItemBy{
    @jobs_weakify(self)
    return ^(CGPoint contentOffset){
        @jobs_strongify(self)
        self.collectionView.contentOffset = contentOffset;
    };
}
#pragma mark —— UITableViewCellProtocol
-(JobsReturnMainTableViewCellByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^MainTableViewCell *_Nonnull(NSObject<MianTableViewCellDelegate> *delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}
#pragma mark —— UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    JobsLog(@"MainTableViewCell - scrollView.contentOffset.x = %f",scrollView.contentOffset.x);
    if (scrollView.contentOffset.x >= 0) {
        /// 防止在数据拉完的情况下，无意义的往左拉动👈🏻
        CGFloat d = (self.excelConfigureData.colNumber * self.excelConfigureData.itemW - self.excelConfigureData.XZExcelW) + self.excelConfigureData.itemW + self.excelConfigureData.scrollOffsetX;
        if(scrollView.contentOffset.x > d) scrollView.contentOffset = CGPointMake(d, scrollView.contentOffset.y);
        @jobs_weakify(self)
        self.delegate.jobsDelegate(@"mianTableViewCellScrollerDid",^(){
            @jobs_strongify(self)
            self.delegate.mianTableViewCellScrollerDid(scrollView);
        });
    }else{
        /// 防止在数据拉完的情况下，无意义的往右拉动👉🏻
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    }
}
#pragma mark —— UICollectionView 代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCellItem *cell = [MainTableViewCellItem cellWithCollectionView:collectionView
                                                                   forIndexPath:indexPath];
    cell.backgroundColor = cell.contentView.backgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
    @jobs_weakify(self)
    cell.jobsRichElementsCollectionViewCellBy(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable vm) {
        @jobs_strongify(self)
        vm.data = self.excelConfigureData;
        vm.buttonModel = self.datas[indexPath.row];
    }));return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.excelConfigureData.itemW, self.excelConfigureData.itemH);
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        @jobs_weakify(self)
        _collectionView = [UICollectionView.alloc initWithFrame:self.bounds
                                           collectionViewLayout:jobsMakeHorizontalCollectionViewFlowLayout(^(UICollectionViewFlowLayout * _Nullable data) {
            data.itemSize = jobsMakeCGSizeByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
                @jobs_strongify(self)
                data.jobsWidth = self.excelConfigureData.itemW;
                data.jobsHeight = self.excelConfigureData.itemH;
            });
            data.minimumLineSpacing = 0;
            data.minimumInteritemSpacing = 0;
        })];
        _collectionView.dataLink(self);
        _collectionView.backgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self.contentView.addSubview(_collectionView) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _collectionView;
}

@end
