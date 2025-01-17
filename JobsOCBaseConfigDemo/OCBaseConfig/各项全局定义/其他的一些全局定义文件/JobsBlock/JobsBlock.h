//
//  JobsBlock.h
//  Casino
//
//  Created by Jobs on 2022/1/4.
//
/**
  * 全局的Block块定义
  * 基本数据类型尽量的用NSNumber进行二次封装成对象对外输出
 */
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
/// 定义确定参数的Block
#import "ReturnByCertainParameters.h"
#import "VoidByCertainParameters.h"
/// 定义不确定参数的Block
#import "ReturnByUnCertainParameters.h"
#import "VoidByUnCertainParameters.h"

#ifndef JobsBlock_h
#define JobsBlock_h
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
#define Jobs_2_Arguments (id _Nullable data,id _Nullable data2)
#define Jobs_3_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3)
#define Jobs_4_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4)
#define Jobs_5_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5)
#define Jobs_6_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5,id _Nullable data6)
#define Jobs_7_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5,id _Nullable data6,id _Nullable data7)
#define Jobs_8_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5,id _Nullable data6,id _Nullable data7,id _Nullable data8)
#define Jobs_9_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5,id _Nullable data6,id _Nullable data7,id _Nullable data8,id _Nullable data9)
#define Jobs_10_Arguments (id _Nullable data,id _Nullable data2,id _Nullable data3,id _Nullable data4,id _Nullable data5,id _Nullable data6,id _Nullable data7,id _Nullable data8,id _Nullable data9,id _Nullable data10)
/// 涉及到自定义类的Block定义
typedef ComponentType(^JobsReturnComponentTypeByVoidBlock)(void);
typedef DeviceOrientation(^JobsReturnDeviceOrientationByVoidBlock)(void);
typedef AppLanguage(^JobsReturnAppLanguageByVoidBlock)(void);
typedef DeviceOrientation(^JobsReturnDeviceOrientationByViewBlock)(__kindof UIView *_Nullable data);
typedef NSTimeZone *_Nullable(^JobsReturnTimeZoneByTypeBlock)(TimeZoneType timeZoneType);
typedef id _Nullable(^JobsReturnIDByAppLanguageBlock)(AppLanguage data);
typedef id _Nullable(^JobsReturnIDByComponentTypeAndUIViewBlock)(ComponentType componentType,
                                                                 __kindof UIView *_Nullable data);
@class MGSwipeButtonModel;
typedef void(^jobsByMGSwipeButtonModelBlock)(__kindof MGSwipeButtonModel *_Nullable model);

@class JobsRichTextConfig;
typedef NSMutableAttributedString *_Nullable(^JobsReturnAttributedStringByRichTextConfigArrayBlock)(NSArray <JobsRichTextConfig *>* _Nullable data);
typedef void(^jobsByRichTextConfigBlock)(__kindof JobsRichTextConfig *_Nullable data);

@class SDWebImageModel;
typedef void(^jobsBySDWebImageModelBlock)(__kindof SDWebImageModel *_Nullable data);

@class URLManagerModel;
typedef void(^jobsByURLManagerModelBlock)(__kindof URLManagerModel *_Nullable data);
typedef URLManagerModel *_Nullable(^JobsReturnURLManagerModelByStringBlock)(NSString *_Nullable data);

@class UIViewModel;
typedef __kindof UIViewModel *_Nullable(^JobsReturnViewModelByVoidBlock)(void);
typedef __kindof UIViewModel *_Nullable(^JobsReturnViewModelByStringBlock)(NSString *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByViewModelBlock)(UIViewModel *_Nullable data);
typedef void(^jobsByViewModelBlock)(__kindof UIViewModel *_Nullable data);
typedef void(^jobsByArrWithViewModelBlock)(__kindof NSArray <UIViewModel *>*_Nullable data);
typedef CGSize(^JobsReturnCGSizeByViewModelBlock)(__kindof UIViewModel *_Nullable data);
typedef CGRect(^JobsReturnCGRectByViewModelBlock)(__kindof UIViewModel *_Nullable data);
typedef CGFloat(^JobsReturnCGFloatByViewModelBlock)(__kindof UIViewModel *_Nullable data);
typedef __kindof NSArray <UIViewModel *>*_Nullable(^JobsReturnViewModelInArrByArrBlock)(__kindof NSArray *_Nullable data);

