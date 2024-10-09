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
#ifndef JOBS_TimeZoneType
#define JOBS_TimeZoneType
typedef NS_ENUM(NSInteger, TimeZoneType) {
    TimeZoneTypeUTC,           // 协调世界时
    TimeZoneTypeGMT,           // 格林尼治标准时间
    TimeZoneTypePST,           // 太平洋标准时间 (美国和加拿大)
    TimeZoneTypeEST,           // 东部标准时间 (美国和加拿大)
    TimeZoneTypeCST,           // 中部标准时间 (美国和加拿大)
    TimeZoneTypeMST,           // 山地标准时间 (美国和加拿大)
    TimeZoneTypeCSTChina,      // 中国标准时间
    TimeZoneTypeJST,           // 日本标准时间
    TimeZoneTypeBST,           // 英国夏令时
    TimeZoneTypeAEST,          // 澳大利亚东部标准时间
    TimeZoneTypeAWST,          // 澳大利亚西部标准时间
    TimeZoneTypeCET,           // 欧洲中部时间
    TimeZoneTypeMSK,           // 莫斯科标准时间
    TimeZoneTypeIST,           // 印度标准时间
    TimeZoneTypeBRT,           // 巴西利亚时间
    TimeZoneTypeCSTMexico,     // 墨西哥城时间
    TimeZoneTypeART,           // 阿根廷时间
    TimeZoneTypeHST,           // 夏威夷标准时间
    TimeZoneTypeAKST,          // 阿拉斯加标准时间
    TimeZoneTypeCEST,          // 中欧夏令时
    TimeZoneTypeEET,           // 欧洲东部时间
    TimeZoneTypeWET,           // 欧洲西部时间
    TimeZoneTypeNST,           // 纽芬兰标准时间
    TimeZoneTypeAST,           // 大西洋标准时间
    TimeZoneTypePDT,           // 太平洋夏令时
    TimeZoneTypeMDT,           // 山地夏令时
    TimeZoneTypeCDT,           // 中部夏令时
    TimeZoneTypeEDT,           // 东部夏令时
    TimeZoneTypeNZST,          // 新西兰标准时间
    TimeZoneTypeHKT,           // 香港时间
    TimeZoneTypeSGT,           // 新加坡时间
    TimeZoneTypeMYT,           // 马来西亚时间
    TimeZoneTypeKST            // 韩国标准时间
    // 可以继续添加更多时区类型...
};
#endif /* JOBS_TimeZoneType */
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

#pragma mark —— 涉及到自定义类的Block定义
typedef ComponentType(^JobsReturnComponentTypeByVoidBlock)(void);
typedef DeviceOrientation(^JobsReturnDeviceOrientationByVoidBlock)(void);
typedef AppLanguage(^JobsReturnAppLanguageByVoidBlock)(void);
typedef DeviceOrientation(^JobsReturnDeviceOrientationByViewBlock)(__kindof UIView *_Nullable data);
typedef NSTimeZone *_Nullable(^JobsReturnTimeZoneByTypeBlock)(TimeZoneType timeZoneType);
typedef id _Nullable(^JobsReturnIDByAppLanguageBlock)(AppLanguage data);
typedef id _Nullable(^JobsReturnIDByComponentTypeAndUIViewBlock)(ComponentType componentType,
                                                                 __kindof UIView *_Nullable data);
@class JobsRichTextConfig;
typedef NSMutableAttributedString *_Nullable(^JobsReturnAttributedStringByRichTextConfigArrayBlock)(NSArray <JobsRichTextConfig *>* _Nullable data);
typedef void(^jobsByRichTextConfigBlock)(__kindof JobsRichTextConfig *_Nullable data);

@class SDWebImageModel;
typedef void(^jobsBySDWebImageModelBlock)(__kindof SDWebImageModel *_Nullable data);

