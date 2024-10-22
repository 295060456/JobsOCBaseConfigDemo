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
-(instancetype)initWithConfig:(nullable ButtonTimerConfigModel *)config
   longPressGestureEventBlock:(JobsReturnIDBySelectorBlock _Nullable)longPressGestureEventBlock
              clickEventBlock:(JobsReturnIDByIDBlock _Nullable)clickEventBlock{
    self = UIButton.jobsInit().onClick(^(UIButton *x){
        x.selected = !x.selected;
        if(clickEventBlock) clickEventBlock(x);
    }).onLongPressGesture(^(id data){
        if (longPressGestureEventBlock) longPressGestureEventBlock(self,data);
    });
    self.btnTimerConfig = config;// 为空则加载默认配置，self.btnTimerConfig 有容错机制
    self.setLayerConfigReadyPlay();// UI配置 1.1、【计时器未开始】设置Layer层 和 背景颜色
    self.setTitleReadyPlay();// 设置普通标题或者富文本标题【计时器未开始】文字内容
    self.setTitleLabelConfigReadyPlay();// UI配置 1.2、【计时器未开始】设置普通文字的对齐方式、文字颜色、文字字体、UILabel的显示样式
    return self;
}
#pragma clang diagnostic pop
#pragma mark —— 一些私有方法
/// 当设置了圆角的时候，会造成UI的一些畸形，这个地方的补偿值正好等于按钮的高的一半
-(jobsByCGFloatBlock)extraWidth{
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
#pragma mark —— UI配置 1.1、【计时器未开始】设置Layer层 和 背景颜色
-(jobsByVoidBlock _Nonnull)setLayerConfigReadyPlay{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        self.layer.borderColor = self.btnTimerConfig.readyPlayValue.layerBorderCor.CGColor;
        self.layer.cornerRadius = self.btnTimerConfig.readyPlayValue.layerCornerRadius;
        self.layer.borderWidth = self.btnTimerConfig.readyPlayValue.layerBorderWidth;
        if(@available(iOS 16.0, *)){
            self.jobsResetBaseBackgroundColor(self.btnTimerConfig.readyPlayValue.bgCor);
        }else self.backgroundColor = self.btnTimerConfig.readyPlayValue.bgCor;
    };
}
#pragma mark —— UI配置 1.2、【计时器未开始】设置普通文字的对齐方式、文字颜色、文字字体、UILabel的显示样式
-(jobsByVoidBlock _Nonnull)setTitleLabelConfigReadyPlay{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        if(@available(iOS 16.0, *)){
            self.jobsResetTitleBaseForegroundColor(self.btnTimerConfig.readyPlayValue.textCor);
            self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:self.btnTimerConfig.readyPlayValue.font
                                                                                                     btnTitleCor:self.btnTimerConfig.readyPlayValue.textCor]);
        }else{
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.jobsResetBtnTitleCor(self.btnTimerConfig.readyPlayValue.textCor);
            self.jobsResetBtnTitleFont(self.btnTimerConfig.readyPlayValue.font);//ok
        }
        self.makeBtnTitleByShowingType(self.btnTimerConfig.labelShowingType);
        self.extraWidth(JobsWidth(8));
    };
}
#pragma mark —— UI配置 2.1、【计时器进行中】设置Layer层 和 背景颜色
-(jobsByVoidBlock _Nonnull)setLayerConfigRunning{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        self.layer.borderColor = self.btnTimerConfig.runningValue.layerBorderCor.CGColor;//可以加一个方法
        self.layer.cornerRadius = self.btnTimerConfig.runningValue.layerCornerRadius;
        self.layer.borderWidth = self.btnTimerConfig.runningValue.layerBorderWidth;
        if(@available(iOS 16.0, *)){
            self.jobsResetBaseBackgroundColor(self.btnTimerConfig.runningValue.bgCor);
        }else self.backgroundColor = self.btnTimerConfig.runningValue.bgCor;
    };
}
#pragma mark —— UI配置 2.2、【计时器进行中】设置普通文字的对齐方式、文字颜色、文字字体、UILabel的显示样式
-(jobsByVoidBlock _Nonnull)setTitleLabelConfigRunning{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        if(@available(iOS 16.0, *)){
            self.jobsResetTitleBaseForegroundColor(self.btnTimerConfig.runningValue.textCor);
            self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:self.btnTimerConfig.runningValue.font
                                                                                                     btnTitleCor:self.btnTimerConfig.runningValue.textCor]);
        }else{
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.jobsResetBtnTitleFont(self.btnTimerConfig.runningValue.font);
            self.jobsResetBtnTitleCor(self.btnTimerConfig.runningValue.textCor);
        }
        self.makeBtnTitleByShowingType(self.btnTimerConfig.labelShowingType);
        self.extraWidth(JobsWidth(0));
    };
}
#pragma mark —— UI配置 3.1、【计时器结束】设置Layer层 和 背景颜色
-(jobsByVoidBlock _Nonnull)setLayerConfigEnd{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        self.layer.borderColor = self.btnTimerConfig.endValue.layerBorderCor.CGColor;
        self.layer.cornerRadius = self.btnTimerConfig.endValue.layerCornerRadius;
        self.layer.borderWidth = self.btnTimerConfig.endValue.layerBorderWidth;
        if(@available(iOS 16.0, *)){
            self.jobsResetBaseBackgroundColor(self.btnTimerConfig.endValue.bgCor);
        }else self.backgroundColor = self.btnTimerConfig.endValue.bgCor;
    };
}
#pragma mark —— UI配置 3.2、【计时器结束】设置普通文字的对齐方式、文字颜色、文字字体、UILabel的显示样式
-(jobsByVoidBlock _Nonnull)setTitleLabelConfigEnd{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        if(@available(iOS 16.0, *)){
            self.jobsResetTitleBaseForegroundColor(self.btnTimerConfig.endValue.textCor);
            self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:self.btnTimerConfig.endValue.font
                                                                                                     btnTitleCor:self.btnTimerConfig.endValue.textCor]);
        }else{
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.jobsResetBtnTitleFont(self.btnTimerConfig.endValue.font);
            self.jobsResetBtnTitleCor(self.btnTimerConfig.endValue.textCor);
        }
        self.titleLabel.numberOfLines = 1;/// 不加这一句会有UI异常
        self.makeBtnTitleByShowingType(self.btnTimerConfig.labelShowingType);
        self.extraWidth(JobsWidth(8));
    };
}
#pragma mark —— 设置普通标题或者富文本标题【计时器未开始】文字内容
-(jobsByButtonTimerProcessValueModelBlock)toSetTitle{
    @jobs_weakify(self)
    return ^(ButtonTimerProcessValueModel *_Nullable data) {
        @jobs_strongify(self)
        self.jobsResetAttributedTitle([NSAttributedString.alloc initWithString:data.text
                                                                    attributes:@{NSForegroundColorAttributeName:data.textCor,
                                                                                 NSFontAttributeName:data.font,
                                                                                 NSParagraphStyleAttributeName:self.jobsparagraphStyleByTextAlignment(NSTextAlignmentCenter)}]);
    };
}

