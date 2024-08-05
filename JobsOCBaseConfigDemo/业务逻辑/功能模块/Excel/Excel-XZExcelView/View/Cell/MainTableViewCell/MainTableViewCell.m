//
//  MainTableViewCell.m
//  BlankProject
//
//  Created by mac on 17/6/15.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell()

@property(nonatomic,strong)UICollectionView *cellCollectionV;
@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel;
@property(nonatomic,strong)TableModel *model;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;

@end

@implementation MainTableViewCell

+ (MainTableViewCell*)dequeneCellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"MainTableViewCell";
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [MainTableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = JobsWhiteColor;
    }return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style 
             reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style 
                    reuseIdentifier:reuseIdentifier]) {
        self.cellCollectionV.alpha = 1;
    }return self;
}

- (void)cellBindViewModel:(XZExcelConfigureViewModel *)viewModel{
    self.viewModel = viewModel;
}

- (void)cellBindModel:(TableModel *)model{
    self.model = model;
}

- (void)scrollerItemWithContentOffset:(CGPoint )contentOffset{
    self.cellCollectionV.contentOffset=contentOffset;
}
#pragma mark —— lazyLoadscrollerViwe 代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.delegate respondsToSelector:@selector(mianTableViewCellScrollerDid:)]) {
        [self.delegate mianTableViewCellScrollerDid:scrollView];
    }
}
#pragma mark —— lazyLoadUICollectionView 代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView 
     numberOfItemsInSection:(NSInteger)section{
    return self.model.itemArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCellITem *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainTableViewCellITem" forIndexPath:indexPath];
    return item;
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MainTableViewCellITem *showItem=(MainTableViewCellITem *)cell;
    [showItem cellBindViewModel:self.viewModel];
    
    ItemModel *model=self.model.itemArr[indexPath.row];
    [showItem cellBindModel:model];
}

- (CGSize)collectionView:(UICollectionView *)collectionView 
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.viewModel.itemW, self.viewModel.itemH);
}
#pragma mark —— lazyLoad
- (UICollectionView *)cellCollectionV{
    if (!_cellCollectionV) {
        _cellCollectionV = [UICollectionView.alloc initWithFrame:self.bounds collectionViewLayout:self.layout];
        _cellCollectionV.backgroundColor = JobsWhiteColor;
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
        _layout.itemSize=CGSizeMake(self.viewModel.itemW,
                                    self.viewModel.itemH);
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
    }return _layout;
}

@end