@class JobsAppDoorModel;
typedef void(^jobsByAppDoorModelBlock)(__kindof JobsAppDoorModel *_Nullable model);
typedef BOOL(^JobsReturnBOOLByAppDoorModelBlock)(__kindof JobsAppDoorModel *_Nullable model);

@class UNNotificationRequestModel;
typedef void(^jobsByUNNotificationRequestModelBlock)(UNNotificationRequestModel *_Nullable data);
typedef __kindof UNNotificationRequest *_Nullable(^JobsReturnUNNotificationRequestByModelBlock)(UNNotificationRequestModel *_Nullable data);
 
@class JobsAlertModel;
typedef void(^jobsByAlertModelBlock)(JobsAlertModel *_Nullable data);
typedef __kindof UIAlertController *_Nullable(^JobsReturnAlertControllerByAlertModelBlock)(JobsAlertModel *_Nullable data);

@class GoodsClassModel;
typedef void(^jobsByGoodsClassModelBlock)(GoodsClassModel *_Nullable model);
typedef __kindof GoodsClassModel *_Nullable(^JobsReturnGoodsClassModelByIntBlock)(int data);

@class UITextModel;
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTextModelBlock)(UITextModel *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByTextModelBlock)(UITextModel *_Nullable data);
typedef void(^jobsByTextModelBlock)(__kindof UITextModel *_Nullable data);

@class RACModel;
typedef void(^jobsByRACModelBlock)(RACModel *_Nullable data);

@class JobsGestureModel;
typedef void(^jobsByGestureModelBlock)(JobsGestureModel *_Nullable data);

@class JobsIMChatInfoModel;
typedef void(^jobsByIMChatInfoModelBlock)(JobsIMChatInfoModel *_Nullable data);

@class NSTimerManager;
typedef void(^jobsByTimerManagerBlock)(NSTimerManager *_Nullable data);

@class ButtonTimerConfigModel;
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTimerConfigModelBlock)(ButtonTimerConfigModel *_Nonnull data);

@class JobsAppDoorInputViewBaseStyleModel;
typedef void(^jobsByAppDoorInputViewBaseStyleModelBlock)(JobsAppDoorInputViewBaseStyleModel *_Nullable data);
@class JobsAppDoorInputViewBaseStyle;
typedef JobsAppDoorInputViewBaseStyle *_Nullable(^JobsReturnAppDoorInputViewBaseStyleByClassBlock)(Class _Nonnull data);

@class JobsCorModel;
typedef JobsCorModel *_Nonnull(^JobsReturnCorModelByCorBlock)(UIColor *_Nullable data);
typedef JobsCorModel *_Nonnull(^JobsReturnCorModelByVoidBlock)(void);
typedef void(^jobsByCorModelBlock)(JobsCorModel *_Nullable data);

@class ButtonTimerConfigModel;
typedef void(^jobsByButtonTimerConfigModelBlock)(__kindof ButtonTimerConfigModel *_Nullable data);

@class MasonryModel;
typedef void(^jobsByMasonryModelBlock)(__kindof MasonryModel *_Nullable data);
typedef id _Nullable(^JobsReturnIDByMasonryModelBlock)(__kindof MasonryModel *_Nullable data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrByMasonryModelBlock)(__kindof MasonryModel *_Nullable data);

@class UITextFieldModel;
typedef void(^jobsByTextFieldModelBlock)(__kindof UITextFieldModel *_Nullable model);
typedef __kindof UITextFieldModel *_Nullable(^JobsReturnTextFieldModelByString)(__kindof NSString *_Nullable data);

@class JobsFileModel;
@class BaseUploadFileRequest;
typedef void(^jobsByFileModelBlock)(__kindof JobsFileModel *_Nullable model);
typedef __kindof BaseUploadFileRequest *_Nullable(^JobsReturnRequestByFileModelBlock)(__kindof JobsFileModel *_Nullable model);

@class UIButtonModel;
typedef void(^jobsByButtonModelBlock)(__kindof UIButtonModel *_Nullable model);
typedef __kindof UIView *_Nullable(^JobsReturnViewByButtonModelBlock)(UIButtonModel *_Nullable data);
typedef BOOL(^JobsReturnBOOLByButtonModelBlock)(UIButtonModel *_Nullable data);
typedef NSMutableArray <UIButtonModel *>*_Nullable(^JobsReturnButtonModelArrByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsReturnButtonModelByString)(__kindof NSString *_Nullable data);
typedef __kindof UIButtonModel *_Nullable(^JobsReturnButtonModelByStringAndImage)(__kindof NSString *_Nullable title,UIImage *_Nullable image);
typedef __kindof UIButtonModel *_Nullable(^JobsReturnButtonModelByAttributedString)(__kindof NSAttributedString *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByButtonModelBlock)(UIButtonModel *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByButtonModel2Block)(jobsByButtonModelBlock _Nullable data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTimerManagerBlock)(jobsByTimerManagerBlock _Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByButtonModelArrayBlock)(__kindof NSArray <UIButtonModel *>*_Nullable arr);

