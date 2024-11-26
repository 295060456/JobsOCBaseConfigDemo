//
//  ReturnByCertainParameters.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/27.
//

#ifndef ReturnByCertainParameters_h
#define ReturnByCertainParameters_h
#import <JavaScriptCore/JavaScriptCore.h>
///【 确定入参个数 并且 有返回值的Block定义】
#pragma mark —— 关于 JavaScript
typedef void(^jobsByJSValueBlock)(JSValue *_Nullable value);
typedef JSValue *_Nullable(^JobsReturnJSValueByStringBlock)(NSString *_Nullable jsCode);
#pragma mark —— 关于 id
typedef id _Nullable(^JobsReturnIDByVoidBlock)(void);

typedef id _Nullable(^JobsReturnIDByCGSizeBlock)(CGSize data);
typedef id _Nullable(^JobsReturnIDByCGRectBlock)(CGRect data);
typedef id _Nullable(^JobsReturnIDByCGPointBlock)(CGPoint data);
typedef id _Nullable(^JobsReturnIDByCGFloatBlock)(CGFloat data);
typedef id _Nullable(^JobsReturnIDByCenterBlock)(CGFloat x,CGFloat y);

typedef id _Nullable(^JobsReturnIDByIDBlock)(id _Nullable data);
typedef id _Nullable(^JobsReturnIDByNotificationBlock)(NSNotification *_Nullable notification);
typedef id _Nullable(^JobsReturnIDByObjBlock)(NSObject *_Nullable data);
typedef id _Nullable(^JobsReturnIDByArrBlock)(NSArray *_Nullable data);
typedef id _Nullable(^JobsReturnIDByDataBlock)(NSData *_Nullable data);
typedef id _Nullable(^JobsReturnIDByStringBlock)(NSString *_Nullable data);
typedef id _Nonnull(^JobsReturnIDBySaltStrBlock)(NSString *_Nullable salt);
typedef id _Nullable(^JobsReturnIDBySELBlock)(SEL _Nullable data);
typedef id _Nullable(^JobsReturnIDByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef id _Nullable(^JobsReturnIDByDicBlock)(__kindof NSDictionary *_Nullable data);
typedef id _Nullable(^JobsReturnIDByImageBlock)(UIImage *_Nullable data);
typedef id _Nullable(^JobsReturnIDByNSIntegerBlock)(NSInteger data);
typedef id _Nullable(^JobsReturnIDByUIntegerBlock)(NSUInteger data);
typedef id _Nullable(^JobsReturnIDByCGFloatBlock)(CGFloat data);
typedef id _Nullable(^JobsReturnIDByBOOLBlock)(BOOL data);
typedef id _Nullable(^JobsReturnIDByIntBlock)(int data);
typedef id _Nullable(^JobsReturnIDByUnsignedIntBlock)(unsigned int data);
typedef id _Nullable(^JobsReturnIDByFloatBlock)(float data);
typedef id _Nullable(^JobsReturnIDByDoubleBlock)(double data);
typedef id _Nullable(^JobsReturnIDByCharBlock)(char data);
typedef id _Nullable(^JobsReturnIDByUnsignedCharBlock)(unsigned char data);
typedef id _Nullable(^JobsReturnIDByShortBlock)(short data);
typedef id _Nullable(^JobsReturnIDByUnsignedShortBlock)(unsigned short data);
typedef id _Nullable(^JobsReturnIDByLongBlock)(long data);
typedef id _Nullable(^JobsReturnIDByUnsignedLongBlock)(unsigned long data);
typedef id _Nullable(^JobsReturnIDByUnsignedLongLongBlock)(unsigned long long data);
/// 多参数
typedef id _Nonnull(^JobsReturnIDByClsAndSaltStrBlock)(Class _Nullable cls,NSString *_Nullable salt);
typedef id _Nullable(^JobsReturnIDBySelectorBlock)(id _Nullable weakSelf,id _Nullable arg);
typedef id _Nullable(^JobsReturnIDBySelectorBlock2)(id _Nullable weakSelf,
                                                    id _Nullable arg,
                                                    id _Nullable data);
typedef id _Nullable(^JobsReturnIDByTwoIDBlock)Jobs_2_Arguments;
typedef id _Nullable(^JobsReturnIDByThreeIDBlock)Jobs_3_Arguments;
typedef id _Nullable(^JobsReturnIDByFourIDBlock)Jobs_4_Arguments;
typedef id _Nullable(^JobsReturnIDByFiveIDBlock)Jobs_5_Arguments;
typedef id _Nullable(^JobsReturnIDBySixIDBlock)Jobs_6_Arguments;
typedef id _Nullable(^JobsReturnIDBySevenIDBlock)Jobs_7_Arguments;
typedef id _Nullable(^JobsReturnIDByEightIDBlock)Jobs_8_Arguments;
typedef id _Nullable(^JobsReturnIDByNineIDBlock)Jobs_9_Arguments;
typedef id _Nullable(^JobsReturnIDByTenIDBlock)Jobs_10_Arguments;
#pragma mark —— 关于数据容器
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByVoidBlock)(void);
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByIDBlock)(id _Nullable data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByStringBlock)(NSString *_Nullable data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByArrayBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSMutableArray *_Nullable(^JobsReturnMutableArrayByVoidBlock)(void);
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByIntegerBlock)(NSInteger data);

