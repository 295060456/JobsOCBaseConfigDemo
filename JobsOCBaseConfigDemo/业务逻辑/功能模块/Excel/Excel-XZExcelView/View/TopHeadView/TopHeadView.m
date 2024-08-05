//
//  TopHeadView.m
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "TopHeadView.h"

@interface TopHeadView()

@property(nonatomic,strong)UICollectionView *headTitleV;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel;

@end

@implementation TopHeadView

- (void)dealloc{
    [self.viewModel removeObserver:self forKeyPath:HorizontalScrollBegin];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.headTitleV.alpha = 1;
    }return self;
}

- (void)viewBindViewModel:(XZExcelConfigureViewModel *)viewModel{
    self.viewModel=viewModel;
    [self.viewModel addObserver:self
                     forKeyPath:HorizontalScrollBegin
                        options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                        context:nil];
}
#pragma mark —— KVO 监听
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context{
    
    XZExcelConfigureViewModel *viewModel=(XZExcelConfigureViewModel *)object;
    if ([keyPath isEqualToString:HorizontalScrollBegin]) {
        self.headTitleV.contentOffset = viewModel.HorizontalScrollValue.CGPointValue;
    }
}
#pragma mark —— UICollectionView 代理和数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
    return self.viewModel.colNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopViewITem *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopViewITem" forIndexPath:indexPath];
    return item;
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath{
    TopViewITem *showItem = (TopViewITem *)cell;
    showItem.backgroundColor = JobsBlueColor;
    [showItem cellBindViewModel:self.viewModel];
    NSString *title = self.viewModel.titleArr[indexPath.row];
    [showItem cellBindModel:title];
}

- (CGSize)collectionView:(UICollectionView *)collectionView 
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.viewModel.itemW, self.viewModel.itemH);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.viewModel setValue:[NSValue valueWithCGPoint:scrollView.contentOffset] forKey:HorizontalScrollBegin];
}
#pragma mark —— getter and setter
-(UICollectionViewFlowLayout *)layout{
    if(!_layout){
        _layout = UICollectionViewFlowLayout.new;
        _layout.itemSize=CGSizeMake(self.viewModel.itemW, self.viewModel.itemH);
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
    }return _layout;
}

- (UICollectionView *)headTitleV{
    if (!_headTitleV) {
        _headTitleV = [UICollectionView.alloc initWithFrame:self.bounds collectionViewLayout:self.layout];
        _headTitleV.backgroundColor = JobsWhiteColor;
        _headTitleV.delegate = self;
        _headTitleV.dataSource = self;
        _headTitleV.showsVerticalScrollIndicator = NO;
        _headTitleV.showsHorizontalScrollIndicator = NO;
        [_headTitleV registerClass:TopViewITem.class forCellWithReuseIdentifier:NSStringFromClass(TopViewITem.class)];
        [self addSubview:_headTitleV];
        [_headTitleV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _headTitleV;
}

@end