@class JobsImageModel;
typedef void(^jobsByImageModelBlock)(__kindof JobsImageModel *_Nullable model);

@class FileFolderHandleModel;
typedef void(^jobsByFileFolderHandleModelBlock)(__kindof FileFolderHandleModel *_Nullable model);

@class JobsNavBarConfig;
typedef void(^jobsByNavBarConfigBlock)(__kindof JobsNavBarConfig *_Nullable data);
typedef JobsNavBarConfig *_Nullable(^JobsReturnNavBarConfigByButtonModelBlock)(UIButtonModel *_Nullable backBtnModel,
                                                                               UIButtonModel *_Nullable closeBtnModel);
@class JobsNavBar;
typedef void(^jobsByNavBarBlock)(__kindof JobsNavBar *_Nullable data);

@class JobsTextField;
typedef void(^jobsByJobsTextFieldBlock)(__kindof JobsTextField *_Nullable data);

@class CJTextField;
typedef void(^jobsByCJTextField)(CJTextField *_Nullable textField);

@class ZYTextField;
typedef void(^jobsByZYTextFieldBlock)(ZYTextField *_Nullable textField);

@class JobsStepView;
typedef void(^jobsByStepViewBlock)(__kindof JobsStepView *_Nullable stepView);

@class BaseLabel;
typedef void(^jobsByBaseLabelBlock)(__kindof BaseLabel *_Nullable label);

@class BaseTextView;
typedef void(^jobsByBaseTextViewBlock)(__kindof BaseTextView *_Nullable textView);

@class JobsToggleBaseView;
typedef void(^jobsByToggleBaseViewBlock)(JobsToggleBaseView *_Nullable toggleBaseView);

@class JobsHotLabelBySingleLine;
typedef void(^jobsByHotLabelBlock)(__kindof JobsHotLabelBySingleLine *_Nullable view);

@class FileNameModel;
typedef FileNameModel *_Nonnull(^JobsReturnFileNameModelByFileFullNameStringBlock)(NSString *_Nullable FileFullName);

@class JobsUserModel;
typedef __kindof JobsUserModel<NSCoding> *_Nullable(^JobsReturnUserModelByVoidBlock)(void);
typedef __kindof JobsUserModel<NSCoding> *_Nullable(^JobsReturnUserModelByKeyBlock)(NSString *_Nullable key);
typedef void(^jobsByUserModelBlock)(__kindof JobsUserModel <NSCoding>*_Nullable userModel);
typedef void(^jobsByIDAndKeyBlock)(NSObject <NSCoding> *_Nonnull userModel,
                                   NSString *_Nullable key);
@class UserDefaultModel;
typedef void(^jobsByUserDefaultModelBlock)(UserDefaultModel *_Nonnull data);

@class JobsTabBarItemConfig;
typedef void(^jobsByTabBarItemConfigBlock)(__kindof JobsTabBarItemConfig *_Nullable data);
typedef __kindof UITabBarItem *_Nullable(^JobsReturnTabBarItemByConfigBlock)(__kindof JobsTabBarItemConfig *_Nullable data);

@class LZTabBarConfig;
typedef void(^jobsByLZTabBarConfigBlock)(__kindof LZTabBarConfig *_Nullable data);

@class MJRefreshConfigModel;
typedef void(^jobsByRefreshConfigModelBlock)(__kindof MJRefreshConfigModel *_Nullable model);

@class HXPhotoPickerModel;
typedef void(^jobsByHXPhotoPickerModelBlock)(__kindof HXPhotoPickerModel *_Nullable model);

@class JobsParagraphStyleModel;
typedef void(^jobsByParagraphStyleModelBlock)(__kindof JobsParagraphStyleModel *_Nullable data);

