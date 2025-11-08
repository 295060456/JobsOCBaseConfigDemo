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
-(JobsRetViewByVoidBlock _Nonnull)reloadDatas{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(){
        @jobs_strongify(self)
        if(self){
            if (self.isKindOfClass(UICollectionView.class)) {
                UICollectionView *collectionView = (UICollectionView *)self;
                [collectionView reloadData];
            }else if (self.isKindOfClass(UITableView.class)){
                UITableView *tableView = (UITableView *)self;
                [tableView reloadData];
            }else{}
        }return self;
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
-(JobsRetViewByNSUIntegerBlock _Nonnull)scrollViewCellsByIndex{
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
-(JobsRetScrollViewByPointBlock _Nonnull)setContentOffsetByYES{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        [self setContentOffset:data animated:YES];
        return self;
    };
}
/// 对系统方法 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;  的二次封装
-(JobsRetScrollViewByPointBlock _Nonnull)setContentOffsetByNO{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGPoint data){
        @jobs_strongify(self)
        [self setContentOffset:data animated:NO];
        return self;
    };
}
/// 对系统方法 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;   的二次封装
-(JobsRetScrollViewByFrameBlock _Nonnull)scrollRectToVisibleByYES{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGRect data){
        @jobs_strongify(self)
        [self scrollRectToVisible:data animated:YES];
        return self;
    };
}
/// 对系统方法 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;  的二次封装
-(JobsRetScrollViewByFrameBlock _Nonnull)scrollRectToVisibleByNO{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGRect data){
        @jobs_strongify(self)
        [self scrollRectToVisible:data animated:NO];
        return self;
    };
}
#pragma mark —— UIScrollViewProtocol
-(JobsRetScrollViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(id <UIScrollViewDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)showsVerticalScrollIndicatorBy{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsVerticalScrollIndicator = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)showsHorizontalScrollIndicatorBy{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.showsHorizontalScrollIndicator = data;
        return self;
    };
}

-(JobsRetScrollViewBySizeBlock _Nonnull)byContentSize{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGSize size){
        @jobs_strongify(self)
        self.contentSize = size;
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentWidth{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.contentSize = CGSizeMake(data ? : self.width, self.contentSize.height ? : self.height);
        return self;
    };
}

-(JobsRetScrollViewByCGFloatBlock _Nonnull)byContentHeight{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.contentSize = CGSizeMake(self.contentSize.width ? : self.width, data ? : self.height);
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byScrollEnabled{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.scrollEnabled = data;
        return self;
    };
}

-(JobsRetScrollViewByBOOLBlock _Nonnull)byBounces{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.bounces = data;
        return self;
    };
}

-(JobsRetScrollViewByUIEdgeInsetsBlock _Nonnull)byEdgeInsets{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.contentInset = insets;
        return self;
    };
}

-(JobsReturnScrollViewByMJRefreshHeaderBlock _Nonnull)byMJRefreshHeader{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(__kindof MJRefreshHeader * _Nullable header){
        @jobs_strongify(self)
        self.mj_header = header;
        self.mj_header.automaticallyChangeAlpha = YES; /// 根据拖拽比例自动切换透明度
        return self;
    };
}

-(JobsReturnScrollViewByMJRefreshFooterBlock _Nonnull)byMJRefreshFooter{
    @jobs_weakify(self)
    return ^__kindof UIScrollView *_Nullable(__kindof MJRefreshFooter * _Nullable header){
        @jobs_strongify(self)
        self.mj_footer = header;
        self.mj_footer.automaticallyChangeAlpha = YES; /// 根据拖拽比例自动切换透明度
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
