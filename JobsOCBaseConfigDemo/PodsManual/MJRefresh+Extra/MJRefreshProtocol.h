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
@optional
/// 普通闲置状态【图】
-(jobsByArrayBlock _Nonnull)refreshStateIdleByImages;
/// 松开就可以进行刷新的状态【图】
-(jobsByArrayBlock _Nonnull)refreshStatePullingByImages;
/// 正在刷新中的状态【图】
-(jobsByArrayBlock _Nonnull)refreshStateRefreshingByImages;
/// 即将刷新的状态【图】
-(jobsByArrayBlock _Nonnull)refreshStateWillRefreshByImages;
/// 所有数据加载完毕，没有更多的数据了【图】
-(jobsByArrayBlock _Nonnull)refreshStateNoMoreDataByImages;
/// 松开就可以进行刷新的状态【字】
-(jobsByStringBlock _Nonnull)refreshStateIdleByString;
/// 松开就可以进行刷新的状态【字】
-(jobsByStringBlock _Nonnull)refreshStatePullingByString;
/// 松开就可以进行刷新的状态【字】
-(jobsByStringBlock _Nonnull)refreshStateRefreshingByString;
/// 松开就可以进行刷新的状态【字】
-(jobsByStringBlock _Nonnull)refreshStateWillRefreshByString;
/// 松开就可以进行刷新的状态【字】
-(jobsByStringBlock _Nonnull)refreshStateNoMoreDataByString;

@end

NS_ASSUME_NONNULL_END