@class JobsLocationModel;
typedef void(^jobsByLocationModelBlock)(__kindof JobsLocationModel *_Nullable model);
typedef __kindof UIView *_Nullable(^JobsReturnViewByLocationModelBlock)(__kindof JobsLocationModel *_Nullable data);

@class GTCaptcha4Model;
typedef void(^jobsByGTCaptcha4ModelBlock)(__kindof GTCaptcha4Model *_Nullable model);
typedef __kindof NSDictionary *_Nullable(^JobsReturnDicByGTCaptcha4ModelBlock)(__kindof GTCaptcha4Model *_Nullable data);

@class FMDoorModel;
typedef void(^jobsByDoorModelBlock)(__kindof FMDoorModel *_Nullable model);
typedef __kindof FMDoorModel *_Nullable(^JobsDoorModelBlock)(__kindof FMDoorModel *_Nullable data);
typedef __kindof FMDoorModel *_Nullable(^JobsReturnDoorModelByGTCaptcha4ModelBlock)(__kindof GTCaptcha4Model *_Nullable data);

@class FMNameModel;
typedef void(^jobsByNameModelBlock)(__kindof FMNameModel *_Nullable model);

@class FMWithDrawModel;
typedef void(^jobsByWithDrawModelBlock)(__kindof FMWithDrawModel *_Nullable model);

@class JobsTimeModel;
typedef void(^jobsByTimeModelBlock)(__kindof JobsTimeModel *_Nullable data);
typedef NSString *_Nullable(^JobsReturnStringByTimeModelBlock)(__kindof JobsTimeModel *_Nullable data);
typedef JobsTimeModel *_Nullable(^JobsReturnTimeModelByIntegerBlock)(NSInteger timeSec);
typedef JobsTimeModel *_Nullable(^JobsReturnTimeModelByStringBlock)(NSString *_Nullable dateFormat);

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

@class JobsExcelView;
typedef void(^jobsByExcelViewBlock)(__kindof JobsExcelView *_Nullable view);
@class JobsExcelContentView;
typedef void(^jobsByExcelContentViewBlock)(__kindof JobsExcelContentView *_Nullable contentView);
@class JobsExcelTopHeadView;
typedef void(^jobsByExcelTopHeadViewBlock)(__kindof JobsExcelTopHeadView *_Nullable topHeadView);
@class JobsExcelLeftListView;
typedef void(^jobsByExcelLeftListViewBlock)(__kindof JobsExcelLeftListView *_Nullable leftListView);

@class JobsKeyValueModel;
typedef void(^jobsByKeyValueModelBlock)(JobsKeyValueModel *_Nullable data);
typedef NSMutableDictionary *_Nonnull(^JobsReturnMutableDicByKeyValueModelBlock)(JobsKeyValueModel *_Nullable data);

@class SPAlertControllerConfig;
typedef void(^jobsBySPAlertControllerConfigBlock)(__kindof SPAlertControllerConfig *_Nullable config);

@class JobsToggleNavView;
typedef void(^jobsByToggleNavViewBlock)(__kindof JobsToggleNavView *_Nullable taggedNavView);

@class JobsCustomTabBar;
typedef void(^jobsByCustomTabBarBlock)(__kindof JobsCustomTabBar *_Nullable customTabBar);
typedef JobsCustomTabBar *_Nullable(^JobsReturnCustomTabBarByViewBlock)(__kindof UIView *_Nullable view);

@class JobsResponseModel;
typedef void(^jobsByResponseModelBlock)(JobsResponseModel *_Nullable responseModel);
typedef id _Nullable(^JobsReturnIDByResponseModelBlock)(JobsResponseModel *_Nullable responseModel);

@class IpifyModel;
typedef void(^jobsByIpifyModelBlock)(IpifyModel *_Nullable ipifyModel);

@class IPApiModel;
typedef void(^jobsByIPApiModelBlock)(IPApiModel *_Nullable iPApiModel);

@class IpinfoModel;
typedef void(^jobsByIpinfoModelBlock)(IpinfoModel *_Nullable ipinfoModel);

@class RequestTool;
typedef void(^jobsByRequestToolBlock)(RequestTool *_Nullable requestTool);

@class BaseModel;
typedef void(^jobsByBaseModelBlock)(__kindof BaseModel *_Nullable baseModel);
typedef void(^jobsByBaseModelAndIndexBlock)(__kindof BaseModel *_Nullable baseModel,NSInteger index);

@class BRStringPickerViewModel;
typedef void(^jobsByBRStringPickerViewModelBlock)(__kindof BRStringPickerViewModel *_Nullable model);

