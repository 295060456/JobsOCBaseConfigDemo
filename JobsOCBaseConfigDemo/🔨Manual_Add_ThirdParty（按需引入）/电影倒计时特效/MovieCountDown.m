//
//  movieCountDown.m
//  Timer
//
//  Created by Jobs on 2020/9/2.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "MovieCountDown.h"

@interface MovieCountDown ()
/// UI
Prop_strong()UILabel *countDown;
Prop_strong()UIView *aphView;

@end

@implementation MovieCountDown

-(instancetype)init{
    if (self = [super init]) {
    }return self;
}
#pragma mark —— 一些私有方法
-(void)倒计时放大特效{
    [self.timer start];
    [self secountDown];
}


-(void)secountDown{
    if (!self.effectView) {
        NSAssert(0,@"检查属性 effectView 不能为空");
    }
}

-(void)getCuntDown:(NSInteger)second{
    self.countDown.text = toStringByLong(second);
    self.countDown.alpha = 1;
    self.aphView.alpha = 0;
    @jobs_weakify(self)
    [UIView animateWithDuration:0.8
                     animations:^{
        @jobs_strongify(self)
        self.countDown.alpha = 0.8;//透明度
        self.aphView.alpha = 0.1;
        self.countDown.transform = CGAffineTransformMakeScale(1.5, 1.5);//放大值
        self.aphView.transform = CGAffineTransformMakeScale(10, 10);//放大值
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        self.aphView.alpha = self.countDown.alpha =  0;
        self.countDown.transform = self.aphView.transform = CGAffineTransformIdentity;//回复原大小
    }];
}
#pragma mark —— lazyLoad
-(UILabel *)countDown{
    if (!_countDown) {
        @jobs_weakify(self)
        _countDown = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textColor = self.countDownTextColor;
            label.font = [UIFont boldSystemFontOfSize:100];
            label.textAlignment = 1;
            label.x = (JobsMainScreen_WIDTH() - 100) / 2;
            label.y = (JobsMainScreen_HEIGHT() - 100) / 2;
            label.width = self->_countDown.height = 100;
            [self.effectView addSubview:label];
        });
    }return _countDown;
}

-(UIView *)aphView{
    if (!_aphView) {
        @jobs_weakify(self)
        _aphView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = self.aphViewBackgroundColor;
            view.frame = jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
                data.jobsWidth = data.jobsHeight = JobsWidth(100);
            });
            view.centerX = self->_countDown.centerX;
            view.centerY = self->_countDown.centerY;
            view.alpha = 0;
            view.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                data.cornerRadiusValue = 50.f;
            }));[self.effectView addSubview:view];
        });
    }return _aphView;
}

-(UIColor *)countDownTextColor{
    if (!_countDownTextColor) {
        _countDownTextColor = JobsRedColor;
    }return _countDownTextColor;
}

-(UIColor *)aphViewBackgroundColor{
    if (!_aphViewBackgroundColor) {
        _aphViewBackgroundColor = JobsClearColor;
    }return _aphViewBackgroundColor;
}

-(CGFloat)countDownTime{
    if (_countDownTime == 0) {
        _countDownTime = 5;
    }return _countDownTime;
}
@synthesize timer = _timer;
-(JobsTimer *)timer{
    if (!_timer) {
        @jobs_weakify(self)
        _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.timerType                = JobsTimerTypeDispatchAfter;
            timer.timerStyle               = TimerStyle_anticlockwise; // 倒计时模式
            timer.timeInterval             = 1;                        // 语义字段
            timer.timeSecIntervalSinceDate = 0;                        // 真正控制 dispatch_after 的延迟
            timer.repeats                  = NO;
            timer.queue                    = dispatch_get_main_queue();
            timer.timerState               = JobsTimerStateIdle;

            timer.startTime                = 10;               // ✅ 总时长
            timer.time                     = 0;                        // ✅ 当前剩余时间（初始 = 总时长）

            timer.onTicker                 = ^(JobsTimer *_Nullable timer){
                @jobs_strongify(self)
                JobsLog(@"正在倒计时...");
                [self getCuntDown:timer.time];
                if (self.objBlock) self.objBlock(timer);
            };
            timer.onFinisher               = ^(JobsTimer *_Nullable timer){
                @jobs_strongify(self)
                JobsLog(@"倒计时结束...");
                if (self.objBlock) self.objBlock(timer);
            };

            timer.accumulatedElapsed       = 0;
            timer.lastStartDate            = nil;
        });
    }return _timer;
}

@end
