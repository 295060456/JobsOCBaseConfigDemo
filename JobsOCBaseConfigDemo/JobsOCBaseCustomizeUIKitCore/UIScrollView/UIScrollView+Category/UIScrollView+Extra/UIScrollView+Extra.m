//
//  UIScrollView+Extra.m
//  Casino
//
//  Created by Jobs on 2021/12/22.
//

#import "UIScrollView+Extra.h"
/**
 XZMRefresh 的相关继承关系
 
 XZMRefreshNormalHeader : XZMRefreshHeader : XZMBaseRefreshView : UIView
 XZMRefreshGifHeader : XZMRefreshNormalHeader : XZMRefreshHeader : XZMBaseRefreshView : UIView

 XZMRefreshNormalFooter : XZMRefreshFooter : XZMBaseRefreshView : UIView
 XZMRefreshGifFooter : XZMRefreshNormalFooter : XZMRefreshFooter : XZMBaseRefreshView : UIView
 */
@implementation UIScrollView (Extra)
/// 在 UIScrollViewDelegate协议方法 -(void)scrollViewDidScroll:(UIScrollView *)scrollView里进行调用
-(ScrollDirection)scrolldirectionWhenScrollViewDidScroll{
    return self.judgementScrollDirectionByPoint(self.contentOffset);
}
#pragma mark —— 一些公共方法
/// 如果使用：dispatch_async + dispatch_get_main_queue()进行主线程上的调用，会执行2次刷新的协议方法
-(jobsByVoidBlock _Nonnull)reloadDatas{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(self){
            if (self.isKindOfClass(UICollectionView.class)) {
                UICollectionView *collectionView = (UICollectionView *)self;
                [collectionView reloadData];
            }else if (self.isKindOfClass(UITableView.class)){
                UITableView *tableView = (UITableView *)self;
                [tableView reloadData];
            }else{}
        }
    };
}
/// 得到visibleCells
-(NSArray <UIView *>*_Nullable)scrollViewCells{
    NSArray <UIView *>*cells = nil;
    if(self){
        if (self.isKindOfClass(UICollectionView.class)) {
            UICollectionView *collectionView = (UICollectionView *)self;
            cells = collectionView.visibleCells;
        }else if (self.isKindOfClass(UITableView.class)){
            UITableView *tableView = (UITableView *)self;
            cells = tableView.visibleCells;
        }else{}
    }return cells;
}
/// 依据index得到cell
-(JobsReturnViewByNSUIntegerBlock _Nonnull)scrollViewCellsByIndex{
    return ^__kindof UIView *_Nullable(NSUInteger index){
        UIView *cell = nil;
        if(self){
            if (self.isKindOfClass(UICollectionView.class)) {
                UICollectionView *collectionView = (UICollectionView *)self;
                cell = [collectionView.visibleCells objectAtIndex:index];
            }else if (self.isKindOfClass(UITableView.class)){
                UITableView *tableView = (UITableView *)self;
                cell = [tableView.visibleCells objectAtIndex:index];
            }else{}
        }return cell;
    };
}
/// 对系统方法 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  的二次封装
-(JobsReturnScrollViewByPointBlock _Nonnull)setContentOffsetByYES{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        [self setContentOffset:data animated:YES];
        return self;
    };
}
/// 对系统方法 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  的二次封装
-(JobsReturnScrollViewByPointBlock _Nonnull)setContentOffsetByNO{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        [self setContentOffset:data animated:NO];
        return self;
    };
}
/// 对系统方法 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;   的二次封装
-(JobsReturnScrollViewByRectBlock _Nonnull)scrollRectToVisibleByYES{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGRect data){
        @jobs_strongify(self)
        [self scrollRectToVisible:data animated:YES];
        return self;
    };
}
/// 对系统方法 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;  的二次封装
-(JobsReturnScrollViewByRectBlock _Nonnull)scrollRectToVisibleByNO{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGRect data){
        @jobs_strongify(self)
        [self scrollRectToVisible:data animated:NO];
        return self;
    };
}
#pragma mark —— Prop_assign()ScrollDirection direction; /// UIScrollView 滑动的方向定义
JobsKey(_direction)
@dynamic direction;
-(ScrollDirection)direction{
    return [Jobs_getAssociatedObject(_direction) integerValue];
}

-(void)setDirection:(ScrollDirection)direction{
    Jobs_setAssociatedRETAIN_NONATOMIC(_direction, @(direction))
}

@end
