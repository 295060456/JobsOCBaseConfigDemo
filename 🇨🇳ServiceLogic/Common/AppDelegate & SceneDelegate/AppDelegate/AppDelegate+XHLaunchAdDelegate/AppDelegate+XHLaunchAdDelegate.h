//
//  AppDelegate+XHLaunchAdDelegate.h
//  UBallLive
//
//  Created by Jobs on 2020/10/11.
//

#import "AppDelegate.h"

#if __has_include(<XHLaunchAd/XHLaunchAd.h>)
#import <XHLaunchAd/XHLaunchAd.h>
#else
#import "XHLaunchAd.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (XHLaunchAdDelegate)

@end

NS_ASSUME_NONNULL_END
