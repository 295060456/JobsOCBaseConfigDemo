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
BaseButtonProtocol_dynamic_part2
TimerProtocol_dynamic
#pragma mark —— TimerProtocol.timerStyle
JobsKey(_timerStyle)
//@dynamic timerStyle;
-(TimerStyle)timerStyle{
    return [Jobs_getAssociatedObject(_timerStyle) unsignedIntegerValue];
}

-(void)setTimerStyle:(TimerStyle)timerStyle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_timerStyle, @(timerStyle))
}
#pragma mark —— BaseProtocol.timer
JobsKey(_timer)
@dynamic timer;
-(JobsTimer *)timer{
    JobsTimer *Timer = Jobs_getAssociatedObject(_timer);
    if (!Timer) {
        @jobs_weakify(self)
        Timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.timerType                = JobsTimerTypeDispatchAfter;
            timer.timerStyle               = self.timerStyle;          // 计时模式
            timer.timeInterval             = self.timeInterval;        // 跳动步长（频率间距）
            timer.timeSecIntervalSinceDate = 0;                        // 真正控制 dispatch_after 的延迟
            timer.repeats                  = NO;
            timer.queue                    = dispatch_get_main_queue();
            timer.timerState               = JobsTimerStateIdle;

            timer.startTime                = self.startTime;            // ✅ 总时长
            timer.time                     = 0;                         // ✅ 当前剩余时间（初始 = 总时长）

            timer.onTicker                 = ^(JobsTimer *_Nullable timer){
                @jobs_strongify(self)
                JobsLog(@"正在倒计时...");
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
        Jobs_setAssociatedRETAIN_NONATOMIC(_timer, Timer)
    }return Timer;
}

-(void)setTimer:(JobsTimer *)timer{
    Jobs_setAssociatedRETAIN_NONATOMIC(_timer, timer)
}
#pragma clang diagnostic pop
#pragma mark —— 一些私有方法
/// 当设置了圆角的时候，会造成UI的一些畸形，这个地方的补偿值正好等于按钮的高的一半
-(jobsByCGFloatBlock _Nonnull)extraWidth{
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
-(jobsByButtonModelBlock _Nonnull)configLayer{
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
-(jobsByButtonModelBlock)configTitle{
    @jobs_weakify(self)
    return ^(UIButtonModel *_Nullable model) {
        @jobs_strongify(self)
        self.jobsResetAttributedTitle(JobsAttributedStringByAttributes(model.title,
                                                                       jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
            @jobs_strongify(self)
            if (model.titleCor) [data setValue:model.titleCor
                                        forKey:NSForegroundColorAttributeName];
            if (model.titleFont) [data setValue:model.titleFont
                                         forKey:NSFontAttributeName];
            if (self.jobsparagraphStyleByTextAlignment(NSTextAlignmentCenter))
            [data setValue:self.jobsparagraphStyleByTextAlignment(NSTextAlignmentCenter)
                    forKey:NSParagraphStyleAttributeName];
        })));
    };
}
/// 是否用富文本数据进行渲染
-(JobsReturnBOOLByButtonModelBlock _Nonnull)isUseAttributedTitle{
    return ^BOOL(UIButtonModel *_Nullable data){
        return data.titleAttributedDataMutArr.count || data.attributedTitle;
    };
}
/// 显示数据的二次封装：字符串拼接
-(jobsByVoidBlock _Nonnull)decorateRunningData{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        switch (self.cequenceForShowTitleRuningStrType) {
            case CequenceForShowTitleRuningStrType_front:{/// 首在前
                self.runningValue.title = self.runningValue.title.add(self.formatTimeStr);
            }break;
            case CequenceForShowTitleRuningStrType_tail:{/// 首在后
                self.runningValue.title = self.formatTimeStr.add(self.runningValue.title);
            }break;
            default:
                self.runningValue.title = JobsInternationalization(@"异常值");
                break;
        }
    };
}
/// 显示数据的二次封装：显示的时间格式
-(jobsByLongBlock _Nonnull)decorateRunningTimeFormat{
    @jobs_weakify(self)
    return ^(long currentTime){
        @jobs_strongify(self)
        switch (self.showTimeType) {
            case ShowTimeType_SS:{
                self.formatTimeStr = toStringByLong(currentTime).add(self.secondStr);
            }break;
            case ShowTimeType_MMSS:{
                self.formatTimeStr = [self getMMSSFromStr:toStringByLong(currentTime) formatTime:nil];
            }break;
            case ShowTimeType_HHMMSS:{
                self.formatTimeStr = [self getHHMMSSFromStr:toStringByLong(currentTime) formatTime:nil];
            }break;
            default:
                self.formatTimeStr = JobsInternationalization(@"异常值");
                break;
        }
    };
}
#pragma mark —— UI配置 计时器未开始
/// 设置Layer层 和 背景颜色
-(jobsByVoidBlock _Nonnull)configLayerReadyPlay{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.configLayer(self.readyPlayValue);
        self.jobsResetBtnBgCor(self.readyPlayValue.bgCor);
    };
}
/// 设置普通文字的对齐方式、文字颜色、文字字体、UILabel的显示样式
-(jobsByVoidBlock _Nonnull)configTitleLabelReadyPlay{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.jobsResetBtnTitleCor(self.readyPlayValue.titleCor);
        self.jobsResetBtnTitleFont(self.readyPlayValue.titleFont);
        self.jobsResetBtnTitleAlignment(NSTextAlignmentCenter);
        self.makeBtnTitleByShowingType(self.labelShowingType);
        self.extraWidth(JobsWidth(8));
    };
}
/// 设置普通标题或者富文本标题
/// 富文本数据如果存在，则优先利用富文本对按钮的标题进行设置
-(jobsByVoidBlock _Nonnull)configTitleReadyPlay{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        /// 富文本存在
        if (self.isUseAttributedTitle(self.readyPlayValue)) {
            self.configTitle(self.readyPlayValue);
        }else self.jobsResetBtnTitle(self.readyPlayValue.title);
    };
}
#pragma mark —— UI配置 计时器进行中
/// 设置Layer层 和 背景颜色
-(jobsByVoidBlock _Nonnull)configLayerConfigRunning{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.configLayer(self.runningValue);
        self.jobsResetBtnBgCor(self.runningValue.bgCor);
    };
}
/// 设置普通标题或者富文本标题
/// 富文本数据如果存在，则优先利用富文本对按钮的标题进行设置
-(jobsByVoidBlock _Nonnull)configTitleRunning{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        /// 富文本存在
        if (self.isUseAttributedTitle(self.runningValue)) {
            self.configTitle(self.runningValue);
        }else self.jobsResetBtnTitle(self.runningValue.title);
        /// 设置普通文字的对齐方式、文字颜色、文字字体、UILabel的显示样式
        self.jobsResetBtnTitleCor(self.runningValue.titleCor);
        self.jobsResetBtnTitleFont(self.runningValue.titleFont);
        self.jobsResetBtnTitleAlignment(NSTextAlignmentCenter);
        self.makeBtnTitleByShowingType(self.labelShowingType);
        self.extraWidth(JobsWidth(8));
    };
}
#pragma mark —— UI配置 计时器结束
/// 设置Layer层 和 背景颜色
-(jobsByVoidBlock _Nonnull)configLayerEnd{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.configLayer(self.endValue);
        self.jobsResetBtnBgCor(self.endValue.bgCor);
    };
}
/// 设置普通文字的对齐方式、文字颜色、文字字体、UILabel的显示样式
-(jobsByVoidBlock _Nonnull)configTitleLabelEnd{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.jobsResetBtnTitleCor(self.endValue.titleCor);
        self.jobsResetBtnTitleFont(self.endValue.titleFont);
        self.jobsResetBtnTitleAlignment(NSTextAlignmentCenter);
        self.titleLabel.numberOfLines = 1;/// 不加这一句会有UI异常
        self.makeBtnTitleByShowingType(self.labelShowingType);
        self.extraWidth(JobsWidth(8));
    };
}
/// 设置普通标题或者富文本标题
/// 富文本数据如果存在，则优先利用富文本对按钮的标题进行设置
-(jobsByVoidBlock _Nonnull)configTitleEnd{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        /// 富文本存在
        if (self.isUseAttributedTitle(self.endValue)) {
            self.configTitle(self.endValue);
        }else self.jobsResetBtnTitle(self.endValue.title);
    };
}
#pragma mark —— 时间相关方法【开启定时器】
///// 1、开启计时【用初始化时间】
//-(JobsRetBtnByVoidBlock _Nonnull)startTimer{
//    @jobs_weakify(self)
//    return ^__kindof UIButton *_Nullable() {
//        @jobs_strongify(self)
//        self.startTimerBy(self.startTime);
//        return self;
//    };
//}
///// 2、开启计时【从某个时间】
//-(JobsRetBtnByNSIntegerBlock _Nonnull)startTimerBy{
//    @jobs_weakify(self)
//    return ^__kindof UIButton *_Nullable(NSInteger startTime) {
//        @jobs_strongify(self)
//        self.configTitleReadyPlay();
//        self.configLayerReadyPlay();
//        self.configTitleLabelReadyPlay();
//        self.startTime = startTime;
//        [self.timer start];
//        return self;
//    };
//}
#pragma mark —— 时间相关方法【定时器运行中】❤️核心方法❤️
-(JobsRetBtnByLongBlock _Nonnull)timerRuning{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(long currentTime) {
        @jobs_strongify(self)
        // 其他一些基础设置
        {
            /// 倒计时期间，默认不接受任何的点击事件
            self.enabled = self.isCanBeClickWhenTimerCycle;
            self.jobsResetBtnBgCor(self.runningValue.bgCor);
        }
        // 清除上一次拼装的数据
        if (isValue(self.formatTimeStr) &&
            [self.runningValue.title containsString:self.formatTimeStr]) {
            self.runningValue.title = [self.runningValue.title stringByReplacingOccurrencesOfString:self.formatTimeStr withString:@""];
        }
        {// 显示数据的二次封装
            /// 显示的时间格式
            self.decorateRunningTimeFormat(currentTime);
            /// 字符串拼接
            self.decorateRunningData();
        }
        // 富文本：锚定 titleRunningStr 和 formatTimeStr
        if(self.isUseAttributedTitle(self.runningValue)){
            self.runningValue.attributedTitle = self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                // 亟待补充 见 JobsRichTextConfig 的使用示例
                switch (self.cequenceForShowTitleRuningStrType) {
                    case CequenceForShowTitleRuningStrType_front:{
                        
                    }break;
                    case CequenceForShowTitleRuningStrType_tail:{
                        
                    }break;
                    default:
                        break;
                }
            }));
        }
        self.configTitleRunning();/// 核心方法
        self.configLayerConfigRunning();
        return self;
    };
}
//#pragma mark —— 时间相关方法【定时器暂停】
//-(JobsRetBtnByVoidBlock _Nonnull)timerSuspend{
//    @jobs_weakify(self)
//    return ^__kindof UIButton *_Nullable() {
//        @jobs_strongify(self)
//        [self.timer pause];
//        return self;
//    };
//}
//#pragma mark —— 时间相关方法【定时器继续】
//-(JobsRetBtnByVoidBlock _Nonnull)timerContinue{
//    @jobs_weakify(self)
//    return ^__kindof UIButton *_Nullable() {
//        @jobs_strongify(self)
//        [self.timer resume];
//        return self;
//    };
//}
//#pragma mark —— 时间相关方法【定时器销毁】
//-(JobsRetBtnByVoidBlock _Nonnull)timerDestroy{
//    @jobs_weakify(self)
//    return ^__kindof UIButton *_Nullable() {
//        @jobs_strongify(self)
//        self.enabled = YES;
//        JobsLog(@"self.btnTimerConfig.titleEndStr = %@",self.endValue.title);
//        self.configTitleEnd();
//        self.configTitleLabelEnd();
//        self.configLayerEnd();
//        self.jobsResetBtnBgCor(self.endValue.bgCor);
//        [self.timer stop];
//        return self;
//    };
//}
#pragma mark —— BaseButtonProtocol.isCanBeClickWhenTimerCycle
JobsKey(_isCanBeClickWhenTimerCycle)
//@dynamic isCanBeClickWhenTimerCycle;
-(BOOL)isCanBeClickWhenTimerCycle{
    return [Jobs_getAssociatedObject(_isCanBeClickWhenTimerCycle) boolValue];
}

