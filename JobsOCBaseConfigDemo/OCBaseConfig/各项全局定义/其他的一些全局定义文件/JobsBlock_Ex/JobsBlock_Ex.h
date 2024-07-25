//
//  JobsBlock_Ex.h
//  FM
//
//  Created by User on 7/25/24.
//

/// 因为自建的一些工具类引用了JobsBlock.h
/// 如果JobsBlock再引用这些自建的工具类就会出现编译问题
/// 所以这个文件，在具体使用的时候再进行包含，不必全局引用
#ifndef JobsBlock_Ex_h
#define JobsBlock_Ex_h
/// 系统支持语言
#ifndef APP_LANGUAGE_ENUM_DEFINED
#define APP_LANGUAGE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, AppLanguage) {
    AppLanguageBySys,/// App语言跟随当前系统
    AppLanguageChineseSimplified, /// zh-Hans：简体中文
    AppLanguageChineseTraditional,/// zh-Hant：繁体中文
    AppLanguageEnglish,           /// en：标准英语
    AppLanguageTagalog            /// tl：菲律宾他加禄语
};
#endif/* APP_LANGUAGE_ENUM_DEFINED */
/// 屏幕方向
#ifndef DeviceOrientation_typedef
#define DeviceOrientation_typedef
typedef NS_ENUM(NSInteger, DeviceOrientation) {
    DeviceOrientationUnknown, /// 未知方向
    DeviceOrientationPortrait,/// 竖屏
    DeviceOrientationLandscape /// 横屏
};
#endif /* DeviceOrientation_typedef */
/// 当前类型
#ifndef MyEnums_h
#define MyEnums_h
typedef NS_ENUM(NSInteger, ComponentType) {
    ComponentTypeUnknown,/// 其他
    ComponentTypeView,/// 视图
    ComponentTypeViewController/// 控制器
};
#endif /* MyEnums_h */

typedef ComponentType(^JobsReturnComponentTypeByVoidBlock)(void);
typedef DeviceOrientation(^JobsReturnDeviceOrientationByVoidBlock)(void);
typedef AppLanguage(^JobsReturnAppLanguageByVoidBlock)(void);
typedef DeviceOrientation(^JobsReturnDeviceOrientationByViewBlock)(UIView *_Nullable data);
typedef id _Nullable(^JobsReturnIDByAppLanguageBlock)(AppLanguage data);
typedef id _Nullable(^JobsReturnIDByComponentTypeAndUIViewBlock)(ComponentType componentType,
                                                                 UIView *_Nullable data);

#import "JobsRichTextConfig.h"
typedef NSMutableAttributedString *_Nullable(^JobsReturnAttributedStringByRichTextConfigArrayBlock)(NSArray <JobsRichTextConfig *>* _Nullable data);

#import "UIViewModel.h"
typedef void(^jobsByViewModelBlock)(UIViewModel *_Nullable data);
typedef CGSize(^JobsReturnCGSizeByViewModelBlock)(UIViewModel *_Nullable data);
typedef CGRect(^JobsReturnCGRectByViewModelBlock)(UIViewModel *_Nullable data);
typedef CGFloat(^JobsReturnCGFloatByViewModelBlock)(UIViewModel *_Nullable data);

#endif /* JobsBlock_Ex_h */
