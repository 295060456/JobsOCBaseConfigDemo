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
#import "DefineConstString.h" /// 常量字符串的定义

#import "JobsBlock.h"
#import "JobsTimerManager.h"/// 时间管理
#import "NSObject+RichText.h"/// 富文本
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

@interface ButtonTimerConfigModel : NSObject<UILocationProtocol>
/// ❤️如果配置了富文本，则优先显示富文本属性
#pragma mark —— 一些通用的设置
/// 倒计时开始前的背景色直接对此控件进行赋值 backgroundColor
Prop_strong()NSTimerManager *timerManager;
Prop_assign()NSInteger count;//【逆时针模式：到这个时间点结束】、【顺时针模式：从这个时间点开始】❤️默认60秒
Prop_assign()ShowTimeType showTimeType;// 时间显示风格
Prop_assign()TimerStyle countDownBtnType;// 时间方向
Prop_assign()CequenceForShowTitleRuningStrType cequenceForShowTitleRuningStrType;// 文本显示类型
Prop_assign()UILabelShowingType labelShowingType;
Prop_assign()BOOL isCanBeClickWhenTimerCycle;// 倒计时期间，默认不接受任何的点击事件
Prop_assign()CGFloat widthCompensationValue;// 因为有圆角的时候需要有补偿值否则UI很难看
#pragma mark —— 计时器未开始【静态值】Ready
Prop_strong()UIButtonModel *readyPlayValue;
#pragma mark —— 计时器进行中【动态值】Running
Prop_strong()UIButtonModel *runningValue;
#pragma mark —— 计时器结束【静态值】End
Prop_strong()UIButtonModel *endValue;
#pragma mark —— 其他
Prop_copy()NSString *formatTimeStr;// 根据ShowTimeType格式化以后的时间【内部使用】
Prop_copy()NSString *appendingStrByFormatTimeStr;// formatTimeStr后缀拼接的字符串。因为formatTimeStr是内部使用
Prop_copy()NSString *secondStr;

@end

NS_ASSUME_NONNULL_END

NS_INLINE ButtonTimerConfigModel *_Nonnull jobsMakeButtonTimerConfigModel(jobsByButtonTimerConfigModelBlock _Nonnull block){
    ButtonTimerConfigModel *model = ButtonTimerConfigModel.alloc.init;
    if (block) block(model);
    return model;
}
/**
 
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
 
 */