-(void)setIsCanBeClickWhenTimerCycle:(BOOL)isCanBeClickWhenTimerCycle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_isCanBeClickWhenTimerCycle, @(isCanBeClickWhenTimerCycle))
}
#pragma mark —— TimerProtocol.startTime
JobsKey(_startTime)
//@dynamic startTime;
-(NSTimeInterval)startTime{
    NSTimeInterval STime = [Jobs_getAssociatedObject(_startTime) doubleValue];
    if (!STime) {
        STime = 10;// 缺省值
        [self setStartTime:STime];
    }return STime;
}

-(void)setStartTime:(NSTimeInterval)startTime{
    Jobs_setAssociatedRETAIN_NONATOMIC(_startTime, @(startTime))
}
#pragma mark —— TimerProtocol.timeInterval
JobsKey(_timeInterval)
//@dynamic timeInterval;
-(NSTimeInterval)timeInterval{
    NSTimeInterval TimeInterval = [Jobs_getAssociatedObject(_timeInterval) doubleValue];
    if (!TimeInterval) {
        TimeInterval = 1;// 缺省值
        [self setTimeInterval:TimeInterval];
    }return TimeInterval;
}

-(void)setTimeInterval:(NSTimeInterval)timeInterval{
    Jobs_setAssociatedRETAIN_NONATOMIC(_timeInterval, @(timeInterval))
}
#pragma mark —— TimerProtocol.onTick
JobsKey(_onTick)
//@dynamic onTick;
- (JobsRetTimerProtocolIDByTimerBlocks)onTick{
    @jobs_weakify(self)
    return ^id<TimerProtocol>(JobsTimerBlock block) {
        @jobs_strongify(self)
        // 把传进来的 block 存到 onTicker，上层真正 tick 时调它
        self.onTicker = block;
        // 返回 self，支持链式：.onTick(...).onFinish(...)
        return (id<TimerProtocol>)self;
    };
}
#pragma mark —— TimerProtocol.onTicker
JobsKey(_onTicker)
@dynamic onTicker;
- (JobsTimerBlock)onTicker{
    return Jobs_getAssociatedObject(_onTicker);
}

