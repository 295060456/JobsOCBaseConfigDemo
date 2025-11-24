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
#import "JobsBlockDef.h"
#import "JobsDefineAllEnumHeader.h"            // 此文件用来存储记录全局的一些枚举
/// 定义确定参数的Block
#import "ReturnByCertainParametersBlock.h"
#import "VoidByCertainParametersBlock.h"
/// 定义不确定参数的Block
#import "ReturnByUnCertainParameters.h"
#import "VoidByUnCertainParameters.h"

#ifndef JobsBlock_h
#define JobsBlock_h
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
#pragma mark —— 涉及到自定义类的Block定义
typedef ComponentType(^JobsReturnComponentTypeByVoidBlock)(void);
typedef DeviceOrientation(^JobsReturnDeviceOrientationByVoidBlock)(void);
typedef AppLanguage(^JobsReturnAppLanguageByVoidBlock)(void);
typedef DeviceOrientation(^JobsReturnDeviceOrientationByViewBlock)(__kindof UIView *_Nullable data);
typedef NSTimeZone *_Nullable(^JobsReturnTimeZoneByTypeBlock)(TimeZoneType timeZoneType);
typedef id _Nullable(^JobsReturnIDByAppLanguageBlock)(AppLanguage data);
typedef id _Nullable(^JobsReturnIDByComponentTypeAndUIViewBlock)(Jobs_ReturnIDByComponentTypeAndUIViewBlock_Arguments);
@class JobsTextView;
typedef void(^jobsByJobsTextViewBlock)(__kindof JobsTextView *_Nullable textView);

@class ZFAVPlayerManager;
@class ZFIJKPlayerManager;
@class ZFDouYinControlView;
@class ZFCustomControlView;
@class CustomZFPlayerControlView;
typedef void(^jobsByZFAVPlayerManagerBlock)(__kindof ZFAVPlayerManager *_Nullable manager);
typedef void(^jobsByZFIJKPlayerManagerBlock)(__kindof ZFIJKPlayerManager *_Nullable manager);
typedef void(^jobsByZFDouYinControlViewBlock)(__kindof ZFDouYinControlView *_Nullable controlView);
typedef void(^jobsByZFCustomControlViewBlock)(__kindof ZFCustomControlView *_Nullable controlView);
typedef void(^jobsByCustomZFPlayerControlViewBlock)(__kindof CustomZFPlayerControlView *_Nullable controlView);

@class JobsRightBtnsView;
typedef void(^jobsByRightBtnsViewBlock)(__kindof JobsRightBtnsView *_Nullable view);

@class BaseView;
typedef void(^jobsByBaseViewBlock)(__kindof BaseView *_Nullable view);

@class JobsTabBarVC;
typedef void(^jobsByTabBarVCBlock)(__kindof JobsTabBarVC *_Nullable vc);

@class JobsCustomTabBarVC;
typedef void(^jobsByCustomTabBarVCBlock)(__kindof JobsCustomTabBarVC *_Nullable vc);

@class JobsCustomTabBarConfig;
typedef void(^jobsByCustomTabBarConfigBlock)(__kindof JobsCustomTabBarConfig *_Nullable config);
 
@class MGSwipeButtonModel;
typedef void(^jobsByMGSwipeButtonModelBlock)(__kindof MGSwipeButtonModel *_Nullable model);

@class JobsRichTextConfig;
typedef NSMutableAttributedString *_Nullable(^JobsReturnAttributedStringByRichTextConfigArrayBlock)(NSArray <JobsRichTextConfig *>* _Nullable configs);
typedef void(^jobsByRichTextConfigBlock)(__kindof JobsRichTextConfig *_Nullable config);

@class SDWebImageModel;
typedef void(^jobsBySDWebImageModelBlock)(__kindof SDWebImageModel *_Nullable model);

@class URLManagerModel;
typedef void(^jobsByURLManagerModelBlock)(__kindof URLManagerModel *_Nullable model);
typedef URLManagerModel *_Nullable(^JobsReturnURLManagerModelByStringBlock)(NSString *_Nullable data);

@class UIViewModel;
typedef void(^jobsByViewModelAndBOOLBlock)(Jobs_ViewModelAndBOOLBlock_Arguments);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByViewModelAndBOOLBlock)(Jobs_ViewModelAndBOOLBlock_Arguments);
typedef __kindof UIViewModel *_Nullable(^JobsReturnViewModelByVoidBlock)(void);
typedef __kindof UIViewModel *_Nullable(^JobsReturnViewModelByStringBlock)(NSString *_Nullable string);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByViewModelBlock)(__kindof UIViewModel *_Nullable model);
typedef void(^jobsByViewModelBlock)(__kindof UIViewModel *_Nullable model);
typedef void(^jobsByArrWithViewModelBlock)(__kindof NSArray <__kindof UIViewModel *>*_Nullable models);
typedef CGSize(^JobsReturnCGSizeByViewModelBlock)(__kindof UIViewModel *_Nullable model);
typedef CGRect(^JobsReturnCGRectByViewModelBlock)(__kindof UIViewModel *_Nullable model);
typedef CGFloat(^JobsReturnCGFloatByViewModelBlock)(__kindof UIViewModel *_Nullable model);
typedef __kindof NSArray <UIViewModel *>*_Nullable(^JobsReturnViewModelInArrByArrBlock)(__kindof NSArray *_Nullable arr);

@class BaseTableView;
typedef void(^jobsByBaseTableViewBlock)(__kindof BaseTableView *_Nullable tableView);

@class JobsSearchBar;
typedef void(^jobsBySearchBarBlock)(__kindof JobsSearchBar *_Nullable searchBar);

@class JobsAppDoorModel;
typedef void(^jobsByAppDoorModelBlock)(__kindof JobsAppDoorModel *_Nullable model);
typedef BOOL(^JobsReturnBOOLByAppDoorModelBlock)(__kindof JobsAppDoorModel *_Nullable model);

