//
//  MJRefreshGifHeader+Extra.m
//  FM
//
//  Created by User on 9/23/24.
//

#import "MJRefreshGifHeader+Extra.h"

@implementation MJRefreshGifHeader (Extra)
/// 普通闲置状态
-(jobsByArrayBlock _Nonnull)refreshStateIdleByImages{
    @jobs_weakify(self)
    return ^(__kindof NSArray <UIImage *>*_Nullable data){
        @jobs_strongify(self)
        [self setImages:data forState:MJRefreshStateIdle];
    };
}
/// 松开就可以进行刷新的状态【图】
-(jobsByArrayBlock _Nonnull)refreshStatePullingByImages{
    @jobs_weakify(self)
    return ^(__kindof NSArray <UIImage *>*_Nullable data){
        @jobs_strongify(self)
        [self setImages:data forState:MJRefreshStatePulling];
    };
}
/// 正在刷新中的状态【图】
-(jobsByArrayBlock _Nonnull)refreshStateRefreshingByImages{
    @jobs_weakify(self)
    return ^(__kindof NSArray <UIImage *>*_Nullable data){
        @jobs_strongify(self)
        [self setImages:data forState:MJRefreshStateRefreshing];
    };
}
/// 即将刷新的状态【图】
-(jobsByArrayBlock _Nonnull)refreshStateWillRefreshByImages{
    @jobs_weakify(self)
    return ^(__kindof NSArray <UIImage *>*_Nullable data){
        @jobs_strongify(self)
        [self setImages:data forState:MJRefreshStateWillRefresh];
    };
}
/// 所有数据加载完毕，没有更多的数据了【图】
-(jobsByArrayBlock _Nonnull)refreshStateNoMoreDataByImages{
    @jobs_weakify(self)
    return ^(__kindof NSArray <UIImage *>*_Nullable data){
        @jobs_strongify(self)
        [self setImages:data forState:MJRefreshStateNoMoreData];
    };
}

@end