@class JobsDecorationModel;
typedef void(^jobsByDecorationModelBlock)(__kindof JobsDecorationModel *_Nullable model);
typedef UIViewModel *_Nullable(^JobsReturnViewModelByDecorationModelBlock)(JobsDecorationModel *_Nullable model);

typedef __kindof UIView *_Nullable(^JobsReturnViewByBlock1)(jobsByIDBlock _Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByBlock2)(JobsReturnIDByVoidBlock _Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByBlock3)(JobsReturnIDByIDBlock _Nullable data);

typedef __kindof UICollectionView *_Nullable(^JobsReturnCollectionViewByBlock1)(jobsByIDBlock _Nullable data);
/// 涉及到第三方类的Block定义
@class GDFadeView;
typedef void(^jobsByGDFadeViewBlock)(__kindof GDFadeView *_Nullable view);

@class CFGradientLabel;
typedef void(^jobsByCFGradientLabelBlock)(__kindof CFGradientLabel *_Nullable label);

@class WGradientProgressModel;
typedef void(^jobsByWGradientProgressModelBlock)(__kindof WGradientProgressModel *_Nullable model);

@class JhtBannerScrollView;
typedef JhtBannerScrollView *_Nullable(^JobsReturnJhtBannerScrollViewByFrame)(CGRect frame);
typedef CGSize(^JobsReturnCGSizeByJhtBannerScrollView)(JhtBannerScrollView *_Nullable view);
typedef NSInteger(^JobsReturnNSIntegerByJhtBannerScrollView)(JhtBannerScrollView *_Nullable view);

@class JhtBannerCardView;
typedef JhtBannerCardView *_Nullable(^JobsReturnJhtBannerCardViewByFrame)(CGRect frame);

@class FSCalendar;
typedef void(^jobsByFSCalendarBlock)(__kindof FSCalendar *_Nullable calendar);

@class HXPhotoView;
@class HXPhotoManager;
typedef HXPhotoView *_Nullable(^JobsReturnHXPhotoViewByPhotoManagerBlock)(HXPhotoManager *_Nullable manager);

@class HTMLDocument;
typedef HTMLDocument *_Nullable(^JobsReturnHTMLDocumentByStringBlock)(__kindof NSString *_Nullable string);

@class HXPhotoManager;
typedef void(^jobsByHXPhotoManagerBlock)(__kindof HXPhotoManager *_Nullable manager);
typedef __kindof HXPhotoManager *_Nonnull(^JobsReturnHXPhotoManagerByNSUIntegerBlock)(NSUInteger type);
@class HXPhotoConfiguration;
typedef void(^jobsByHXPhotoConfigurationBlock)(__kindof HXPhotoConfiguration *_Nullable config);

@class BRDatePickerView;
@class BRAddressPickerView;
@class BRStringPickerView;
@class BRPickerStyle;
typedef void(^jobsByBRPickerStyleBlock)(__kindof BRPickerStyle *_Nullable pickerStyle);
typedef void(^jobsByBRDatePickerViewBlock)(__kindof BRDatePickerView *_Nullable datePickerView);
typedef void(^jobsByBRAddressPickerViewBlock)(__kindof BRAddressPickerView *_Nullable addressPickerView);
typedef BRDatePickerView *_Nonnull(^JobsReturnBRDatePickerViewByPickerStyleBlock)(BRPickerStyle *_Nullable style);
typedef BRAddressPickerView *_Nonnull(^JobsReturnBRAddressPickerViewByPickerStyleBlock)(BRPickerStyle *_Nullable style);
typedef BRStringPickerView *_Nonnull(^JobsReturnBRStringPickerViewByPickerModeBlock)(NSInteger mode);

@class AFSecurityPolicy;
typedef AFSecurityPolicy *_Nonnull(^JobsReturnAFSecurityPolicyByAFSSLPinningModeBlock)(NSUInteger data);

@class IQKeyboardManager;
typedef void(^jobsByIQKeyboardManagerBlock)(__kindof IQKeyboardManager *_Nullable manager);

@class CJTextField;
typedef void(^JobsByCJTextFieldBlock)(CJTextField *_Nullable data);

@class WMZBannerView;
@class WMZBannerParam;
typedef WMZBannerView *_Nonnull(^JobsReturnWMZBannerViewByBannerParamBlock)(WMZBannerParam *_Nonnull bannerParam);

