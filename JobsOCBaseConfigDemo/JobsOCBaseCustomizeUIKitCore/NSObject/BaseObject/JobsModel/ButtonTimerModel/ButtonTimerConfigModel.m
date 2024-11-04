//
//  ButtonTimerModel.m
//  SelectorBlock
//
//  Created by Jobs on 2021/3/23.
//

#import "ButtonTimerConfigModel.h"

@implementation ButtonTimerConfigModel
UILocationProtocol_UIViewModelSynthesize
#pragma mark —— 重写set方法
@synthesize countDownBtnType = _countDownBtnType;
-(void)setCountDownBtnType:(TimerStyle)countDownBtnType{
    _countDownBtnType = countDownBtnType;
    _timerManager.timerStyle = _countDownBtnType;
}
@synthesize count = _count;
-(void)setCount:(long)count{
    _count = count;
    _timerManager.anticlockwiseTime = _count;//逆时针模式（倒计时）的顶点时间
}
#pragma mark —— lazyLoad【配置默认值】
-(NSTimerManager *)timerManager{
    if (!_timerManager) {
        @jobs_weakify(self)
        _timerManager = jobsMakeTimerManager(^(NSTimerManager * _Nullable data) {
            @jobs_strongify(self)
            data.timerStyle = self.countDownBtnType;
            data.anticlockwiseTime = self.count;//【逆时针模式：到这个时间点结束】、【顺时针模式：从这个时间点开始】
            //倒计时启动
            [data actionObjectBlock:^(TimerProcessModel *data) {
                @jobs_strongify(self)
                NSLog(@"正在倒计时...");
                NSLog(@"SSS = %@",self.objectBlock);
                if (self.objectBlock) self.objectBlock(data);
            }];
        });
    }return _timerManager;
}
/// 根据ShowTimeType格式化以后的时间【内部使用】
-(NSString *)formatTimeStr{
    if (self.labelShowingType == UILabelShowingType_05) {//提行模式
        if (![_formatTimeStr containsString:@"\n"] && _formatTimeStr) {
            if (self.cequenceForShowTitleRuningStrType == CequenceForShowTitleRuningStrType_front) {
                _formatTimeStr = @"\n".add(_formatTimeStr);
            }else if (self.cequenceForShowTitleRuningStrType == CequenceForShowTitleRuningStrType_tail){
                _formatTimeStr = _formatTimeStr.add(@"\n");
            }else{}
        }
    }return _formatTimeStr;
}
/// 计时器未开始
-(ButtonTimerProcessValueModel *)readyPlayValue{
    if (!_readyPlayValue) {
        _readyPlayValue = jobsMakeButtonTimerProcessValueModel(^(__kindof ButtonTimerProcessValueModel * _Nullable data) {
//            data.layerBorderCor = JobsWhiteColor;
//            data.textCor = JobsWhiteColor;
//            data.font = UIFontWeightRegularSize(12);
//            data.bgCor = JobsLightGrayColor;
//            data.layerCornerRadius = JobsWidth(8);
//            data.layerBorderWidth = 0.5f;

            data.labelShowingType = UILabelShowingType_01;
            /// 普通文本
            data.text = JobsInternationalization(@"准备开始");
            /// 富文本相关
            if (data.titleAttributedDataMutArr.count) {
                data.attributedText = self.richTextWithDataConfigMutArr(data.titleAttributedDataMutArr);
            }
        });
    }return _readyPlayValue;
}
/// 计时器进行中
-(ButtonTimerProcessValueModel *)runningValue{
    if (!_runningValue) {
        @jobs_weakify(self)
        _runningValue = jobsMakeButtonTimerProcessValueModel(^(ButtonTimerProcessValueModel * _Nullable data) {
            @jobs_strongify(self)
//            data.layerBorderCor = JobsRedColor;
//            data.textCor = JobsGreenColor;
//            data.font = UIFontWeightRegularSize(15);
//            data.bgCor = JobsCyanColor;
//            data.layerCornerRadius = JobsWidth(12);
//            data.layerBorderWidth = 1;
            
            data.labelShowingType = UILabelShowingType_01;
            /// 普通文本
            data.text = @"    ".add(JobsInternationalization(@"重新开始")).add(@"    ");
            /// 富文本相关
            if (data.titleAttributedDataMutArr.count) {
                data.attributedText = self.richTextWithDataConfigMutArr(data.titleAttributedDataMutArr);
            }
        });
    }return _runningValue;
}
/// 计时器结束
-(ButtonTimerProcessValueModel *)endValue{
    if (!_endValue) {
        @jobs_weakify(self)
        _endValue = jobsMakeButtonTimerProcessValueModel(^(ButtonTimerProcessValueModel * _Nullable data) {
            @jobs_strongify(self)
            data.layerBorderCor = self.readyPlayValue.layerBorderCor;
            data.textCor = self.readyPlayValue.textCor;
            data.font = self.readyPlayValue.font;
            data.bgCor = self.readyPlayValue.bgCor;
            data.layerCornerRadius = self.readyPlayValue.layerCornerRadius;
            data.layerBorderWidth = self.readyPlayValue.layerBorderWidth;
            
            data.labelShowingType = UILabelShowingType_01;
            /// 普通文本
            data.text = JobsInternationalization(@"重新开始");
            /// 富文本相关
            if (data.titleAttributedDataMutArr.count) {
                data.attributedText = self.richTextWithDataConfigMutArr(data.titleAttributedDataMutArr);
            }
        });
    }return _endValue;
}

-(NSInteger)count{
    if (!_count) {
        _count = 60;
    }return _count;
}

-(NSString *)secondStr{
    if (!_secondStr) {
        _secondStr = JobsInternationalization(@"Sec");
    }return _secondStr;
}

@end

@implementation ButtonTimerProcessValueModel
UILocationProtocol_UIViewModelSynthesize
UIPictureAndBackGroundCorProtocol_synthesize
UITextModelProtocol_synthesize
UITextModelProtocol_UIViewModelSynthesize
UIViewModelOthersProtocol_synthesize

#pragma mark —— 缺省值
-(UIColor *)layerBorderCor{
    if(!_layerBorderCor){
        _layerBorderCor = JobsWhiteColor;
    }return _layerBorderCor;
}

-(UIColor *)textCor{
    if(!_textCor){
        _textCor = JobsWhiteColor;
    }return _textCor;
}

-(UIFont *)font{
    if(!_font){
        _font = UIFontWeightRegularSize(12);
    }return _font;
}

-(UIColor *)bgCor{
    if(!_bgCor){
        _bgCor = JobsLightGrayColor;
    }return _bgCor;
}

-(CGFloat)layerCornerRadius{
    if(!_layerCornerRadius){
        _layerCornerRadius = JobsWidth(8);
    }return _layerCornerRadius;
}

-(CGFloat)layerBorderWidth{
    if(!_layerBorderWidth){
        _layerBorderWidth = 0.5f;
    }return _layerBorderWidth;
}

@end
