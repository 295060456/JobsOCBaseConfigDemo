//
//  MJRefreshBackGifFooter+Extra.m
//  FM
//
//  Created by User on 9/23/24.
//

#import "MJRefreshBackGifFooter+Extra.h"

@implementation MJRefreshBackGifFooter (Extra)
/// 普通闲置状态
-(JobsReturnMJRefreshViewByArrayBlock _Nonnull)refreshStateIdleByImages{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSArray <UIImage *>*_Nullable data){
        @jobs_strongify(self)
        [self setImages:data forState:MJRefreshStateIdle];
        return self;
    };
}
/// 松开就可以进行刷新的状态【图】
-(JobsReturnMJRefreshViewByArrayBlock _Nonnull)refreshStatePullingByImages{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSArray <UIImage *>*_Nullable data){
        @jobs_strongify(self)
        [self setImages:data forState:MJRefreshStatePulling];
        return self;
    };
}
/// 正在刷新中的状态【图】
-(JobsReturnMJRefreshViewByArrayBlock _Nonnull)refreshStateRefreshingByImages{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSArray <UIImage *>*_Nullable data){
        @jobs_strongify(self)
        [self setImages:data forState:MJRefreshStateRefreshing];
        return self;
    };
}
/// 即将刷新的状态【图】
-(JobsReturnMJRefreshViewByArrayBlock _Nonnull)refreshStateWillRefreshByImages{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSArray <UIImage *>*_Nullable data){
        @jobs_strongify(self)
        [self setImages:data forState:MJRefreshStateWillRefresh];
        return self;
    };
}
/// 所有数据加载完毕，没有更多的数据了【图】
-(JobsReturnMJRefreshViewByArrayBlock _Nonnull)refreshStateNoMoreDataByImages{
    @jobs_weakify(self)
    return ^__kindof UIView <MJRefreshProtocol>*_Nullable(__kindof NSArray <UIImage *>*_Nullable data){
        @jobs_strongify(self)
        [self setImages:data forState:MJRefreshStateNoMoreData];
        return self;
    };
}

@end
