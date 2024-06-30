//
//  UIView+MJRefresh.h
//  DouDong-II
//
//  Created by Jobs on 2021/1/17.
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
#import "BaseViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN
/// https://github.com/CoderMJLee/MJRefresh/issues/1495
@interface UIView (MJRefresh)<BaseViewProtocol>
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

@end

NS_ASSUME_NONNULL_END