typedef __kindof NSDictionary *_Nullable(^JobsReturnDicByStringBlock)(NSString *_Nullable data);
typedef __kindof NSDictionary *_Nullable(^JobsReturnDicByDataBlock)(NSData *_Nullable data);
typedef __kindof NSMutableDictionary *_Nonnull(^JobsReturnMutableDicByVoidBlock)(void);

#pragma mark —— 关于 NSValue
typedef NSValue *_Nullable(^JobsReturnValueByCGSizeBlock)(CGSize data);
typedef NSValue *_Nullable(^JobsReturnValueByPointerBlock)(const void *_Nullable data);
typedef NSValue *_Nullable(^JobsReturnValueByPointBlock)(CGPoint data);

#pragma mark —— 关于按钮配置信息
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByFontBlock)(UIFont *_Nullable data);
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByButtonConfigurationBlock)(UIButtonConfiguration *_Nullable config);
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByBackgroundBlock)(UIBackgroundConfiguration *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByCornerStyleBlock)(UIButtonConfigurationCornerStyle data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationBySizeBlock)(UIButtonConfigurationSize data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByMacIdiomStyleBlock)(UIButtonConfigurationMacIdiomStyle data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByBaseForegroundColorBlock)(UIColor *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByBaseBackgroundColorBlock)(UIColor *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByImageBlock)(UIImage *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByImageColorTransformerBlock)(UIConfigurationColorTransformer _Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByPreferredSymbolConfigurationForImageBlock)(UIImageSymbolConfiguration *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByShowsActivityIndicatorBlock)(BOOL data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByActivityIndicatorColorTransformerBlock)(UIConfigurationColorTransformer _Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByTitleBlock)(NSString *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByAttributedTitleBlock)(NSAttributedString *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByTitleTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByTitleLineBreakModeBlock)(NSLineBreakMode data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationBySubtitleBlock)(NSString *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByAttributedSubtitleBlock)(NSAttributedString *_Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationBySubtitleTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationBySubtitleLineBreakModeBlock)(NSLineBreakMode data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByIndicatorBlock)(UIButtonConfigurationIndicator data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByIndicatorColorTransformerBlock)(UIConfigurationColorTransformer _Nullable data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByContentInsetsBlock)(NSDirectionalEdgeInsets data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByImagePlacementBlock)(NSDirectionalRectEdge data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByImagePaddingBlock)(CGFloat data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByTitlePaddingBlock)(CGFloat data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data) API_AVAILABLE(ios(16.0));
typedef UIButtonConfiguration *_Nullable(^JobsReturnButtonConfigurationByAutomaticallyUpdateForSelectionBlock)(BOOL data) API_AVAILABLE(ios(16.0));
#pragma mark —— 关于手势
typedef __kindof UIView *_Nullable(^JobsReturnViewByGestureRecognizer)(__kindof UIGestureRecognizer *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByTapGestureBlock)(UITapGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsReturnViewByLongPressGestureBlock)(UILongPressGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsReturnViewBySwipeGestureBlock)(UISwipeGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsReturnViewByPanGestureBlock)(UIPanGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsReturnViewByPinchGestureBlock)(UIPinchGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsReturnViewByRotationGestureBlock)(UIRotationGestureRecognizer *_Nullable gesture);
#pragma mark —— 关于Layer
typedef __kindof CALayer *_Nullable(^JobsReturnCALayerByCALayerBlock)(CALayer *_Nullable data);
#pragma mark —— 关于 View
typedef __kindof UIView *_Nullable(^JobsReturnViewByVoidBlock)(void);
typedef __kindof UIView *_Nullable(^JobsReturnViewByStringBlock)(NSString *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByViewBlock)(UIView *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByIDBlock)(id _Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByArrBlock)(NSArray *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByCorBlock)(UIColor *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByBOOLBlock)(BOOL data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByFloatBlock)(CGFloat data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIView *_Nullable(^JobsReturnViewBySizeBlock)(CGSize data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByRectBlock)(CGRect data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByPointBlock)(CGPoint data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByCenterBlock)(CGFloat x,CGFloat y);
typedef __kindof UIView *_Nullable(^JobsReturnViewByClassBlock)(Class _Nonnull cls);
typedef __kindof UIView *_Nullable(^JobsReturnViewByTableViewHeaderFooterViewBlock)(__kindof UITableViewHeaderFooterView *_Nonnull headerFooterView);
typedef __kindof UIBarButtonItem *_Nullable(^JobsReturnBarButtonItemByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UIBarButtonItem *_Nullable(^JobsReturnBarButtonItemByVoidBlock)(void);
typedef __kindof UIImageView *_Nonnull(^JobsReturnImageViewByImageBlock)(UIImage *_Nullable data);
typedef __kindof UIImageView *_Nonnull(^JobsReturnImageViewByURLBlock)(NSURL *_Nullable data);
typedef __kindof UIWindow *_Nullable(^JobsReturnWindowByVoidBlock)(void);
typedef __kindof UIWindow *_Nullable(^JobsReturnWindowByWindowSceneBlock)(UIWindowScene *_Nullable data);
#pragma mark —— 关于按钮
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByVoidBlock)(void);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByControlStateBlock)(UIControlState data);
typedef __kindof UIButton *_Nonnull(^JobsReturnButtonByBOOLBlock)(BOOL data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByCGFloatBlock)(CGFloat data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByFloatBlock)(float data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByNSIntegerBlock)(NSInteger data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTitleAlignmentBlock)(UIButtonConfigurationTitleAlignment data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTextAlignmentBlock)(NSTextAlignment data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByImagePlacementBlock)(NSDirectionalRectEdge data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByDicBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof UIButton *_Nonnull(^JobsReturnButtonByImageBlock)(UIImage *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByImageBlock)(UIImage *_Nonnull image);
typedef __kindof UIButton *_Nonnull(^JobsReturnButtonByURLBlock)(NSURL *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByFontBlock)(UIFont *_Nullable data);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByColorBlock)(UIColor *_Nonnull cor);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStringBlock)(__kindof NSString *_Nullable data);/// 主文字内容
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByAttributedStringBlock)(NSAttributedString *_Nonnull title);/// 富文本内容
/// 多参数
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByImagePlacementAndPaddingBlock)(NSDirectionalRectEdge data,
                                                                                       CGFloat x);
