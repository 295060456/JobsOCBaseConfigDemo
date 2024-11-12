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
@property(nonatomic,strong)JobsExcelConfigureViewModel *excelConfigureData;
@property(nonatomic,strong)NSMutableArray <UIButtonModel *>*datas;

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
        self.excelConfigureData = viewModel;
    };
}

-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel2{
    @jobs_weakify(self)
    return ^(NSMutableArray <UIButtonModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.datas = model;
        self.collectionView.reloadDatas();
    };
}

-(jobsByPointBlock _Nonnull)scrollerItemBy{
    @jobs_weakify(self)
    return ^(CGPoint contentOffset){
        @jobs_strongify(self)
        self.collectionView.contentOffset = contentOffset;
    };
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"MainTableViewCell - scrollView.contentOffset.x = %f",scrollView.contentOffset.x);
    if (scrollView.contentOffset.x >= 0) {
        /// 防止在数据拉完的情况下，无意义的往左拉动👈🏻
        CGFloat d = (self.excelConfigureData.rowNumber * self.excelConfigureData.itemW - self.excelConfigureData.XZExcelW) + self.excelConfigureData.itemW + self.excelConfigureData.scrollOffsetX;
        
        if(scrollView.contentOffset.x > d) scrollView.contentOffset = CGPointMake(d, scrollView.contentOffset.y);
        @jobs_weakify(self)
        self.delegate.jobsDelegate(@"mianTableViewCellScrollerDid:",^(){
            @jobs_strongify(self)
            [self.delegate mianTableViewCellScrollerDid:scrollView];
        });
    }else{
        /// 防止在数据拉完的情况下，无意义的往右拉动👉🏻
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    }
}
#pragma mark —— lazyLoadUICollectionView 代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return self.datas.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCellItem *cell = [MainTableViewCellItem cellWithCollectionView:collectionView
                                                                   forIndexPath:indexPath];
    cell.backgroundColor = cell.contentView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
    NSLog(@"KKK1 = %ld-%@",self.indexPath.row + 1,self.datas[indexPath.row].title);
    cell.jobsRichElementsInCellWithModel(self.excelConfigureData);
    cell.jobsRichElementsInCellWithModel2(self.datas[indexPath.row]);
    return cell;
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
        _collectionView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _collectionView.dataLink(self);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _collectionView;
}

@end
