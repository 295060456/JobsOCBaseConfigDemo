//
//  UIViewController+MJRefresh.h
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#import "NSObject+Extras.h"

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

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#import "LOTAnimationMJRefreshHeader.h"
#import "MJRefreshConfigModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (MJRefresh)
#pragma mark —— 配置信息
Prop_strong()MJRefreshConfigModel *refreshConfigHeader;/// 头部的配置信息
Prop_strong()MJRefreshConfigModel *refreshConfigFooter;/// 尾部的配置信息
#pragma mark —— MJRefreshHeader
Prop_strong()LOTAnimationMJRefreshHeader *lotAnimMJRefreshHeader;
Prop_strong()MJRefreshNormalHeader *mjRefreshNormalHeader;
Prop_strong()MJRefreshStateHeader *mjRefreshStateHeader;
Prop_strong()MJRefreshHeader *mjRefreshHeader;
Prop_strong()MJRefreshGifHeader *mjRefreshGifHeader;
#pragma mark —— MJRefreshFooter
Prop_strong()MJRefreshAutoGifFooter *mjRefreshAutoGifFooter;
Prop_strong()MJRefreshBackNormalFooter *mjRefreshBackNormalFooter;
Prop_strong()MJRefreshAutoNormalFooter *mjRefreshAutoNormalFooter;
Prop_strong()MJRefreshAutoStateFooter *mjRefreshAutoStateFooter;
Prop_strong()MJRefreshAutoFooter *mjRefreshAutoFooter;
Prop_strong()MJRefreshBackGifFooter *mjRefreshBackGifFooter;
Prop_strong()MJRefreshBackStateFooter *mjRefreshBackStateFooter;
Prop_strong()MJRefreshBackFooter *mjRefreshBackFooter;
Prop_strong()MJRefreshFooter *mjRefreshFooter;

@end

NS_ASSUME_NONNULL_END

/**
 进页面的时候必须先走下拉刷新。当数据源有值的时候，tableview的content会被撑开，mj_footer会监视这个content，也可以理解为数据源
 数据源是否有值，是决定mj_footer 是否存在的先决条件
 **/
/**
{
    MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
    refreshConfigHeader.stateIdleTitle = @"下拉刷新".tr;
    refreshConfigHeader.pullingTitle = @"下拉刷新".tr;
    refreshConfigHeader.refreshingTitle = @"立即释放刷新".tr;
    refreshConfigHeader.willRefreshTitle = @"刷新数据".tr;
    refreshConfigHeader.noMoreDataTitle = @"下拉刷新".tr;
    refreshConfigHeader.loadBlock = ^id _Nullable(id  _Nullable data) {
        return nil;
    };
    
    MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
    refreshConfigFooter.stateIdleTitle = @"".tr;
    refreshConfigFooter.pullingTitle = @"".tr;
    refreshConfigFooter.refreshingTitle = @"".tr;
    refreshConfigFooter.willRefreshTitle = @"".tr;
    refreshConfigFooter.noMoreDataTitle = @"".tr;
    
    self.lotAnimMJRefreshHeader.refreshConfigModel = refreshConfigHeader;
    self.refreshConfigFooter = refreshConfigFooter;//数据赋值
 
    _tableView.mj_header = self.lotAnimMJRefreshHeader;
    _tableView.mj_footer = self.mjRefreshAutoNormalFooter;
    self.view.mjRefreshTargetView = _tableView;
}
*/

/**
 {
     MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
     refreshConfigHeader.stateIdleTitle = @"下拉刷新".tr;
     refreshConfigHeader.pullingTitle = @"下拉刷新".tr;
     refreshConfigHeader.refreshingTitle = @"立即释放刷新".tr;
     refreshConfigHeader.willRefreshTitle = @"刷新数据".tr;
     refreshConfigHeader.noMoreDataTitle = @"下拉刷新".tr;
     refreshConfigFooter.loadBlock = ^id _Nullable(id  _Nullable data) {
         return nil;
     };
     self.refreshConfigHeader = mJRefreshConfigModel;//数据赋值
 
     _tableView.mj_header = self.mjRefreshNormalHeader;
     _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
     self.view.mjRefreshTargetView = _tableView;
 }
 */