@class UNNotificationRequestModel;
typedef void(^jobsByUNNotificationRequestModelBlock)(UNNotificationRequestModel *_Nullable model);
typedef __kindof UNNotificationRequest *_Nullable(^JobsReturnUNNotificationRequestByModelBlock)(UNNotificationRequestModel *_Nullable model);
 
@class JobsAlertModel;
typedef void(^jobsByAlertModelBlock)(JobsAlertModel *_Nullable model);
typedef __kindof UIAlertController *_Nullable(^JobsReturnAlertControllerByAlertModelBlock)(JobsAlertModel *_Nullable model);

@class UITextModel;
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTextModelBlock)(UITextModel *_Nullable model);
typedef __kindof UIView *_Nullable(^JobsReturnViewByTextModelBlock)(UITextModel *_Nullable model);
typedef void(^jobsByTextModelBlock)(__kindof UITextModel *_Nullable model);

@class JobsMagicTextField;
typedef void(^jobsByMagicTextFieldBlock)(__kindof JobsMagicTextField *_Nullable textField);

@class RACModel;
typedef void(^jobsByRACModelBlock)(RACModel *_Nullable model);

@class JobsGestureModel;
typedef void(^jobsByGestureModelBlock)(JobsGestureModel *_Nullable model);

@class JobsIMChatInfoModel;
typedef void(^jobsByIMChatInfoModelBlock)(JobsIMChatInfoModel *_Nullable model);

@class JobsAppDoorInputViewBaseStyleModel;
typedef void(^jobsByAppDoorInputViewBaseStyleModelBlock)(JobsAppDoorInputViewBaseStyleModel *_Nullable model);
@class JobsAppDoorInputViewBaseStyle;
typedef JobsAppDoorInputViewBaseStyle *_Nullable(^JobsReturnAppDoorInputViewBaseStyleByClassBlock)(Class _Nonnull cls);

@class JobsCorModel;
typedef JobsCorModel *_Nonnull(^JobsReturnCorModelByVoidBlock)(void);
typedef JobsCorModel *_Nonnull(^JobsReturnCorModelByCorBlock)(__kindof UIColor *_Nullable data);
typedef void(^jobsByCorModelBlock)(JobsCorModel *_Nullable data);

@class JobsControlTarget;
typedef void(^jobsByControlTargeBlock)(JobsControlTarget *_Nullable data);

@class JobsMenuView;
typedef void(^jobsByMenuViewBlock)(__kindof JobsMenuView *_Nullable view);

@class JobsViewNavigator;
typedef void(^jobsByViewNavigatorBlock)(__kindof JobsViewNavigator *_Nullable navigator);
typedef JobsViewNavigator *_Nonnull(^JobsReturnViewNavigatorByViewAndAnimatedBlock)(Jobs_ReturnViewNavigatorByViewAndAnimatedBlock_Arguments);
typedef JobsViewNavigator *_Nonnull(^JobsReturnViewNavigatorByBOOLBlock)(BOOL data);

@class BaseNavigationBar;
typedef void(^jobsByBaseNavigationBarBlock)(__kindof BaseNavigationBar *_Nullable navBar);

@class MasonryModel;
typedef void(^jobsByMasonryModelBlock)(__kindof MasonryModel *_Nullable model);
typedef id _Nullable(^JobsReturnIDByMasonryModelBlock)(__kindof MasonryModel *_Nullable model);
typedef __kindof NSArray *_Nullable(^JobsReturnArrByMasonryModelBlock)(__kindof MasonryModel *_Nullable model);

@class LZTabBar;
typedef void(^jobsByLZTabBarBlock)(__kindof LZTabBar *_Nullable tabBar);
@class LZTabBarItem;
typedef void(^jobsByLZTabBarItemBlock)(__kindof LZTabBarItem *_Nullable item);

@class UITextFieldModel;
typedef void(^jobsByTextFieldModelBlock)(__kindof UITextFieldModel *_Nullable model);
typedef __kindof UITextFieldModel *_Nullable(^JobsReturnTextFieldModelByString)(__kindof NSString *_Nullable data);

@class JobsFileModel;
@class BaseUploadFileRequest;
typedef void(^jobsByFileModelBlock)(__kindof JobsFileModel *_Nullable model);
typedef __kindof BaseUploadFileRequest *_Nullable(^JobsReturnRequestByFileModelBlock)(__kindof JobsFileModel *_Nullable model);

@class UIButtonModel;
typedef void(^jobsByButtonModelBlock)(__kindof UIButtonModel *_Nullable model);
typedef void(^jobsByButtonModelAndBOOLBlock)(Jobs_ByButtonModelAndBOOLBlock_Arguments);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByButtonModelAndBOOLBlock)(Jobs_ByButtonModelAndBOOLBlock_Arguments);
typedef __kindof UIView *_Nullable(^JobsReturnViewByButtonModelBlock)(UIButtonModel *_Nullable model);
typedef BOOL(^JobsReturnBOOLByButtonModelBlock)(UIButtonModel *_Nullable data);
typedef NSMutableArray <UIButtonModel *>*_Nullable(^JobsReturnButtonModelArrByArrBlock)(__kindof NSArray *_Nullable arr);
typedef __kindof UIButtonModel *_Nullable(^JobsReturnButtonModelByString)(__kindof NSString *_Nullable string);
typedef __kindof UIButtonModel *_Nullable(^JobsReturnButtonModelByAttributedString)(__kindof NSAttributedString *_Nullable aString);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByButtonModelBlock)(__kindof UIButtonModel *_Nullable model);
typedef __kindof UIView *_Nullable(^JobsReturnViewByButtonModelArrayBlock)(__kindof NSArray <UIButtonModel *>*_Nullable models);

@class JobsImageModel;
typedef void(^jobsByImageModelBlock)(__kindof JobsImageModel *_Nullable model);

@class PointLabBaseView;
typedef void(^jobsByPointLabBaseViewBlock)(__kindof PointLabBaseView *_Nullable view);

@class JobsTabBar;
typedef void(^jobsByTabBarBlock)(JobsTabBar *_Nullable tabBar);

