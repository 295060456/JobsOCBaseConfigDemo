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
/// 文本显示类型
typedef enum : NSUInteger {
    CequenceForShowTitleRuningStrType_front = 0,// TitleRuningStr（固定值） 相对于 currentTime（浮动值）在前面 | 首在前
    CequenceForShowTitleRuningStrType_tail      // TitleRuningStr（固定值） 相对于 currentTime（浮动值）在后面 | 首在后
} CequenceForShowTitleRuningStrType;

@interface UIButton (Timer)<BaseProtocol,BaseButtonProtocol,TimerProtocol>

-(UIButtonModel *_Nonnull)readyPlayValue;
-(UIButtonModel *_Nonnull)runningValue;
-(UIButtonModel *_Nonnull)endValue;
/// ❤️如果配置了富文本，则优先显示富文本属性
#pragma mark —— 一些通用的设置
Prop_assign()CequenceForShowTitleRuningStrType cequenceForShowTitleRuningStrType;// 文本显示类型
Prop_assign()UILabelShowingType labelShowingType;
Prop_assign()CGFloat widthCompensationValue;      // 因为有圆角的时候需要有补偿值否则UI很难看
#pragma mark —— 计时器未开始【静态值】Ready
Prop_strong()UIButtonModel *readyPlayValue;
#pragma mark —— 计时器进行中【动态值】Running
Prop_strong()UIButtonModel *runningValue;
#pragma mark —— 计时器结束【静态值】End
Prop_strong()UIButtonModel *endValue;
#pragma mark —— 其他
Prop_copy()NSString *formatTimeStr;               // 根据ShowTimeType格式化以后的时间【内部使用】
Prop_copy()NSString *secondStr;

@end

NS_ASSUME_NONNULL_END
