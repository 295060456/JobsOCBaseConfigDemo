//
//  WGradientProgress.m
//  WGradientProgressDemo
//
//  Created by zilin_weng on 15/7/19.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "WGradientProgress.h"

@interface WGradientProgress ()
/// UI
@property(nonatomic,strong)CALayer *roadLayer;//跑道 即将运行的轨迹
@property(nonatomic,strong)CALayer *fenceLayer;//栅栏
@property(nonatomic,strong)CAGradientLayer *__block gradLayer;//通过改变layer的宽度来实现进度 运动员
/// Data
@property(nonatomic,strong)NSTimerManager *nsTimerManager_color;//主管线条颜色的翻滚
@property(nonatomic,strong)NSTimerManager *nsTimerManager_length;//主管线条长度的递增
@property(nonatomic,strong)NSMutableArray *colors;

@end

@implementation WGradientProgress

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsBrownColor;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;//自动调整view的宽度，保证左边距和右边距不变
    }return self;
}

-(void)makeTimer_color{
    //启动方式——1
    self.nsTimerManager_color.nsTimeStartWithRunLoop(nil);
    //启动方式——2
//    self.nsTimerManager.nsTimeStartSysAutoInRunLoop();
}

-(void)makeTimer_length{
    //启动方式——1
    self.nsTimerManager_length.nsTimeStartWithRunLoop(nil);
    //启动方式——2
//    self.nsTimerManager.nsTimeStartSysAutoInRunLoop();
}

-(void)showOnParent{
    if (self.isShowRoad) {
        self.roadLayer.hidden = NO;
    }
    
    self.gradLayer.hidden = NO;
    
    if (self.isShowFence) {
        self.fenceLayer.hidden = NO;
    }
}
/// 开始
-(void)start{
    if (self.progressType == WGradientProgressType_colorRoll) {
        [self makeTimer_color];
    }
    [self makeTimer_length];
}
/// 暂停
-(void)pause{
    [self.nsTimerManager_length nsTimePause];
}
/// 重新开始
-(void)resume{
    [self.nsTimerManager_length nsTimecontinue];
}
/// 归位
-(void)reset{
    //定时器归位
    [self.nsTimerManager_color nsTimeDestroy];
    [self.nsTimerManager_length nsTimeDestroy];
    //UI归位
    self.gradLayer.frame = CGRectZero;
}

-(void)hide{
    [self.nsTimerManager_color nsTimePause];
    if ([self superview]) {
        [self removeFromSuperview];
    }
}

-(void)setProgress:(CGFloat)progress{
    if (progress < 0) {
        progress = 0;
    }
    if (progress > 1) {
        progress = 1;
    }
    _progress = progress;
    self.gradLayer.frame = CGRectMake(0,
                                      0,
                                      progress * self.width,
                                      self.mj_h);
}

-(void)timerFunc{
    CAGradientLayer *gradLayer = self.gradLayer;
    NSMutableArray *copyArray = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        [data addObjectsFromArray:gradLayer.colors];
    });
    UIColor *lastColor = copyArray.lastObject;
    [copyArray removeLastObject];
    if (lastColor) {
        [copyArray insertObject:lastColor atIndex:0];
    }self.gradLayer.colors = copyArray;
}
#pragma mark —— lazyLoad
-(CGFloat)increment{
    if (!_increment) {
        _increment = 0.1;
    }return _increment;
}

-(NSTimeInterval)color_timeInterval{
    if (!_color_timeInterval) {
        _color_timeInterval = 0.03;
    }return _color_timeInterval;
}

-(NSTimeInterval)length_timeInterval{
    if (!_length_timeInterval) {
        _length_timeInterval = 1;
    }return _length_timeInterval;
}

-(NSTimeInterval)length_timeSecIntervalSinceDate{
    if (!_length_timeSecIntervalSinceDate) {
        _length_timeSecIntervalSinceDate = 2;
    }return _length_timeSecIntervalSinceDate;
}

-(NSTimerManager *)nsTimerManager_color{
    if (!_nsTimerManager_color) {
        @jobs_weakify(self)
        _nsTimerManager_color = jobsMakeTimerManager(^(NSTimerManager * _Nullable data) {
            @jobs_strongify(self)
            data.timeInterval = self.color_timeInterval;
            data.timerStyle = TimerStyle_clockwise;
            @jobs_weakify(self)
            [data actionObjectBlock:^(UIButtonModel *data) {
                @jobs_strongify(self)
                switch (data.timerProcessType) {
                    case TimerProcessType_ready:{
                        
                    }break;
                    case TimerProcessType_running:{
                        [self timerFunc];
                    }break;
                    case TimerProcessType_end:{
                        NSLog(@"我死球了");
                    }break;
                        
                    default:
                        break;
                }
            }];
        });
    }return _nsTimerManager_color;
}