- (void)setOnTicker:(JobsTimerBlock)onTicker{
    Jobs_setAssociatedCOPY_NONATOMIC(_onTicker, onTicker);
}
#pragma mark —— TimerProtocol.onFinish
JobsKey(_onFinish)
//@dynamic onFinish;
- (JobsRetTimerProtocolIDByTimerBlocks)onFinish{
    @jobs_weakify(self)
    return ^id<TimerProtocol>(JobsTimerBlock block) {
        @jobs_strongify(self)
        self.onFinisher = block;
        return (id<TimerProtocol>)self;
    };
}
#pragma mark —— TimerProtocol.onFinisher
JobsKey(_onFinisher)
@dynamic onFinisher;
- (JobsTimerBlock)onFinisher{
    return Jobs_getAssociatedObject(_onFinisher);
}

- (void)setOnFinisher:(JobsTimerBlock)onFinisher{
    Jobs_setAssociatedCOPY_NONATOMIC(_onFinisher, onFinisher);
}
/// 根据ShowTimeType格式化以后的时间【内部使用】
JobsKey(_formatTimeStr)
@dynamic formatTimeStr;
-(NSString *)formatTimeStr{
    NSString *str = Jobs_getAssociatedObject(_formatTimeStr);
    if (!str) {
        if (self.labelShowingType == UILabelShowingType_05) {//提行模式
            if (![str containsString:JobsNewline]) {
                if (self.cequenceForShowTitleRuningStrType == CequenceForShowTitleRuningStrType_front) {
                    str = JobsNewline.add(str);
                }else if (self.cequenceForShowTitleRuningStrType == CequenceForShowTitleRuningStrType_tail){
                    str = str.add(JobsNewline);
                }else{
                    str = @"";
                }
            }
        }Jobs_setAssociatedRETAIN_NONATOMIC(_formatTimeStr, str)
    }return str;
}

