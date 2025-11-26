//
//  JobsCountdownView.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/27.
//

#import "JobsCountdownView.h"

@interface JobsCountdownView ()
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *countdownTimeLab;
/// Data
Prop_strong()JobsTimeModel *formatTime;
Prop_strong()UIButtonModel *timerProcessModel;
Prop_copy()NSString *minutesStr;
Prop_copy()NSString *secondStr;
Prop_strong()NSMutableArray <JobsRichTextConfig *>*richTextConfigMutArr;
Prop_strong()NSMutableArray <NSString *>*richTextMutArr;
Prop_strong()NSMutableParagraphStyle *paragraphStyle;

@end

@implementation JobsCountdownView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    [self.timer stop];
}
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_countdownViewOnceToken = 0;
    static_countdownView = nil;
}

static JobsCountdownView *static_countdownView = nil;
static dispatch_once_t static_countdownViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_countdownViewOnceToken, ^{
        static_countdownView = JobsCountdownView.new;
    });return static_countdownView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        MakeDataNull
        [self.timer start];
        self.titleLab.byVisible(YES);
        self.countdownTimeLab.byVisible(YES);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(343), JobsWidth(184));
    };
}
#pragma mark —— 公共方法
-(void)refreshData{
    self.minutesStr = nil;
    self.secondStr = nil;
    self.richTextConfigMutArr = nil;
    self.countdownTimeLab.attributedText = nil;
}
#pragma mark —— lazyLoad
@synthesize timer = _timer;
-(JobsTimer *)timer{
    if (!_timer) {
        @jobs_weakify(self)
        _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer
            /// 必须配置的项
                .byTimerType(JobsTimerTypeNSTimer)           // 计时器核心选择
                .byTimerStyle(TimerStyle_clockwise)          // 正计时模式
                .byTimeInterval(1)                           // 跳动步长（频率间距）
                .byStartTime(30 * 60)                        // ✅ 总时长
                .byTimeSecIntervalSinceDate(3)               // dispatch_after 延迟（这里等价 0）
                .byQueue(dispatch_get_main_queue())
                .byOnTick(^(CGFloat time){
                    @jobs_strongify(self)
//                    JobsLog(@"正在倒计时...");
//                    NSLog(@"time = %f",t.time);
//                    NSLog(@"timer.timerType = %lu",(unsigned long)t.timerType);
//                    NSLog(@"timer.timerStyle = %lu",(unsigned long)t.timerStyle);

                    NSArray *strArr1 = [[self getMMSSFromStr:[NSString stringWithFormat:@"%f",time] formatTime:self.formatTime]
                                        componentsSeparatedByString:@"分".tr];
                    self.minutesStr = strArr1[0];

                    NSArray *strArr2 = [strArr1[1] componentsSeparatedByString:@"秒".tr];
                    self.secondStr = strArr2[0];

                    self.countdownTimeLab.attributedText = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr paragraphStyle:self.paragraphStyle];
                    if (self.objBlock) self.objBlock(@(time));
                })
                .byOnFinish(^(__kindof JobsTimer * _Nullable t){
                    @jobs_strongify(self)
//                    JobsLog(@"倒计时结束...");
                    if (self.objBlock) self.objBlock(t);
                });
            /// 这些是内部状态初始化，不暴露成 DSL 也可以
            timer.accumulatedElapsed = 0;   // 已经流逝的时间（总 elapsed，单位秒）
            timer.lastStartDate      = nil; // 最近一次 start/resume 的时间点（支持 pause/resume）
        });
    }return _timer;
}

-(JobsTimeModel *)formatTime{
    if (!_formatTime) {
        _formatTime = jobsMakeTimeModel(^(__kindof JobsTimeModel * _Nullable data) {
            data.year = @"".tr;
            data.month = @"".tr;
            data.day = @"".tr;
            data.hour = @"".tr;
            data.minute = @"分".tr;
            data.second = @"秒".tr;
        });
    }return _formatTime;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"支付時間還有".tr).byFont(UIFontWeightRegularSize(14)).byTextCor(HEXCOLOR(0x757575));
            [self.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self).offset(JobsWidth(28));
                make.height.mas_equalTo(JobsWidth(14));
            }];label.makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _titleLab;
}

-(UILabel *)countdownTimeLab{
    if (!_countdownTimeLab) {
        @jobs_weakify(self)
        _countdownTimeLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byAttributedString([self richTextWithDataConfigMutArr:self.richTextConfigMutArr paragraphStyle:self.paragraphStyle])
                .byTextAlignment(NSTextAlignmentCenter);
            [self.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(16));
                make.height.mas_equalTo(JobsWidth(60));
                make.width.mas_equalTo(JobsCountdownView.viewSizeByModel(nil).width);
            }];
        });
    }return _countdownTimeLab;
}

-(NSMutableArray<JobsRichTextConfig *> *)richTextConfigMutArr{
    JobsMutableArray(_richTextConfigMutArr);
    @jobs_weakify(self)
    _richTextConfigMutArr.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data) {
        @jobs_strongify(self)
        data.font = UIFontWeightBoldSize(48);
        data.textCor = HEXCOLOR(0xAE8330);
        data.targetString = self.minutesStr;
    }))
    .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data) {
        data.font = UIFontWeightRegularSize(12);
        data.textCor = HEXCOLOR(0x757575);
        data.targetString = @"分".tr;
    }))
    .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data) {
        data.font = UIFontWeightBoldSize(48);
        data.textCor = HEXCOLOR(0xAE8330);
        data.targetString = self.secondStr;
    }))
    .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data) {
        data.font = UIFontWeightRegularSize(12);
        data.textCor = HEXCOLOR(0x757575);
        data.targetString = @"秒".tr;
    }));return _richTextConfigMutArr;
}

-(NSMutableArray<NSString *> *)richTextMutArr{
    JobsMutableArray(_richTextMutArr);
    _richTextMutArr.add(self.minutesStr)
    .add(@"分".tr)
    .add(self.secondStr)
    .add(@"秒".tr);
    return _richTextMutArr;
}

-(NSMutableParagraphStyle *)paragraphStyle{
    if (!_paragraphStyle) {
        _paragraphStyle = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
            data.alignment = NSTextAlignmentCenter;
        });
    }return _paragraphStyle;
}

-(NSString *)minutesStr{
    if (!_minutesStr) {
        _minutesStr = @"30".tr;
    }return _minutesStr;
}

-(NSString *)secondStr{
    if (!_secondStr) {
        _secondStr = @"0".tr;
    }return _secondStr;
}

@end
