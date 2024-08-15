//
//  UIButton+Timer.h
//  SelectorBlock
//
//  Created by Jobs on 2021/3/23.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "NSObject+Time.h"
#import "NSObject+RichText.h"//富文本
#import "NSObject+Extras.h"
#import "JobsTimerManager.h"//时间管理
#import "ButtonTimerDefStructure.h"
#import "ButtonTimerConfigModel.h"
#import "MacroDef_Func.h"
#import "UIButton+UI.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Timer)

@property(nonatomic,strong)ButtonTimerConfigModel *btnTimerConfig;

#pragma mark —— 时间相关方法【开启定时器】
-(void)startTimer;/// 开启计时【用初始化时间】
-(void)startTimer:(NSInteger)timeCount;/// 开启计时【从某个时间】
#pragma mark —— 时间相关方法【定时器暂停】
-(void)timerSuspend;
#pragma mark —— 时间相关方法【定时器继续】
-(void)timerContinue;
#pragma mark —— 时间相关方法【定时器销毁】
-(void)timerDestroy;/// 可以不结束直接掐死
/// - Parameters:
///   - config: 倒计时按钮配置的数据源
///   - longPressGestureEventBlock: 长按回掉
///   - clickEventBlock: 点击回掉
-(instancetype)initWithConfig:(nullable ButtonTimerConfigModel *)config
   longPressGestureEventBlock:(JobsSelectorBlock _Nullable)longPressGestureEventBlock
              clickEventBlock:(JobsReturnIDByIDBlock _Nullable)clickEventBlock;

@end

NS_ASSUME_NONNULL_END

/** 调用示例
 
 -(UIButton *)countDownBtn{
     if (!_countDownBtn) {
         @jobs_weakify(self)
         _countDownBtn = [UIButton.alloc initWithConfig:self.btnTimerConfigModel
                             longPressGestureEventBlock:nil
                                        clickEventBlock:^id _Nullable(UIButton *_Nullable x) {
             x.selected = !x.selected;
             [self adDidFinish];
             return nil;
         }];
         [self.adView addSubview:_countDownBtn];
         [_countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.height.mas_equalTo(JobsWidth(72));
             make.top.equalTo(self).offset(JobsWidth(20));
             make.centerX.equalTo(self);
         }];
         _countDownBtn.makeBtnTitleByShowingType(UILabelShowingType_03);

         /// 倒计时按钮点击事件（可以在其他地方实现）
         [_countDownBtn jobsBtnClickEventBlock:^id(UIButton *x) {
             [x startTimer];//选择时机、触发启动
             NSLog(@"🪓🪓🪓🪓🪓 = 获取验证码");
             return nil;
         }];
         /// 定时器跳动的回调（可以在其他地方实现）
         [_countDownBtn actionObjectBlock:^(id data) {
             @jobs_strongify(self)
             if ([data isKindOfClass:TimerProcessModel.class]) {
                 TimerProcessModel *model = (TimerProcessModel *)data;
                 NSLog(@"❤️❤️❤️❤️❤️%f",model.data.anticlockwiseTime);
             }
             [self adDidFinish];
         }];
     }return _countDownBtn;
 }

 -(ButtonTimerConfigModel *)btnTimerConfigModel{
     if (!_btnTimerConfigModel) {
         _btnTimerConfigModel = ButtonTimerConfigModel.new;
         /// 一些通用的设置
         _btnTimerConfigModel.jobsSize = CGSizeMake(JobsWidth(108), JobsWidth(14));
         _btnTimerConfigModel.count = 60;
         _btnTimerConfigModel.showTimeType = ShowTimeType_SS;//时间显示风格
         _btnTimerConfigModel.countDownBtnType = TimerStyle_anticlockwise;/// 逆时针模式（倒计时模式）
         _btnTimerConfigModel.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;
         _btnTimerConfigModel.labelShowingType = UILabelShowingType_03;/// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
         _btnTimerConfigModel.secondStr = JobsInternationalization(@"秒后重新发送");
         /// 计时器未开始【静态值】
         _btnTimerConfigModel.readyPlayValue.layerBorderWidth = 0;
         _btnTimerConfigModel.readyPlayValue.layerCornerRadius = JobsWidth(0);
         _btnTimerConfigModel.readyPlayValue.bgCor = JobsClearColor;
         _btnTimerConfigModel.readyPlayValue.layerBorderCor = JobsClearColor;
         _btnTimerConfigModel.readyPlayValue.textCor = JobsCor(@"#333333");
         _btnTimerConfigModel.readyPlayValue.text = JobsInternationalization(@"获取验证码");
         _btnTimerConfigModel.readyPlayValue.font = UIFontWeightRegularSize(14);
         /// 计时器进行中【动态值】
         _btnTimerConfigModel.runningValue.layerBorderWidth = 0;
         _btnTimerConfigModel.runningValue.layerCornerRadius = JobsWidth(0);
         _btnTimerConfigModel.runningValue.bgCor = JobsClearColor;
         _btnTimerConfigModel.runningValue.layerBorderCor = JobsClearColor;
         _btnTimerConfigModel.runningValue.textCor = JobsCor(@"#333333");
         _btnTimerConfigModel.runningValue.text = JobsInternationalization(@"");
         _btnTimerConfigModel.runningValue.font = UIFontWeightRegularSize(14);

         /// 计时器结束【静态值】
         _btnTimerConfigModel.endValue.layerBorderWidth = 0;
         _btnTimerConfigModel.endValue.layerCornerRadius = JobsWidth(0);
         _btnTimerConfigModel.endValue.bgCor = JobsClearColor;
         _btnTimerConfigModel.endValue.layerBorderCor = JobsClearColor;
         _btnTimerConfigModel.endValue.textCor = JobsCor(@"#333333");
         _btnTimerConfigModel.endValue.text = JobsInternationalization(@"重新获取");
         _btnTimerConfigModel.endValue.font = UIFontWeightRegularSize(14);
         
     }return _btnTimerConfigModel;
 }
 
 /// 开始   [self.countDownBtn startTimer];
 /// 暂停 [self.countDownBtn timerSuspend];
 /// 继续 [self.countDownBtn timerContinue];
 /// 结束 [self.countDownBtn timerDestroy];

 */