@class FileFolderHandleModel;
typedef void(^jobsByFileFolderHandleModelBlock)(__kindof FileFolderHandleModel *_Nullable model);

@class JobsNavBarConfig;
typedef void(^jobsByNavBarConfigBlock)(__kindof JobsNavBarConfig *_Nullable config);
typedef JobsNavBarConfig *_Nullable(^JobsReturnNavBarConfigByStringBlock)(NSString *_Nullable string);
typedef JobsNavBarConfig *_Nullable(^JobsReturnNavBarConfigByStringsBlock)(Jobs_NSStringBlock_3_Arguments);
typedef JobsNavBarConfig *_Nullable(^JobsReturnNavBarConfigByAttributedStringBlock)(NSAttributedString *_Nullable aString);
typedef JobsNavBarConfig *_Nullable(^JobsReturnNavBarConfigByStringAndActionBlock)(Jobs_NavBarConfig_Title_Action_Arguments);
typedef JobsNavBarConfig *_Nullable(^JobsReturnNavBarConfigByStringsAndActionBlock)(Jobs_NavBarConfig_Titles_Action_Arguments);
typedef JobsNavBarConfig *_Nullable(^JobsReturnNavBarConfigByButtonModelBlock)(Jobs_NavBarConfig_BackBtnModel_CloseBtnModel_Arguments);

@class JobsNavBar;
typedef void(^jobsByNavBarBlock)(__kindof JobsNavBar *_Nullable data);

