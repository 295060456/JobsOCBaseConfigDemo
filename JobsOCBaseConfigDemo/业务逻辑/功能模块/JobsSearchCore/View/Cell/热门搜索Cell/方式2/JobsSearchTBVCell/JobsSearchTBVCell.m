//
//  TableViewCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/22.
//

#import "JobsSearchTBVCell.h"

@interface JobsSearchTBVCell ()

@end

@implementation JobsSearchTBVCell
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
#pragma mark —— BaseCellProtocol
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsSearchTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsSearchTBVCell);
        return cell;
    };
}

+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        NSArray *arr = (NSArray *)data;
        int rowNum = ceilf(arr.count / listNum);
        return rowNum * JobsSearchShowHotwordsTBVCellHeight;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsCellBy{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        [self.collectionView removeFromSuperview];
        self->_collectionView = nil;
        if (model) {
            self.viewModelMutArr = (NSMutableArray *)model;
            self.collectionView.reloadDatas();
        }
    };
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
    cell.jobsRichElementsCellBy(self.viewModelMutArr[indexPath.row]);
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
    JobsLog(@"%s", __FUNCTION__);
    return YES;
}
/// 高亮完成后回调
-(void)collectionView:(UICollectionView *)collectionView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
}
/// 由高亮转成非高亮完成时的回调
-(void)collectionView:(UICollectionView *)collectionView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
}
/// 设置是否允许选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
    return YES;
}
/// 设置是否允许取消选中
-(BOOL)collectionView:(UICollectionView *)collectionView
shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
    return YES;
}
/// 选中操作
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
    JobsSearchDataCVCell *cvcell = (JobsSearchDataCVCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (self.objBlock) self.objBlock(cvcell.viewModel);
    /// 点击即存入数据
    JobsSearchStorageData(cvcell.viewModel.textModel.text);
}
/// 取消选中操作
-(void)collectionView:(UICollectionView *)collectionView
didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    JobsLog(@"%s", __FUNCTION__);
}
#pragma mark —— UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(JobsMainScreen_WIDTH() / 2, JobsSearchShowHotwordsTBVCellHeight);
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
/// BaseViewProtocol
@synthesize collectionView = _collectionView;
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = UICollectionView.initByLayout(self.verticalLayout);
        _collectionView.dataLink(self);
        _collectionView.registerCollectionViewClass();
        [self.contentView.addSubview(_collectionView) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _collectionView;
}

@end
