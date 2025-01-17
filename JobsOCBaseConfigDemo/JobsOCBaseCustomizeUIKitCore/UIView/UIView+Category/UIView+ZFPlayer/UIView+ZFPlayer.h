//
//  UIView+ZFPlayer.h
//  UBallLive
//
//  Created by Jobs on 2020/11/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "DefineConstString.h" /// 常量字符串的定义

#pragma mark —— ZFPlayer 播放器相关
/// Core
#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif
/// AVPlayer
#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
#import <ZFPlayer/ZFAVPlayerManager.h>
#else
#import "ZFAVPlayerManager.h"
#endif
/// ijkplayer
#if __has_include(<ZFPlayer/ZFIJKPlayerManager.h>)
#import <ZFPlayer/ZFIJKPlayerManager.h>
#else
#import "ZFIJKPlayerManager.h"
#endif
/// ControlView
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

#import "CustomZFPlayerControlView.h"/// 播放器控制层

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZFPlayer)
/// 友情提醒，注意代码规范，先配置后播放，否则可能出现各种错
@property(nonatomic,strong,nullable)ZFPlayerController *playerCtr;
@property(nonatomic,strong,nullable)ZFAVPlayerManager *avPlayerManager;//默认不支持FLV流视频格式的
@property(nonatomic,strong,nullable)ZFIJKPlayerManager *ijkPlayerManager;//ZFPlayer的作者告诉我：如果要兼容FLV流视频格式请用这个
@property(nonatomic,strong,nullable)CustomZFPlayerControlView *customPlayerControlView;

-(void)enterBackgroundStopPlayer;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof ZFAVPlayerManager *_Nonnull jobsMakeZFAVPlayerManager(jobsByZFAVPlayerManagerBlock _Nonnull block){
    ZFAVPlayerManager *data = ZFAVPlayerManager.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof ZFIJKPlayerManager *_Nonnull jobsMakeZFIJKPlayerManager(jobsByZFIJKPlayerManagerBlock _Nonnull block){
    ZFIJKPlayerManager *data = ZFIJKPlayerManager.alloc.init;
    if (block) block(data);
    return data;
}

/** 用法
 self.playerManager.assetURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"iph_X" ofType:@"mp4"]];
 @jobs_weakify(self)
 [self.customPlayerControlView actionCustomZFPlayerControlViewBlock:^(NSString *data, NSNumber *data2) {
     @jobs_strongify(self)
     if ([data isEqualToString:@"gestureSingleTapped:"]) {
         if (self.livingVideoViewBlock) {
             self.livingVideoViewBlock(data);
         }
     }
 }];
 */
