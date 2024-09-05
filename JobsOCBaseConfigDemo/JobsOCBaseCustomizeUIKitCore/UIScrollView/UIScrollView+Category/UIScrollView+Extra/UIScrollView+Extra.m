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
    return [self judgementScrollDirectionByPoint:self.contentOffset];
}
#pragma mark —— 一些公共方法
-(jobsByVoidBlock _Nonnull)reloadDatas{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if (self.isKindOfClass(UICollectionView.class)) {
            UICollectionView *collectionView = (UICollectionView *)self;
            [collectionView reloadData];
        }else if (self.isKindOfClass(UITableView.class)){
            UITableView *tableView = (UITableView *)self;
            [tableView reloadData];
        }else{}
    };
}
/// 得到visibleCells
-(NSArray <UIView *>*_Nullable)scrollViewCells{
    NSArray <UIView *>*cells = nil;
    if (self.isKindOfClass(UICollectionView.class)) {
        UICollectionView *collectionView = (UICollectionView *)self;
        cells = collectionView.visibleCells;
    }else if (self.isKindOfClass(UITableView.class)){
        UITableView *tableView = (UITableView *)self;
        cells = tableView.visibleCells;
    }else{}
    return cells;
}
/// 依据index得到cell
-(UIView *_Nullable)scrollViewCellsAtIndex:(NSUInteger)index{
    UIView *cell = nil;
    if (self.isKindOfClass(UICollectionView.class)) {
        UICollectionView *collectionView = (UICollectionView *)self;
        cell = [collectionView.visibleCells objectAtIndex:index];
    }else if (self.isKindOfClass(UITableView.class)){
        UITableView *tableView = (UITableView *)self;
        cell = [tableView.visibleCells objectAtIndex:index];
    }else{}return cell;
}
#pragma mark —— 关于 XZMRefresh 的二次封装
-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingNormalHeader{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.xzm_header beginRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)XZM_endRefreshingNormalHeader{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.xzm_header endRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingGifHeader{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.xzm_gifHeader beginRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)XZM_endRefreshingGifHeader{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.xzm_gifHeader endRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingNormalFooter{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.xzm_footer beginRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)XZM_endRefreshingNormalFooter{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.xzm_footer endRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingGifFooter{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.xzm_gifFooter beginRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)XZM_endRefreshingGifFooter{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.xzm_gifFooter endRefreshing];
    };
}
#pragma mark —— 关于 MJRefresh 的二次封装
-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_header{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.mj_header beginRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)mj_endRefreshing_header{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.mj_header endRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_footer{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.mj_footer beginRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)mj_endRefreshing_footer{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.mj_footer endRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_trailer{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.mj_trailer beginRefreshing];
    };
}

-(jobsByVoidBlock _Nonnull)mj_endRefreshing_trailer{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.mj_trailer endRefreshing];
    };
}
/// 停止刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(jobsByScrollViewBlock _Nonnull)endRefreshing{
    @jobs_weakify(self)
    return ^(UIScrollView * _Nullable targetScrollView) {
        @jobs_strongify(self)
        if ([targetScrollView isKindOfClass:UITableView.class]) {
            UITableView *tableView = (UITableView *)targetScrollView;
            [tableView reloadData];
        }else if ([targetScrollView isKindOfClass:UICollectionView.class]){
            UICollectionView *collectionView = (UICollectionView *)targetScrollView;
            [collectionView reloadData];
        }else{}
        
        [targetScrollView tab_endAnimation];//里面实现了 [self.collectionView reloadData];
        
        self.endMJHeaderRefreshing(targetScrollView);
        self.endMJFooterRefreshingWithMoreData(targetScrollView);
    };
}
/// 停止刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByScrollViewBlock _Nonnull)endRefreshingWithNoMoreData{
    @jobs_weakify(self)
    return ^(UIScrollView * _Nullable targetScrollView) {
        @jobs_strongify(self)
        if ([targetScrollView isKindOfClass:UITableView.class]) {
            UITableView *tableView = (UITableView *)targetScrollView;
            [tableView reloadData];
        }else if ([targetScrollView isKindOfClass:UICollectionView.class]){
            UICollectionView *collectionView = (UICollectionView *)targetScrollView;
            [collectionView reloadData];
        }else{}
        
        [targetScrollView tab_endAnimation];//里面实现了 [self.collectionView reloadData];

        self.endMJHeaderRefreshing(targetScrollView);
        self.endMJFooterRefreshingWithNoMoreData(targetScrollView);
    };
}
/// 停止MJHeader的刷新
-(jobsByScrollViewBlock _Nonnull)endMJHeaderRefreshing{
    return ^(UIScrollView * _Nullable targetScrollView) {
        if (targetScrollView.mj_header.refreshing) {
            [targetScrollView.mj_header endRefreshing];// 结束刷新
        }
    };
}
/// 停止MJFooter的刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByScrollViewBlock _Nonnull)endMJFooterRefreshingWithNoMoreData{
    return ^(UIScrollView * _Nullable targetScrollView) {
        if (targetScrollView.mj_footer.refreshing) {
            [targetScrollView.mj_footer endRefreshingWithNoMoreData];// 结束刷新
        }
    };
}
/// 停止MJFooter刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(jobsByScrollViewBlock _Nonnull)endMJFooterRefreshingWithMoreData{
    return ^(UIScrollView * _Nullable targetScrollView) {
        if (targetScrollView.mj_footer.refreshing) {
            [targetScrollView.mj_footer endRefreshing];// 结束刷新
        }else{
            [targetScrollView.mj_footer resetNoMoreData];// 结束刷新
        }
    };
}

@end
