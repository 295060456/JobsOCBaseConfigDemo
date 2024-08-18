//
//  MainTableViewCell.m
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell()
/// Data
@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel_;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)NSMutableArray <UITextModel *>*model;

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
            cell.backgroundColor = JobsWhiteColor;
            cell.collectionView.alpha = 1;
        }return cell;
    };
}
#pragma mark —— BaseCellProtocol
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(XZExcelConfigureViewModel *_Nullable viewModel) {
        @jobs_strongify(self)
        self.viewModel_ = viewModel;
    };
}

-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel2{
    @jobs_weakify(self)
    return ^(NSMutableArray <UITextModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.model = model;
    };
}

- (void)scrollerItemWithContentOffset:(CGPoint)contentOffset{
    self.collectionView.contentOffset = contentOffset;
}
#pragma mark —— lazyLoadscrollerViwe 代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    /// 防止在初始情况下，无意义的往右拉动
    NSLog(@"MainTableViewCell - scrollView.contentOffset.x = %f",scrollView.contentOffset.x)// 1242
    if (scrollView.contentOffset.x >= 0) {
        /// 防止在数据拉完的情况下，无意义的往左拉动
        if(scrollView.contentOffset.x <= 1242){
            @jobs_weakify(self)
            self.delegate.jobsDelegate(@"mianTableViewCellScrollerDid:",^(){
                @jobs_strongify(self)
                [self.delegate mianTableViewCellScrollerDid:scrollView];
            });
        }else{
            scrollView.contentOffset = CGPointMake(1242, scrollView.contentOffset.y);
        }
    }else{
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    }
}
#pragma mark —— lazyLoadUICollectionView 代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return self.model.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCellITem *cell = [MainTableViewCellITem cellWithCollectionView:collectionView
                                                                   forIndexPath:indexPath];
    cell.contentView.backgroundColor = cell.backgroundColor = indexPath.row %2 ? JobsCor(@"#000000").colorWithAlphaComponent(.3f) : JobsCor(@"#4B00AB").colorWithAlphaComponent(.3f);
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
