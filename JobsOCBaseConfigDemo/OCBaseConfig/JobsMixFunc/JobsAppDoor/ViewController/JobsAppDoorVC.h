//
//  JobsAppDoor.h
//  My_BaseProj
//
//  Created by Jobs on 2020/12/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "NSObject+CurrentDevice.h"
#import "BaseViewController.h"
#import "JobsAppDoorContentView.h"
#import "CustomZFPlayerControlView.h"
#import "JobsAppDoorLogoContentView.h"
#import "JobsAppDoorConfig.h"

#import "JobsAppDoorForgotCodeContentView.h"//忘记密码

#pragma mark —— ZFPlayer 播放器相关
//Core
#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif
//AVPlayer
#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
#import <ZFPlayer/ZFAVPlayerManager.h>
#else
#import "ZFAVPlayerManager.h"
#endif
//ijkplayer
#if __has_include(<ZFPlayer/ZFIJKPlayerManager.h>)
#import <ZFPlayer/ZFIJKPlayerManager.h>
#else
#import "ZFIJKPlayerManager.h"
#endif
//ControlView
#if __has_include(<ZFPlayer/UIImageView+ZFCache.h>)
#import <ZFPlayer/UIImageView+ZFCache.h>
#else
#import "UIImageView+ZFCache.h"
#endif

#if __has_include(<ZFPlayer/UIView+ZFFrame.h>)
#import <ZFPlayer/UIView+ZFFrame.h>
#else
#import "UIView+ZFFrame.h"
#endif

#if __has_include(<ZFPlayer/ZFLandScapeControlView.h>)
#import <ZFPlayer/ZFLandScapeControlView.h>
#else
#import "ZFLandScapeControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFLoadingView.h>)
#import <ZFPlayer/ZFLoadingView.h>
#else
#import "ZFLoadingView.h"
#endif

#if __has_include(<ZFPlayer/ZFNetworkSpeedMonitor.h>)
#import <ZFPlayer/ZFNetworkSpeedMonitor.h>
#else
#import "ZFNetworkSpeedMonitor.h"
#endif

#if __has_include(<ZFPlayer/ZFPlayerControlView.h>)
#import <ZFPlayer/ZFPlayerControlView.h>
#else
#import "ZFPlayerControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFPortraitControlView.h>)
#import <ZFPlayer/ZFPortraitControlView.h>
#else
#import "ZFPortraitControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFSliderView.h>)
#import <ZFPlayer/ZFSliderView.h>
#else
#import "ZFSliderView.h"
#endif

#if __has_include(<ZFPlayer/ZFSmallFloatControlView.h>)
#import <ZFPlayer/ZFSmallFloatControlView.h>
#else
#import "ZFSmallFloatControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFSpeedLoadingView.h>)
#import <ZFPlayer/ZFSpeedLoadingView.h>
#else
#import "ZFSpeedLoadingView.h"
#endif

#if __has_include(<ZFPlayer/ZFUtilities.h>)
#import <ZFPlayer/ZFUtilities.h>
#else
#import "ZFUtilities.h"
#endif

#if __has_include(<ZFPlayer/ZFVolumeBrightnessView.h>)
#import <ZFPlayer/ZFVolumeBrightnessView.h>
#else
#import "ZFVolumeBrightnessView.h"
#endif

#import "CustomZFPlayerControlView.h"//播放器的控制层

NS_ASSUME_NONNULL_BEGIN
//高仿蜜柚
@interface JobsAppDoorVC : BaseViewController
/// 进此页面先自动跳转到注册页面
-(void)toRegister;

@end

NS_ASSUME_NONNULL_END
