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
@property(nonatomic,strong)UILabel *countDown;
@property(nonatomic,strong)UIView *aphView;
/// Data
@property(nonatomic,strong)NSTimerManager *nsTimerManager;

@end

@implementation MovieCountDown

-(instancetype)init{
    if (self = [super init]) {
    }return self;
}
#pragma mark —— 一些私有方法
-(void)倒计时放大特效{
    [self makeTimer];
    [self secountDown];
}

-(void)makeTimer{
    self.nsTimerManager.anticlockwiseTime = self.countDownTime;
    //启动方式——1
    self.nsTimerManager.nsTimeStartWithRunLoop(nil);
    //启动方式——2
//    self.nsTimerManager.nsTimeStartSysAutoInRunLoop();
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
-(NSTimerManager *)nsTimerManager{
    if (!_nsTimerManager) {
        @jobs_weakify(self)
        _nsTimerManager = jobsMakeTimerManager(^(NSTimerManager * _Nullable data) {
            @jobs_strongify(self)
            data.timerStyle = TimerStyle_anticlockwise;
            data.anticlockwiseTime = self.countDownTime;
            [data actionObjectBlock:^(id data) {
                @jobs_strongify(self)
                if ([data isKindOfClass:NSTimerManager.class]) {
                    NSTimerManager *timerManager = (NSTimerManager *)data;
                    [self getCuntDown:(NSInteger)timerManager.anticlockwiseTime];
                }else if ([data isKindOfClass:UIButtonModel.class]){
                    UIButtonModel *model = (UIButtonModel *)data;
                    if (model.timerProcessType == TimerProcessType_end) {
                        if (self.objectBlock) self.objectBlock(data);
                    }
                }else{}
            }];
        });
    }return _nsTimerManager;
}

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
                data.cornerRadius = 50.f;
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

@end