typedef __kindof UIButton *_Nonnull(^JobsReturnButtonByColor_FloatBlock)(UIColor *_Nullable,
                                                                         float borderWidth);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTitlesBlock)(NSString *_Nonnull title,
                                                                     NSString *_Nonnull subTitle);/// 主/副 文字内容
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByAttributedStringsBlock)(NSAttributedString *_Nonnull title,
                                                                                NSAttributedString *_Nonnull subTitle);/// 主/副 富文本内容
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle1Block)(NSString *_Nonnull title,/// 主文字内容
                                                                     UIFont *_Nullable font);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle2Block)(NSString *_Nonnull title,/// 主文字内容
                                                                     UIFont *_Nullable font,/// 字体大小
                                                                     UIColor *_Nullable titleCor);/// 主文字颜色
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle3Block)(NSString *_Nonnull title,/// 主文字内容
                                                                     UIFont *_Nullable font,/// 字体大小
                                                                     UIColor *_Nullable titleCor,/// 主文字颜色
                                                                     UIImage *_Nonnull image,/// 按钮图片
                                                                     NSDirectionalRectEdge imagePlacement,/// 图片和文字的位置关系
                                                                     CGFloat x);/// 图文距离
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle4Block)(NSString *_Nonnull title,/// 主文字内容
                                                                     UIFont *_Nullable font,/// 字体大小
                                                                     UIColor *_Nullable titleCor,/// 主文字颜色
                                                                     UIImage *_Nonnull image);/// 按钮图片
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle5Block)(NSString *_Nonnull title,/// 主文字内容
                                                                     UIFont *_Nullable font,/// 字体大小
                                                                     UIColor *_Nullable titleCor,/// 主文字颜色
                                                                     UIImage *_Nonnull image,/// 按钮图片
                                                                     UIImage *_Nonnull backgroundImage,/// 按钮背景图片
                                                                     NSDirectionalRectEdge imagePlacement);/// 图片和文字的位置关系
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle6Block)(NSString *_Nonnull title,/// 主文字内容
                                                                     UIFont *_Nullable font,/// 字体大小
                                                                     UIColor *_Nullable titleCor,/// 主文字颜色
                                                                     UIImage *_Nonnull image,/// 按钮图片
                                                                     NSDirectionalRectEdge directionalRectEdge,/// 图文相对位置
                                                                     CGFloat x);/// 图文距离
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle7Block)(NSString *_Nonnull title,/// 主文字内容
                                                                     UIFont *_Nullable font,/// 字体大小
                                                                     UIColor *_Nullable titleCor,/// 主文字颜色
                                                                     UIImage *_Nonnull image,/// 按钮图片
                                                                     CGFloat x);/// 图文距离
