//
//  JobsCountdownView.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/27.
//

#import "JobsCountdownView.h"

@interface JobsCountdownView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *countdownTimeLab;
/// Data
@property(nonatomic,strong)NSTimerManager *nsTimerManager;
@property(nonatomic,strong)JobsFormatTime *formatTime;
@property(nonatomic,strong)TimerProcessModel *timerProcessModel;
@property(nonatomic,strong)NSString *minutesStr;
@property(nonatomic,strong)NSString *secondStr;
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*richTextConfigMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
@property(nonatomic,strong)NSMutableParagraphStyle *paragraphStyle;

@end

@implementation JobsCountdownView

@synthesize viewModel = _viewModel;

-(void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    [self.nsTimerManager nsTimeDestroy];
}
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_countdownViewOnceToken = 0;
    static_countdownView = nil;
}

static JobsCountdownView *static_countdownView = nil;
static dispatch_once_t static_countdownViewOnceToken;
+(instancetype)sharedInstance{
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
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model ? : UIViewModel.new;
    MakeDataNull
    [self.nsTimerManager nsTimeStartSysAutoInRunLoop];
    self.titleLab.alpha = 1;
    self.countdownTimeLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(343), JobsWidth(184));
}
#pragma mark —— lazyLoad
-(NSTimerManager *)nsTimerManager{
    if (!_nsTimerManager) {
        _nsTimerManager = NSTimerManager.new;
        _nsTimerManager.timerStyle = TimerStyle_anticlockwise;
        _nsTimerManager.anticlockwiseTime = 30 * 60;
        _nsTimerManager.timeInterval = 1;
        @jobs_weakify(self)
        [_nsTimerManager actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:TimerProcessModel.class]) {
                self.timerProcessModel = (TimerProcessModel *)data;
                NSArray *strArr1 = [[self getMMSSFromStr:[NSString stringWithFormat:@"%f",self.timerProcessModel.data.anticlockwiseTime] formatTime:self.formatTime] componentsSeparatedByString:JobsInternationalization(@"分")];
                self.minutesStr = strArr1[0];
                NSArray *strArr2 = [strArr1[1] componentsSeparatedByString:JobsInternationalization(@"秒")];
                self.secondStr = strArr2[0];
                self.countdownTimeLab.attributedText = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr
                                                                           paragraphStyle:self.paragraphStyle];
            }
        }];
    }return _nsTimerManager;
}

-(JobsFormatTime *)formatTime{
    if (!_formatTime) {
        _formatTime = JobsFormatTime.new;
        _formatTime.year = JobsInternationalization(@"");
        _formatTime.month = JobsInternationalization(@"");
        _formatTime.day = JobsInternationalization(@"");
        _formatTime.hour = JobsInternationalization(@"");
        _formatTime.minute = JobsInternationalization(@"分");
        _formatTime.second = JobsInternationalization(@"秒");
    }return _formatTime;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = JobsInternationalization(@"支付時間還有");
        _titleLab.font = UIFontWeightRegularSize(14);
        _titleLab.textColor = HEXCOLOR(0x757575);
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(JobsWidth(28));
            make.height.mas_equalTo(JobsWidth(14));
        }];
        _titleLab.makeLabelByShowingType(UILabelShowingType_03);
    }return _titleLab;
}

-(UILabel *)countdownTimeLab{
    if (!_countdownTimeLab) {
        _countdownTimeLab = UILabel.new;
        _countdownTimeLab.attributedText = [self richTextWithDataConfigMutArr:self.richTextConfigMutArr
                                                               paragraphStyle:self.paragraphStyle];
        _countdownTimeLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_countdownTimeLab];
        [_countdownTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(16));
            make.height.mas_equalTo(JobsWidth(60));
            make.width.mas_equalTo([JobsCountdownView viewSizeWithModel:nil].width);
        }];
    }return _countdownTimeLab;
}

-(NSMutableArray<JobsRichTextConfig *> *)richTextConfigMutArr{
    JobsMutableArray(_richTextConfigMutArr);
    JobsRichTextConfig *config_01 = JobsRichTextConfig.new;
    config_01.font = UIFontWeightBoldSize(48);
    config_01.textCor = HEXCOLOR(0xAE8330);
    config_01.targetString = self.minutesStr;
    [_richTextConfigMutArr addObject:config_01];

    JobsRichTextConfig *config_02 = JobsRichTextConfig.new;
    config_02.font = UIFontWeightRegularSize(12);
    config_02.textCor = HEXCOLOR(0x757575);
    config_02.targetString = JobsInternationalization(@"分");
    [_richTextConfigMutArr addObject:config_02];
    
    JobsRichTextConfig *config_03 = JobsRichTextConfig.new;
    config_03.font = UIFontWeightBoldSize(48);
    config_03.textCor = HEXCOLOR(0xAE8330);
    config_03.targetString = self.secondStr;
    [_richTextConfigMutArr addObject:config_03];
    
    JobsRichTextConfig *config_04 = JobsRichTextConfig.new;
    config_04.font = UIFontWeightRegularSize(12);
    config_04.textCor = HEXCOLOR(0x757575);
    config_04.targetString = JobsInternationalization(@"秒");
    [_richTextConfigMutArr addObject:config_04];
    
    return _richTextConfigMutArr;
}

-(NSMutableArray<NSString *> *)richTextMutArr{
    JobsMutableArray(_richTextMutArr);
    [_richTextMutArr addObject:self.minutesStr];
    [_richTextMutArr addObject:JobsInternationalization(@"分")];
    [_richTextMutArr addObject:self.secondStr];
    [_richTextMutArr addObject:JobsInternationalization(@"秒")];
    return _richTextMutArr;
}

-(NSMutableParagraphStyle *)paragraphStyle{
    if (!_paragraphStyle) {
        _paragraphStyle = NSMutableParagraphStyle.new;
        _paragraphStyle.alignment = NSTextAlignmentCenter;
    }return _paragraphStyle;
}

-(NSString *)minutesStr{
    if (!_minutesStr) {
        _minutesStr = JobsInternationalization(@"30");
    }return _minutesStr;
}

-(NSString *)secondStr{
    if (!_secondStr) {
        _secondStr = JobsInternationalization(@"0");
    }return _secondStr;
}

@end
