//
//  MJRefreshBackStateFooter+Extra.m
//  FM
//
//  Created by User on 9/23/24.
//

#import "MJRefreshBackStateFooter+Extra.h"

@implementation MJRefreshBackStateFooter (Extra)
/// 松开就可以进行刷新的状态【字】
-(JobsReturnMJRefreshViewByStringBlock _Nonnull)refreshStateIdleByString{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSString *_Nullable string){
        @jobs_strongify(self)
        [self setTitle:string forState:MJRefreshStateIdle];
        return self;
    };
}
/// 松开就可以进行刷新的状态【字】
-(JobsReturnMJRefreshViewByStringBlock _Nonnull)refreshStatePullingByString{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSString *_Nullable string){
        @jobs_strongify(self)
        [self setTitle:string forState:MJRefreshStatePulling];
        return self;
    };
}
/// 松开就可以进行刷新的状态【字】
-(JobsReturnMJRefreshViewByStringBlock _Nonnull)refreshStateRefreshingByString{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSString *_Nullable string){
        @jobs_strongify(self)
        [self setTitle:string forState:MJRefreshStateRefreshing];
        return self;
    };
}
/// 松开就可以进行刷新的状态【字】
-(JobsReturnMJRefreshViewByStringBlock _Nonnull)refreshStateWillRefreshByString{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSString *_Nullable string){
        @jobs_strongify(self)
        [self setTitle:string forState:MJRefreshStateWillRefresh];
        return self;
    };
}
/// 松开就可以进行刷新的状态【字】
-(JobsReturnMJRefreshViewByStringBlock _Nonnull)refreshStateNoMoreDataByString{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSString *_Nullable string){
        @jobs_strongify(self)
        [self setTitle:string forState:MJRefreshStateNoMoreData];
        return self;
    };
}

@end
