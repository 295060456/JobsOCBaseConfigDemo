//
//  TableViewCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/22.
//

#import "JobsSearchTBVCell.h"

@interface JobsSearchTBVCell ()
/// UI
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
/// Data

@end

@implementation JobsSearchTBVCell

UIViewModelProtocol_synthesize

#pragma mark —— BaseCellProtocol
+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    JobsSearchTBVCell *cell = (JobsSearchTBVCell *)[tableView tableViewCellClass:JobsSearchTBVCell.class];
    if (!cell) {
        cell = [JobsSearchTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }return cell;
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    NSArray *arr = (NSArray *)model;
    int rowNum = ceilf(arr.count / listNum);
    return rowNum * JobsSearchShowHotwordsTBVCellHeight;
}

-(void)richElementsInCellWithModel:(NSMutableArray <UIViewModel *>*_Nullable)model{
    
    [_collectionView removeFromSuperview];
    _collectionView = nil;
    
    if (model) {
        self.viewModelMutArr = (NSMutableArray *)model;
        self.collectionView.alpha = 1;
    }
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {

    JobsSearchDataCVCell *cell = [JobsSearchDataCVCell cellWithCollectionView:collectionView
                                                                 forIndexPath:indexPath];

    cell.indexPath = indexPath;
    [cell richElementsInCellWithModel:self.viewModelMutArr[indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.viewModelMutArr.count;
}
#pragma mark —— UICollectionViewDelegate
/// 允许选中时，高亮
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 高亮完成后回调
-(void)collectionView:(UICollectionView *)collectionView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
/// 由高亮转成非高亮完成时的回调
-(void)collectionView:(UICollectionView *)collectionView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
/// 设置是否允许选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 设置是否允许取消选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
/// 选中操作
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    JobsSearchDataCVCell *cvcell = (JobsSearchDataCVCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (self.objectBlock) self.objectBlock(cvcell.viewModel);
    /// 点击即存入数据
    JobsSearchStorageData(cvcell.viewModel.textModel.text);
}
/// 取消选中操作
-(void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(JobsMainScreen_WIDTH(nil) / 2, JobsSearchShowHotwordsTBVCellHeight);
}
/// 每个item之间的间距 横（行）间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
/// 每个item之间的间距  列(纵)间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout*)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }return _layout;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero
                                           collectionViewLayout:self.layout];
        [self dataLinkByCollectionView:_collectionView];
        [_collectionView registerCollectionViewClass];
        [self.contentView addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _collectionView;
}

@end