-(void)setFormatTimeStr:(NSString *)formatTimeStr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_formatTimeStr, formatTimeStr)
}
/// 计时器未开始
JobsKey(_readyPlayValue)
@dynamic readyPlayValue;
-(UIButtonModel *)readyPlayValue{
    UIButtonModel *value = Jobs_getAssociatedObject(_readyPlayValue);
    if (!value) {
        @jobs_weakify(self)
        value = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            @jobs_strongify(self)
            // 原来注释掉的样式，如果以后要开，就照抄这里改：
            // data.layerBorderCor   = JobsWhiteColor;
            // data.textCor          = JobsWhiteColor;
            // data.font             = UIFontWeightRegularSize(12);
            // data.bgCor            = JobsLightGrayColor;
            // data.layerCornerRadius = JobsWidth(8);
            // data.layerBorderWidth = 0.5f;

            data.labelShowingType = UILabelShowingType_01;
            /// 普通文本
            data.text = JobsInternationalization(@"准备开始");
            /// 富文本相关
            if (data.titleAttributedDataMutArr.count) {
                data.attributedTitle = self.richTextWithDataConfigMutArr(data.titleAttributedDataMutArr);
            }
        });Jobs_setAssociatedRETAIN_NONATOMIC(_readyPlayValue, value);
    }return value;
}

