//
//  UIView+Refresh.h
//  DouDong-II
//
//  Created by Jobs on 2021/1/17.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "NSObject+Extras.h"
#import "NSObject+DynamicInvoke.h"
#import "MJRefresh+Extra.h"

#import "LOTAnimationMJRefreshHeader.h"
#import "MJRefreshConfigModel.h"
#import "BaseViewProtocol.h"

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<TABAnimated/TABAnimated.h>)
#import <TABAnimated/TABAnimated.h>
#else
#import "TABAnimated.h"
#endif

#if __has_include(<XZMRefresh/XZMRefresh.h>)
#import <XZMRefresh/XZMRefresh.h>
#else
#import "XZMRefresh.h"
#endif

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

NS_ASSUME_NONNULL_BEGIN
/// https://github.com/CoderMJLee/MJRefresh/issues/1495
@interface UIView (Refresh)<BaseViewProtocol>
/// MJRefresh 作用于targetView
@property(nonatomic,weak)UIScrollView *mjRefreshTargetView;

@property(nonatomic,strong)MJRefreshConfigModel *refreshConfigHeader;//头部的配置信息
@property(nonatomic,strong)MJRefreshConfigModel *refreshConfigFooter;//尾部的配置信息
#pragma mark —— MJRefreshHeader
@property(nonatomic,strong)LOTAnimationMJRefreshHeader *lotAnimMJRefreshHeader;
@property(nonatomic,strong)MJRefreshNormalHeader *mjRefreshNormalHeader;
@property(nonatomic,strong)MJRefreshStateHeader *mjRefreshStateHeader;
@property(nonatomic,strong)MJRefreshHeader *mjRefreshHeader;
@property(nonatomic,strong)MJRefreshGifHeader *mjRefreshGifHeader;
#pragma mark —— MJRefreshFooter
@property(nonatomic,strong)MJRefreshAutoGifFooter *mjRefreshAutoGifFooter;
@property(nonatomic,strong)MJRefreshBackNormalFooter *mjRefreshBackNormalFooter;
@property(nonatomic,strong)MJRefreshAutoNormalFooter *mjRefreshAutoNormalFooter;
@property(nonatomic,strong)MJRefreshAutoStateFooter *mjRefreshAutoStateFooter;
@property(nonatomic,strong)MJRefreshAutoFooter *mjRefreshAutoFooter;
@property(nonatomic,strong)MJRefreshBackGifFooter *mjRefreshBackGifFooter;
@property(nonatomic,strong)MJRefreshBackStateFooter *mjRefreshBackStateFooter;
@property(nonatomic,strong)MJRefreshBackFooter *mjRefreshBackFooter;
@property(nonatomic,strong)MJRefreshFooter *mjRefreshFooter;
#pragma mark —— UI刷新（调用系统底层方法）
-(jobsByVoidBlock _Nonnull)refresh;
#pragma mark —— 创建不同类型的MJHeader 和 MJFootor
/// Header
-(JobsReturnLOTAnimationMJRefreshHeaderByRefreshConfigModelBlock _Nonnull)LOTAnimationMJRefreshHeaderBy;
-(JobsReturnMJRefreshNormalHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshNormalHeaderBy;
-(JobsReturnMJRefreshStateHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshStateHeaderBy;
-(JobsReturnMJRefreshHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshHeaderBy;
-(JobsReturnMJRefreshGifHeaderByRefreshConfigModelBlock _Nonnull)MJRefreshGifHeaderBy;
/// Footer
-(JobsReturnMJRefreshAutoGifFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoGifFooterBy;
-(JobsReturnMJRefreshBackNormalFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackNormalFooterBy;
-(JobsReturnMJRefreshAutoNormalFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoNormalFooterBy;
-(JobsReturnMJRefreshAutoStateFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoStateFooterBy;
-(JobsReturnMJRefreshAutoFooterByRefreshConfigModelBlock _Nonnull)MJRefreshAutoFooterBy;
-(JobsReturnMJRefreshBackGifFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackGifFooterBy;
-(JobsReturnMJRefreshBackStateFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackStateFooterBy;
-(JobsReturnMJRefreshBackFooterByRefreshConfigModelBlock _Nonnull)MJRefreshBackFooterBy;
-(JobsReturnMJRefreshFooterByRefreshConfigModelBlock _Nonnull)MJRefreshFooterBy;
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
-(jobsByBOOLBlock _Nonnull)endRefreshing;
/// 停止刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByBOOLBlock _Nonnull)endRefreshingWithNoMoreData;
/// 停止MJHeader的刷新
-(jobsByVoidBlock _Nonnull)endMJHeaderRefreshing;
/// 停止MJFooter的刷新【没有数据的情况，状态为：MJRefreshStateNoMoreData】
-(jobsByVoidBlock _Nonnull)endMJFooterRefreshingWithNoMoreData;
/// 停止MJFooter刷新【可能还有数据的情况，状态为：MJRefreshStateIdle】
-(jobsByVoidBlock _Nonnull)endMJFooterRefreshingWithMoreData;

@end

NS_ASSUME_NONNULL_END
