//
//  UIButton+Timer.m
//  SelectorBlock
//
//  Created by Jobs on 2021/3/23.
//

#import "UIButton+Timer.h"

@implementation UIButton (Timer)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
#pragma clang diagnostic ignored "-Wunguarded-availability"

BaseButtonProtocol_dynamic_part2
TimerProtocol_dynamic

#pragma mark —— TimerProtocol.timerStyle
JobsKey(_timerStyle)
//@dynamic timerStyle;
- (TimerStyle)timerStyle{
    return [Jobs_getAssociatedObject(_timerStyle) unsignedIntegerValue];
}

- (void)setTimerStyle:(TimerStyle)timerStyle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_timerStyle, @(timerStyle))
}
#pragma mark —— BaseProtocol.timer（使用新版 JobsTimer 驱动按钮）
JobsKey(_timer)
@dynamic timer;
- (JobsTimer *)timer{
    JobsTimer *timer = Jobs_getAssociatedObject(_timer);
    if (!timer) {
        @jobs_weakify(self)
        timer = jobsMakeTimer(^(__kindof JobsTimer * _Nullable t) {
            @jobs_strongify(self)
            // 初始化 JobsTimer：核心配置从 UIButton 当前属性读取
            t
                .byTimerType(JobsTimerTypeNSTimer)                 // 用 NSTimer 驱动
                .byTimerStyle(self.timerStyle)                     // 正计时 / 倒计时 模式
                .byTimeInterval(self.timeInterval)                 // 跳动步长（频率）
                .byTimeSecIntervalSinceDate(0)                     // 首跳延迟（如需可开放成属性）
                .byQueue(dispatch_get_main_queue())                // 主线程队列，方便更新 UI
                .byStartTime(self.startTime)                       // 总时长（倒计时时使用）
                .byOnTick(^(CGFloat time){
                    @jobs_strongify(self)
                    if (self.onTick) self.onTick(time);
                    if (self.objBlock) self.objBlock(nil);
                })
                .byOnFinish(^(__kindof JobsTimer * _Nullable t2){
                    @jobs_strongify(self)
                    JobsLog(@"按钮计时结束");
                    // 计时结束：恢复可点击 & 切到结束 UI
                    self.enabled = YES;
                    // 外部配置的 onFinish 回调
                    if (self.onFinish) self.onFinish(t2);
                    if (self.objBlock) self.objBlock(t2);
                });
            // 内部时间状态初始化（保险措施）
            t.accumulatedElapsed = 0;
            t.lastStartDate      = nil;
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_timer, timer)
    }return timer;
}

-(void)setTimer:(JobsTimer *)timer{
    Jobs_setAssociatedRETAIN_NONATOMIC(_timer, timer)
}
#pragma clang diagnostic pop

#pragma mark —— 一些私有方法
/// 当设置了圆角的时候，会造成UI的一些畸形，这个地方的补偿值正好等于按钮的高的一半
- (jobsByCGFloatBlock _Nonnull)extraWidth{
    @jobs_weakify(self)
    return ^(CGFloat offsetWidth) {
        @jobs_strongify(self)
        if (self.layer.cornerRadius) {
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(self.width + (offsetWidth ? : self.widthCompensationValue));
            }];
        }
    };
}
/// 设置Layer
- (jobsByButtonModelBlock _Nonnull)configLayer{
    @jobs_weakify(self)
    return ^(UIButtonModel *_Nullable data){
        @jobs_strongify(self)
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel *_Nullable model) {
            model.layerCor = data.layerBorderCor;
            model.jobsWidth = data.layerBorderWidth;
            model.cornerRadiusValue = data.layerCornerRadius;
        }));
    };
}
/// 设置按钮富文本标题
- (jobsByButtonModelBlock)configTitle{
    @jobs_weakify(self)
    return ^(UIButtonModel *_Nullable model) {
        @jobs_strongify(self)
        self.jobsResetAttributedTitle(JobsAttributedStringByAttributes(model.title,
                                                                       jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            @jobs_strongify(self)
            if (model.titleCor) {
                [data setValue:model.titleCor
                        forKey:NSForegroundColorAttributeName];
            }
            if (model.titleFont) {
                [data setValue:model.titleFont
                        forKey:NSFontAttributeName];
            }
            if (self.jobsparagraphStyleByTextAlignment(NSTextAlignmentCenter)) {
                [data setValue:self.jobsparagraphStyleByTextAlignment(NSTextAlignmentCenter)
                        forKey:NSParagraphStyleAttributeName];
            }
        })));
    };
}
#pragma mark —— 时间相关方法
///【开启定时器】
/// 1、开启计时【用初始化时间】
- (JobsRetBtnByVoidBlock _Nonnull)startTimer{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        self.startTimerBy((NSInteger)self.startTime);
        return self;
    };
}
/// 2、开启计时【从某个时间】
- (JobsRetBtnByNSIntegerBlock _Nonnull)startTimerBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSInteger startTime) {
        @jobs_strongify(self)
        // 配置总时长
        self.startTime = startTime;
        // 同步给内部 JobsTimer
        self.timer.byStartTime(startTime);
        // 计时期间是否允许点击
        self.enabled = self.isCanBeClickWhenTimerCycle;
        // 启动计时
        [self.timer start];
        return self;
    };
}
///【定时器暂停】
- (JobsRetBtnByVoidBlock _Nonnull)timerSuspend{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self.timer pause];
        return self;
    };
}
///【定时器继续】
- (JobsRetBtnByVoidBlock _Nonnull)timerContinue{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self.timer resume];
        return self;
    };
}
///【定时器销毁】
- (JobsRetBtnByVoidBlock _Nonnull)timerDestroy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        self.enabled = YES;
        [self.timer stop];
        return self;
    };
}
#pragma mark —— BaseButtonProtocol.isCanBeClickWhenTimerCycle
JobsKey(_isCanBeClickWhenTimerCycle)
//@dynamic isCanBeClickWhenTimerCycle;
- (BOOL)isCanBeClickWhenTimerCycle{
    return [Jobs_getAssociatedObject(_isCanBeClickWhenTimerCycle) boolValue];
}

