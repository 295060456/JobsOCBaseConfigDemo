//
//  GifLoopPlayView.m
//  TFRememberHistoryInputContentWithDropList
//
//  Created by Jobs on 2020/9/30.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "GifLoopPlayView.h"

@interface GifLoopPlayView ()

@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation GifLoopPlayView

static dispatch_once_t dispatchOnce;
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
        dispatchOnce = 0;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    dispatch_once(&dispatchOnce, ^{
        self.imageView.alpha = 1;
        self.stopped = NO;// YES: 没有播放，NO：正在播放
    });
}
//  YES - 停止；NO - 播放
-(void)setStopped:(BOOL)stopped{
    _stopped = stopped;
    if(!stopped) {
        [self.imageView startAnimating];
    }else{
        [self.imageView stopAnimating];
        self.imageView.image = self.pauseImage;
    }
}
#pragma mark —— lazyLoad
-(UIImageView *)imageView{
    if (!_imageView) {
        @jobs_weakify(self)
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.frame = self.bounds;
            imageView.image = self.pauseImage;
            imageView.animationImages = (NSArray *)self.gifMutArr; //动画图片数组
            imageView.animationDuration = self.duration;
            imageView.animationRepeatCount = 0;  //动画重复次数，无限循环
            self.addSubview(imageView);
        });
    }return _imageView;
}

-(NSMutableArray<UIImage *> *)gifMutArr{
    if (!_gifMutArr) {
        _gifMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            arr.add(JobsBuddleIMG(nil,@"音律跳动", nil, @"1"));
        });
    }return _gifMutArr;
}

-(CGFloat)duration{
    if (_duration == 0) {
        _duration = 1.5;// 执行一次完整动画所需的时长
    }return _duration;
}

-(UIImage *)pauseImage{
    if (!_pauseImage) {
        _pauseImage = self.gifMutArr[0];
    }return _pauseImage;
}

@end
