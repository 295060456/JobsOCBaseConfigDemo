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
+(JobsReturnButtonByTimerConfigModelBlock _Nullable)initByConfig{
    @jobs_weakify(self)
    return ^__kindof UIButton *(ButtonTimerConfigModel *_Nullable data){
        @jobs_strongify(self)
        return [self.class.alloc initByConfig:data];
    };
}

-(instancetype)initByConfig:(ButtonTimerConfigModel *_Nullable)config{
    self = UIButton.jobsInit();
    /// 为空则加载默认配置，self.btnTimerConfig 有容错机制
    self.btnTimerConfig = config;
    /// UI配置 1.1、【计时器未开始】设置Layer层 和 背景颜色
    self.configLayerReadyPlay();
    /// 设置普通标题或者富文本标题【计时器未开始】文字内容
    self.configTitleReadyPlay();
    return self;
}
#pragma clang diagnostic pop
#pragma mark —— 一些公有方法
-(UIButtonModel *_Nonnull)readyPlayValue{
    return self.btnTimerConfig.readyPlayValue;
}

-(UIButtonModel *_Nonnull)runningValue{
    return self.btnTimerConfig.runningValue;
}

-(UIButtonModel *_Nonnull)endValue{
    return self.btnTimerConfig.endValue;
}

-(NSTimerManager *_Nonnull)timerManager{
    return self.btnTimerConfig.timerManager;
}
#pragma mark —— 一些私有方法
/// 当设置了圆角的时候，会造成UI的一些畸形，这个地方的补偿值正好等于按钮的高的一半
-(jobsByCGFloatBlock _Nonnull)extraWidth{
    @jobs_weakify(self)
    return ^(CGFloat offsetWidth) {
        @jobs_strongify(self)
        if (self.layer.cornerRadius) {
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(self.btnTimerConfig.jobsSize.width + (offsetWidth ? : self.btnTimerConfig.widthCompensationValue));
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
            model.cornerRadius = data.layerCornerRadius;
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
        switch (self.btnTimerConfig.cequenceForShowTitleRuningStrType) {
            case CequenceForShowTitleRuningStrType_front:{/// 首在前
                id f = self.runningValue.title;
                self.runningValue.title = self.runningValue.title.add(self.btnTimerConfig.formatTimeStr);
            }break;
            case CequenceForShowTitleRuningStrType_tail:{/// 首在后
                self.runningValue.title = self.btnTimerConfig.formatTimeStr.add(self.runningValue.title);
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
        switch (self.btnTimerConfig.showTimeType) {
            case ShowTimeType_SS:{
                self.btnTimerConfig.formatTimeStr = toStringByLong(currentTime).add(self.btnTimerConfig.secondStr);
            }break;
            case ShowTimeType_MMSS:{
                self.btnTimerConfig.formatTimeStr = [self getMMSSFromStr:toStringByLong(currentTime) formatTime:nil];
            }break;
            case ShowTimeType_HHMMSS:{
                self.btnTimerConfig.formatTimeStr = [self getHHMMSSFromStr:toStringByLong(currentTime) formatTime:nil];
            }break;
            default:
                self.btnTimerConfig.formatTimeStr = JobsInternationalization(@"异常值");
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
        self.makeBtnTitleByShowingType(self.btnTimerConfig.labelShowingType);
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
        self.makeBtnTitleByShowingType(self.btnTimerConfig.labelShowingType);
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
        self.makeBtnTitleByShowingType(self.btnTimerConfig.labelShowingType);
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
/// 1、开启计时【用初始化时间】
-(jobsByVoidBlock _Nonnull)startTimer{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.startTimerBy(self.btnTimerConfig.count);
    };
}
/// 2、开启计时【从某个时间】
-(jobsByNSIntegerBlock _Nonnull)startTimerBy{
    @jobs_weakify(self)
    return ^(NSInteger timeCount) {
        @jobs_strongify(self)
        self.configTitleReadyPlay();
        self.configLayerReadyPlay();
        self.configTitleLabelReadyPlay();
        self.btnTimerConfig.count = timeCount;
        //启动方式——1
//        self.timerManager.nsTimeStartWithRunLoop(nil);
        //启动方式——2
        self.timerManager.nsTimeStartSysAutoInRunLoop();
        self.configPreData();
    };
}
/// 因为计时器要走过一个周期才开始报值
-(jobsByVoidBlock _Nonnull)configPreData{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.timerRuning(self.timerManager.anticlockwiseTime);
    };
}
#pragma mark —— 时间相关方法【定时器运行中】❤️核心方法❤️
-(jobsByLongBlock _Nonnull)timerRuning{
    @jobs_weakify(self)
    return ^(long currentTime) {
        @jobs_strongify(self)
        // 其他一些基础设置
        {
            /// 倒计时期间，默认不接受任何的点击事件
            self.enabled = self.btnTimerConfig.isCanBeClickWhenTimerCycle;
            self.jobsResetBtnBgCor(self.runningValue.bgCor);
        }
        // 清除上一次拼装的数据
        if (isValue(self.btnTimerConfig.formatTimeStr) &&
            [self.runningValue.title containsString:self.btnTimerConfig.formatTimeStr]) {
            self.runningValue.title = [self.runningValue.title stringByReplacingOccurrencesOfString:self.btnTimerConfig.formatTimeStr withString:@""];
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
                switch (self.btnTimerConfig.cequenceForShowTitleRuningStrType) {
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
    };
}
#pragma mark —— 时间相关方法【定时器暂停】
-(jobsByVoidBlock _Nonnull)timerSuspend{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        self.timerManager.nsTimePause();
    };
}
#pragma mark —— 时间相关方法【定时器继续】
-(jobsByVoidBlock _Nonnull)timerContinue{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.timerManager.nsTimecontinue();
    };
}
#pragma mark —— 时间相关方法【定时器销毁】
-(jobsByVoidBlock _Nonnull)timerDestroy{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.enabled = YES;
        NSLog(@"self.btnTimerConfig.titleEndStr = %@",self.endValue.title);
        self.configTitleEnd();
        self.configTitleLabelEnd();
        self.configLayerEnd();
        self.jobsResetBtnBgCor(self.endValue.bgCor);
        self.timerManager.nsTimeDestroy();
    };
}
#pragma mark —— @property(nonatomic,strong)ButtonTimerModel *btnTimerConfig;
JobsKey(_btnTimerConfig)
@dynamic btnTimerConfig;
-(ButtonTimerConfigModel *)btnTimerConfig{
    ButtonTimerConfigModel *BtnTimerConfig = Jobs_getAssociatedObject(_btnTimerConfig);
    if (!BtnTimerConfig) {
        BtnTimerConfig = jobsMakeButtonTimerConfigModel(^(__kindof ButtonTimerConfigModel * _Nullable data) {
            
        });Jobs_setAssociatedRETAIN_NONATOMIC(_btnTimerConfig, BtnTimerConfig)
    }
    /// 定时器运行时的Block
    @jobs_weakify(self)
    [BtnTimerConfig actionObjectBlock:^(NSTimerManager *data) {
        @jobs_strongify(self)
        switch (data.timerProcessType) {
            case TimerProcessType_ready:{
                
            }break;
            case TimerProcessType_running:{
                data.timerStyle = BtnTimerConfig.countDownBtnType;
                NSLog(@"DDD = %f",data.anticlockwiseTime);
                self.timerRuning((long)data.anticlockwiseTime);/// 倒计时方法
            }break;
            case TimerProcessType_end:{
                self.timerDestroy();
            }break;
            default:
                break;
        }if (self.heartBeatBlock) self.heartBeatBlock(data);
    }];return BtnTimerConfig;
}

-(void)setBtnTimerConfig:(ButtonTimerConfigModel *)btnTimerConfig{
    Jobs_setAssociatedRETAIN_NONATOMIC(_btnTimerConfig, btnTimerConfig)
    /// UI配置 1.2、【计时器未开始】设置普通文字的对齐方式、文字颜色、文字字体、UILabel的显示样式
    self.configTitleLabelReadyPlay();
}

@end
