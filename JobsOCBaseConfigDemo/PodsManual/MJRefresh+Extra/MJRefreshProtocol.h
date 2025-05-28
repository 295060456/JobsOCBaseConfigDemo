//
//  MJRefreshProtocol.h
//  FM
//
//  Created by User on 9/23/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
NS_ASSUME_NONNULL_BEGIN

@protocol MJRefreshProtocol <NSObject>
typedef __kindof UIView <MJRefreshProtocol>*_Nullable(^JobsReturnMJRefreshViewByStringBlock)(__kindof NSString *_Nullable string);
typedef __kindof UIView <MJRefreshProtocol>*_Nullable(^JobsReturnMJRefreshViewByArrayBlock)(__kindof NSArray <NSObject *>*_Nullable data);
@optional
/// 普通闲置状态【图】
-(JobsReturnMJRefreshViewByArrayBlock _Nonnull)refreshStateIdleByImages;
/// 松开就可以进行刷新的状态【图】
-(JobsReturnMJRefreshViewByArrayBlock _Nonnull)refreshStatePullingByImages;
/// 正在刷新中的状态【图】
-(JobsReturnMJRefreshViewByArrayBlock _Nonnull)refreshStateRefreshingByImages;
/// 即将刷新的状态【图】
-(JobsReturnMJRefreshViewByArrayBlock _Nonnull)refreshStateWillRefreshByImages;
/// 所有数据加载完毕，没有更多的数据了【图】
-(JobsReturnMJRefreshViewByArrayBlock _Nonnull)refreshStateNoMoreDataByImages;
/// 松开就可以进行刷新的状态【字】
-(JobsReturnMJRefreshViewByStringBlock _Nonnull)refreshStateIdleByString;
/// 松开就可以进行刷新的状态【字】
-(JobsReturnMJRefreshViewByStringBlock _Nonnull)refreshStatePullingByString;
/// 松开就可以进行刷新的状态【字】
-(JobsReturnMJRefreshViewByStringBlock _Nonnull)refreshStateRefreshingByString;
/// 松开就可以进行刷新的状态【字】
-(JobsReturnMJRefreshViewByStringBlock _Nonnull)refreshStateWillRefreshByString;
/// 松开就可以进行刷新的状态【字】
-(JobsReturnMJRefreshViewByStringBlock _Nonnull)refreshStateNoMoreDataByString;

@end

NS_ASSUME_NONNULL_END
