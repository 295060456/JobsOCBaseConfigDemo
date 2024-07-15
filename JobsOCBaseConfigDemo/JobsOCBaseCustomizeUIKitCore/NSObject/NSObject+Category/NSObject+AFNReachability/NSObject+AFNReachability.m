//
//  NSObject+AFNReachability.m
//  UBallLive
//
//  Created by Jobs on 2020/11/5.
//

#import "NSObject+AFNReachability.h"

@implementation NSObject (AFNReachability)
/// 监听网络状态的改变
+(void)AFNReachability:(jobsByNSIntegerBlock)statusBlock{
    /*
     AFNetworkReachabilityStatusUnknown          = 未知
     AFNetworkReachabilityStatusNotReachable     = 没有网络
     AFNetworkReachabilityStatusReachableViaWWAN = 3G
     AFNetworkReachabilityStatusReachableViaWiFi = WIFI
     */
    AFNetworkReachabilityManager *networkReachabilityManager = AFNetworkReachabilityManager.sharedManager;
    /// 如果没有请求完成就检测网络
    @weakify(networkReachabilityManager)
    [networkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (statusBlock) statusBlock(status);
        JobsPostNotification(JobsAFNReachabilityStatus, @(status));
        @strongify(networkReachabilityManager)
        [networkReachabilityManager startMonitoring];
    }];
}

@end

