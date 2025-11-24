//
//  UIButton+Timer.h
//  SelectorBlock
//
//  Created by Jobs on 2021/3/23.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "BaseProtocol.h"
#import "BaseButtonProtocol.h"
#import "TimerProtocol.h"
#import "MacroDef_Func.h"
#import "JobsAttributedString.h"
#import "JobsDefineAllEnumHeader.h"

#import "NSObject+Time.h"
#import "NSObject+RichText.h"/// 富文本
#import "NSObject+NSMutableParagraphStyle.h"
#import "NSObject+Extras.h"
#import "NSString+Others.h"
#import "NSMutableArray+Extra.h"

#import "JobsTimer.h"/// 时间管理
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
///（时间）文本@显示类型
#ifndef CEQUENCE_FOR_SHOW_TITLE_RUNING_STR_TYPE_DEFINED
#define CEQUENCE_FOR_SHOW_TITLE_RUNING_STR_TYPE_DEFINED
typedef NS_ENUM(NSUInteger, CequenceForShowTitleRuningStrType) {
    CequenceForShowTitleRuningStrType_front = 0, // TitleRuningStr 在前 | 首在前
    CequenceForShowTitleRuningStrType_tail       // TitleRuningStr 在后 | 首在后
};
#endif /* CEQUENCE_FOR_SHOW_TITLE_RUNING_STR_TYPE_DEFINED */

@interface UIButton (Timer)<BaseProtocol,BaseButtonProtocol,TimerProtocol>
/// ❤️如果配置了富文本，则优先显示富文本属性
#pragma mark —— 一些通用的设置
Prop_assign()ShowTimeType showTimeType;                                             // 时间@显示风格
Prop_assign()CequenceForShowTitleRuningStrType cequenceForShowTitleRuningStrType;   //（时间）文本@显示类型
Prop_assign()UILabelShowingType labelShowingType;
Prop_assign()CGFloat widthCompensationValue;                                        // 因为有圆角的时候需要有补偿值否则UI很难看
/// 计时器运行期间，按钮是否允许点击
Prop_assign()BOOL isCanBeClickWhenTimerCycle;

#pragma mark —— 时间相关方法【开启定时器】
/// 1、开启计时【用初始化时间】
- (JobsRetBtnByVoidBlock _Nonnull)startTimer;
/// 2、开启计时【从某个时间】
- (JobsRetBtnByNSIntegerBlock _Nonnull)startTimerBy;
#pragma mark —— 时间相关方法【定时器暂停】
- (JobsRetBtnByVoidBlock _Nonnull)timerSuspend;
#pragma mark —— 时间相关方法【定时器继续】
- (JobsRetBtnByVoidBlock _Nonnull)timerContinue;
#pragma mark —— 时间相关方法【定时器销毁】
- (JobsRetBtnByVoidBlock _Nonnull)timerDestroy;

-(JobsRetBtnByTimerStyleBlock _Nonnull)byTimerStyle;
-(JobsRetBtnByDoubleBlock _Nonnull)byTimeInterval;
-(JobsRetBtnByDoubleBlock _Nonnull)byStartTime;
-(JobsRetBtnByBOOLBlock _Nonnull)byClickWhenTimerCycle;

@end

NS_ASSUME_NONNULL_END