@class JobsTextField;
typedef void(^jobsByJobsTextFieldBlock)(__kindof JobsTextField *_Nullable data);
typedef __kindof JobsTextField *_Nonnull(^JobsReturnJobsTextFieldByCGFloatBlock)(CGFloat data);
typedef __kindof JobsTextField *_Nonnull(^JobsReturnJobsTextFieldByBOOLBlock)(BOOL data);
typedef __kindof JobsTextField *_Nonnull(^JobsReturnJobsTextFieldByGestureRecognizerBlock)(__kindof UIGestureRecognizer * _Nullable gesture);
typedef __kindof JobsTextField *_Nonnull(^JobsReturnJobsTextFieldByCorBlock)(UIColor *_Nullable cor);
typedef __kindof JobsTextField *_Nonnull(^JobsReturnJobsTextFieldByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof JobsTextField *_Nullable(^JobsReturnJobsTextFieldByModeBlock)(UITextFieldViewMode mode);

@class CJTextField;
typedef void(^jobsByCJTextField)(CJTextField *_Nullable textField);

@class ZYTextField;
typedef void(^jobsByZYTextFieldBlock)(ZYTextField *_Nullable textField);

@class JobsStepView;
typedef void(^jobsByStepViewBlock)(__kindof JobsStepView *_Nullable stepView);
typedef __kindof JobsStepView *_Nullable(^JobsReturnStepViewByCGFloatBlock)(CGFloat data);
typedef __kindof JobsStepView *_Nullable(^JobsReturnStepViewByNSIntegerBlock)(NSInteger data);
typedef __kindof JobsStepView *_Nullable(^JobsReturnStepViewByColorBlock)(UIColor *_Nullable cor);

@class BaseLabel;
typedef void(^jobsByBaseLabelBlock)(__kindof BaseLabel *_Nullable label);

@class BaseTextView;
typedef void(^jobsByBaseTextViewBlock)(__kindof BaseTextView *_Nullable textView);

@class JobsToggleBaseView;
typedef void(^jobsByToggleBaseViewBlock)(JobsToggleBaseView *_Nullable toggleBaseView);

@class JobsHotLabelBySingleLine;
typedef void(^jobsByHotLabelBlock)(__kindof JobsHotLabelBySingleLine *_Nullable view);

@class FileNameModel;
typedef FileNameModel *_Nonnull(^JobsReturnFileNameModelByFileFullNameStringBlock)(NSString *_Nullable fileFullName);

@class JobsUserModel;
typedef __kindof JobsUserModel<NSCoding> *_Nullable(^JobsReturnUserModelByVoidBlock)(void);
typedef __kindof JobsUserModel<NSCoding> *_Nullable(^JobsReturnUserModelByKeyBlock)(NSString *_Nullable key);
typedef void(^jobsByUserModelBlock)(__kindof JobsUserModel <NSCoding>*_Nullable model);
typedef void(^jobsByIDAndKeyBlock)(NSObject <NSCoding> *_Nonnull userModel,
                                   NSString *_Nullable key);
@class UserDefaultModel;
typedef void(^jobsByUserDefaultModelBlock)(UserDefaultModel *_Nonnull data);

@class JobsTabBarItemConfig;
typedef void(^jobsByTabBarItemConfigBlock)(__kindof JobsTabBarItemConfig *_Nullable config);
typedef __kindof UITabBarItem *_Nullable(^JobsReturnTabBarItemByConfigBlock)(__kindof JobsTabBarItemConfig *_Nullable config);

@class LZTabBarConfig;
typedef void(^jobsByLZTabBarConfigBlock)(__kindof LZTabBarConfig *_Nullable config);

@class HXPhotoPickerModel;
typedef void(^jobsByHXPhotoPickerModelBlock)(__kindof HXPhotoPickerModel *_Nullable model);

@class JobsParagraphStyleModel;
typedef void(^jobsByParagraphStyleModelBlock)(__kindof JobsParagraphStyleModel *_Nullable model);
typedef __kindof NSMutableAttributedString *_Nullable(^JobsReturnMutAttributedStringByParagraphStyleModelBlock)(__kindof JobsParagraphStyleModel *_Nullable model);

@class JobsLocationModel;
typedef void(^jobsByLocationModelBlock)(__kindof JobsLocationModel *_Nullable model);
typedef __kindof UIView *_Nullable(^JobsReturnViewByLocationModelBlock)(__kindof JobsLocationModel *_Nullable model);

@class GTCaptcha4Model;
typedef void(^jobsByGTCaptcha4ModelBlock)(__kindof GTCaptcha4Model *_Nullable model);
typedef __kindof NSDictionary *_Nullable(^JobsReturnDicByGTCaptcha4ModelBlock)(__kindof GTCaptcha4Model *_Nullable model);

@class FMDoorModel;
typedef void(^jobsByDoorModelBlock)(__kindof FMDoorModel *_Nullable model);
typedef __kindof FMDoorModel *_Nullable(^JobsDoorModelBlock)(__kindof FMDoorModel *_Nullable model);
typedef __kindof FMDoorModel *_Nullable(^JobsReturnDoorModelByGTCaptcha4ModelBlock)(__kindof GTCaptcha4Model *_Nullable model);

@class FMNameModel;
typedef void(^jobsByNameModelBlock)(__kindof FMNameModel *_Nullable model);

@class FMWithDrawModel;
typedef void(^jobsByWithDrawModelBlock)(__kindof FMWithDrawModel *_Nullable model);

@class JobsTimeModel;
typedef void(^jobsByTimeModelBlock)(__kindof JobsTimeModel *_Nullable model);
typedef NSString *_Nullable(^JobsReturnStringByTimeModelBlock)(__kindof JobsTimeModel *_Nullable model);
typedef JobsTimeModel *_Nullable(^JobsReturnTimeModelByIntegerBlock)(NSInteger timeSec);
typedef JobsTimeModel *_Nullable(^JobsReturnTimeModelByStringBlock)(NSString *_Nullable dateFormat);

@class VideoModel_Core;
typedef void(^jobsByVideoModelCoreBlock)(__kindof VideoModel_Core *_Nullable model);

@class NotificationModel;
typedef void(^jobsByNotificationModelBlock)(NotificationModel *_Nullable model);

@class NSNotificationKeyboardModel;
typedef void(^jobsByNSNotificationKeyboardModelBlock)(NSNotificationKeyboardModel *_Nullable model);

@class JobsExcelConfigureViewModel;
typedef void(^jobsByExcelConfigureViewModelBlock)(JobsExcelConfigureViewModel *_Nullable model);

@class PopListBaseView;
typedef void(^jobsByPopListBaseViewBlock)(PopListBaseView *_Nullable data);
typedef PopListBaseView *_Nonnull(^JobsReturnPopListBaseViewByID)(id _Nullable data);

@class JobsExcelView;
typedef void(^jobsByExcelViewBlock)(__kindof JobsExcelView *_Nullable view);
@class JobsExcelContentView;
typedef void(^jobsByExcelContentViewBlock)(__kindof JobsExcelContentView *_Nullable contentView);
@class JobsExcelTopHeadView;
typedef void(^jobsByExcelTopHeadViewBlock)(__kindof JobsExcelTopHeadView *_Nullable topHeadView);
@class JobsExcelLeftListView;
typedef void(^jobsByExcelLeftListViewBlock)(__kindof JobsExcelLeftListView *_Nullable leftListView);

@class JobsUserHeaderDataViewTBVCell;
typedef void(^jobsByUserHeaderDataViewTBVCellBlock)(JobsUserHeaderDataViewTBVCell *_Nullable cell);

@class JobsKeyValueModel;
typedef void(^jobsByKeyValueModelBlock)(JobsKeyValueModel *_Nullable data);
typedef NSMutableDictionary *_Nonnull(^JobsReturnMutableDicByKeyValueModelBlock)(JobsKeyValueModel *_Nullable model);

@class SPAlertControllerConfig;
typedef void(^jobsBySPAlertControllerConfigBlock)(__kindof SPAlertControllerConfig *_Nullable config);

@class JobsToggleNavView;
typedef void(^jobsByToggleNavViewBlock)(__kindof JobsToggleNavView *_Nullable taggedNavView);

@class JobsCustomTabBar;
typedef void(^jobsByCustomTabBarBlock)(__kindof JobsCustomTabBar *_Nullable customTabBar);
typedef JobsCustomTabBar *_Nullable(^JobsReturnCustomTabBarByViewBlock)(__kindof UIView *_Nullable view);

@class JobsDecorationModel;
typedef __kindof JobsDecorationModel *_Nullable(^JobsReturnDecorationModelByClsBlock)(Class _Nullable cls);
typedef __kindof JobsDecorationModel *_Nullable(^JobsReturnDecorationModelByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof JobsDecorationModel *_Nullable(^JobsReturnDecorationModelByIDBlock)(id _Nullable data);

@class JobsResponseModel;
typedef void(^jobsByResponseModelBlock)(JobsResponseModel *_Nullable model);
typedef id _Nullable(^JobsReturnIDByResponseModelBlock)(JobsResponseModel *_Nullable model);

@class IpifyModel;
typedef void(^jobsByIpifyModelBlock)(IpifyModel *_Nullable model);

@class IPApiModel;
typedef void(^jobsByIPApiModelBlock)(IPApiModel *_Nullable model);

@class IpinfoModel;
typedef void(^jobsByIpinfoModelBlock)(IpinfoModel *_Nullable model);

@class RequestTool;
typedef void(^jobsByRequestToolBlock)(RequestTool *_Nullable tool);

@class BaseModel;
typedef void(^jobsByBaseModelBlock)(__kindof BaseModel *_Nullable model);
typedef void(^jobsByBaseModelAndIndexBlock)(__kindof BaseModel *_Nullable model,NSInteger index);

@class BRStringPickerViewModel;
typedef void(^jobsByBRStringPickerViewModelBlock)(__kindof BRStringPickerViewModel *_Nullable model);

@class JobsDecorationModel;
typedef void(^jobsByDecorationModelBlock)(__kindof JobsDecorationModel *_Nullable model);
typedef UIViewModel *_Nullable(^JobsReturnViewModelByDecorationModelBlock)(JobsDecorationModel *_Nullable model);
#pragma mark —— 涉及到第三方类的Block定义
@class MGSwipeTableCell;
#if __has_include(<MGSwipeTableCell/MGSwipeTableCell.h>)
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#else
#import "MGSwipeTableCell.h"
#endif
typedef __kindof MGSwipeTableCell *_Nullable(^JobsReturnMGSwipeTableCellByBOOLBlock)(BOOL data);
typedef __kindof MGSwipeTableCell *_Nonnull(^JobsReturnMGSwipeTableCellByDelegateBlock)(id<MGSwipeTableCellDelegate> _Nullable delegate);

@class UIButtonModel;
@class GKCustomNavigationBar;
typedef __kindof GKCustomNavigationBar *_Nullable(^JobsReturnGKNavBarByButtonModelBlock)(__kindof UIButtonModel *_Nullable model);

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
typedef HXPhotoView *_Nullable(^JobsReturnHXPhotoViewByPhotoManagerBlock)(__kindof HXPhotoManager *_Nullable manager);

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
@class BRTextPickerView;
@class BRPickerStyle;
typedef void(^jobsByBRPickerStyleBlock)(__kindof BRPickerStyle *_Nullable pickerStyle);
typedef void(^jobsByBRDatePickerViewBlock)(__kindof BRDatePickerView *_Nullable datePickerView);
typedef void(^jobsByBRAddressPickerViewBlock)(__kindof BRAddressPickerView *_Nullable addressPickerView);
typedef BRDatePickerView *_Nonnull(^JobsReturnBRDatePickerViewByPickerStyleBlock)(__kindof BRPickerStyle *_Nullable style);
typedef BRAddressPickerView *_Nonnull(^JobsReturnBRAddressPickerViewByPickerStyleBlock)(__kindof BRPickerStyle *_Nullable style);
typedef BRStringPickerView *_Nonnull(^JobsReturnBRStringPickerViewByPickerModeBlock)(NSInteger mode);
typedef BRTextPickerView *_Nonnull(^JobsReturnBRTextPickerViewByPickerModeBlock)(NSInteger mode);

@class AFSecurityPolicy;
typedef AFSecurityPolicy *_Nonnull(^JobsReturnAFSecurityPolicyByAFSSLPinningModeBlock)(NSUInteger data);

@class IQKeyboardManager;
typedef void(^jobsByIQKeyboardManagerBlock)(__kindof IQKeyboardManager *_Nullable manager);

@class CJTextField;
typedef void(^JobsByCJTextFieldBlock)(CJTextField *_Nullable data);

@class JobsTransitionAnimator;
typedef __kindof JobsTransitionAnimator *_Nullable(^JobsReturnAnimatorByTransDirectionBlock)(JobsTransitionDirection direction);

@class JobsNavigationTransitionMgr;
typedef void(^jobsByNavigationTransitionManagerBlock)(__kindof JobsNavigationTransitionMgr *_Nullable manager);

@class JobsTimer;
@protocol TimerProtocol;
typedef void(^JobsTimerBlock)(JobsTimer *_Nullable timer);
typedef void(^jobsByCGFloatBlocks)(jobsByCGFloatBlock _Nullable timer);

typedef __kindof JobsTimer *_Nullable(^JobsRetJTimerByJTimerBlock)(__kindof JobsTimer * _Nullable timer);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByCGFloatBlock)(CGFloat time);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByDoubleBlock)(double time);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByStringBlock)(NSString * _Nullable mode);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByUserInfo)(id _Nullable userInfo);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByQueue)(dispatch_queue_t _Nullable queue);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByNSUInteger)(NSUInteger state);