#pragma mark —— 关于 UITableViewHeaderFooterView
/// 多参数
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsReturnTableViewHeaderFooterViewByClsAndSaltStrBlock)(Class _Nonnull cls,
                                                                                                                  NSString *_Nullable salt);
#pragma mark —— 关于 UITableViewCell
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByTableViewCellStyleBlock)(UITableViewCellStyle tableViewCellStyle);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByTableViewBlock)(UITableView *_Nonnull tableView);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByVoidBlock)(void);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByClsBlock)(Class _Nonnull cls);
/// 多参数
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByClsAndSaltStrBlock)(Class _Nonnull cls,
                                                                                          NSString *_Nullable salt);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByCls_SaltStr_IndexPath_Block)(Class _Nonnull cls,
                                                                                                   NSString *_Nullable salt,
                                                                                                   NSIndexPath *_Nonnull indexPath);
#pragma mark —— 关于 UICollectionView
typedef __kindof UICollectionView *_Nullable(^JobsReturnCollectionViewByLayoutBlock)(__kindof UICollectionViewLayout *_Nullable data);
typedef __kindof UICollectionView *_Nullable(^JobsReturnCollectionViewByFlowLayoutBlock)(__kindof UICollectionViewFlowLayout *_Nullable data);

#pragma mark —— 关于 UICollectionViewCell
typedef __kindof UICollectionViewCell *_Nullable(^JobsReturnCollectionViewCellByVoidBlock)(void);
#pragma mark —— 关于 UIScrollView
typedef __kindof UIScrollView *_Nullable(^JobsReturnScrollViewByVoidBlock)(void);
typedef __kindof UIScrollView *_Nullable(^JobsReturnScrollViewByMutArrBlock)(NSMutableArray *_Nullable data);
#pragma mark —— 关于 WKWebView
#import <WebKit/WebKit.h>
typedef __kindof WKWebView *_Nullable(^JobsReturnWKWebViewByVoidBlock)(void);
typedef __kindof WKWebView *_Nullable(^JobsReturnWKWebViewByConfigurationBlock)(WKWebViewConfiguration *_Nullable config);

typedef __kindof WKWebView *_Nullable(^JobsReturnWKWebViewByStringBlock)(NSString *_Nullable data);
typedef __kindof WKWebView *_Nullable(^JobsReturnWKWebViewByURLBlock)(NSURL *_Nullable URL);
#pragma mark —— 关于控制器
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByViewBlock)(__kindof UIView *_Nonnull view);
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByVCBlock)(__kindof UIViewController *_Nonnull vc);
typedef __kindof UINavigationController *_Nullable(^JobsReturnNavCtrByVCBlock)(__kindof UIViewController *_Nonnull vc);
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByWebViewBlock)(__kindof WKWebView *_Nonnull webView);
typedef __kindof UIAlertController *_Nullable(^JobsReturnAlertControllerByActionBlock)(UIAlertAction *_Nullable data);
typedef __kindof UIAlertController *_Nullable(^JobsReturnAlertControllerByStringBlock)(NSString *_Nullable data);
#pragma mark —— 关于富文本
typedef __kindof NSAttributedString *_Nullable(^JobsReturnAttributedStringByStringBlock)(NSString *_Nullable data);
typedef __kindof NSAttributedString *_Nullable(^JobsReturnAttributedStringByAttributedStringBlock)(NSAttributedString *_Nonnull data);
#pragma mark —— NSNumber
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByIntegerBlock)(NSInteger data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByFloatBlock)(CGFloat data);
#pragma mark —— 关于字符串
typedef __kindof NSString *_Nullable(^JobsReturnStringByVoidBlock)(void);
typedef __kindof NSString *_Nullable(^JobsReturnStringByCharBlock)(char *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByIntegerBlock)(NSInteger data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByRangeBlock)(NSRange data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByBOOLBlock)(BOOL data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByIDBlock)(id _Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByURLBlock)(NSURL *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByDateBlock)(NSDate *_Nullable date);
typedef __kindof NSString *_Nullable(^JobsReturnStringByDataBlock)(NSData *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByImageBlock)(UIImage *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByStringBlock)(NSString *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByCorBlock)(UIColor *_Nullable data);
/// 多参数
typedef __kindof NSString *_Nullable(^JobsReturnStringByTimeIntervalAndDateFormatterBlock)(NSTimeInterval data,
                                                                                           NSDateFormatter *_Nullable dateFormatter);
typedef __kindof NSString *_Nullable(^JobsReturnStringByStringStringBlock)(NSString *_Nullable fontString,
                                                                           NSString *_Nullable tailString);
