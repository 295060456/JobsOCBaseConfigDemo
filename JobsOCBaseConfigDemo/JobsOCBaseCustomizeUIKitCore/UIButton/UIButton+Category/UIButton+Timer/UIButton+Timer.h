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
#import "NSMutableArray+Extra.h"

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
/// 计时器专用数据源
@property(nonatomic,strong)ButtonTimerConfigModel *btnTimerConfig;
-(UIButtonModel *_Nonnull)readyPlayValue;
-(UIButtonModel *_Nonnull)runningValue;
-(UIButtonModel *_Nonnull)endValue;
-(NSTimerManager *_Nonnull)timerManager;
#pragma mark —— 时间相关方法【开启定时器】
-(jobsByVoidBlock _Nonnull)startTimer;/// 开启计时【用初始化时间】
-(jobsByNSIntegerBlock _Nonnull)startTimerBy;/// 开启计时【从某个时间】
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
 
 -(__kindof UIButton *)makeSendSMSCodeBtn{
     @jobs_weakify(self)
     return UIButton.initByConfig(jobsMakeButtonTimerConfigModel(^(__kindof ButtonTimerConfigModel * _Nullable data) {
         /// 一些通用的设置
         data.count = 10;
         data.showTimeType = ShowTimeType_SS;// 时间显示风格
         data.countDownBtnType = TimerStyle_anticlockwise;// 时间方向
         data.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;//
         data.labelShowingType = UILabelShowingType_01;//【换行模式】
         data.secondStr = @" ".add(JobsInternationalization(@"S"));
         /// 计时器未开始【静态值】
         data.readyPlayValue = jobsMakeButtonModel(^(UIButtonModel * _Nullable model) {
             model.jobsSize = CGSizeMake(JobsWidth(80), JobsWidth(28));
             model.bgCor = JobsClearColor;
             model.layerBorderCor = JobsClearColor;
             model.titleCor = JobsWhiteColor;
             model.title = JobsInternationalization(@"GET CODE");
             model.titleFont = bayonRegular(JobsWidth(12));
             model.backgroundImage = JobsIMG(@"获取验证码背景图");
         });
         /// 计时器进行中【动态值】
         data.runningValue = jobsMakeButtonModel(^(UIButtonModel * _Nullable model) {
             model.jobsSize = CGSizeMake(JobsWidth(80), JobsWidth(28));
             model.bgCor = JobsClearColor;
             model.title = @"  ";
             model.layerBorderCor = JobsClearColor;
             model.titleCor = JobsWhiteColor;
             model.titleFont = bayonRegular(JobsWidth(12));
             model.backgroundImage = JobsIMG(@"获取验证码背景图");
         });
         /// 计时器结束【静态值】
         data.endValue = jobsMakeButtonModel(^(UIButtonModel * _Nullable model) {
             model.jobsSize = CGSizeMake(JobsWidth(80), JobsWidth(28));
             model.bgCor = JobsClearColor;
             model.titleCor = JobsWhiteColor;
             model.title = JobsInternationalization(@"GET CODE");
             model.titleFont = bayonRegular(JobsWidth(12));
             model.backgroundImage = JobsIMG(@"获取验证码背景图");
         });
     })).onClick(^(__kindof UIButton *x){
         @jobs_strongify(self)
         x.startTimer();//选择时机、触发启动
         if (self.objectBlock) self.objectBlock(x);
     }).onLongPressGesture(^(id data){
         NSLog(@"");
     }).heartBeat(^(NSTimerManager *_Nullable data){
         NSLog(@"❤️❤️❤️❤️❤️%f",data.anticlockwiseTime);
     });
 }
 
 /// 开始 self.authCodeBtn.startTimer();
 /// 暂停 self.authCodeBtn.timerSuspend();
 /// 继续 self.authCodeBtn.timerContinue();
 /// 结束 self.authCodeBtn.timerDestroy();

 */