@class MASConstraintMaker;
typedef void(^jobsByMASConstraintMakerBlock)(MASConstraintMaker *_Nonnull make);
typedef void(^jobsByMasonryBlock)(jobsByMASConstraintMakerBlock _Nonnull data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByMasonryConstraintsBlock)(jobsByMASConstraintMakerBlock _Nullable block);
typedef __kindof NSArray *_Nullable(^JobsReturnArrByMasonryBlock)(jobsByMASConstraintMakerBlock _Nonnull data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrByMASConstraintMakerBlock)(MASConstraintMaker *_Nonnull data);

@class MJRefreshNormalHeader;
typedef MJRefreshNormalHeader *_Nonnull(^JobsReturnMJRefreshNormalHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshNormalHeaderBlock)(MJRefreshNormalHeader *_Nullable view);
@class MJRefreshStateHeader;
typedef MJRefreshStateHeader *_Nonnull(^JobsReturnMJRefreshStateHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshStateHeaderBlock)(MJRefreshStateHeader *_Nullable view);
@class MJRefreshHeader;
typedef MJRefreshHeader *_Nonnull(^JobsReturnMJRefreshHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshHeaderBlock)(MJRefreshHeader *_Nullable view);
@class MJRefreshGifHeader;
typedef MJRefreshGifHeader *_Nonnull(^JobsReturnMJRefreshGifHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshGifHeaderBlock)(MJRefreshGifHeader *_Nullable view);
@class MJRefreshAutoGifFooter;
typedef MJRefreshAutoGifFooter *_Nonnull(^JobsReturnMJRefreshAutoGifFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshAutoGifFooterBlock)(MJRefreshAutoGifFooter *_Nullable view);
@class MJRefreshBackNormalFooter;
typedef MJRefreshBackNormalFooter *_Nonnull(^JobsReturnMJRefreshBackNormalFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshBackNormalFooterBlock)(MJRefreshBackNormalFooter *_Nullable view);
@class MJRefreshAutoNormalFooter;
typedef MJRefreshAutoNormalFooter *_Nonnull(^JobsReturnMJRefreshAutoNormalFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshAutoNormalFooterBlock)(MJRefreshAutoNormalFooter *_Nullable view);
@class MJRefreshAutoStateFooter;
typedef MJRefreshAutoStateFooter *_Nonnull(^JobsReturnMJRefreshAutoStateFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshAutoStateFooterBlock)(MJRefreshAutoStateFooter *_Nullable view);
@class MJRefreshAutoFooter;
typedef MJRefreshAutoFooter *_Nonnull(^JobsReturnMJRefreshAutoFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshAutoFooterBlock)(MJRefreshAutoFooter *_Nullable view);
@class MJRefreshBackGifFooter;
typedef MJRefreshBackGifFooter *_Nonnull(^JobsReturnMJRefreshBackGifFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshBackGifFooterBlock)(MJRefreshBackGifFooter *_Nullable view);
@class MJRefreshBackStateFooter;
typedef MJRefreshBackStateFooter *_Nonnull(^JobsReturnMJRefreshBackStateFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshBackStateFooterBlock)(MJRefreshBackStateFooter *_Nullable view);
@class MJRefreshBackFooter;
typedef MJRefreshBackFooter *_Nonnull(^JobsReturnMJRefreshBackFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshBackFooterBlock)(MJRefreshBackFooter *_Nullable view);
@class MJRefreshFooter;
typedef MJRefreshFooter *_Nonnull(^JobsReturnMJRefreshFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByMJRefreshFooterBlock)(MJRefreshFooter *_Nullable view);
@class LOTAnimationMJRefreshHeader;
typedef LOTAnimationMJRefreshHeader *_Nonnull(^JobsReturnLOTAnimationMJRefreshHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull refreshConfigModel);
typedef void(^jobsByLOTAnimationMJRefreshHeaderBlock)(LOTAnimationMJRefreshHeader *_Nullable view);

@class SRWebSocket;
typedef SRWebSocket *_Nonnull(^JobsReturnSRWebSocketByNSURLRequestBlock)(NSURLRequest *_Nullable webSocket);

@class RACDisposable;
typedef RACDisposable *_Nonnull(^JobsReturnRACDisposableByVoidBlock)(void);
typedef void(^jobsByRACDisposableBlock)(RACDisposable *_Nullable data);
typedef RACDisposable *_Nonnull(^JobsReturnRACDisposableByReturnIDByIDBlock)(JobsReturnIDByIDBlock _Nullable data);
typedef RACDisposable *_Nonnull(^JobsReturnRACDisposableByTimeIntervalBlock)(NSTimeInterval data);
    
