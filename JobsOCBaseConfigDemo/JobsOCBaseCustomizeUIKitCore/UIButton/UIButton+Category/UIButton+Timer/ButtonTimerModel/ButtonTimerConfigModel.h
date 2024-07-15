//
//  ButtonTimerModel.h
//  SelectorBlock
//
//  Created by Jobs on 2021/3/23.
//

#import <Foundation/Foundation.h>
#import "UIPictureAndBackGroundCorProtocol.h"
#import "UITextModelProtocol.h"
#import "UIViewModelOthersProtocol.h"
#import "UILocationProtocol.h"

#import "JobsBlock.h"
#import "JobsTimerManager.h"//时间管理
#import "NSObject+RichText.h"//富文本
#import "ButtonTimerDefStructure.h"
#import "MacroDef_App.h"
#import "MacroDef_Size.h"

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 记录过程值
@interface ButtonTimerProcessValueModel : NSObject
<
UIPictureAndBackGroundCorProtocol
,UITextModelProtocol
,UIViewModelOthersProtocol
>

@property(nonatomic,assign)TimerProcessType timerProcessType;

@end

@interface ButtonTimerConfigModel : NSObject<UILocationProtocol>
/**
    ❤️如果配置了富文本，则优先显示富文本属性
 */
#pragma mark —— 一些通用的设置
// 倒计时开始前的背景色直接对此控件进行赋值 backgroundColor
@property(nonatomic,strong)NSTimerManager *timerManager;
@property(nonatomic,assign)NSInteger count;//【逆时针模式：到这个时间点结束】、【顺时针模式：从这个时间点开始】❤️默认60秒
@property(nonatomic,assign)ShowTimeType showTimeType;// 时间显示风格
@property(nonatomic,assign)TimerStyle countDownBtnType;// 时间方向
@property(nonatomic,assign)CequenceForShowTitleRuningStrType cequenceForShowTitleRuningStrType;// 文本显示类型
@property(nonatomic,assign)UILabelShowingType labelShowingType;
@property(nonatomic,assign)BOOL isCanBeClickWhenTimerCycle;// 倒计时期间，默认不接受任何的点击事件
@property(nonatomic,assign)CGFloat widthCompensationValue;// 因为有圆角的时候需要有补偿值否则UI很难看
#pragma mark —— 计时器未开始【静态值】Ready
@property(nonatomic,strong)ButtonTimerProcessValueModel *readyPlayValue;
#pragma mark —— 计时器进行中【动态值】Running
@property(nonatomic,strong)ButtonTimerProcessValueModel *runningValue;
#pragma mark —— 计时器结束【静态值】End
@property(nonatomic,strong)ButtonTimerProcessValueModel *endValue;
#pragma mark —— 其他
@property(nonatomic,strong)NSString *formatTimeStr;// 根据ShowTimeType格式化以后的时间【内部使用】
@property(nonatomic,strong)NSString *appendingStrByFormatTimeStr;// formatTimeStr后缀拼接的字符串。因为formatTimeStr是内部使用
@property(nonatomic,strong)NSString *secondStr;

@end

NS_ASSUME_NONNULL_END

/**
 
 -(ButtonTimerConfigModel *)btnTimerConfigModel{
     if (!_btnTimerConfigModel) {
         _btnTimerConfigModel = ButtonTimerConfigModel.new;
         
         /// 一些通用的设置
         _btnTimerConfigModel.jobsSize = CGSizeMake(JobsWidth(100), JobsWidth(25));
         _btnTimerConfigModel.count = 5;
         _btnTimerConfigModel.showTimeType = ShowTimeType_SS;//时间显示风格
         _btnTimerConfigModel.countDownBtnType = TimerStyle_anticlockwise;// 时间方向
         _btnTimerConfigModel.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;// 文本显示类型
         _btnTimerConfigModel.labelShowingType = UILabelShowingType_05;//【换行模式】
         
         /// 计时器未开始【静态值】
         _btnTimerConfigModel.readyPlayValue.layerBorderWidth = 1;
         _btnTimerConfigModel.readyPlayValue.layerCornerRadius = JobsWidth(18);
         _btnTimerConfigModel.readyPlayValue.bgCor = JobsYellowColor;
         _btnTimerConfigModel.readyPlayValue.layerBorderCor = JobsClearColor;
         _btnTimerConfigModel.readyPlayValue.textCor = JobsBlackColor;
         _btnTimerConfigModel.readyPlayValue.text = Title9;
         _btnTimerConfigModel.readyPlayValue.font = UIFontWeightMediumSize(13);
         /// 计时器进行中【动态值】
         _btnTimerConfigModel.runningValue.bgCor = JobsCyanColor;
         /// 计时器结束【静态值】
         _btnTimerConfigModel.endValue.bgCor = JobsRedColor;
         
     }return _btnTimerConfigModel;
 }
 
 */
