//
//  UIScrollView+Extra.h
//  Casino
//
//  Created by Jobs on 2021/12/22.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"

#if __has_include(<XZMRefresh/XZMRefresh.h>)
#import <XZMRefresh/XZMRefresh.h>
#else
#import "XZMRefresh.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (Extra)
/// 在 UIScrollViewDelegate协议方法 -(void)scrollViewDidScroll:(UIScrollView *)scrollView里进行调用
-(ScrollDirection)scrolldirectionWhenScrollViewDidScroll;
#pragma mark —— 一些公共方法
-(jobsByVoidBlock _Nonnull)reloadDatas;
/// 得到visibleCells
-(NSArray <UIView *>*_Nullable)scrollViewCells;
/// 依据index得到cell
-(UIView *_Nullable)scrollViewCellsAtIndex:(NSUInteger)index;
#pragma mark —— 关于 XZMRefresh 的二次封装
-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingNormalHeader;
-(jobsByVoidBlock _Nonnull)XZM_endRefreshingNormalHeader;
-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingGifHeader;
-(jobsByVoidBlock _Nonnull)XZM_endRefreshingGifHeader;
-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingNormalFooter;
-(jobsByVoidBlock _Nonnull)XZM_endRefreshingNormalFooter;
-(jobsByVoidBlock _Nonnull)XZM_beginRefreshingGifFooter;
-(jobsByVoidBlock _Nonnull)XZM_endRefreshingGifFooter;
#pragma mark —— 关于 MJRefresh 的二次封装
-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_header;
-(jobsByVoidBlock _Nonnull)mj_endRefreshing_header;
-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_footer;
-(jobsByVoidBlock _Nonnull)mj_endRefreshing_footer;
-(jobsByVoidBlock _Nonnull)mj_beginRefreshing_trailer;
-(jobsByVoidBlock _Nonnull)mj_endRefreshing_trailer;
/// 停止刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(jobsByScrollViewBlock _Nonnull)endRefreshing;
/// 停止刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByScrollViewBlock _Nonnull)endRefreshingWithNoMoreData;
/// 停止MJHeader的刷新
-(jobsByScrollViewBlock _Nonnull)endMJHeaderRefreshing;
/// 停止MJFooter的刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByScrollViewBlock _Nonnull)endMJFooterRefreshingWithNoMoreData;
/// 停止MJFooter刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(jobsByScrollViewBlock _Nonnull)endMJFooterRefreshingWithMoreData;

@end

NS_ASSUME_NONNULL_END
