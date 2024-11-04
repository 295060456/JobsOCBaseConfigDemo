//
//  UIButton+Timer.h
//  SelectorBlock
//
//  Created by Jobs on 2021/3/23.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "MacroDef_Func.h"
#import "JobsAttributedString.h"

#import "NSObject+Time.h"
#import "NSObject+RichText.h"/// 富文本
#import "NSObject+NSMutableParagraphStyle.h"
#import "NSObject+Extras.h"
#import "NSString+Others.h"

#import "JobsTimerManager.h"/// 时间管理
#import "ButtonTimerDefStructure.h"
#import "ButtonTimerConfigModel.h"
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
-(UIButtonModel *)readyPlayValue;
-(UIButtonModel *)runningValue;
-(UIButtonModel *)endValue;
#pragma mark —— 时间相关方法【开启定时器】
-(jobsByVoidBlock _Nonnull)startTimer;/// 开启计时【用初始化时间】
-(jobsByNSIntegerBlock _Nonnull)startFromTimer;/// 开启计时【从某个时间】
#pragma mark —— 时间相关方法【定时器暂停】
-(jobsByVoidBlock _Nonnull)timerSuspend;
#pragma mark —— 时间相关方法【定时器继续】
-(jobsByVoidBlock _Nonnull)timerContinue;
#pragma mark —— 时间相关方法【定时器销毁】
-(jobsByVoidBlock _Nonnull)timerDestroy;/// 可以不结束直接掐死
+(JobsReturnButtonByTimerConfigModelBlock _Nullable)initByConfig;
-(instancetype)initByConfig:(ButtonTimerConfigModel *_Nullable)config;

@end

NS_ASSUME_NONNULL_END

/** 调用示例
 
 -(UIButton *)countDownBtn{
     if (!_countDownBtn) {
         @jobs_weakify(self)
         _countDownBtn = UIButton.initByConfig(jobsMakeButtonTimerConfigModel(^(__kindof ButtonTimerConfigModel * _Nullable data) {
             /// 一些通用的设置
             data.count = 50;
             data.showTimeType = ShowTimeType_SS;// 时间显示风格
             data.countDownBtnType = TimerStyle_anticlockwise;// 时间方向
             data.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;//
             data.labelShowingType = UILabelShowingType_01;//【换行模式】
             /// 计时器未开始【静态值】
             data.readyPlayValue = jobsMakeButtonTimerProcessValueModel(^(UIButtonModel * _Nullable model) {
                 model.layerBorderWidth = 1;
                 model.layerCornerRadius = JobsWidth(18);
                 model.bgCor = JobsClearColor;
                 model.layerBorderCor = JobsClearColor;
                 model.textCor = HEXCOLOR_ALPHA(0xAE8330, 1);
                 model.text = Title9;
                 model.font = UIFontWeightMediumSize(JobsWidth(14));
             });
             /// 计时器进行中【动态值】
             data.runningValue = jobsMakeButtonTimerProcessValueModel(^(UIButtonModel * _Nullable model) {
                 model.bgCor = JobsClearColor;
                 model.text = JobsInternationalization(Title12);
                 model.layerBorderCor = JobsClearColor;
                 model.textCor = HEXCOLOR_ALPHA(0xAE8330, 1);
                 model.font = UIFontWeightMediumSize(JobsWidth(14));
             });
             /// 计时器结束【静态值】
             data.endValue = jobsMakeButtonTimerProcessValueModel(^(UIButtonModel * _Nullable model) {
                 model.bgCor = JobsClearColor;
             });
         })).onClick(^(__kindof UIButton *x){
             @jobs_strongify(self)
             x.startTimer();//选择时机、触发启动
             if (self.objectBlock) self.objectBlock(x);
         }).onLongPressGesture(^(id data){
             NSLog(@"");
         }).heartBeat(^(id _Nullable data){
             if ([data isKindOfClass:UIButtonModel.class]) {
                 UIButtonModel *model = (UIButtonModel *)data;
                 NSLog(@"❤️❤️❤️❤️❤️%f",model.data.anticlockwiseTime);
             }
         });
         [self addSubview:_countDownBtn];
         [_countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.right.equalTo(self).offset(-JobsWidth(120));
             make.top.equalTo(self).offset(JobsWidth(8));
             make.bottom.equalTo(self).offset(-JobsWidth(8));
             make.width.mas_equalTo(JobsWidth(80));
         }];
     }return _countDownBtn;
 }
 
 /// 开始 self.authCodeBtn.startTimer();
 /// 暂停 self.authCodeBtn.timerSuspend();
 /// 继续 self.authCodeBtn.timerContinue();
 /// 结束 self.authCodeBtn.timerDestroy();

 */
