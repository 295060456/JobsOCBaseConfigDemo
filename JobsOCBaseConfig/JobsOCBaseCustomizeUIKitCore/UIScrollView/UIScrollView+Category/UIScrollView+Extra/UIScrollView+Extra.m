//
//  UIScrollView+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/22.
//

#import "UIScrollView+Extra.h"

@implementation UIScrollView (Extra)
/// 在 UIScrollViewDelegate协议方法 -(void)scrollViewDidScroll:(UIScrollView *)scrollView里进行调用
-(ScrollDirection)scrolldirectionWhenScrollViewDidScroll{
    return [self judgementScrollDirectionByPoint:self.contentOffset];
}
#pragma mark —— 一些公共方法
/// 得到visibleCells
-(NSArray <UIView *> * _Nullable)scrollViewCells{
    NSArray <UIView *>*cells = nil;
    if ([self isKindOfClass:UICollectionView.class]) {
        UICollectionView *collectionView = (UICollectionView *)self;
        cells = collectionView.visibleCells;
    }else if ([self isKindOfClass:UITableView.class]){
        UITableView *tableView = (UITableView *)self;
        cells = tableView.visibleCells;
    }else{}
    return cells;
}
/// 依据index得到cell
-(UIView * _Nullable)scrollViewCellsAtIndex:(NSUInteger)index{
    UIView *cell = nil;
    if ([self isKindOfClass:UICollectionView.class]) {
        UICollectionView *collectionView = (UICollectionView *)self;
        cell = [collectionView.visibleCells objectAtIndex:index];
    }else if ([self isKindOfClass:UITableView.class]){
        UITableView *tableView = (UITableView *)self;
        cell = [tableView.visibleCells objectAtIndex:index];
    }else{}return cell;
}

@end