- (void)setIsCanBeClickWhenTimerCycle:(BOOL)isCanBeClickWhenTimerCycle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_isCanBeClickWhenTimerCycle, @(isCanBeClickWhenTimerCycle))
}
#pragma mark —— Prop_assign()ShowTimeType showTimeType;
JobsKey(_showTimeType)
@dynamic showTimeType;
-(ShowTimeType)showTimeType{
    return [Jobs_getAssociatedObject(_showTimeType) unsignedIntegerValue];
}

-(void)setShowTimeType:(ShowTimeType)showTimeType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_showTimeType, @(showTimeType))
}
#pragma mark —— TimerProtocol.startTime
JobsKey(_startTime)
//@dynamic startTime;
- (NSTimeInterval)startTime{
    NSTimeInterval STime = [Jobs_getAssociatedObject(_startTime) doubleValue];
    if (!STime) {
        STime = 10;// 缺省值
        [self setStartTime:STime];
    }return STime;
}

- (void)setStartTime:(NSTimeInterval)startTime{
    Jobs_setAssociatedRETAIN_NONATOMIC(_startTime, @(startTime))
}
#pragma mark —— TimerProtocol.timeInterval
JobsKey(_timeInterval)
//@dynamic timeInterval;
- (NSTimeInterval)timeInterval{
    NSTimeInterval TimeInterval = [Jobs_getAssociatedObject(_timeInterval) doubleValue];
    if (!TimeInterval) {
        TimeInterval = 1;// 缺省值
        [self setTimeInterval:TimeInterval];
    }return TimeInterval;
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval{
    Jobs_setAssociatedRETAIN_NONATOMIC(_timeInterval, @(timeInterval))
}
#pragma mark —— TimerProtocol.onTick
JobsKey(_onTick)
//@dynamic onTick;
- (JobsRetBtnByCGFloatBlocks)byOnTick{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByCGFloatBlock block) {
        @jobs_strongify(self)
        self.onTick = block;
        return self;
    };
}

-(jobsByCGFloatBlock)onTick{
    return Jobs_getAssociatedObject(_onTick);
}

-(void)setOnTick:(jobsByCGFloatBlock)onTick{
    Jobs_setAssociatedCOPY_NONATOMIC(_onTick, onTick)
}
#pragma mark —— TimerProtocol.onFinish
JobsKey(_onFinish)
//@dynamic onFinish;
- (JobsRetBtnByJTimerBlocks)byOnFinish{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(JobsTimerBlock block) {
        @jobs_strongify(self)
        self.onFinish = block;
        return self;
    };
}

-(JobsTimerBlock)onFinish{
    return Jobs_getAssociatedObject(_onFinish);
}

-(void)setOnFinish:(JobsTimerBlock)onFinish{
    Jobs_setAssociatedCOPY_NONATOMIC(_onFinish, onFinish)
}
#pragma mark —— Prop_assign()CequenceForShowTitleRuningStrType cequenceForShowTitleRuningStrType;
JobsKey(_cequenceForShowTitleRuningStrType)
@dynamic cequenceForShowTitleRuningStrType;
-(CequenceForShowTitleRuningStrType)cequenceForShowTitleRuningStrType{
    return [Jobs_getAssociatedObject(_cequenceForShowTitleRuningStrType) unsignedIntegerValue];
}

-(void)setCequenceForShowTitleRuningStrType:(CequenceForShowTitleRuningStrType)cequenceForShowTitleRuningStrType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_cequenceForShowTitleRuningStrType, @(cequenceForShowTitleRuningStrType))
}
#pragma mark —— Prop_assign()CGFloat widthCompensationValue;
JobsKey(_widthCompensationValue)
@dynamic widthCompensationValue;
-(CGFloat)widthCompensationValue{
    return [Jobs_getAssociatedObject(_widthCompensationValue) floatValue];
}

-(void)setWidthCompensationValue:(CGFloat)widthCompensationValue{
    Jobs_setAssociatedRETAIN_NONATOMIC(_widthCompensationValue, @(widthCompensationValue))
}
JobsKey(_labelShowingType)
@dynamic labelShowingType;
-(UILabelShowingType)labelShowingType{
    return [Jobs_getAssociatedObject(_labelShowingType) unsignedIntegerValue];
}

-(void)setLabelShowingType:(UILabelShowingType)labelShowingType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_labelShowingType, @(labelShowingType))
}
#pragma mark —— DSL
-(JobsRetBtnByTimerStyleBlock _Nonnull)byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(TimerStyle timerStyle){
        @jobs_strongify(self)
        self.timerStyle = timerStyle;
        return self;
    };
}

-(JobsRetBtnByDoubleBlock _Nonnull)byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSTimeInterval interva){
        @jobs_strongify(self)
        self.timeInterval = interva;
        return self;
    };
}

-(JobsRetBtnByDoubleBlock _Nonnull)byStartTime{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSTimeInterval interva){
        @jobs_strongify(self)
        self.startTime = interva;
        return self;
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)byClickWhenTimerCycle{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(BOOL can){
        @jobs_strongify(self)
        self.isCanBeClickWhenTimerCycle = can;
        return self;
    };
}

@end