@class UIViewModel;
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByViewModelBlock)(UIViewModel *_Nullable data);
typedef void(^jobsByViewModelBlock)(__kindof UIViewModel *_Nullable data);
typedef CGSize(^JobsReturnCGSizeByViewModelBlock)(__kindof UIViewModel *_Nullable data);
typedef CGRect(^JobsReturnCGRectByViewModelBlock)(__kindof UIViewModel *_Nullable data);
typedef CGFloat(^JobsReturnCGFloatByViewModelBlock)(__kindof UIViewModel *_Nullable data);
typedef __kindof NSArray <UIViewModel *>*_Nullable(^JobsReturnViewModelInArrByArrBlock)(__kindof NSArray *_Nullable data);

@class UITextModel;
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTextModelBlock)(UITextModel *_Nullable data);
typedef void(^jobsByTextModelBlock)(__kindof UITextModel *_Nullable data);

@class JobsTimeFormatterModel;
typedef JobsTimeFormatterModel *_Nullable(^JobsReturnTimeFormatterModelByStringBlock)(NSString *_Nullable data);

@class ButtonTimerProcessValueModel;
typedef void(^jobsByButtonTimerProcessValueModelBlock)(ButtonTimerProcessValueModel *_Nullable data);

@class JobsAppDoorInputViewBaseStyleModel;
typedef void(^jobsByAppDoorInputViewBaseStyleModelBlock)(JobsAppDoorInputViewBaseStyleModel *_Nullable data);

@class JobsCorModel;
typedef JobsCorModel *_Nonnull(^JobsReturnCorModelByCorBlock)(UIColor *_Nullable data);
typedef JobsCorModel *_Nonnull(^JobsReturnCorModelByVoidBlock)(void);

@class ButtonTimerConfigModel;
typedef void(^jobsByButtonTimerConfigModelBlock)(__kindof ButtonTimerConfigModel *_Nullable data);

@class MasonryModel;
typedef void(^jobsByMasonryModelBlock)(__kindof MasonryModel *_Nullable data);
typedef id _Nullable(^JobsReturnIDByMasonryModelBlock)(__kindof MasonryModel *_Nullable data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrByMasonryModelBlock)(__kindof MasonryModel *_Nullable data);

@class UIButtonModel;
typedef void(^jobsByButtonModelBlock)(__kindof UIButtonModel *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByButtonModelBlock)(UIButtonModel *_Nullable data);
@class JobsNavBarConfig;
typedef JobsNavBarConfig *_Nullable(^JobsReturnNavBarConfigByButtonModelBlock)(UIButtonModel *_Nullable backBtnModel,
                                                                               UIButtonModel *_Nullable closeBtnModel);
@class FileNameModel;
typedef FileNameModel *_Nonnull(^JobsReturnFileNameModelByFileFullNameStringBlock)(NSString *_Nullable FileFullName);

@class JobsUserModel;
typedef __kindof JobsUserModel<NSCoding> *_Nullable(^JobsReturnUserModelByVoidBlock)(void);
typedef __kindof JobsUserModel<NSCoding> *_Nullable(^JobsReturnUserModelByKeyBlock)(NSString *_Nullable key);
typedef void(^jobsByUserModelBlock)(__kindof JobsUserModel <NSCoding>*_Nullable userModel);
typedef void(^jobsByIDAndKeyBlock)(NSObject <NSCoding> *_Nonnull userModel,
                                   NSString *_Nullable key);

@class JobsTabBarItemConfig;
typedef void(^jobsByTabBarItemConfigBlock)(__kindof JobsTabBarItemConfig *_Nullable data);

@class UserDefaultModel;
typedef void(^jobsByUserDefaultModelBlock)(UserDefaultModel *_Nonnull data);

@class LZTabBarConfig;
typedef void(^jobsByLZTabBarConfigBlock)(__kindof LZTabBarConfig *_Nullable data);

@class JobsRequestBuilder;
typedef JobsRequestBuilder *_Nullable(^JobsReturnRequestBuilderByURLRequestBlock)(__kindof NSURLRequest *_Nonnull data);
typedef JobsRequestBuilder *_Nullable(^JobsReturnRequestBuilderByStringBlock)(NSString *_Nonnull data);