@class JobsNetworkSource;
typedef void(^jobsByNetworkSourceBlock)(__kindof JobsNetworkSource *_Nullable source);
typedef void(^JobsNetworkUpdateBlock)(JobsNetworkSource * _Nullable source,
                                      uint64_t uploadBytesPerSec,
                                      uint64_t downloadBytesPerSec);
@class JobsNetworkTrafficMonitor;
typedef __kindof JobsNetworkTrafficMonitor *_Nullable(^JobsRetTNetworkTrafficMonitorByUpdateBlock)(JobsNetworkUpdateBlock _Nullable block);

/// 返回 self 的 DSL block：传入一个 void 回调，返回实现该协议的对象（方便链式）
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByCGFloatBlocks)(jobsByCGFloatBlock _Nullable block);
typedef __kindof JobsTimer *_Nullable(^JobsRetTimerByJTimerBlocks)(JobsTimerBlock _Nullable block);

@class WMZBannerView;
@class WMZBannerParam;
typedef WMZBannerView *_Nonnull(^JobsReturnWMZBannerViewByBannerParamBlock)(WMZBannerParam *_Nonnull bannerParam);

@class MASConstraintMaker;
typedef __kindof NSArray *_Nullable(^JobsReturnArrByMASConstraintMakerBlock)(MASConstraintMaker *_Nonnull data);
typedef void(^jobsByMASConstraintMakerBlock)(MASConstraintMaker *_Nonnull make);

