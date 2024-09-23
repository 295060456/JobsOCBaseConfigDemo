//
//  MJRefreshAutoStateFooter+Extra.m
//  FM
//
//  Created by User on 9/23/24.
//

#import "MJRefreshAutoStateFooter+Extra.h"

@implementation MJRefreshAutoStateFooter (Extra)
/// 松开就可以进行刷新的状态【字】
-(jobsByStringBlock _Nonnull)refreshStateIdleByString{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data){
        @jobs_strongify(self)
        [self setTitle:data forState:MJRefreshStateIdle];
    };
}
/// 松开就可以进行刷新的状态【字】
-(jobsByStringBlock _Nonnull)refreshStatePullingByString{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data){
        @jobs_strongify(self)
        [self setTitle:data forState:MJRefreshStatePulling];
    };
}
/// 松开就可以进行刷新的状态【字】
-(jobsByStringBlock _Nonnull)refreshStateRefreshingByString{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data){
        @jobs_strongify(self)
        [self setTitle:data forState:MJRefreshStateRefreshing];
    };
}
/// 松开就可以进行刷新的状态【字】
-(jobsByStringBlock _Nonnull)refreshStateWillRefreshByString{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data){
        @jobs_strongify(self)
        [self setTitle:data forState:MJRefreshStateWillRefresh];
    };
}
/// 松开就可以进行刷新的状态【字】
-(jobsByStringBlock _Nonnull)refreshStateNoMoreDataByString{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data){
        @jobs_strongify(self)
        [self setTitle:data forState:MJRefreshStateNoMoreData];
    };
}

@end
