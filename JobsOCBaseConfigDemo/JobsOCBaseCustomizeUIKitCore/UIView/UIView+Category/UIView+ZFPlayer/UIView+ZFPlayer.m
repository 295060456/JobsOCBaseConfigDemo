//
//  UIView+ZFPlayer.m
//  UBallLive
//
//  Created by Jobs on 2020/11/3.
//

#import "UIView+ZFPlayer.h"

@implementation UIView (ZFPlayer)
#pragma mark —— 一些公有方法
-(void)enterBackgroundStopPlayer{
    @jobs_weakify(self)
    [NSNotificationCenter.defaultCenter addObserverForName:UBLEnterBackgroundStopPlayer
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification * _Nonnull notification) {
        @jobs_strongify(self)
        NSString *notificationName = notification.name;
        if (objc_getAssociatedObject(self, _avPlayerManager)) {
            [self.avPlayerManager stop];
        }
        
        if (objc_getAssociatedObject(self, _ijkPlayerManager)) {
            [self.ijkPlayerManager stop];
        }
    }];
}
#pragma mark —— @property(nonatomic,strong,nullable)ZFPlayerController *playerCtr;
JobsKey(_playerCtr)
@dynamic playerCtr;
-(ZFPlayerController *)playerCtr{
    ZFPlayerController *PlayerCtr = Jobs_getAssociatedObject(_playerCtr);
    if (!PlayerCtr) {
        if (objc_getAssociatedObject(self, _avPlayerManager)) {
            @jobs_weakify(self)
            PlayerCtr = [ZFPlayerController.alloc initWithPlayerManager:self.avPlayerManager
                                                          containerView:self];
            PlayerCtr.controlView = self.customPlayerControlView;
            NSLog(@"%@",PlayerCtr.controlView);
            PlayerCtr.muted = YES;//静音播放
            [PlayerCtr setPlayerDidToEnd:^(id<ZFPlayerMediaPlayback>  _Nonnull asset) {
                @jobs_strongify(self)
                [self.avPlayerManager replay];//设置循环播放
            }];
        }
        
        if (objc_getAssociatedObject(self, _ijkPlayerManager)) {
            @jobs_weakify(self)
            PlayerCtr = [ZFPlayerController.alloc initWithPlayerManager:self.ijkPlayerManager
                                                          containerView:self];
            PlayerCtr.controlView = self.customPlayerControlView;
            NSLog(@"%@",PlayerCtr.controlView);
            PlayerCtr.muted = YES;//静音播放
            [PlayerCtr setPlayerDidToEnd:^(id<ZFPlayerMediaPlayback>  _Nonnull asset) {
                @jobs_strongify(self)
                [self.ijkPlayerManager replay];//设置循环播放
            }];
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_playerCtr, PlayerCtr)
    }return PlayerCtr;
}

-(void)setPlayerCtr:(ZFPlayerController *)playerCtr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_playerCtr, playerCtr)
}
#pragma mark —— @property(nonatomic,strong,nullable)ZFAVPlayerManager *avPlayerManager;//默认不支持FLV流视频格式的
JobsKey(_avPlayerManager)
@dynamic avPlayerManager;
-(ZFAVPlayerManager *)avPlayerManager{
    ZFAVPlayerManager *AVPlayerManager = Jobs_getAssociatedObject(_avPlayerManager);
    if (!AVPlayerManager) {
        AVPlayerManager = ZFAVPlayerManager.new;
        AVPlayerManager.shouldAutoPlay = YES;
//        {
//            NSString *str = @"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4";//苹果官方给出的测试地址
//            AVPlayerManager.assetURL = str.jobsUrl;
//            AVPlayerManager.assetURL = [NSURL fileURLWithPath:[NSBundle.mainBundle pathForResource:@"iph_X" ofType:@"mp4"]];
//        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_avPlayerManager, AVPlayerManager)
    }return AVPlayerManager;
}

-(void)setAvPlayerManager:(ZFAVPlayerManager *)avPlayerManager{
    Jobs_setAssociatedRETAIN_NONATOMIC(_avPlayerManager, avPlayerManager)
}
#pragma mark —— @property(nonatomic,strong,nullable)ZFIJKPlayerManager *ijkPlayerManager;//ZFPlayer的作者告诉我：如果要兼容FLV流视频格式请用这个
JobsKey(_ijkPlayerManager)
@dynamic ijkPlayerManager;
-(ZFIJKPlayerManager *)ijkPlayerManager{
    ZFIJKPlayerManager *IJKPlayerManager = Jobs_getAssociatedObject(_ijkPlayerManager);
    if (!IJKPlayerManager) {
        IJKPlayerManager = ZFIJKPlayerManager.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_ijkPlayerManager, IJKPlayerManager)
    }return IJKPlayerManager;
}

-(void)setIjkPlayerManager:(ZFIJKPlayerManager *)ijkPlayerManager{
    Jobs_setAssociatedRETAIN_NONATOMIC(_ijkPlayerManager, ijkPlayerManager)
}
#pragma mark —— @property(nonatomic,strong,nullable)CustomZFPlayerControlView *customPlayerControlView;
JobsKey(_customPlayerControlView)
@dynamic customPlayerControlView;
-(CustomZFPlayerControlView *)customPlayerControlView{
    CustomZFPlayerControlView *playerControlView = Jobs_getAssociatedObject(_customPlayerControlView);
    if (!playerControlView) {
        playerControlView = CustomZFPlayerControlView.new;
//        playerControlView.frame = self.bounds;
        Jobs_setAssociatedRETAIN_NONATOMIC(_customPlayerControlView, playerControlView)
    }return playerControlView;
}

-(void)setCustomPlayerControlView:(CustomZFPlayerControlView *)customPlayerControlView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_customPlayerControlView, customPlayerControlView)
}

@end



