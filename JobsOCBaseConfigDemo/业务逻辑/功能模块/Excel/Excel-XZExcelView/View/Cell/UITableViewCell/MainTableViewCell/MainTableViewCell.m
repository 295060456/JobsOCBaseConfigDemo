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
@property(nonatomic,strong)TableModel *model;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;

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
            cell.cellCollectionV.alpha = 1;
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
    return ^(TableModel *_Nullable model) {
        @jobs_strongify(self)
        self.model = model;
    };
}

- (void)scrollerItemWithContentOffset:(CGPoint )contentOffset{
    self.cellCollectionV.contentOffset = contentOffset;
}
#pragma mark —— lazyLoadscrollerViwe 代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    /// 防止在初始情况下，无意义的往右拉动
    if (scrollView.contentOffset.x >= 0) {
        @jobs_weakify(self)
        self.delegate.jobsDelegate(@"mianTableViewCellScrollerDid:",^(){
            @jobs_strongify(self)
            [self.delegate mianTableViewCellScrollerDid:scrollView];
        });
    }else{
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    }
}
#pragma mark —— lazyLoadUICollectionView 代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return self.model.itemArr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCellITem *cell = [MainTableViewCellITem cellWithCollectionView:collectionView
                                                                   forIndexPath:indexPath];
    cell.contentView.backgroundColor = cell.backgroundColor = indexPath.row %2 ? JobsCor(@"#000000").colorWithAlphaComponent(.3f) : JobsCor(@"#4B00AB").colorWithAlphaComponent(.3f);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MainTableViewCellITem *showItem = (MainTableViewCellITem *)cell;
    showItem.jobsRichElementsInCellWithModel(self.viewModel_);
    
    ItemModel *model = self.model.itemArr[indexPath.row];
    showItem.jobsRichElementsInCellWithModel2(model);
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.viewModel_.itemW, self.viewModel_.itemH);
}
#pragma mark —— lazyLoad
- (UICollectionView *)cellCollectionV{
    if (!_cellCollectionV) {
        _cellCollectionV = [UICollectionView.alloc initWithFrame:self.bounds collectionViewLayout:self.layout];
        _cellCollectionV.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _cellCollectionV.delegate = self;
        _cellCollectionV.dataSource = self;
        _cellCollectionV.showsVerticalScrollIndicator = NO;
        _cellCollectionV.showsHorizontalScrollIndicator = NO;
        
        [_cellCollectionV registerClass:MainTableViewCellITem.class
             forCellWithReuseIdentifier:NSStringFromClass(MainTableViewCellITem.class)];
        
        [self.contentView addSubview:_cellCollectionV];
        [_cellCollectionV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _cellCollectionV;
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