#pragma mark —— 关于 NSRegularExpression
typedef __kindof NSRegularExpression *_Nullable(^JobsReturnRegularExpressionByStringBlock)(NSString *_Nullable data);
#pragma mark —— 关于时间（格式）/日历/计时器/间隔时间
typedef __kindof NSTimer *_Nullable(^JobsReturnTimerByVoidBlock)(void);
typedef __kindof NSString *_Nullable(^JobsReturnStringByDateFormatterBlock)(NSDateFormatter *_Nullable data);
typedef NSTimeInterval(^JobsReturnTimeIntervalByDateBlock)(NSDate *_Nullable);
typedef __kindof NSDateFormatter *_Nullable(^JobsReturnDateFormatterByStringBlock)(NSString *_Nullable);
typedef __kindof NSDate *_Nullable(^JobsReturnDateByVoidBlock)(void);
typedef __kindof NSDate *_Nullable(^JobsReturnDateByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof NSDate *_Nullable(^JobsReturnDateByDateFormatterBlock)(NSDateFormatter *_Nullable data);
typedef __kindof NSCalendar *_Nullable(^JobsReturnCalendarByCalendarIdentifierBlock)(NSCalendarIdentifier _Nullable data);
typedef __kindof UNCalendarNotificationTrigger *_Nullable(^JobsReturnCalendarNotificationTriggerByComponentsBlock)(NSDateComponents *_Nullable data);
#pragma mark —— 关于数据
typedef __kindof NSURLRequest *_Nullable(^JobsReturnURLRequestByVoidBlock)(void);
typedef NSMutableURLRequest *_Nullable(^JobsReturnMutableURLRequestByVoidBlock)(void);
typedef __kindof NSURLRequest *_Nullable(^JobsReturnURLRequestByURLBlock)(NSURL *_Nullable url);
typedef NSMutableURLRequest *_Nullable(^JobsReturnMutableURLRequestByURLBlock)(NSURL *_Nullable url);
typedef NSData *_Nullable(^JobsReturnDataByVoidBlock)(void);
typedef NSData *_Nullable(^JobsReturnDataByIDBlock)(id _Nullable data);
typedef NSData *_Nullable(^JobsReturnDataByURLBlock)(NSURL *_Nullable data);
typedef NSData *_Nullable(^JobsReturnDataByAssetBlock)(AVAsset *_Nullable asset);
typedef NSData *_Nullable(^JobsReturnDataByStringBlock)(__kindof NSString *_Nullable data);
typedef NSData *_Nullable(^JobsReturnDataByDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef PHAsset *_Nullable(^JobsReturnAssetByStrBlock)(NSString *_Nullable Key);
typedef NSURL *_Nullable(^JobsReturnURLByStringBlock)(NSString *_Nullable data);
typedef NSURL *_Nullable(^JobsReturnURLByURLBlock)(NSURL *_Nullable data);
typedef NSURL *_Nullable(^JobsReturnURLByVoidBlock)(void);
#pragma mark —— 关于字体
typedef UIFont *_Nullable(^JobsReturnFontByVoidBlock)(void);
typedef UIFont *_Nullable(^JobsReturnFontByConfigurationTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable transformer);
#pragma mark —— 关于颜色
typedef UIColor *_Nullable(^JobsReturnColorByHexAlphaBlock)(uint32_t hexValue, CGFloat alpha);
typedef UIColor *_Nullable(^JobsReturnColorByHexBlock)(uint32_t hexValue);
typedef UIColor *_Nonnull(^JobsReturnColorByCGFloatBlock)(CGFloat data);
typedef UIColor *_Nullable(^JobsReturnColorByConfigurationTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable transformer);
typedef UIColor *_Nullable(^JobsReturnColorByStringBlock)(NSString *_Nonnull cor);
typedef UIColor *_Nullable(^JobsReturnColorByImageBlock)(UIImage *_Nonnull cor);
#pragma mark —— 关于图片
typedef UIImage *_Nonnull(^JobsReturnImageByVoidBlock)(void);
typedef UIImage *_Nonnull(^JobsReturnImageByAlphaBlock)(CGFloat alpha);
typedef UIImage *_Nonnull(^JobsReturnImageByCGRectBlock)(CGRect data);
typedef UIImage *_Nonnull(^JobsReturnImageByCGSizeBlock)(CGSize data);
typedef UIImage *_Nonnull(^JobsReturnImageByAVURLAssetBlock)(AVURLAsset *_Nonnull data);
typedef UIImage *_Nonnull(^JobsReturnImageByViewBlock)(__kindof UIView *_Nonnull data);
typedef UIImage *_Nullable(^JobsReturnImageByImageBlock)(UIImage *_Nullable data);
typedef UIImage *_Nullable(^JobsReturnImageByCorBlock)(UIColor *_Nullable data);
typedef UIImage *_Nullable(^JobsReturnImageByDataBlock)(NSData *_Nullable data);
typedef UIImage *_Nonnull(^JobsReturnImageByDataBlock)(NSData *_Nullable data);
typedef UIImage *_Nullable(^JobsReturnImageByStringBlock)(NSString *_Nullable data);
#pragma mark —— 关于段落配置
typedef __kindof NSParagraphStyle *_Nullable(^JobsReturnParagraphStyleByVoidBlock)(void);
typedef __kindof NSParagraphStyle *_Nullable(^JobsReturnParagraphStyleByTextAlignmentBlock)(NSTextAlignment data);
#pragma mark —— 关于Animation
typedef __kindof CABasicAnimation *_Nullable(^JobsReturnCABasicAnimationByStringBlock)(NSString *_Nullable data);
#pragma mark —— 关于位置
typedef NSRange (^JobsReturnRangeByTextCheckingResultBlock)(NSTextCheckingResult *_Nullable data);
typedef NSRange (^JobsReturnRangeByIntegerBlock)(NSInteger data);

typedef UIEdgeInsets(^JobsReturnUIEdgeInsetsByVoidBlock)(void);
typedef UIEdgeInsets(^JobsReturnUIEdgeInsetsByIDBlock)(id _Nullable data);

typedef CGSize(^JobsReturnCGSizeByVoidBlock)(void);
typedef CGSize(^JobsReturnCGSizeByArrBlock)(NSArray *_Nullable data);
typedef CGSize(^JobsReturnCGSizeByIDBlock)(id _Nullable data);
typedef CGSize(^JobsReturnSizeByBOOLBlock)(BOOL data);
typedef CGSize(^JobsReturnSizeByIntBlock)(int data);
typedef CGSize(^JobsReturnSizeByLongBlock)(long data);
typedef CGSize(^JobsReturnSizeByNSIntegerBlock)(NSInteger data);
typedef CGSize(^JobsReturnSizeByUIntegerBlock)(NSUInteger data);
typedef CGSize(^JobsReturnSizeByCGFloatBlock)(CGFloat data);
typedef CGSize(^JobsReturnSizeByFloatBlock)(float data);
typedef CGSize(^JobsReturnSizeByDoubleBlock)(double data);
typedef CGSize(^JobsReturnSizeByShortBlock)(short data);
typedef CGSize(^JobsReturnSizeByCharBlock)(char data);
typedef CGSize(^JobsReturnSizeByUnsignedIntBlock)(unsigned int data);
typedef CGSize(^JobsReturnSizeByUnsignedCharBlock)(unsigned char data);
typedef CGSize(^JobsReturnSizeByUnsignedShortBlock)(unsigned short data);
typedef CGSize(^JobsReturnSizeByUnsignedLongBlock)(unsigned long data);
typedef CGSize(^JobsReturnSizeByUnsignedLongLongBlock)(unsigned long long data);
/// 多参数
typedef CGSize(^JobsReturnCGSizeByTwoIDBlock)Jobs_2_Arguments;
typedef CGSize(^JobsReturnCGSizeByThreeIDBlock)Jobs_3_Arguments;
typedef CGSize(^JobsReturnCGSizeByFourIDBlock)Jobs_4_Arguments;
typedef CGSize(^JobsReturnCGSizeByFiveIDBlock)Jobs_5_Arguments;
typedef CGSize(^JobsReturnCGSizeBySixIDBlock)Jobs_6_Arguments;
typedef CGSize(^JobsReturnCGSizeBySevenIDBlock)Jobs_7_Arguments;
typedef CGSize(^JobsReturnCGSizeByEightIDBlock)Jobs_8_Arguments;
typedef CGSize(^JobsReturnCGSizeByNineIDBlock)Jobs_9_Arguments;
typedef CGSize(^JobsReturnCGSizeByTenIDBlock)Jobs_10_Arguments;

typedef CGRect(^JobsReturnCGRectByVoidBlock)(void);
typedef CGRect(^JobsReturnCGRectByArrBlock)(__kindof NSArray <__kindof UIView *>*_Nullable arr);
typedef CGRect(^JobsReturnRectByNSIntegerBlock)(NSInteger data);
typedef CGRect(^JobsReturnRectByUIntegerBlock)(NSUInteger data);
typedef CGRect(^JobsReturnRectByCGFloatBlock)(CGFloat data);
typedef CGRect(^JobsReturnRectByBOOLBlock)(BOOL data);
typedef CGRect(^JobsReturnRectByIntBlock)(int data);
typedef CGRect(^JobsReturnRectByLongBlock)(long data);
typedef CGRect(^JobsReturnRectByShortBlock)(short data);
typedef CGRect(^JobsReturnRectByFloatBlock)(float data);
typedef CGRect(^JobsReturnRectByDoubleBlock)(double data);
typedef CGRect(^JobsReturnRectByCharBlock)(char data);
typedef CGRect(^JobsReturnRectByUnsignedIntBlock)(unsigned int data);
typedef CGRect(^JobsReturnRectByUnsignedShortBlock)(unsigned short data);
typedef CGRect(^JobsReturnRectByUnsignedCharBlock)(unsigned char data);
typedef CGRect(^JobsReturnRectByUnsignedLongBlock)(unsigned long data);
typedef CGRect(^JobsReturnRectByUnsignedLongLongBlock)(unsigned long long data);
typedef CGRect(^JobsReturnCGRectByCGPointBlock)(CGPoint data);
typedef CGRect(^JobsReturnCGRectByCGSizeBlock)(CGSize data);
typedef CGRect(^JobsReturnCGRectByCGFloatBlock)(CGFloat data);
typedef CGRect(^JobsReturnCGRectByIDBlock)(id _Nullable data);
typedef CGRect(^JobsReturnRectByViewBlock)(__kindof UIView *_Nonnull data);
/// 多参数
typedef CGRect(^JobsReturnCGRectByCGFloatAndUIViewBlock)(CGFloat data,__kindof UIView *_Nonnull superView);
typedef CGRect(^JobsReturnCGRectByTwoIDBlock)Jobs_2_Arguments;
typedef CGRect(^JobsReturnCGRectByThreeIDBlock)Jobs_3_Arguments;
typedef CGRect(^JobsReturnCGRectByFourIDBlock)Jobs_4_Arguments;
typedef CGRect(^JobsReturnCGRectByFiveIDBlock)Jobs_5_Arguments;
typedef CGRect(^JobsReturnCGRectBySixIDBlock)Jobs_6_Arguments;
typedef CGRect(^JobsReturnCGRectBySevenIDBlock)Jobs_7_Arguments;
typedef CGRect(^JobsReturnCGRectByEightIDBlock)Jobs_8_Arguments;
typedef CGRect(^JobsReturnCGRectByNineIDBlock)Jobs_9_Arguments;
typedef CGRect(^JobsReturnCGRectByTenIDBlock)Jobs_10_Arguments;

typedef CGPoint(^JobsReturnCGPointByVoidBlock)(void);
typedef CGPoint(^JobsReturnCGPointByBOOLBlock)(BOOL data);
typedef CGPoint(^JobsReturnCGPointByIntBlock)(int data);
typedef CGPoint(^JobsReturnCGPointByFloatBlock)(float data);
typedef CGPoint(^JobsReturnCGPointByDoubleBlock)(double data);
typedef CGPoint(^JobsReturnCGPointByShortBlock)(short data);
typedef CGPoint(^JobsReturnCGPointByLongBlock)(long data);
typedef CGPoint(^JobsReturnCGPointByCharBlock)(char data);
typedef CGPoint(^JobsReturnCGPointByUnsignedIntBlock)(unsigned int data);
typedef CGPoint(^JobsReturnCGPointByUnsignedCharBlock)(unsigned char data);
typedef CGPoint(^JobsReturnCGPointByUnsignedShortBlock)(unsigned short data);
typedef CGPoint(^JobsReturnCGPointByUnsignedLongBlock)(unsigned long data);
typedef CGPoint(^JobsReturnCGPointByUnsignedLongLongBlock)(unsigned long long data);
typedef CGPoint(^JobsReturnCGPointByNSIntegerBlock)(NSInteger data);
typedef CGPoint(^JobsReturnCGPointByUIntegerBlock)(NSUInteger data);
typedef CGPoint(^JobsReturnCGPointByCGFloatBlock)(CGFloat data);
typedef CGPoint(^JobsReturnCGPointByIDBlock)(id _Nullable data);
/// 多参数
typedef CGPoint(^JobsReturnCGPointByTwoIDBlock)Jobs_2_Arguments;
typedef CGPoint(^JobsReturnCGPointByThreeIDBlock)Jobs_3_Arguments;
typedef CGPoint(^JobsReturnCGPointByFourIDBlock)Jobs_4_Arguments;
typedef CGPoint(^JobsReturnCGPointByFiveIDBlock)Jobs_5_Arguments;
typedef CGPoint(^JobsReturnCGPointBySixIDBlock)Jobs_6_Arguments;
typedef CGPoint(^JobsReturnCGPointBySevenIDBlock)Jobs_7_Arguments;
typedef CGPoint(^JobsReturnCGPointByEightIDBlock)Jobs_8_Arguments;
typedef CGPoint(^JobsReturnCGPointByNineIDBlock)Jobs_9_Arguments;
typedef CGPoint(^JobsReturnCGPointByTenIDBlock)Jobs_10_Arguments;
#pragma mark —— 关于数据类型
typedef NSInteger(^JobsReturnNSIntegerByVoidBlock)(void);
typedef NSInteger(^JobsReturnByNSIntegerBlock)(NSInteger data);
typedef NSInteger(^JobsReturnNSIntegerByIDBlock)(id _Nullable data);
typedef NSInteger(^JobsReturnNSIntegerByStringBlock)(NSString *_Nullable data);

typedef NSUInteger(^JobsReturnNSUIntegerByVoidBlock)(void);
typedef NSUInteger(^JobsReturnByNSUIntegerBlock)(NSUInteger data);
typedef NSUInteger(^JobsReturnNSUIntegerByIDBlock)(id _Nullable data);

typedef CGFloat(^JobsReturnByCGFloatBlock)(CGFloat data);
typedef CGFloat(^JobsReturnCGFloatByCGFloatBlock)(CGFloat data);
typedef CGFloat(^JobsReturnCGFloatByIDBlock)(id _Nullable data);
typedef CGFloat(^JobsReturnCGFloatByArrBlock)(NSMutableArray *_Nullable data);
typedef CGFloat(^JobsReturnByFontBlock)(UIFont *_Nullable font);
typedef CGFloat(^JobsReturnCGFloatByVoidBlock)(void);

typedef BOOL(^JobsReturnBOOLByVoidBlock)(void);
typedef BOOL(^JobsReturnBOOLBySizeBlock)(CGSize size);
typedef BOOL(^JobsReturnBOOLByPointBlock)(CGPoint point);
typedef BOOL(^JobsReturnBOOLByFrameBlock)(CGRect frame);
typedef BOOL(^JobsReturnBOOLByBOOLBlock)(BOOL data);
typedef BOOL(^JobsReturnBOOLByNSUIntegerBlock)(NSUInteger data);
typedef BOOL(^JobsReturnBOOLByNSIntegerBlock)(NSInteger data);
typedef BOOL(^JobsReturnBOOLByIDBlock)(id _Nullable data);
typedef BOOL(^JobsReturnBOOLByViewControllerBlock)(UIViewController *_Nullable viewController);
typedef BOOL(^JobsReturnBOOLByStringBlock)(NSString *_Nullable data);
typedef BOOL(^JobsReturnBOOLByDateBlock)(NSDate *_Nullable date);
typedef BOOL(^JobsReturnBOOLByArrBlock)(__kindof NSArray *_Nullable arr);

typedef int(^JobsReturnIntByVoidBlock)(void);
typedef int(^JobsReturnIntByIntBlock)(int data);
typedef int(^JobsReturnIntByIDBlock)(id _Nullable data);

typedef unsigned int(^JobsReturnUnsignedIntByVoidBlock)(void);
typedef unsigned int(^JobsReturnByUnsignedIntBlock)(unsigned int data);
typedef unsigned int(^JobsReturnUnsignedIntByIDBlock)(id _Nullable data);

typedef float(^JobsReturnFloatByVoidBlock)(void);
typedef float(^JobsReturnByFloatBlock)(float data);
typedef float(^JobsReturnFloatByIDBlock)(id _Nullable data);
typedef float(^JobsReturnFloatByStringBlock)(NSString *_Nullable data);

typedef double(^JobsReturnDoubleByVoidBlock)(void);
typedef double(^JobsReturnDoubleByNSIntegerBlock)(NSInteger data);
typedef double(^JobsReturnByDoubleBlock)(double data);
typedef double(^JobsReturnDoubleByIDBlock)(id _Nullable data);
typedef double(^JobsReturnDoubleByStringBlock)(NSString *_Nullable data);

typedef char(^JobsReturnByCharBlock)(char data);
typedef char(^JobsReturnCharByIDBlock)(id _Nullable data);
typedef char(^JobsReturnCharByVoidBlock)(void);

typedef unsigned char(^JobsReturnByUnsignedCharBlock)(unsigned char data);
typedef unsigned char(^JobsReturnUnsignedCharByIDBlock)(id _Nullable data);
typedef unsigned char(^JobsReturnUnsignedCharByVoidBlock)(void);

typedef short(^JobsReturnByShortBlock)(short data);
typedef short(^JobsReturnShortByIDBlock)(id _Nullable data);
typedef short(^JobsReturnShortByVoidBlock)(void);

typedef unsigned short(^JobsReturnUnsignedShortByVoidBlock)(void);
typedef unsigned short(^JobsReturnByUnsignedShortBlock)(unsigned short data);
typedef unsigned short(^JobsReturnUnsignedShortByIDBlock)(id _Nullable data);

typedef long(^JobsReturnLongByVoidBlock)(void);
typedef long(^JobsReturnByLongBlock)(long data);
typedef long(^JobsReturnLongByIDBlock)(id _Nullable data);

typedef unsigned long(^JobsReturnUnsignedLongByVoidBlock)(void);
typedef unsigned long(^JobsReturnByUnsignedLongBlock)(unsigned long data);
typedef unsigned long(^JobsReturnUnsignedLongByIDBlock)(id _Nullable data);

typedef unsigned long long(^JobsReturnUnsignedLongLongByIDBlock)(id _Nullable data);
typedef unsigned long long(^JobsReturnUnsignedLongLongByVoidBlock)(void);
typedef unsigned long long(^JobsReturnByUnsignedLongLongBlock)(unsigned long long data);

#endif /* ReturnByCertainParameters_h */