@class MJRefreshConfigModel;
typedef void(^jobsByRefreshConfigModelBlock)(__kindof MJRefreshConfigModel *_Nullable data);

@class JobsParagraphStyleModel;
typedef void(^jobsByParagraphStyleModelBlock)(__kindof JobsParagraphStyleModel *_Nullable data);

@class JobsLocationModel;
typedef void(^jobsByLocationModelBlock)(__kindof JobsLocationModel *_Nullable data);

@class JobsNavBarConfig;
typedef void(^jobsByNavBarConfigBlock)(__kindof JobsNavBarConfig *_Nullable data);

@class JobsTimeModel;
typedef void(^jobsByTimeModelBlock)(__kindof JobsTimeModel *_Nullable data);

@class JobsTimeFormatterModel;
typedef void(^jobsByTimeFormatterModelBlock)(__kindof JobsTimeFormatterModel *_Nullable data);

@class VideoModel_Core;
typedef void(^jobsByVideoModelCoreBlock)(__kindof VideoModel_Core *_Nullable data);

@class NotificationModel;
typedef void(^jobsByNotificationModelBlock)(NotificationModel *_Nullable data);

@class NSNotificationKeyboardModel;
typedef void(^jobsByNSNotificationKeyboardModelBlock)(NSNotificationKeyboardModel *_Nullable data);

@class JobsExcelConfigureViewModel;
typedef void(^jobsByExcelConfigureViewModelBlock)(JobsExcelConfigureViewModel *_Nullable data);

@class PopListBaseView;
typedef void(^jobsByPopListBaseViewBlock)(PopListBaseView *_Nullable data);

typedef __kindof UIView *_Nullable(^JobsReturnViewByBlock1)(jobsByIDBlock _Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByBlock2)(JobsReturnIDByVoidBlock _Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByBlock3)(JobsReturnIDByIDBlock _Nullable data);

#pragma mark —— 涉及到第三方类的Block定义
@class RACDisposable;
typedef RACDisposable *_Nonnull(^JobsReturnRACDisposableByReturnIDByIDBlock)(JobsReturnIDByIDBlock _Nullable data);

@class YTKBaseRequest;
typedef void(^jobsByYTKBaseRequestBlock)(YTKBaseRequest *_Nonnull request);

@class GKPhotoBrowser;
typedef void(^jobsByGKPhotoBrowserBlock)(GKPhotoBrowser *_Nonnull data);

@class XZMRefreshNormalHeader;
typedef void(^jobsByXZMRefreshNormalHeaderBlock)(XZMRefreshNormalHeader *_Nonnull data);

typedef __kindof UIButton *_Nullable(^JobsReturnButtonByClickBlock)(jobsByBtnBlock _Nullable);

@class MASConstraintMaker;
typedef void(^jobsByMASConstraintMakerBlock)(MASConstraintMaker *_Nonnull data);
typedef void(^jobsByMasonryBlock)(jobsByMASConstraintMakerBlock _Nonnull data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrByMasonryBlock)(jobsByMASConstraintMakerBlock _Nonnull data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrByMASConstraintMakerBlock)(MASConstraintMaker *_Nonnull data);

@class YTKNetworkConfig;
typedef void(^jobsByYTKNetworkConfigBlock)(__kindof YTKNetworkConfig *_Nullable data);

@class YTKBaseRequest;
#import "JobsDefineAllEnumHeader.h"
typedef void(^JobsHandelNoSuccessBlock)(HTTPResponseCode data,YTKBaseRequest *_Nonnull request);
#pragma mark —— 关于业务（不与JobsOCBaseConfigDemo同步）
@class FMBannerAdsModel;
typedef void(^jobsByBannerAdsModelBlock)(__kindof FMBannerAdsModel *_Nullable data);

@class JobsMsgDataModel;
typedef void(^jobsByMsgDataModelBlock)(__kindof JobsMsgDataModel *_Nullable data);

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

