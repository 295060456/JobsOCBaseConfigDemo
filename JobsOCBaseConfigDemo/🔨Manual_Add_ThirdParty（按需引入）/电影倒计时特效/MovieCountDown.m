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
    [self.nsTimerManager nsTimeStartWithRunLoop:nil];
    //启动方式——2
    //    [self.nsTimerManager nsTimeStartSysAutoInRunLoop];
}

-(void)secountDown{
    if (!self.effectView) {
        NSAssert(0,@"检查属性 effectView 不能为空");
    }
}

-(void)getCuntDown:(NSInteger)second{
    self.countDown.text = [NSString stringWithFormat:@"%ld",(long)second];
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
        _nsTimerManager = NSTimerManager.new;
        _nsTimerManager.timerStyle = TimerStyle_anticlockwise;
        _nsTimerManager.anticlockwiseTime = self.countDownTime;
        @jobs_weakify(self)
        [_nsTimerManager actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:NSTimerManager.class]) {
                NSTimerManager *timerManager = (NSTimerManager *)data;
                [self getCuntDown:(NSInteger)timerManager.anticlockwiseTime];
            }else if ([data isKindOfClass:TimerProcessModel.class]){
                TimerProcessModel *model = (TimerProcessModel *)data;
                if (model.timerProcessType == TimerProcessType_end) {
                    if (self.objectBlock) self.objectBlock(data);
                }
            }else{}
        }];
        
    }return _nsTimerManager;
}

-(UILabel *)countDown{
    if (!_countDown) {
        _countDown = UILabel.new;
        _countDown.textColor = self.countDownTextColor;
        _countDown.font = [UIFont boldSystemFontOfSize:100];
        _countDown.textAlignment = 1;
        _countDown.x = (JobsMainScreen_WIDTH() - 100) / 2;
        _countDown.y = (JobsMainScreen_HEIGHT() - 100) / 2;
        _countDown.width = _countDown.height = 100;
        [self.effectView addSubview:_countDown];
    }return _countDown;
}

-(UIView *)aphView{
    if (!_aphView) {
        _aphView = UIView.new;
        _aphView.backgroundColor = self.aphViewBackgroundColor;
        _aphView.frame = CGRectMake(0,
                                    0,
                                    100,
                                    100);
        _aphView.centerX = _countDown.centerX;
        _aphView.centerY = _countDown.centerY;
        _aphView.alpha = 0;
        _aphView.layer.cornerRadius = 50.f;
        [self.effectView addSubview:_aphView];
    }return _aphView;
}


-(UIColor *)countDownTextColor{
    if (!_countDownTextColor) {
        _countDownTextColor = [UIColor redColor];
    }return _countDownTextColor;
}

-(UIColor *)aphViewBackgroundColor{
    if (!_aphViewBackgroundColor) {
        _aphViewBackgroundColor = [UIColor clearColor];
    }return _aphViewBackgroundColor;
}

-(CGFloat)countDownTime{
    if (_countDownTime == 0) {
        _countDownTime = 5;
    }return _countDownTime;
}

@end