@class RACSignal;
typedef NSArray<RACSignal *>*_Nonnull(^JobsReturnRACSignalArrByVoidBlock)(void);

@class GKPhotoBrowser;
typedef void(^jobsByGKPhotoBrowserBlock)(GKPhotoBrowser *_Nonnull data);
typedef GKPhotoBrowser *_Nullable(^JobsReturnGKPhotoBrowserByPhotosArrayAndCurrentIndexBlock)(__kindof NSArray * _Nullable photosArray,NSInteger currentIndex);
@class GKPhoto;
typedef void(^jobsByGKPhotoBlock)(GKPhoto *_Nonnull data);

@class SZTextView;
typedef void(^jobsBySZTextViewBlock)(SZTextView *_Nonnull textView);

@class XZMRefreshNormalHeader;
typedef void(^jobsByXZMRefreshNormalHeaderBlock)(XZMRefreshNormalHeader *_Nonnull data);

typedef __kindof UIButton *_Nullable(^JobsReturnButtonByClickBlock)(jobsByBtnBlock _Nullable);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByIDBlock)(jobsByIDBlock _Nullable);

@class YTKNetworkConfig;
typedef void(^jobsByYTKNetworkConfigBlock)(__kindof YTKNetworkConfig *_Nullable data);

@class YTKRequest;
typedef void(^jobsByYTKRequestBlock)(__kindof YTKRequest *_Nullable request);

@class YTKChainRequest;
typedef void(^jobsByYTKChainRequestBlock)(YTKChainRequest *_Nullable chainRequest);

@class YTKBatchRequest;
typedef void(^jobsByYTKBatchRequestBlock)(__kindof YTKBatchRequest *_Nullable data);
typedef __kindof YTKBatchRequest *_Nullable(^JobsReturnBatchRequestByArrBlock)(__kindof NSArray <YTKRequest *>*_Nullable data);

@class YTKBaseRequest;
typedef void(^jobsByYTKBaseRequestBlock)(YTKBaseRequest *_Nonnull request);
typedef JobsResponseModel *_Nullable(^JobsReturnResponseModelByYTKBaseRequestBlock)(YTKBaseRequest *_Nonnull request);
typedef void(^JobsHandelNoSuccessBlock)(__kindof YTKBaseRequest *_Nonnull request);
typedef __kindof YTKBaseRequest *_Nonnull(^JobsReturnYTKRequestByVoidBlock)(void);
typedef __kindof YTKBaseRequest *_Nonnull(^JobsReturnYTKRequestByIDBlock)(id _Nullable data);
typedef __kindof YTKBaseRequest *_Nonnull(^JobsReturnYTKRequestByDictionaryBlock)(NSDictionary *_Nullable data);

@class ZFAVPlayerManager;
typedef void(^jobsByZFAVPlayerManagerBlock)(__kindof ZFAVPlayerManager *_Nullable data);

@class ZFIJKPlayerManager;
typedef void(^jobsByZFIJKPlayerManagerBlock)(__kindof ZFIJKPlayerManager *_Nullable data);
/// 关于业务（不与JobsOCBaseConfigDemo同步）
@class KYCModel;
typedef void(^jobsByKYCModelBlock)(__kindof KYCModel *_Nullable model);

@class FMTableHeaderView1;
typedef void(^jobsByTableHeaderView1Block)(__kindof FMTableHeaderView1 *_Nullable tableHeaderView);

@class FMBannerAdsModel;
@class WMZBannerParam;
typedef void(^jobsByBannerAdsModelBlock)(__kindof FMBannerAdsModel *_Nullable data);
typedef WMZBannerParam *_Nonnull(^JobsReturnWMZBannerParamByArrBlock)(__kindof NSMutableArray <FMBannerAdsModel *>*_Nullable data);
typedef WMZBannerParam *_Nonnull(^JobsReturnWMZBannerParamByArrAndADTypeBlock)(__kindof NSMutableArray <FMBannerAdsModel *>*_Nullable data,FMAdsType ADType);
typedef void(^jobsByWMZBannerParamBlock)(WMZBannerParam *_Nullable data);

@class JobsMsgDataModel;
typedef void(^jobsByMsgDataModelBlock)(__kindof JobsMsgDataModel *_Nullable data);