@class MJRefreshConfigModel;
typedef void(^jobsByRefreshConfigModelBlock)(__kindof MJRefreshConfigModel *_Nullable model);
@class MJRefreshStateHeader;
typedef __kindof MJRefreshStateHeader *_Nullable(^JobsReturnMJRefreshStateHeaderByMJRefreshConfigModelBlock)(MJRefreshConfigModel *_Nullable config);
@class MJRefreshNormalHeader;
typedef __kindof MJRefreshNormalHeader *_Nonnull(^JobsReturnMJRefreshNormalHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshNormalHeaderBlock)(__kindof MJRefreshNormalHeader *_Nullable view);
@class MJRefreshStateHeader;
typedef __kindof MJRefreshStateHeader *_Nonnull(^JobsReturnMJRefreshStateHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshStateHeaderBlock)(__kindof MJRefreshStateHeader *_Nullable view);
@class MJRefreshHeader;
typedef __kindof UIScrollView *_Nullable(^JobsReturnScrollViewByMJRefreshHeaderBlock)(__kindof MJRefreshHeader *_Nullable header);
typedef __kindof UITableView *_Nullable(^JobsReturnTableViewByMJRefreshHeaderBlock)(__kindof MJRefreshHeader *_Nullable header);
typedef __kindof UICollectionView *_Nullable(^JobsReturnCollectionViewByMJRefreshHeaderBlock)(__kindof MJRefreshHeader *_Nullable header);
typedef __kindof MJRefreshHeader *_Nonnull(^JobsReturnMJRefreshHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshHeaderBlock)(__kindof MJRefreshHeader *_Nullable view);
@class MJRefreshGifHeader;
typedef __kindof MJRefreshGifHeader *_Nonnull(^JobsReturnMJRefreshGifHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshGifHeaderBlock)(__kindof MJRefreshGifHeader *_Nullable view);
/// MJRefreshFooter
@class MJRefreshFooter;
typedef __kindof MJRefreshFooter *_Nonnull(^JobsReturnMJRefreshFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshFooterBlock)(__kindof MJRefreshFooter *_Nullable view);
typedef __kindof UIScrollView *_Nullable(^JobsReturnScrollViewByMJRefreshFooterBlock)(__kindof MJRefreshFooter *_Nullable footer);
typedef __kindof UITableView *_Nullable(^JobsReturnTableViewByMJRefreshFooterBlock)(__kindof MJRefreshFooter *_Nullable footer);
typedef __kindof UICollectionView *_Nullable(^JobsReturnCollectionViewByMJRefreshFooterBlock)(__kindof MJRefreshFooter *_Nullable footer);
@class MJRefreshAutoGifFooter;
typedef __kindof MJRefreshAutoGifFooter *_Nonnull(^JobsReturnMJRefreshAutoGifFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshAutoGifFooterBlock)(__kindof MJRefreshAutoGifFooter *_Nullable view);
@class MJRefreshBackNormalFooter;
typedef __kindof MJRefreshBackNormalFooter *_Nonnull(^JobsReturnMJRefreshBackNormalFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshBackNormalFooterBlock)(__kindof MJRefreshBackNormalFooter *_Nullable view);
@class MJRefreshAutoNormalFooter;
typedef __kindof MJRefreshAutoNormalFooter *_Nonnull(^JobsReturnMJRefreshAutoNormalFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshAutoNormalFooterBlock)(__kindof MJRefreshAutoNormalFooter *_Nullable view);
@class MJRefreshAutoStateFooter;
typedef __kindof MJRefreshAutoStateFooter *_Nonnull(^JobsReturnMJRefreshAutoStateFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshAutoStateFooterBlock)(__kindof MJRefreshAutoStateFooter *_Nullable view);
@class MJRefreshAutoFooter;
typedef __kindof MJRefreshAutoFooter *_Nonnull(^JobsReturnMJRefreshAutoFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshAutoFooterBlock)(__kindof MJRefreshAutoFooter *_Nullable view);
@class MJRefreshBackGifFooter;
typedef __kindof MJRefreshBackGifFooter *_Nonnull(^JobsReturnMJRefreshBackGifFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshBackGifFooterBlock)(__kindof MJRefreshBackGifFooter *_Nullable view);
@class MJRefreshBackStateFooter;
typedef __kindof MJRefreshBackStateFooter *_Nonnull(^JobsReturnMJRefreshBackStateFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshBackStateFooterBlock)(__kindof MJRefreshBackStateFooter *_Nullable view);
@class MJRefreshBackFooter;
typedef __kindof MJRefreshBackFooter *_Nonnull(^JobsReturnMJRefreshBackFooterByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef void(^jobsByMJRefreshBackFooterBlock)(__kindof MJRefreshBackFooter *_Nullable view);

@class LOTAnimationMJRefreshHeader;
typedef LOTAnimationMJRefreshHeader *_Nonnull(^JobsReturnLOTAnimationMJRefreshHeaderByRefreshConfigModelBlock)(MJRefreshConfigModel *_Nonnull model);
typedef LOTAnimationMJRefreshHeader *_Nonnull(^JobsReturnLOTAnimationMJRefreshHeaderBySizeBlock)(CGSize size);

typedef void(^jobsByLOTAnimationMJRefreshHeaderBlock)(LOTAnimationMJRefreshHeader *_Nullable view);

@class SRWebSocket;
typedef SRWebSocket *_Nonnull(^JobsReturnSRWebSocketByNSURLRequestBlock)(NSURLRequest *_Nullable request);

@class RACDisposable;
typedef RACDisposable *_Nonnull(^JobsReturnRACDisposableByVoidBlock)(void);
typedef void(^jobsByRACDisposableBlock)(RACDisposable *_Nullable disposable);
typedef RACDisposable *_Nonnull(^JobsReturnRACDisposableByTimeIntervalBlock)(NSTimeInterval data);
    
@class RACSignal;
typedef NSArray<RACSignal *>*_Nonnull(^JobsReturnRACSignalArrByVoidBlock)(void);

@class GKPhotoBrowser;
typedef void(^jobsByGKPhotoBrowserBlock)(GKPhotoBrowser *_Nonnull browser);
typedef GKPhotoBrowser *_Nullable(^JobsReturnGKPhotoBrowserByPhotosArrayAndCurrentIndexBlock)(Jobs_ReturnGKPhotoBrowserByPhotosArrayAndCurrentIndexBlock_Arguments);
@class GKPhoto;
typedef void(^jobsByGKPhotoBlock)(GKPhoto *_Nonnull data);

@class SZTextView;
typedef void(^jobsBySZTextViewBlock)(SZTextView *_Nonnull textView);

@class XZMRefreshNormalHeader;
typedef void(^jobsByXZMRefreshNormalHeaderBlock)(__kindof XZMRefreshNormalHeader *_Nonnull data);

@class YTKNetworkConfig;
typedef void(^jobsByYTKNetworkConfigBlock)(__kindof YTKNetworkConfig *_Nullable data);

@class YTKRequest;
typedef void(^jobsByYTKRequestBlock)(__kindof YTKRequest *_Nullable request);

@class YTKChainRequest;
typedef void(^jobsByYTKChainRequestBlock)(YTKChainRequest *_Nullable chainRequest);

@class YTKBatchRequest;
typedef void(^jobsByYTKBatchRequestBlock)(__kindof YTKBatchRequest *_Nullable data);
typedef __kindof YTKBatchRequest *_Nullable(^JobsReturnBatchRequestByArrBlock)(__kindof NSArray <YTKRequest *>*_Nullable requests);

@class YTKBaseRequest;
typedef void(^jobsByYTKBaseRequestBlock)(YTKBaseRequest *_Nonnull request);
typedef JobsResponseModel *_Nullable(^JobsReturnResponseModelByYTKBaseRequestBlock)(YTKBaseRequest *_Nonnull request);
typedef void(^JobsHandelNoSuccessBlock)(__kindof YTKBaseRequest *_Nonnull request);
typedef __kindof YTKBaseRequest *_Nonnull(^JobsReturnYTKRequestByVoidBlock)(void);
typedef __kindof YTKBaseRequest *_Nonnull(^JobsReturnYTKRequestByIDBlock)(id _Nullable data);
typedef __kindof YTKBaseRequest *_Nonnull(^JobsReturnYTKRequestByDictionaryBlock)(NSDictionary *_Nullable dic);

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif
typedef void(^jobsByCategoryTitleViewBlock)(__kindof JXCategoryTitleView *_Nullable view);
typedef void(^jobsByCategoryImageViewBlock)(__kindof JXCategoryImageView *_Nullable view);
typedef void(^jobsByCategoryDotViewBlock)(__kindof JXCategoryDotView *_Nullable view);
typedef void(^jobsByCategoryNumberViewBlock)(__kindof JXCategoryNumberView *_Nullable view);
typedef void(^jobsByCategoryIndicatorBackgroundViewBlock)(__kindof JXCategoryIndicatorBackgroundView *_Nullable bgView);
typedef void(^jobsCategoryIndicatorLineViewBlock)(__kindof JXCategoryIndicatorLineView *_Nullable indicator);

typedef __kindof JXCategoryListContainerView *_Nullable(^JobsReturnCategoryListContainerViewByNSIntegerBlock)(NSInteger data);
typedef __kindof JXCategoryIndicatorView *_Nullable(^JobsReturnCategoryIndicatorViewByViewsBlock)(__kindof NSArray <__kindof UIView <JXCategoryIndicatorProtocol>*>* _Nullable views);

typedef __kindof JXCategoryBaseView *_Nullable(^JobsReturnCategoryBaseViewByVoidBlock)(void);
typedef __kindof JXCategoryBaseView *_Nullable(^JobsReturnCategoryBaseViewByDelegateBlock)(id<JXCategoryViewDelegate> _Nullable delegate);
typedef __kindof JXCategoryBaseView *_Nullable(^JobsReturnCategoryBaseViewByListContainerBlock)(id<JXCategoryViewListContainer> _Nullable listContainer);
typedef __kindof JXCategoryBaseView *_Nullable(^JobsReturnCategoryBaseViewByCGFloatBlock)(CGFloat data);
typedef __kindof JXCategoryBaseView *_Nullable(^JobsReturnCategoryBaseViewByViewBlock)(__kindof UIView *_Nullable view);

typedef __kindof JXCategoryTitleView *_Nullable(^JobsReturnCategoryTitleViewByCorBlock)(__kindof UIColor *_Nullable cor);
typedef __kindof JXCategoryTitleView *_Nullable(^JobsReturnCategoryTitleViewByFontBlock)(UIFont *_Nullable font);
typedef __kindof JXCategoryTitleView *_Nullable(^JobsReturnCategoryTitleViewByStringsBlock)(__kindof NSArray <__kindof NSString *>* _Nullable strings);
typedef __kindof JXCategoryTitleView *_Nullable(^JobsReturnCategoryTitleViewByNSIntegerBlock)(NSInteger data);
typedef __kindof JXCategoryTitleView *_Nullable(^JobsReturnCategoryTitleViewByBOOLBlock)(BOOL data);

typedef __kindof JXCategoryImageView *_Nullable(^JobsReturnCategoryImageViewByStringsBlock)(__kindof NSArray <__kindof NSString *>* _Nullable strings);
typedef __kindof JXCategoryImageView *_Nullable(^JobsReturnCategoryImageViewBySizeBlock)(CGSize size);
typedef __kindof JXCategoryImageView *_Nullable(^JobsReturnCategoryImageViewByCGFloatBlock)(CGFloat data);
typedef __kindof JXCategoryImageView *_Nullable(^JobsReturnCategoryImageViewByBOOLBlock)(BOOL data);
typedef __kindof JXCategoryImageView *_Nullable(^JobsReturnCategoryImageViewByNSIntegerBlock)(NSInteger data);
typedef __kindof JXCategoryImageView *_Nullable(^JobsReturnCategoryImageViewByIndicatorLineViewsBlock)(__kindof NSArray <__kindof JXCategoryIndicatorLineView *>* _Nullable indicatorLineViews);

typedef __kindof JXCategoryDotView *_Nullable(^JobsReturnCategoryDotViewByRelativePositionBlock)(JXCategoryDotRelativePosition relativePosition);
typedef __kindof JXCategoryDotView *_Nullable(^JobsReturnCategoryDotViewByCGFloatBlock)(CGFloat data);
typedef __kindof JXCategoryDotView *_Nullable(^JobsReturnCategoryDotViewBySizeBlock)(CGSize size);
typedef __kindof JXCategoryDotView *_Nullable(^JobsReturnCategoryDotViewByPointBlock)(CGPoint point);
typedef __kindof JXCategoryDotView *_Nullable(^JobsReturnCategoryDotViewByCorBlock)(__kindof UIColor *_Nullable cor);
typedef __kindof JXCategoryDotView *_Nullable(^JobsReturnCategoryDotViewByNumbersBlock)(__kindof NSArray <__kindof NSNumber *>* _Nullable numbers);
typedef __kindof JXCategoryNumberView *_Nullable(^JobsReturnCategoryNumberViewByNumbersBlock)(__kindof NSArray <__kindof NSNumber *>* _Nullable numbers);
typedef __kindof JXCategoryNumberView *_Nullable(^JobsReturnCategoryNumberViewByCGPointBlock)(CGPoint point);
typedef __kindof JXCategoryNumberView *_Nullable(^JobsReturnCategoryNumberViewByReturnStringByIntegerBlocks)(JobsRetStrByIntegerBlock _Nullable block);

#pragma mark —— 复合型Block
typedef void(^jobsByErrBlocks)(jobsByErrBlock _Nullable block);
typedef void(^jobsByRetIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);
typedef void(^jobsDelegateBlocks)(Jobs_DelegateBlocks_Arguments);

typedef id _Nullable(^JobsReturnIDByVoidBlocks)(jobsByVoidBlock _Nullable block);
typedef id _Nullable(^JobsReturnIDByVoidIDBlocks)(jobsByIDBlock _Nullable block);
typedef id _Nullable(^JobsReturnIDByRetIDVoidBlocks)(JobsRetIDByVoidBlock _Nullable block);
typedef id _Nullable(^JobsReturnIDByRetIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);
#import "UIViewModelOthersProtocol.h"
typedef JobsRetIDByIDBlock _Nullable(^JobsRetIDByIDBlockByViewModelOthersProtocolID)(id<UIViewModelOthersProtocol> _Nullable data);

typedef __kindof UIView *_Nullable(^JobsReturnViewByVoidBlocks)(jobsByVoidBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsReturnViewByIDBlocks)(jobsByIDBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsReturnViewByRetIDBlocks)(JobsRetIDByVoidBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsReturnViewByRetIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsReturnViewByMasonryConstraintsBlocks)(jobsByMASConstraintMakerBlock _Nullable block);
typedef __kindof UIView *_Nullable(^JobsReturnViewByViewAndMasonryConstraintsBlocks)(Jobs_ReturnViewByViewAndMasonryConstraintsBlocks_Arguments);

typedef __kindof UIButton *_Nullable(^JobsReturnButtonByButtonModel2Blocks)(jobsByButtonModelBlock _Nullable block);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByClickBlocks)(jobsByBtnBlock _Nullable block);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByIDBlocks)(jobsByIDBlock _Nullable block);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByCGFloatBlocks)(jobsByCGFloatBlock _Nullable block);
typedef __kindof UIButton *_Nullable(^JobsRetBtnByJTimerBlocks)(JobsTimerBlock _Nullable block);

