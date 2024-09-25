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
#import "NSString+Others.h"
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
-(jobsByVoidBlock _Nonnull)startTimer;/// 开启计时【用初始化时间】
-(jobsByNSIntegerBlock _Nonnull)startFromTimer;/// 开启计时【从某个时间】
#pragma mark —— 时间相关方法【定时器暂停】
-(jobsByVoidBlock _Nonnull)timerSuspend;
#pragma mark —— 时间相关方法【定时器继续】
-(jobsByVoidBlock _Nonnull)timerContinue;
#pragma mark —— 时间相关方法【定时器销毁】
-(jobsByVoidBlock _Nonnull)timerDestroy;/// 可以不结束直接掐死
/// - Parameters:
///   - config: 倒计时按钮配置的数据源
///   - longPressGestureEventBlock: 长按回掉
///   - clickEventBlock: 点击回掉
-(instancetype)initWithConfig:(nullable ButtonTimerConfigModel *)config
   longPressGestureEventBlock:(JobsReturnIDBySelectorBlock _Nullable)longPressGestureEventBlock
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
             x.startTimer();//选择时机、触发启动
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
         _btnTimerConfigModel = jobsMakeButtonTimerConfigModel(^(__kindof ButtonTimerConfigModel * _Nullable data) {
             /// 一些通用的设置
             data.count = 50;
             data.showTimeType = ShowTimeType_SS;// 时间显示风格
             data.countDownBtnType = TimerStyle_anticlockwise;// 时间方向
             data.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;//
             data.labelShowingType = UILabelShowingType_01;//【换行模式】
             /// 计时器未开始【静态值】
             data.readyPlayValue.layerBorderWidth = 1;
             data.readyPlayValue.layerCornerRadius = JobsWidth(18);
             data.readyPlayValue.bgCor = JobsClearColor;
             data.readyPlayValue.layerBorderCor = JobsClearColor;
             data.readyPlayValue.textCor = HEXCOLOR_ALPHA(0xAE8330, 1);
             data.readyPlayValue.text = Title9;
             data.readyPlayValue.font = UIFontWeightMediumSize(JobsWidth(14));
             /// 计时器进行中【动态值】
             data.runningValue.bgCor = JobsClearColor;
             data.runningValue.text = JobsInternationalization(Title12);
             data.runningValue.layerBorderCor = JobsClearColor;
             data.runningValue.textCor = HEXCOLOR_ALPHA(0xAE8330, 1);
             data.runningValue.font = UIFontWeightMediumSize(JobsWidth(14));
             /// 计时器结束【静态值】
             data.endValue.bgCor = JobsClearColor;
         });
     }return _btnTimerConfigModel;
 }
 
 /// 开始 self.countDownBtn.startTimer();
 /// 暂停 self.countDownBtn.timerSuspend();
 /// 继续 self.countDownBtn.timerContinue();
 /// 结束 self.countDownBtn.timerDestroy();

 */