@class JobsToggleBaseView;
typedef JobsToggleBaseView *_Nonnull(^JobsReturnToggleBaseViewByArrBlock)(NSMutableArray *_Nullable data);

@class FM_updatePassword_model;
typedef void(^jobsByUpdatePasswordModelBlock)(__kindof FM_updatePassword_model *_Nullable data);

@class FMLikeModel;
typedef void(^jobsByLikeModelBlock)(__kindof FMLikeModel *_Nullable data);

@class FMKYCInfoModel;
typedef void(^jobsByKYCInfoModelBlock)(__kindof FMKYCInfoModel *_Nullable data);

@class FMHotGameListModel;
typedef void(^jobsByHotGameListModelBlock)(__kindof FMHotGameListModel *_Nullable data);

@class FMGameHomeSubMobileModel;
typedef void(^jobsByGameHomeSubMobileModelBlock)(__kindof FMGameHomeSubMobileModel *_Nullable data);

@class FMInboxModel;
typedef void(^jobsByInboxModelBlock)(__kindof FMInboxModel *_Nullable inboxModel);

@class FMInboxTitleModel;
typedef void(^jobsByInboxTitleModelBlock)(__kindof FMInboxTitleModel *_Nullable inboxTitleModel);

@class FMSubjectModel;
typedef void(^jobsBySubjectModelBlock)(__kindof FMSubjectModel *_Nullable subjectModel);

@class FMDateModel;
typedef void(^jobsByFMDateModelBlock)(__kindof FMDateModel *_Nullable dateModel);

@class FMTypeModel;
typedef void(^jobsByTypeModelBlock)(__kindof FMTypeModel *_Nullable typeModel);

@class FMMyBetOrderDetailModel;
typedef void(^jobsByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable data);

@class FMPagerModel;
typedef void(^jobsByPagerModelBlock)(__kindof FMPagerModel *_Nullable data);

@class FMReportTradeModel;
typedef void(^jobsByReportTradeModelBlock)(__kindof FMReportTradeModel *_Nullable model);

@class FMMyBetOrderDetailModel;
typedef void(^jobsByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable data);
typedef JobsExcelConfigureViewModel *_Nullable(^JobsReturnExcelConfigureDataByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable data);
typedef JobsExcelConfigureViewModel *_Nullable(^JobsReturnExcelConfigureDataByReportTradeModelBlock)(__kindof FMReportTradeModel *_Nullable data);

@class FMBankDataSubModel;
typedef void(^jobsByBankDataSubModelBlock)(__kindof FMBankDataSubModel *_Nullable subModel);

@class FMBankDataModel;
typedef void(^jobsByBankDataModelBlock)(__kindof FMBankDataModel *_Nullable model);

@class FMMyGameBetOrderSumModel;
typedef void(^jobsByMyGameBetOrderSumModelBlock)(__kindof FMMyGameBetOrderSumModel *_Nullable model);

@class GetDepositDiscountActivityRecordModel;
typedef UIViewModel *_Nullable(^jobsByGetDepositDiscountActivityRecordModelBlock)(__kindof GetDepositDiscountActivityRecordModel *_Nullable model);

@class FMAccModel;
typedef FMAccModel *_Nullable(^JobsReturnAccModelByArrBlock)(__kindof NSArray *_Nullable arr);
typedef void(^jobsByFMAccModelBlock)(__kindof FMAccModel *_Nullable model);

#endif /* JobsBlock_h */
/*
 
    不定参数Block【 使用示例】
    [self GettingPicBlock:^(id firstArg, ...)NS_REQUIRES_NIL_TERMINATION{
        @jobs_strongify(self)
        if (firstArg) {
            // 取出第一个参数
            JobsLog(@"%@", firstArg);
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
    //                    JobsLog(@"KKK = %@", arg);
                    if ([arg isKindOfClass:UIImage.class]) {
                        JobsLog(@"");
                    }else if ([arg isKindOfClass:PHAsset.class]){
                        JobsLog(@"");
                    }else if ([arg isKindOfClass:NSString.class]){
                        JobsLog(@"");
                    }else if ([arg isKindOfClass:NSArray.class]){
                        JobsLog(@"");
                    }else{
                        JobsLog(@"");
                    }
                }
            }else{
                JobsLog(@"");
            }
            // 清空参数列表，并置参数指针args无效
            va_end(args);
        }
    }];

*/
