//
//  PlayerCell.m
//  DouYin
//
//  Created by Jobs on 2020/9/23.
//

#import "JobsPlayerTBVCell.h"

@interface JobsPlayerTBVCell ()
/// UI
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong,nullable)ZFPlayerController *player;
@property(nonatomic,strong,nullable)CustomZFPlayerControlView *customPlayerControlView;
/// Data
@property(nonatomic,strong,nullable)ZFAVPlayerManager *playerManager;
@property(nonatomic,strong)VideoModel_Core *videoModel_Core;
@property(nonatomic,strong)NSMutableArray <NSURL *>*assetURLs;

@end

@implementation JobsPlayerTBVCell
@synthesize index = _index;
-(void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
}

-(instancetype)init{
    if(self = [super init]){
        @jobs_weakify(self)
        [self addNotificationObserverWithName:@"noti1"
                                selectorBlock:^(id data,
                                                id data2) {
            @jobs_strongify(self)
            [self.player.currentPlayerManager stop];
            self.player = nil;
            self.playerManager = nil;
            [self.customPlayerControlView removeFromSuperview];
            self.customPlayerControlView = nil;
        }];
    }return self;
}

+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    JobsPlayerTBVCell *cell = (JobsPlayerTBVCell *)[tableView tableViewCellClass:JobsPlayerTBVCell.class];
    if (!cell) {
        cell = [JobsPlayerTBVCell initTableViewCellWithStyle:UITableViewCellStyleSubtitle];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = JobsRandomColor;
    }return cell;
}
#pragma mark —— BaseCellProtocol
+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return JobsMainScreen_HEIGHT();
}

-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    if ([model isKindOfClass:UIViewModel.class]) {
        self.viewModel = model;
        self.label.text = [NSString stringWithFormat:@"%ld",(long)self.viewModel.row];
        self.videoModel_Core = (VideoModel_Core *)self.viewModel.data;
    }
}
#pragma mark —— Get方法
-(ZFPlayerController *)getPlayer{
    return self.player;
}
#pragma mark —— lazyLoad
-(UILabel *)label{
    if (!_label) {
        _label = UILabel.new;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = UIFontWeightRegularSize(100);
        _label.backgroundColor = self.contentView.backgroundColor;
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _label;
}

-(ZFAVPlayerManager *)playerManager{
    if (!_playerManager) {
        _playerManager = ZFAVPlayerManager.new;
        _playerManager.shouldAutoPlay = YES;
        NSLog(@"videoIdcUrl = %@",self.videoModel_Core.videoIdcUrl);
        _playerManager.assetURL = self.videoModel_Core.videoIdcUrl.jobsUrl;
    }return _playerManager;
}

-(CustomZFPlayerControlView *)customPlayerControlView{
    if (!_customPlayerControlView) {
        _customPlayerControlView = CustomZFPlayerControlView.new;
        @jobs_weakify(self)
        [_customPlayerControlView actionCustomZFPlayerControlViewBlock:^(NSString *data, NSNumber *data2) {
            @jobs_strongify(self)
            if ([data isEqualToString:@"gestureEndedPan:panDirection:panLocation:"]) {
                if (data2.intValue == ZFPanMovingDirectionTop) {
                    if(self.objectBlock)self.objectBlock([JobsTuple.alloc initWithValues:@0,@(self.index), nil]);
                }else if (data2.intValue == ZFPanMovingDirectionBottom){
                    if(self.objectBlock)self.objectBlock([JobsTuple.alloc initWithValues:@1,@(self.index), nil]);
                }else{}
            }
        }];
    }return _customPlayerControlView;
}

-(ZFPlayerController *)player{
    if (!_player) {
        @jobs_weakify(self)
        _player = [ZFPlayerController.alloc initWithPlayerManager:self.playerManager
                                                    containerView:self.contentView];
        _player.controlView = self.customPlayerControlView;
//        _player.assetURLs = self.assetURLs;
//        ZFPlayer_DoorVC = _player;
        [_player setPlayerDidToEnd:^(id<ZFPlayerMediaPlayback> _Nonnull asset) {
            @jobs_strongify(self)
            [self.playerManager replay];//设置循环播放
        }];
    }return _player;
}

-(NSMutableArray<NSURL *> *)assetURLs{
    if (!_assetURLs) {
        [_assetURLs addObject:@"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4".jobsUrl];
        [_assetURLs addObject:@"https://www.apple.com/105/media/cn/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/bruce/mac-bruce-tpl-cn-2018_1280x720h.mp4".jobsUrl];
        [_assetURLs addObject:@"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/peter/mac-peter-tpl-cc-us-2018_1280x720h.mp4".jobsUrl];
        [_assetURLs addObject:@"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/grimes/mac-grimes-tpl-cc-us-2018_1280x720h.mp4".jobsUrl];
        [_assetURLs addObject:@"https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7194236f31b2e1e3da0fe06cfed4ba2b.mp4".jobsUrl];
        [_assetURLs addObject:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4".jobsUrl];
        [_assetURLs addObject:@"http://vjs.zencdn.net/v/oceans.mp4".jobsUrl];
        [_assetURLs addObject:@"https://media.w3.org/2010/05/sintel/trailer.mp4".jobsUrl];
        [_assetURLs addObject:@"http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4".jobsUrl];
        [_assetURLs addObject:@"https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_2mb.mp4".jobsUrl];
    }return _assetURLs;
}

@end