-(NSTimerManager *)nsTimerManager_length{
    if (!_nsTimerManager_length) {
        @jobs_weakify(self)
        _nsTimerManager_length = jobsMakeTimerManager(^(NSTimerManager *_Nullable data) {
            @jobs_strongify(self)
            data.timeInterval = self.length_timeInterval;
            data.timeSecIntervalSinceDate = self.length_timeSecIntervalSinceDate;
            data.timerStyle = TimerStyle_clockwise;
            [data actionObjectBlock:^(UIButtonModel *data) {
                @jobs_strongify(self)
                switch (data.timerProcessType) {
                    case TimerProcessType_ready:{
                        
                    }break;
                    case TimerProcessType_running:{
                        if (self.progress < 1) {
                            [self start];
                            
                            WGradientProgressModel *model = WGradientProgressModel.new;
                            model.progress = self.progress;
                            model.gradLayer = self.gradLayer;
                            
                            if (self.objectBlock) self.objectBlock(model);
                            
                            self.progress += self.increment;
                        }else{
                            [self.nsTimerManager_length nsTimeDestroy];//销毁
                        }
                    }break;
                    case TimerProcessType_end:{
                        NSLog(@"我死球了");
                    }break;
                        
                    default:
                        break;
                }
            }];
        });
    }return _nsTimerManager_length;
}

-(NSMutableArray *)colors{
    if (!_colors) {
        @jobs_weakify(self)
        _colors = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            for (NSInteger deg = 0; deg <= 360; deg += 5) {
                if (self.progressType == WGradientProgressType_colorNormal) {
                    data.add((id)self.progressColor.CGColor);
                }else{
                    data.add((id)jobsMakeCor2(^(JobsCorModel * _Nullable data1) {
                        data1.hue = 1.0 * deg / 360.0;
                        data1.saturation = 1.f;
                        data1.brightness = 1.f;
                        data1.alpha = 1.f;
                    }).CGColor);
                }
            }
        });
    }return _colors;
}

-(CAGradientLayer *)gradLayer{
    if (!_gradLayer) {
        @jobs_weakify(self)
        _gradLayer = jobsMakeCAGradientLayer(^(__kindof CAGradientLayer * _Nullable data) {
            @jobs_strongify(self)
            data.frame = CGRectZero;
            data.borderWidth = 1;
            data.startPoint = CGPointMake(0, 0);
            data.endPoint = CGPointMake(1, 1);
            data.colors = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                [data addObjectsFromArray:self.colors];
            });[self.layer addSublayer:data];
        });
    }return _gradLayer;
}

-(CALayer *)roadLayer{
    if (!_roadLayer) {
        @jobs_weakify(self)
        _roadLayer = jobsMakeCALayer(^(__kindof CALayer * _Nullable data) {
            @jobs_strongify(self)
            data.frame = self.bounds;
            data.backgroundColor = JobsLightGrayColor.CGColor;
            [self.layer addSublayer:data];
        });
    }return _roadLayer;
}

-(CALayer *)fenceLayer{
    if (!_fenceLayer) {
        @jobs_weakify(self)
        _fenceLayer = jobsMakeCALayer(^(__kindof CALayer * _Nullable data) {
            @jobs_strongify(self)
            data.frame = CGRectMake(self.fenceLayer_x,
                                    0,
                                    self.fenceLayer_width,
                                    self.mj_h);
            data.backgroundColor = self.fenceLayerColor.CGColor;
            [self.gradLayer addSublayer:data];
        });
    }return _fenceLayer;
}

-(CGFloat)fenceLayer_x{
    if (!_fenceLayer_x) {
        _fenceLayer_x = self.width * 0.3;
    }return _fenceLayer_x;
}

-(CGFloat)fenceLayer_width{
    if (!_fenceLayer_width) {
        _fenceLayer_width = 5;
    }return _fenceLayer_width;
}

-(UIColor *)fenceLayerColor{
    if (!_fenceLayerColor) {
        _fenceLayerColor = JobsRandomColor;
    }return _fenceLayerColor;
}

-(UIColor *)progressColor{
    if (!_progressColor) {
        _progressColor = JobsRedColor;
    }return _progressColor;
}

@end

@implementation WGradientProgressModel
 
@end
