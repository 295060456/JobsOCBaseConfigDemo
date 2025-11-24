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
Prop_strong()CALayer *roadLayer;                 // 跑道 即将运行的轨迹
Prop_strong()CALayer *fenceLayer;                // 栅栏
Prop_strong()CAGradientLayer *gradLayer;         // 通过改变layer的宽度来实现进度 运动员
/// Data
Prop_strong()JobsTimer *timer_color;             // 主管线条颜色的翻滚
Prop_strong()JobsTimer *timer_length;            // 主管线条长度的递增
Prop_strong()NSMutableArray *colors;

@end

@implementation WGradientProgress

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsBrownColor;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth; // 自动调整view的宽度，保证左边距和右边距不变
    }return self;
}

-(void)makeTimer_color{
    [self.timer_color start];
}

-(void)makeTimer_length{
    [self.timer_length start];
}

-(void)showOnParent{
    if (self.isShowRoad) self.roadLayer.hidden = NO;
    self.gradLayer.hidden = NO;
    if (self.isShowFence) self.fenceLayer.hidden = NO;
}
/// 开始
-(void)start{
    if (self.progressType == WGradientProgressType_colorRoll) [self makeTimer_color];
    [self makeTimer_length];
}
/// 暂停
-(void)pause{
    [self.timer_length pause];
}
/// 重新开始
-(void)resume{
    [self.timer_length resume];
}
/// 归位
-(void)reset{
    /// 定时器归位
    [self.timer_color stop];
    [self.timer_length stop];
    /// UI归位
    self.gradLayer.frame = CGRectZero;
}

-(void)hide{
    [self.timer_color pause];
    if ([self superview]) [self removeFromSuperview];
}

-(void)setProgress:(CGFloat)progress{
    if (progress < 0) progress = 0;
    if (progress > 1) progress = 1;
    _progress = progress;
    self.gradLayer.frame = CGRectMake(0,
                                      0,
                                      progress * self.width,
                                      self.mj_h);
}

-(void)timerFunc{
    CAGradientLayer *gradLayer = self.gradLayer;
    NSMutableArray *copyArray = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data.addBy(gradLayer.colors);
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

-(JobsTimer *)timer_color{
    if (!_timer_color) {
        @jobs_weakify(self)
        _timer_color = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.byTimerType(JobsTimerTypeNSTimer)
            .byTimerStyle(TimerStyle_anticlockwise) // 倒计时模式
            .byTimeInterval(self.color_timeInterval)
            .byTimeSecIntervalSinceDate(0)
            .byQueue(dispatch_get_main_queue())
            .byTimerState(JobsTimerStateIdle)
            .byStartTime(0)
            .byTime(0)
            .byOnTick(^(CGFloat time){
                @jobs_strongify(self)
                if (self.progress < 1) {
                    [self start];
                    if (self.objBlock) self.objBlock(jobsMakeWGradientProgressModel(^(__kindof WGradientProgressModel * _Nullable model) {
                        @jobs_strongify(self)
                        model.progress = self.progress;
                        model.gradLayer = self.gradLayer;
                    }));

                    self.progress += self.increment;
                }else [self->_timer_length stop];/// 销毁
            })
            .byOnFinish(^(JobsTimer *_Nullable timer){
//                @jobs_strongify(self)
                JobsLog(@"我死球了");
            });

            timer.accumulatedElapsed       = 0;
            timer.lastStartDate            = nil;
        });
    }return _timer_color;
}

-(JobsTimer *)timer_length{
    if (!_timer_length) {
        @jobs_weakify(self)
        _timer_length = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.byTimerType(JobsTimerTypeNSTimer)
            .byTimerStyle(TimerStyle_anticlockwise) // 倒计时模式
            .byTimeInterval(self.color_timeInterval)
            .byTimeSecIntervalSinceDate(0)
            .byQueue(dispatch_get_main_queue())
            .byTimerState(JobsTimerStateIdle)
            .byStartTime(0)
            .byTime(0)
            .byOnTick(^(CGFloat time){
                @jobs_strongify(self)
                if (self.progress < 1) {
                    [self start];
                    if (self.objBlock) self.objBlock(jobsMakeWGradientProgressModel(^(__kindof WGradientProgressModel * _Nullable model) {
                        @jobs_strongify(self)
                        model.progress = self.progress;
                        model.gradLayer = self.gradLayer;
                    }));

                    self.progress += self.increment;
                }else [self->_timer_length stop];/// 销毁
            })
            .byOnFinish(^(JobsTimer *_Nullable timer){
//                @jobs_strongify(self)
                JobsLog(@"我死球了");
            });

            timer.accumulatedElapsed       = 0;
            timer.lastStartDate            = nil;
        });
    }return _timer_length;
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
            data.startPoint = CGPointZero;
            data.endPoint = CGPointMake(1, 1);
            data.colors = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                @jobs_strongify(self)
                data.addBy(self.colors);
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