typedef __kindof UICollectionView *_Nullable(^JobsReturnCollectionViewByBlock1)(jobsByIDBlock _Nullable block);

typedef __kindof JobsNavBar *_Nullable(^JobsReturnNavBarByVoidBtnBlocks)(jobsByBtnBlock _Nullable block);

typedef __kindof UIViewController *_Nullable(^JobsReturnVCByVoidBlocks)(jobsByVoidBlock _Nullable block);
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByIDBlocks)(jobsByIDBlock _Nullable data);
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByRetIDByVoidBlocks)(JobsRetIDByVoidBlock _Nullable block);
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByRetIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByMasonryConstraintsBlocks)(jobsByMASConstraintMakerBlock _Nullable block);

typedef RACDisposable *_Nonnull(^JobsReturnRACDisposableByReturnIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);

typedef __kindof NSArray *_Nullable(^JobsReturnArrByMasonryBlocks)(jobsByMASConstraintMakerBlock _Nonnull block);
typedef void(^jobsByMasonryBlock)(jobsByMASConstraintMakerBlock _Nonnull block);
typedef jobsByMASConstraintMakerBlock _Nonnull(^JobsReturnMASConstraintMakerByBOOLBlock)(BOOL data);

typedef MJRefreshConfigModel *_Nullable(^JobsReturnMJRefreshConfigModelByReturnIDByIDBlocks)(JobsRetIDByIDBlock _Nullable block);

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif
/// SDWebImage+UIButton
#ifndef SDWebImageButtonBlock
#define SDWebImageButtonBlock
typedef __kindof UIButton *_Nullable(^JobsReturnButtonBySDExternalCompletionBlocks)(SDExternalCompletionBlock _Nullable completionBlock);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonBySDWebImageOptionsBlocks)(SDWebImageOptions options);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonBySDImageLoaderProgressBlocks)(SDImageLoaderProgressBlock _Nullable progressBlock);
#endif /* SDWebImageButtonBlock */
/// SDWebImage+UIImageView
#ifndef SDWebImageImageViewBlock
#define SDWebImageImageViewBlock
typedef __kindof UIImageView *_Nullable(^JobsReturnImageViewBySDExternalCompletionBlocks)(SDExternalCompletionBlock _Nullable completionBlock);
typedef __kindof UIImageView *_Nullable(^JobsReturnImageViewBySDWebImageOptionsBlocks)(SDWebImageOptions options);
#endif /* SDWebImageImageViewBlock */

#import "JobsBizBlock.h" /// 关于业务（不与JobsOCBaseConfigDemo同步）

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

/**
 Block 的三种类型
 在 Objective-C 中，block 有三种存储类型：

 Stack Block（栈区 block）：

 默认创建的 block 存储在栈中。
 生命周期与作用域绑定，当作用域结束时，栈上的 block 会被销毁。
 Malloc Block（堆区 block）：

 通过 copy 操作将栈上的 block 拷贝到堆中，拥有更长的生命周期，直到引用计数为 0。
 Global Block（全局 block）：

 不捕获任何外部变量的 block，存储在全局内存区，不需要 copy。
 
 ❤️assign 是一种非强引用的修饰符，直接指向内存地址，并不会增加 block 的引用计数。
 如果 block 是存储在栈上的（即 Stack Block），在作用域结束时，block 会被销毁，指针指向的内存随之变为野指针，从而导致程序崩溃。❤️
 */
