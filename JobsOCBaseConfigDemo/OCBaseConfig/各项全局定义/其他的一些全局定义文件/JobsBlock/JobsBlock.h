//
//  JobsBlock.h
//  Casino
//
//  Created by Jobs on 2022/1/4.
//

#ifndef JobsBlock_h
#define JobsBlock_h
/**
    全局的Block块定义
    基本数据类型尽量的用NSNumber进行二次封装成对象对外输出
 */
#define Jobs_2_Arguments (id _Nullable data,id _Nullable data2)
#define Jobs_3_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3)
#define Jobs_4_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4)
#define Jobs_5_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5)
#define Jobs_6_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5,id _Nullable data6)
#define Jobs_7_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5,id _Nullable data6,id _Nullable data7)
#define Jobs_8_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5,id _Nullable data6,id _Nullable data7,id _Nullable data8)
#define Jobs_9_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5,id _Nullable data6,id _Nullable data7,id _Nullable data8,id _Nullable data9)
#define Jobs_10_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5,id _Nullable data6,id _Nullable data7,id _Nullable data8,id _Nullable data9,id _Nullable data10)

#pragma mark —— 定义确定参数的Block
#import "ReturnByCertainParameters.h"
#import "VoidByCertainParameters.h"
#pragma mark —— 定义不确定参数的Block
#import "ReturnByUnCertainParameters.h"
#import "VoidByUnCertainParameters.h"

#pragma mark —— 定义业务Block
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

@class RACDisposable;
typedef RACDisposable *_Nonnull(^JobsReturnRACDisposableByReturnIDByIDBlock)(JobsReturnIDByIDBlock _Nullable data);

@class YTKBaseRequest;
typedef void(^jobsByYTKBaseRequestBlock)(YTKBaseRequest *_Nonnull request);

@class JobsRichTextConfig;
typedef NSMutableAttributedString *_Nullable(^JobsReturnAttributedStringByRichTextConfigArrayBlock)(NSArray <JobsRichTextConfig *>* _Nullable data);

@class UIViewModel;
typedef void(^jobsByViewModelBlock)(UIViewModel *_Nullable data);
typedef CGSize(^JobsReturnCGSizeByViewModelBlock)(UIViewModel *_Nullable data);
typedef CGRect(^JobsReturnCGRectByViewModelBlock)(UIViewModel *_Nullable data);
typedef CGFloat(^JobsReturnCGFloatByViewModelBlock)(UIViewModel *_Nullable data);

@class ButtonTimerProcessValueModel;
typedef void(^jobsByButtonTimerProcessValueModelBlock)(ButtonTimerProcessValueModel *_Nullable data);

@class JobsCorModel;
typedef JobsCorModel *_Nonnull(^JobsReturnCorModelByCorBlock)(UIColor *_Nullable data);
typedef JobsCorModel *_Nonnull(^JobsReturnCorModelByVoidBlock)(void);

@class UIButtonModel;
@class JobsNavBarConfig;
typedef JobsNavBarConfig *_Nullable(^JobsReturnNavBarConfigByButtonModelBlock)(UIButtonModel *_Nullable backBtnModel,
                                                                               UIButtonModel *_Nullable closeBtnModel);

@class GKPhotoBrowser;
typedef void(^jobsByGKPhotoBrowserBlock)(GKPhotoBrowser *_Nonnull data);

@class JobsUserModel;
typedef JobsUserModel *_Nullable(^JobsReturnUserModelByVoidBlock)(void);
typedef void(^jobsByUserModelBlock)(JobsUserModel <NSCoding> *_Nullable userModel);

@class UserDefaultModel;
typedef void(^jobsByUserDefaultModelBlock)(UserDefaultModel *_Nonnull data);

#endif /* JobsBlock_h */
/*

    不定参数Block【 使用示例】
    [self GettingPicBlock:^(id firstArg, ...)NS_REQUIRES_NIL_TERMINATION{
        @jobs_strongify(self)
        if (firstArg) {
            // 取出第一个参数
            NSLog(@"%@", firstArg);
            // 定义一个指向个数可变的参数列表指针；
            va_list args;
            // 用于存放取出的参数
            id arg = nil;
            // 初始化变量刚定义的va_list变量，这个宏的第二个参数是第一个可变参数的前一个参数，是一个固定的参数
            va_start(args, firstArg);
            // 遍历全部参数 va_arg返回可变的参数(a_arg的第二个参数是你要返回的参数的类型)
            if ([firstArg isKindOfClass:NSNumber.class]) {
                NSNumber *num = (NSNumber *)firstArg;
                for (int i = 0; i < num.intValue; i++) {
                    arg = va_arg(args, id);
    //                    NSLog(@"KKK = %@", arg);
                    if ([arg isKindOfClass:UIImage.class]) {
                        NSLog(@"");
                    }else if ([arg isKindOfClass:PHAsset.class]){
                        NSLog(@"");
                    }else if ([arg isKindOfClass:NSString.class]){
                        NSLog(@"");
                    }else if ([arg isKindOfClass:NSArray.class]){
                        NSLog(@"");
                    }else{
                        NSLog(@"");
                    }
                }
            }else{
                NSLog(@"");
            }
            // 清空参数列表，并置参数指针args无效
            va_end(args);
        }
    }];

*/