-(jobsByVoidBlock _Nonnull)setTitleReadyPlay{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        if (self.btnTimerConfig.readyPlayValue.titleAttributedDataMutArr.count ||
            self.btnTimerConfig.readyPlayValue.attributedText) {/// 富文本存在
            if (@available(iOS 16.0, *)) {
                self.jobsResetAttributedTitle(self.attributedTitleForNormalState);
            }else self.jobsResetBtnNormalAttributedTitle(self.btnTimerConfig.readyPlayValue.attributedText);
        }else{
            if (@available(iOS 16.0, *)) {
                /// 拼凑组装
                NSLog(@"%@",self.btnTimerConfig.readyPlayValue.text);
                NSLog(@"%@",self.btnTimerConfig.readyPlayValue.textCor);
                NSLog(@"%@",self.btnTimerConfig.readyPlayValue.font);
                self.toSetTitle(self.btnTimerConfig.readyPlayValue);
            }else self.jobsResetBtnTitle(self.btnTimerConfig.readyPlayValue.text);
        }
    };
}
#pragma mark —— 设置普通标题或者富文本标题【计时器进行中】文字内容
-(jobsByVoidBlock _Nonnull)setTitleRunning{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        if (self.btnTimerConfig.runningValue.titleAttributedDataMutArr.count ||
            self.btnTimerConfig.runningValue.attributedText) {/// 富文本存在
            if (@available(iOS 16.0, *)) {
                self.jobsResetAttributedTitle(self.attributedTitleForNormalState);
            }else self.jobsResetBtnNormalAttributedTitle(self.btnTimerConfig.runningValue.attributedText);
        }else{
            if (@available(iOS 16.0, *)) {
                /// 拼凑组装
                NSLog(@"%@",self.btnTimerConfig.runningValue.text);
                NSLog(@"%@",self.btnTimerConfig.runningValue.textCor);
                NSLog(@"%@",self.btnTimerConfig.runningValue.font);
                self.toSetTitle(self.btnTimerConfig.runningValue);
            }else self.jobsResetBtnTitle(self.btnTimerConfig.runningValue.text);
        }
    };
}
#pragma mark —— 设置普通标题或者富文本标题【计时器结束】文字内容
-(jobsByVoidBlock _Nonnull)setTitleEnd{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        if (self.btnTimerConfig.endValue.titleAttributedDataMutArr.count ||
            self.btnTimerConfig.endValue.attributedText) {/// 富文本存在
            if (@available(iOS 16.0, *)) {
                self.jobsResetAttributedTitle(self.attributedTitleForNormalState);
            }else self.jobsResetBtnNormalAttributedTitle(self.btnTimerConfig.endValue.attributedText);
        }else{
            if (@available(iOS 16.0, *)) {
                /// 拼凑组装
                NSLog(@"%@",self.btnTimerConfig.endValue.text);
                NSLog(@"%@",self.btnTimerConfig.endValue.textCor);
                NSLog(@"%@",self.btnTimerConfig.endValue.font);
                self.toSetTitle(self.btnTimerConfig.endValue);
            }else self.jobsResetBtnTitle(self.btnTimerConfig.endValue.text);
        }
    };
}
#pragma mark —— 时间相关方法【开启定时器】
/// 1、开启计时【用初始化时间】
-(jobsByVoidBlock _Nonnull)startTimer{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        self.startFromTimer(self.btnTimerConfig.count);
    };
}
/// 2、开启计时【从某个时间】
-(jobsByNSIntegerBlock _Nonnull)startFromTimer{
    @jobs_weakify(self)
    return ^(NSInteger timeCount) {
        @jobs_strongify(self)
        self.setTitleReadyPlay();
        self.setLayerConfigReadyPlay();
        self.setTitleLabelConfigReadyPlay();
        self.btnTimerConfig.count = timeCount;
        //启动方式——1
//        self.btnTimerConfig.timerManager.nsTimeStartWithRunLoop(nil);
        //启动方式——2
        self.btnTimerConfig.timerManager.nsTimeStartSysAutoInRunLoop();
        self.preData();
    };
}
/// 因为计时器要走过一个周期才开始报值
-(jobsByVoidBlock _Nonnull)preData{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        self.timerRuning(self.btnTimerConfig.timerManager.timerProcessModel.data.anticlockwiseTime);
    };
}
#pragma mark —— 时间相关方法【定时器运行中】❤️核心方法❤️
-(jobsByLongBlock)timerRuning{
    @jobs_weakify(self)
    return ^(long currentTime) {
        @jobs_strongify(self)
        // 其他一些基础设置
        {
            self.enabled = self.btnTimerConfig.isCanBeClickWhenTimerCycle;//倒计时期间，默认不接受任何的点击事件
            if(@available(iOS 16.0, *)){
                self.jobsResetBaseBackgroundColor(self.btnTimerConfig.runningValue.bgCor);
            }else self.backgroundColor = self.btnTimerConfig.runningValue.bgCor;
        }
        // 清除上一次拼装的数据
        if (self.btnTimerConfig.formatTimeStr.length > 0 &&
            [self.btnTimerConfig.runningValue.text containsString:self.btnTimerConfig.formatTimeStr]) {
            self.btnTimerConfig.runningValue.text = [self.btnTimerConfig.runningValue.text stringByReplacingOccurrencesOfString:self.btnTimerConfig.formatTimeStr withString:JobsInternationalization(@"")];
        }
        // 显示数据的二次封装
        {
            // 显示的时间格式
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
            // 字符串拼接
            switch (self.btnTimerConfig.cequenceForShowTitleRuningStrType) {
                case CequenceForShowTitleRuningStrType_front:{/// 首在前
                    self.btnTimerConfig.runningValue.text = self.btnTimerConfig.runningValue.text.add(self.btnTimerConfig.formatTimeStr);
                }break;
                case CequenceForShowTitleRuningStrType_tail:{/// 首在后
                    self.btnTimerConfig.runningValue.text = self.btnTimerConfig.formatTimeStr.add(self.btnTimerConfig.runningValue.text);
                }break;
                default:
                    self.btnTimerConfig.runningValue.text = JobsInternationalization(@"异常值");
                    break;
            }
        }
        // 富文本：锚定 titleRunningStr 和 formatTimeStr
        if(self.btnTimerConfig.runningValue.titleAttributedDataMutArr.count ||
           self.btnTimerConfig.runningValue.attributedText){
            // 富文本 每一次时间触发方法都刷新数据并赋值
            NSMutableArray *tempDataMutArr = NSMutableArray.array;
            // 亟待补充 见 JobsRichTextConfig 的使用示例
            switch (self.btnTimerConfig.cequenceForShowTitleRuningStrType) {
                case CequenceForShowTitleRuningStrType_front:{
                    
                }break;
                case CequenceForShowTitleRuningStrType_tail:{
                    
                }break;
                default:
                    break;
            }self.btnTimerConfig.runningValue.attributedText = self.richTextWithDataConfigMutArr(tempDataMutArr);
        }
        
        self.setTitleRunning();// 核心方法
        self.setLayerConfigRunning();
        self.setTitleLabelConfigRunning();
    };
}
#pragma mark —— 时间相关方法【定时器暂停】
-(jobsByVoidBlock _Nonnull)timerSuspend{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        [self.btnTimerConfig.timerManager nsTimePause];
    };
}
#pragma mark —— 时间相关方法【定时器继续】
-(jobsByVoidBlock _Nonnull)timerContinue{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        [self.btnTimerConfig.timerManager nsTimecontinue];
    };
}
#pragma mark —— 时间相关方法【定时器销毁】
-(jobsByVoidBlock _Nonnull)timerDestroy{
    @jobs_weakify(self)
    return ^(void) {
        @jobs_strongify(self)
        self.enabled = YES;
        NSLog(@"self.btnTimerConfig.titleEndStr = %@",self.btnTimerConfig.endValue.text);
        self.setTitleEnd();
        self.setTitleLabelConfigEnd();
        self.setLayerConfigEnd();

        if(@available(iOS 16.0, *)){
            self.jobsResetBaseBackgroundColor(self.btnTimerConfig.endValue.bgCor);
        }else self.backgroundColor = self.btnTimerConfig.endValue.bgCor;
        
        [self.btnTimerConfig.timerManager nsTimeDestroy];
    };
}
#pragma mark —— @property(nonatomic,strong)ButtonTimerModel *btnTimerConfig;
JobsKey(_btnTimerConfig)
@dynamic btnTimerConfig;
-(ButtonTimerConfigModel *)btnTimerConfig{
    ButtonTimerConfigModel *BtnTimerConfig = Jobs_getAssociatedObject(_btnTimerConfig);
    if (!BtnTimerConfig) {
        BtnTimerConfig = jobsMakeButtonTimerConfigModel(^(__kindof ButtonTimerConfigModel * _Nullable data) {
            
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_btnTimerConfig, BtnTimerConfig)
    }
    // 定时器运行时的Block
    @jobs_weakify(self)
    [BtnTimerConfig actionObjectBlock:^(TimerProcessModel *data) {
        @jobs_strongify(self)
        switch (data.timerProcessType) {
            case TimerProcessType_ready:{
                
            }break;
            case TimerProcessType_running:{
                data.data.timerStyle = BtnTimerConfig.countDownBtnType;
                NSLog(@"DDD = %f",data.data.anticlockwiseTime);
                self.timerRuning((long)data.data.anticlockwiseTime);//倒计时方法
            }break;
            case TimerProcessType_end:{
                self.timerDestroy();
            }break;
            default:
                break;
        }if (self.objectBlock) self.objectBlock(data);
    }];return BtnTimerConfig;
}

-(void)setBtnTimerConfig:(ButtonTimerConfigModel *)btnTimerConfig{
    Jobs_setAssociatedRETAIN_NONATOMIC(_btnTimerConfig, btnTimerConfig)
}

@end