- (void)setReadyPlayValue:(UIButtonModel *)readyPlayValue{
    Jobs_setAssociatedRETAIN_NONATOMIC(_readyPlayValue, readyPlayValue);
}
/// 计时器进行中
JobsKey(_runningValue)
@dynamic runningValue;
- (UIButtonModel *)runningValue{
    UIButtonModel *value = Jobs_getAssociatedObject(_runningValue);
    if (!value) {
        @jobs_weakify(self)
        value = jobsMakeButtonModel(^(UIButtonModel * _Nullable data) {
            @jobs_strongify(self)
            // data.layerBorderCor   = JobsRedColor;
            // data.textCor          = JobsGreenColor;
            // data.font             = UIFontWeightRegularSize(15);
            // data.bgCor            = JobsCyanColor;
            // data.layerCornerRadius = JobsWidth(12);
            // data.layerBorderWidth = 1;

            data.labelShowingType = UILabelShowingType_01;
            /// 普通文本
            data.text = @"    ".add(JobsInternationalization(@"重新开始")).add(@"    ");
            /// 富文本相关
            if (data.titleAttributedDataMutArr.count) {
                data.attributedTitle = self.richTextWithDataConfigMutArr(data.titleAttributedDataMutArr);
            }
        });Jobs_setAssociatedRETAIN_NONATOMIC(_runningValue, value);
    }return value;
}

- (void)setRunningValue:(UIButtonModel *)runningValue{
    Jobs_setAssociatedRETAIN_NONATOMIC(_runningValue, runningValue);
}
/// 计时器结束
JobsKey(_endValue)
@dynamic endValue;
-(UIButtonModel *)endValue{
    UIButtonModel *value = Jobs_getAssociatedObject(_endValue);
    if (!value) {
        @jobs_weakify(self)
        value = jobsMakeButtonModel(^(UIButtonModel * _Nullable data) {
            @jobs_strongify(self)
            // 同步「准备开始」的样式
            data.layerBorderCor    = self.readyPlayValue.layerBorderCor;
            data.textCor           = self.readyPlayValue.textCor;
            data.font              = self.readyPlayValue.font;
            data.bgCor             = self.readyPlayValue.bgCor;
            data.layerCornerRadius = self.readyPlayValue.layerCornerRadius;
            data.layerBorderWidth  = self.readyPlayValue.layerBorderWidth;

            data.labelShowingType = UILabelShowingType_01;
            /// 普通文本
            data.text = JobsInternationalization(@"重新开始");
            /// 富文本相关
            if (data.titleAttributedDataMutArr.count) {
                data.attributedTitle = self.richTextWithDataConfigMutArr(data.titleAttributedDataMutArr);
            }
        });Jobs_setAssociatedRETAIN_NONATOMIC(_endValue, value);
    }return value;
}

-(void)setEndValue:(UIButtonModel *)endValue{
    Jobs_setAssociatedRETAIN_NONATOMIC(_endValue, endValue);
}

JobsKey(_secondStr)
@dynamic secondStr;
-(NSString *)secondStr{
    NSString *value = Jobs_getAssociatedObject(_secondStr);
    if (!value) {
        value = JobsInternationalization(@"SEC");
        Jobs_setAssociatedRETAIN_NONATOMIC(_secondStr, value);
    }return value;
}

-(void)setSecondStr:(NSString *)secondStr{
    Jobs_setAssociatedRETAIN_NONATOMIC(_secondStr, secondStr);
}

@end
