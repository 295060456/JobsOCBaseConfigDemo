//
//  ReturnByCertainParametersBlock.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/27.
//

#import <JavaScriptCore/JavaScriptCore.h>
#import "JobsBlockDef.h"

#ifndef ReturnByCertainParameters_h
#define ReturnByCertainParameters_h
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
///【 确定入参个数 并且 有返回值的Block定义】
#pragma mark —— 关于 id
typedef id _Nullable(^JobsReturnIDByVoidBlock)(void);

typedef id _Nullable(^JobsReturnIDByCGSizeBlock)(CGSize data);
typedef id _Nullable(^JobsReturnIDByCGRectBlock)(CGRect data);
typedef id _Nullable(^JobsReturnIDByCGPointBlock)(CGPoint data);
typedef id _Nullable(^JobsReturnIDByCGFloatBlock)(CGFloat data);
typedef id _Nullable(^JobsReturnIDByCenterBlock)(CGFloat x,CGFloat y);

typedef id _Nullable(^JobsReturnIDByIDBlock)(id _Nullable data);
typedef id _Nullable(^JobsReturnIDByNotificationBlock)(NSNotification *_Nullable notification);
typedef id _Nullable(^JobsReturnIDByObjBlock)(__kindof NSObject *_Nullable data);
typedef id _Nullable(^JobsReturnIDByArrBlock)(__kindof NSArray *_Nullable data);
typedef id _Nullable(^JobsReturnIDByDataBlock)(NSData *_Nullable data);
typedef id _Nullable(^JobsReturnIDByStringBlock)(__kindof NSString *_Nullable data);
typedef id _Nonnull(^JobsReturnIDBySaltStrBlock)(__kindof NSString *_Nullable salt);
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
typedef id _Nullable(^JobsReturnIDByTwoIDBlock) (Jobs_2_Arguments);/// weakSelf、arg
typedef id _Nullable(^JobsReturnIDByThreeIDBlock) (Jobs_3_Arguments);/// weakSelf、arg、data
#pragma mark —— 关于 NSRunLoop
typedef __kindof NSRunLoop *_Nullable(^JobsReturnRunLoopByTimerBlock)(NSTimer *_Nonnull timer);
#pragma mark —— 关于数据容器
/// 数组
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByVoidBlock)(void);
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByIDBlock)(id _Nullable data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByArrayBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByIntegerBlock)(NSInteger data);
typedef NSMutableArray <NSObject *>*_Nullable(^JobsReturnMutableArrayByVoidBlock)(void);
typedef NSMutableArray <NSObject *>*_Nullable(^JobsReturnMutableArrayByIDBlock)(id _Nullable data);
/// 字典
typedef __kindof NSDictionary *_Nullable(^JobsReturnDicByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSDictionary *_Nullable(^JobsReturnDicByDataBlock)(NSData *_Nullable data);
typedef __kindof NSDictionary *_Nullable(^JobsReturnDicByURLBlock)(NSURL *_Nullable url);
typedef NSMutableDictionary *_Nonnull(^JobsReturnMutableDicByVoidBlock)(void);
typedef NSMutableDictionary *_Nonnull(^JobsReturnMutableDicByDicBlock)(__kindof NSDictionary *_Nullable dic);
typedef NSMutableDictionary *_Nonnull(^JobsReturnMutableDicByKeyValueBlock)(id <NSCopying>_Nonnull key,id _Nonnull value);
typedef NSMutableDictionary *_Nonnull(^JobsReturnMutableDicByKey_ValueBlock)(NSString *_Nonnull key,id _Nullable value);
/// 集合
typedef __kindof NSSet *_Nullable(^JobsReturnNSSetByIDBlock)(id _Nullable data);
typedef __kindof NSSet *_Nullable(^JobsReturnNSSetByArrBlock)(__kindof NSArray *_Nullable data);
typedef NSMutableSet *_Nullable(^JobsReturnNSMutableSetByIDBlock)(id _Nullable data);
#pragma mark —— 关于 NSBundle
typedef NSBundle *_Nullable(^JobsReturnBundleByStringBlock)(__kindof NSString *_Nullable data);
typedef NSBundle *_Nullable(^JobsReturnBundleByURLBlock)(NSURL *_Nullable data);
typedef NSBundle *_Nullable(^JobsReturnBundleByClsBlock)(Class _Nullable data);
#pragma mark —— 关于 NSLocale
typedef NSLocale *_Nullable(^JobsReturnLocaleByStringBlock)(__kindof NSString *_Nullable data);
#pragma mark —— 关于 NSValue
typedef NSValue *_Nullable(^JobsReturnValueByCGSizeBlock)(CGSize data);
typedef NSValue *_Nullable(^JobsReturnValueByPointerBlock)(const void *_Nullable data);
typedef NSValue *_Nullable(^JobsReturnValueByPointBlock)(CGPoint data);
typedef NSValue *_Nullable(^JobsReturnValueByVectorBlock)(CGVector data);
typedef NSValue *_Nullable(^JobsReturnValueByRectBlock)(CGRect data);
typedef NSValue *_Nullable(^JobsReturnValueByAffineTransformBlock)(CGAffineTransform data);
typedef NSValue *_Nullable(^JobsReturnValueByEdgeInsetsBlock)(UIEdgeInsets
 data);
typedef NSValue *_Nullable(^JobsReturnValueByDirectionalEdgeInsetsBlock)(NSDirectionalEdgeInsets
 data);
typedef NSValue *_Nullable(^JobsReturnValueByOffsetBlock)(UIOffset data);
#pragma mark —— 关于贝塞尔曲线
typedef UIBezierPath *_Nullable(^JobsReturnBezierPathByCGRectBlock)(CGRect data);
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
typedef __kindof UIGestureRecognizer *_Nullable(^JobsReturnGestureRecognizerByVoidBlock)(void);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsReturnGestureRecognizerByVoidStarBlock)(void *_Nullable key);
typedef __kindof UIGestureRecognizer *_Nullable(^JobsReturnGestureRecognizerByGestureRecognizer)(__kindof UIGestureRecognizer *_Nullable data);
#pragma mark —— 关于 Layer
typedef __kindof CALayer *_Nullable(^JobsReturnCALayerByCALayerBlock)(CALayer *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsReturnCALayerByCorBlock)(UIColor *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsReturnCALayerByCGFloatBlock)(CGFloat data);
typedef __kindof CALayer *_Nullable(^JobsReturnCALayerByBezierPathBlock)(UIBezierPath *_Nullable data);
typedef __kindof CALayer *_Nullable(^JobsReturnCALayerByBOOLBlock)(BOOL data);
typedef __kindof CALayer *_Nullable(^JobsReturnCALayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CALayer *_Nullable(^JobsReturnCALayerByCGColorRefBlock)(CGColorRef _Nullable data);

typedef __kindof CAShapeLayer *_Nullable(^JobsReturnCAShapeLayerByCALayerBlock)(CALayer *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsReturnCAShapeLayerByCorBlock)(UIColor *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsReturnCAShapeLayerByCGFloatBlock)(CGFloat data);
typedef __kindof CAShapeLayer *_Nullable(^JobsReturnCAShapeLayerByBezierPathBlock)(UIBezierPath *_Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsReturnCAShapeLayerByBOOLBlock)(BOOL data);
typedef __kindof CAShapeLayer *_Nullable(^JobsReturnCAShapeLayerByCGPathRefBlock)(CGPathRef _Nullable data);
typedef __kindof CAShapeLayer *_Nullable(^JobsReturnCAShapeLayerByCGColorRefBlock)(CGColorRef _Nullable data);
#pragma mark —— 关于 View
/// UIView
typedef __kindof UIView *_Nullable(^JobsReturnViewByVoidBlock)(void);
typedef __kindof UIView *_Nullable(^JobsReturnViewByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByViewBlock)(UIView *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByInteractionBlock)(id <UIInteraction>_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByIDBlock)(id _Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByArrBlock)(NSArray *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByCorBlock)(UIColor *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByBOOLBlock)(BOOL data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByFloatBlock)(CGFloat data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByNSUIntegerBlock)(NSUInteger data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByNSIntegerBlock)(NSInteger data);
typedef __kindof UIView *_Nullable(^JobsReturnViewBySizeBlock)(CGSize data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByRectBlock)(CGRect data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByPointBlock)(CGPoint data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByCenterBlock)(CGFloat x,CGFloat y);
typedef __kindof UIView *_Nullable(^JobsReturnViewByClassBlock)(Class _Nonnull cls);
typedef __kindof UIView *_Nullable(^JobsReturnViewByTableViewHeaderFooterViewBlock)(__kindof UITableViewHeaderFooterView *_Nonnull headerFooterView);
typedef __kindof UIView *_Nullable(^JobsReturnViewByTimeIntervalBlock)(NSTimeInterval data);
/// UIView + UIGestureRecognizer
typedef __kindof UIView *_Nullable(^JobsReturnViewByGestureRecognizer)(__kindof UIGestureRecognizer *_Nullable data);
typedef __kindof UIView *_Nullable(^JobsReturnViewByTapGestureBlock)(UITapGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsReturnViewByLongPressGestureBlock)(UILongPressGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsReturnViewBySwipeGestureBlock)(UISwipeGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsReturnViewByPanGestureBlock)(UIPanGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsReturnViewByPinchGestureBlock)(UIPinchGestureRecognizer *_Nullable gesture);
typedef __kindof UIView *_Nullable(^JobsReturnViewByRotationGestureBlock)(UIRotationGestureRecognizer *_Nullable gesture);
/// UIBarButtonItem
typedef __kindof UIBarButtonItem *_Nullable(^JobsReturnBarButtonItemByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UIBarButtonItem *_Nullable(^JobsReturnBarButtonItemByVoidBlock)(void);
/// UIImageView
typedef __kindof UIImageView *_Nonnull(^JobsReturnImageViewByImageBlock)(UIImage *_Nullable data);
typedef __kindof UIImageView *_Nonnull(^JobsReturnImageViewByURLBlock)(NSURL *_Nullable data);
/// UIWindow
typedef __kindof UIWindow *_Nullable(^JobsReturnWindowByVoidBlock)(void);
typedef __kindof UIWindow *_Nullable(^JobsReturnWindowByWindowSceneBlock)(UIWindowScene *_Nullable data);
/// UIMenuItem
typedef __kindof UIMenuItem *_Nullable(^JobsReturnMenuItemByIDBlock)(id _Nullable data);
typedef __kindof UIMenuItem *_Nullable(^JobsReturnMenuItemBySELBlock)(SEL _Nullable data);
#pragma mark —— 关于 Label
typedef __kindof UILabel *_Nullable(^JobsReturnLabelByImage)(__kindof UIImage *_Nullable image);
typedef __kindof UILabel *_Nullable(^JobsReturnLabelByCor)(__kindof UIColor *_Nullable cor);
typedef __kindof UILabel *_Nullable(^JobsReturnLabelByText)(__kindof NSString *_Nullable str);
typedef __kindof UILabel *_Nullable(^JobsReturnLabelByFont)(__kindof UIFont *_Nullable font);
typedef __kindof UILabel *_Nullable(^JobsReturnLabelByAttributedString)(__kindof NSAttributedString *_Nullable attributedString);
typedef __kindof UILabel *_Nullable(^JobsReturnLabelByTextAlignment)(NSTextAlignment textAlignment);
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
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByAttributedStringBlock)(NSAttributedString *_Nullable title);/// 富文本内容
/// 多参数
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByImagePlacementAndPaddingBlock)(NSDirectionalRectEdge data,
                                                                                       CGFloat x);
typedef __kindof UIButton *_Nonnull(^JobsReturnButtonByColor_FloatBlock)(UIColor *_Nullable,
                                                                         float borderWidth);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTitlesBlock)(NSString *_Nonnull title,
                                                                     NSString *_Nonnull subTitle);/// 主/副 文字内容
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByAttributedStringsBlock)(NSAttributedString *_Nonnull title,
                                                                                NSAttributedString *_Nonnull subTitle);/// 主/副 富文本内容
/// 主文字内容、字体大小
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle1Block) (Jobs_Title_Font_Arguments);
/// 主文字内容、字体大小、主文字颜色
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle2Block) (Jobs_Title_Font_TitleCor_Arguments);
/// 主文字内容、字体大小、主文字颜色、按钮图片、图片和文字的位置关系、x
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle3Block) (Jobs_Title_Font_TitleCor_Image_imagePlacement_X_Arguments);
/// 主文字内容、字体大小、主文字颜色、按钮图片
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle4Block) (Jobs_Title_Font_TitleCor_Image_Arguments);
/// 主文字内容、字体大小、主文字颜色、按钮图片、按钮背景图片、图片和文字的位置关系
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle5Block) (Jobs_Title_Font_TitleCor_Image_BackgroundImage_ImagePlacement_Arguments);
/// 主文字内容、字体大小、主文字颜色、按钮图片、图文相对位置、图文距离
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle6Block) (Jobs_Title_Font_TitleCor_Image_DirectionalRectEdge_X_Arguments);
/// 主文字内容、字体大小、主文字颜色、按钮图片、图文距离
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByStyle7Block) (Jobs_Title_Font_TitleCor_Image_X_Arguments);
#pragma mark —— 关于 UIActivityIndicatorView
typedef __kindof UIActivityIndicatorView *_Nullable(^JobsReturnActivityIndicatorViewByNSInteger)(NSInteger data);
#pragma mark —— 关于 UITableViewHeaderFooterView
/// 多参数
typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsReturnTableViewHeaderFooterViewByClsAndSaltStrBlock)(Class _Nonnull cls,
                                                                                                                  NSString *_Nullable salt);
#pragma mark —— 关于 UITableViewCell
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByVoidBlock)(void);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByIDBlock)(id _Nullable data);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByClsBlock)(Class _Nonnull cls);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByTableViewCellStyleBlock)(UITableViewCellStyle tableViewCellStyle);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByTableViewBlock)(UITableView *_Nonnull tableView);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByIndexPathBlock)(NSIndexPath *_Nonnull indexPath);
/// 多参数
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByClsAndSaltStrBlock)(Class _Nonnull cls,
                                                                                          NSString *_Nullable salt);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByCls_SaltStr_IndexPath_Block)(Class _Nonnull cls,
                                                                                                   NSString *_Nullable salt,
                                                                                                   NSIndexPath *_Nonnull indexPath);
#pragma mark —— 关于 UICollectionView
typedef __kindof UICollectionView *_Nullable(^JobsReturnCollectionViewByLayoutBlock)(__kindof UICollectionViewLayout *_Nullable data);
typedef __kindof UICollectionView *_Nullable(^JobsReturnCollectionViewByFlowLayoutBlock)(__kindof UICollectionViewFlowLayout *_Nullable data);
#pragma mark —— 关于 UICollectionViewLayoutAttributes
typedef __kindof UICollectionViewLayoutAttributes *_Nullable(^JobsReturnCollectionViewLayoutAttributesByNSIndexPathBlock)(__kindof NSIndexPath *_Nullable indexPath);
#pragma mark —— 关于 UICollectionViewCell
typedef __kindof UICollectionViewCell *_Nullable(^JobsReturnCollectionViewCellByVoidBlock)(void);
typedef __kindof UICollectionViewCell *_Nullable(^JobsReturnCollectionViewCellByIDBlock)(id _Nullable data);
typedef __kindof UICollectionViewCell *_Nullable(^JobsReturnCollectionViewCellByIndexPathBlock)(NSIndexPath *_Nullable indexPath);
#pragma mark —— 关于 UIScrollView
typedef __kindof UIScrollView *_Nullable(^JobsReturnScrollViewByVoidBlock)(void);
typedef __kindof UIScrollView *_Nullable(^JobsReturnScrollViewByPointBlock)(CGPoint data);
typedef __kindof UIScrollView *_Nullable(^JobsReturnScrollViewByRectBlock)(CGRect data);
typedef __kindof UIScrollView *_Nullable(^JobsReturnScrollViewByMutArrBlock)(NSMutableArray <NSObject *>*_Nullable data);
#pragma mark —— 关于 PDF
typedef __kindof PDFDocument *_Nullable(^JobsReturnPDFDocumentByURLBlock)(NSURL *_Nullable pdfURL);
#pragma mark —— 关于 WKWebView
#import <WebKit/WebKit.h>
@class UIViewModel;
typedef __kindof WKWebView *_Nullable(^JobsReturnWKWebViewByVoidBlock)(void);
typedef __kindof WKWebView *_Nullable(^JobsReturnWKWebViewByConfigurationBlock)(WKWebViewConfiguration *_Nullable config);
typedef __kindof WKWebView *_Nullable(^JobsReturnWKWebViewByURLRequestBlock)(__kindof NSURLRequest *_Nullable request);
typedef __kindof WKWebView *_Nullable(^JobsReturnWKWebViewByStringBlock)(NSString *_Nullable data);
typedef __kindof WKWebView *_Nullable(^JobsReturnWKWebViewByURLBlock)(NSURL *_Nullable URL);
typedef __kindof WKWebView *_Nullable(^JobsReturnWKWebViewByViewModelBlock)(__kindof UIViewModel *_Nullable viewModel);
#pragma mark —— 关于 控制器
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByViewBlock)(__kindof UIView *_Nonnull view);
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByVCBlock)(__kindof UIViewController *_Nonnull vc);
typedef __kindof UINavigationController *_Nullable(^JobsReturnNavCtrByVCBlock)(__kindof UIViewController *_Nonnull vc);
typedef __kindof UINavigationController *_Nullable(^JobsReturnNavCtrByClassBlock)(Class _Nonnull cls);
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByWebViewBlock)(__kindof WKWebView *_Nonnull webView);
typedef __kindof UIAlertController *_Nullable(^JobsReturnAlertControllerByActionBlock)(UIAlertAction *_Nullable data);
typedef __kindof UIAlertController *_Nullable(^JobsReturnAlertControllerByStringBlock)(NSString *_Nullable data);
#pragma mark —— 关于 富文本
typedef __kindof NSAttributedString *_Nullable(^JobsReturnAttributedStringByVoidBlock)(void);
typedef __kindof NSAttributedString *_Nullable(^JobsReturnAttributedStringByNSUIntegerBlock)(NSUInteger data);
typedef __kindof NSAttributedString *_Nullable(^JobsReturnAttributedStringByStringBlock)(NSString *_Nullable data);
typedef __kindof NSAttributedString *_Nullable(^JobsReturnAttributedStringByAttributedStringBlock)(NSAttributedString *_Nonnull data);
typedef __kindof NSAttributedString *_Nullable(^JobsReturnAttributedStringByColorBlock)(UIColor *_Nonnull data);
#pragma mark —— NSNumber
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByCharBlock)(char data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByUnsignedCharBlock)(unsigned char data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByShortBlock)(short data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByUnsignedShortBlock)(unsigned short data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByIntBlock)(int data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByUnsignedIntBlock)(unsigned int data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByLongBlock)(long data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByUnsignedLongBlock)(unsigned long data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByLongLongBlock)(long long data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByUnsignedLongLongBlock)(unsigned long long data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByFloatBlock)(float data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByDoubleBlock)(double data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByBOOLBlock)(BOOL data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByNSIntegerBlock)(NSInteger data);
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByNSUIntegerBlock)(NSUInteger data);
/// CGFloat 是一个平台相关的类型，它在 32 位系统上是 float 类型，而在 64 位系统上是 double 类型。
/// 因此，直接将 CGFloat 封装为 NSNumber 时，需要根据平台的不同选择正确的 NSNumber 方法。
typedef __kindof NSNumber *_Nullable(^JobsReturnNumberByCGFloatBlock)(CGFloat data);
#pragma mark —— 关于字符串
typedef __kindof NSString *_Nullable(^JobsReturnStringByIntegersBlock)(NSInteger data, ...);
typedef __kindof NSString *_Nullable(^JobsReturnStringByVoidBlock)(void);
typedef __kindof NSString *_Nullable(^JobsReturnStringByCharBlock)(char *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByCharacterSetBlock)(NSCharacterSet *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByCGFloatBlock)(CGFloat data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByIntegerBlock)(NSInteger data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByUIntegerBlock)(NSUInteger data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByRangeBlock)(NSRange data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByTimeIntervalsBlock)(NSTimeInterval data, ...);
typedef __kindof NSString *_Nullable(^JobsReturnStringByBOOLBlock)(BOOL data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByIDBlock)(id _Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByURLBlock)(NSURL *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByDateBlock)(NSDate *_Nullable date);
typedef __kindof NSString *_Nullable(^JobsReturnStringByDataBlock)(__kindof NSData *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByImageBlock)(UIImage *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByNumberBlock)(NSNumber *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByDictionaryBlock)(__kindof NSDictionary *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByCorBlock)(UIColor *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByCGPointBlock)(CGPoint data);
typedef __kindof NSString *_Nullable(^JobsReturnStringByArrAndNSIntegerBlock)(__kindof NSArray *_Nullable arr,NSInteger index);
/// 多参数
typedef __kindof NSString *_Nullable(^JobsReturnStringByTimeIntervalAndDateFormatterBlock)(NSTimeInterval data,
                                                                                           NSDateFormatter *_Nullable dateFormatter);
typedef __kindof NSString *_Nullable(^JobsReturnStringByStringStringBlock)(NSString *_Nullable fontString,
                                                                           NSString *_Nullable tailString);
#pragma mark —— 关于 NSRegularExpression
typedef __kindof NSRegularExpression *_Nullable(^JobsReturnRegularExpressionByStringBlock)(NSString *_Nullable data);
#pragma mark —— 关于时间（格式）/日历/计时器/间隔时间
typedef __kindof NSTimer *_Nullable(^JobsReturnTimerByVoidBlock)(void);
typedef __kindof NSTimer *_Nullable(^JobsReturnTimerByTimerBlock)(NSTimer *_Nullable timer);
typedef __kindof NSString *_Nullable(^JobsReturnStringByDateFormatterBlock)(NSDateFormatter *_Nullable data);
typedef NSTimeInterval(^JobsReturnTimeIntervalByDateBlock)(NSDate *_Nullable data);
typedef __kindof NSDate *_Nullable(^JobsReturnDateByStringBlock)(NSString *_Nullable data);
typedef __kindof NSDateFormatter *_Nullable(^JobsReturnDateFormatterByStringBlock)(NSString *_Nullable);
typedef __kindof NSDate *_Nullable(^JobsReturnDateByVoidBlock)(void);
typedef __kindof NSDate *_Nullable(^JobsReturnDateByTimeIntervalBlock)(NSTimeInterval data);
typedef __kindof NSDate *_Nullable(^JobsReturnDateByDateFormatterBlock)(NSDateFormatter *_Nullable data);
typedef __kindof NSDate *_Nullable(^JobsReturnDateByDateComponentsBlock)(NSDateComponents *_Nullable data);
typedef __kindof NSCalendar *_Nullable(^JobsReturnCalendarByCalendarIdentifierBlock)(NSCalendarIdentifier _Nullable data);
typedef __kindof UNCalendarNotificationTrigger *_Nullable(^JobsReturnCalendarNotificationTriggerByComponentsBlock)(NSDateComponents *_Nullable data);
typedef NSTimeZone *_Nullable(^JobsReturnTimeZoneByStringBlock)(__kindof NSString *_Nullable data);
typedef NSTimeZone *_Nullable(^JobsReturnTimeZoneByIntegerBlock)(NSInteger data);
#pragma mark —— 关于URL
typedef NSURL *_Nullable(^JobsReturnURLByStringBlock)(__kindof NSString *_Nullable data);
typedef NSURL *_Nullable(^JobsReturnURLByURLBlock)(NSURL *_Nullable data);
typedef NSURL *_Nullable(^JobsReturnURLByVoidBlock)(void);
typedef void(^jobsByURLRequestBlock)(__kindof NSURLRequest *_Nonnull request);
typedef __kindof NSURLRequest *_Nullable(^JobsReturnURLRequestByVoidBlock)(void);
typedef NSMutableURLRequest *_Nullable(^JobsReturnMutableURLRequestByVoidBlock)(void);
typedef __kindof NSURLRequest *_Nullable(^JobsReturnURLRequestByURLBlock)(NSURL *_Nullable url);
typedef NSMutableURLRequest *_Nullable(^JobsReturnMutableURLRequestByURLBlock)(NSURL *_Nullable url);
#pragma mark —— 关于相册
typedef PHAsset *_Nullable(^JobsReturnAssetByStrBlock)(NSString *_Nullable Key);
#pragma mark —— 关于数据
typedef __kindof NSData *_Nullable(^JobsReturnDataByVoidBlock)(void);
typedef __kindof NSData *_Nullable(^JobsReturnDataByIDBlock)(id _Nullable data);
typedef __kindof NSData *_Nullable(^JobsReturnDataByNSUIntegerBlock)(NSUInteger data);
typedef __kindof NSData *_Nullable(^JobsReturnDataByDataBlock)(__kindof NSData *_Nullable data);
typedef __kindof NSData *_Nullable(^JobsReturnDataByImageBlock)(UIImage *_Nullable data);
typedef __kindof NSData *_Nullable(^JobsReturnDataByFloatBlock)(CGFloat data);
typedef __kindof NSData *_Nullable(^JobsReturnDataByURLBlock)(NSURL *_Nullable data);
typedef __kindof NSData *_Nullable(^JobsReturnDataByAssetBlock)(AVAsset *_Nullable asset);
typedef __kindof NSData *_Nullable(^JobsReturnDataByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof NSData *_Nullable(^JobsReturnDataByDictionaryBlock)(__kindof NSDictionary *_Nullable data);
#pragma mark —— 关于字体
typedef UIFont *_Nullable(^JobsReturnFontByVoidBlock)(void);
typedef UIFont *_Nullable(^JobsReturnFontByConfigurationTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable transformer);
#pragma mark —— 关于颜色
typedef UIColor *_Nullable(^JobsReturnColorByHexAlphaBlock)(uint32_t hexValue, CGFloat alpha);
typedef UIColor *_Nullable(^JobsReturnColorByHexBlock)(uint32_t hexValue);
typedef UIColor *_Nonnull(^JobsReturnColorByCGFloatBlock)(CGFloat data);
typedef UIColor *_Nullable(^JobsReturnColorByNSUIntegerBlock)(NSUInteger data);
typedef UIColor *_Nullable(^JobsReturnColorByConfigurationTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable transformer);
typedef UIColor *_Nullable(^JobsReturnColorByStringBlock)(NSString *_Nonnull cor);
typedef UIColor *_Nullable(^JobsReturnColorByImageBlock)(UIImage *_Nonnull cor);
#pragma mark —— 关于图片
typedef UIImage *_Nonnull(^JobsReturnImageByVoidBlock)(void);
typedef UIImage *_Nonnull(^JobsReturnImageByAlphaBlock)(CGFloat alpha);
typedef UIImage *_Nullable(^JobsReturnImageByNSUIntegerBlock)(NSUInteger data);
typedef UIImage *_Nullable(^JobsReturnImageByNSIntegerBlock)(NSInteger data);
typedef UIImage *_Nonnull(^JobsReturnImageByCGRectBlock)(CGRect data);
typedef UIImage *_Nonnull(^JobsReturnImageByCGSizeBlock)(CGSize data);
typedef UIImage *_Nonnull(^JobsReturnImageByAVURLAssetBlock)(AVURLAsset *_Nonnull data);
typedef UIImage *_Nonnull(^JobsReturnImageByViewBlock)(__kindof UIView *_Nonnull data);
typedef UIImage *_Nullable(^JobsReturnImageByImageBlock)(UIImage *_Nullable data);
typedef UIImage *_Nullable(^JobsReturnImageByCorBlock)(UIColor *_Nullable data);
typedef UIImage *_Nullable(^JobsReturnImageByDataBlock)(__kindof NSData *_Nullable data);
typedef UIImage *_Nonnull(^JobsReturnImageByDataBlock)(__kindof NSData *_Nullable data);
typedef UIImage *_Nonnull(^JobsReturnImageByCGImageRefBlock)(CGImageRef _Nullable data);
typedef UIImage *_Nullable(^JobsReturnImageByStringBlock)(__kindof NSString *_Nullable data);
#pragma mark —— 关于段落配置
typedef __kindof NSParagraphStyle *_Nullable(^JobsReturnParagraphStyleByVoidBlock)(void);
typedef __kindof NSParagraphStyle *_Nullable(^JobsReturnParagraphStyleByTextAlignmentBlock)(NSTextAlignment data);
#pragma mark —— 关于 动画
#import <QuartzCore/QuartzCore.h>
typedef CAKeyframeAnimation *_Nullable(^JobsReturnCAKeyframeAnimationByStringBlock)(NSString *_Nullable data);
typedef CABasicAnimation *_Nullable(^JobsReturnCABasicAnimationByStringBlock)(NSString *_Nullable data);
#pragma mark —— 关于 JavaScript
typedef JSValue *_Nullable(^JobsReturnJSValueByStringBlock)(NSString *_Nullable jsCode);
#pragma mark —— UIImpactFeedbackGenerator
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsReturnImpactFeedbackGeneratorByVoidBlock)(void);
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsReturnImpactFeedbackGeneratorByNSIntegerBlock)(NSInteger data);
typedef UIImpactFeedbackGenerator *_Nonnull(^JobsReturnImpactFeedbackGeneratorByViewBlock)(__kindof UIView *_Nullable view);
#pragma mark —— 关于PHAssetCollectionChangeRequest
typedef __kindof PHAssetCollectionChangeRequest *_Nonnull(^JobsReturnPHAssetCollectionChangeRequestByPHAssetCollectionBlock)(__kindof PHAssetCollection *_Nullable data);
typedef __kindof PHAssetCollectionChangeRequest *_Nonnull(^JobsReturnPHAssetCollectionChangeRequestByStringBlock)(__kindof NSString *_Nullable data);
typedef __kindof PHAssetCollectionChangeRequest *_Nullable(^JobsReturnPHAssetCollectionChangeRequestByIDBlock)(id<NSFastEnumeration> _Nullable data);
#pragma mark —— 关于 PHFetchResult
typedef __kindof PHFetchResult <__kindof PHCollection *>*_Nonnull(^JobsReturnPHFetchResultWithPHCollectionByPHFetchOptionsBlock)(__kindof PHFetchOptions *_Nullable options);
typedef __kindof PHFetchResult <PHAsset *>*_Nonnull(^JobsReturnPHFetchResultWithPHAssetByPHFetchOptionsBlock)(__kindof PHFetchOptions *_Nullable options);
#pragma mark —— 关于位置
typedef NSRange (^JobsReturnRangeByTextCheckingResultBlock)(NSTextCheckingResult *_Nullable data);
typedef NSRange (^JobsReturnRangeByIntegerBlock)(NSInteger data);
typedef NSRange (^JobsReturnRangeByStringBlock)(NSString *_Nullable data);
typedef NSRange (^JobsReturnRangeByVoidBlock)(void);

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
#pragma mark —— 关于数据类型
typedef NSInteger(^JobsReturnNSIntegerByVoidBlock)(void);
typedef NSInteger(^JobsReturnByNSIntegerBlock)(NSInteger data);
typedef NSInteger(^JobsReturnNSIntegerByIDBlock)(id _Nullable data);
typedef NSInteger(^JobsReturnNSIntegerByStringBlock)(NSString *_Nullable data);
typedef NSInteger(^JobsReturnNSIntegerByPointBlock)(CGPoint data);

typedef NSUInteger(^JobsReturnNSUIntegerByVoidBlock)(void);
typedef NSUInteger(^JobsReturnByNSUIntegerBlock)(NSUInteger data);
typedef NSUInteger(^JobsReturnNSUIntegerByIDBlock)(id _Nullable data);

typedef CGFloat(^JobsReturnCGFloatByVoidBlock)(void);
typedef CGFloat(^JobsReturnCGFloatByViewBlock)(UIView *_Nullable view);
typedef CGFloat(^JobsReturnCGFloatByCGFloatBlock)(CGFloat data);
typedef CGFloat(^JobsReturnByCGPointBlock)(CGPoint data);
typedef CGFloat(^JobsReturnCGFloatByIDBlock)(id _Nullable data);
typedef CGFloat(^JobsReturnCGFloatByArrBlock)(NSMutableArray <__kindof NSObject *>*_Nullable data);
typedef CGFloat(^JobsReturnCGFloatByFontBlock)(UIFont *_Nullable font);
typedef CGFloat(^JobsReturnCGFloatByNumberBlock)(NSNumber *_Nullable data);

typedef BOOL(^JobsReturnBOOLByVoidBlock)(void);
typedef BOOL(^JobsReturnBOOLBySizeBlock)(CGSize size);
typedef BOOL(^JobsReturnBOOLByPointBlock)(CGPoint point);
typedef BOOL(^JobsReturnBOOLByFrameBlock)(CGRect frame);
typedef BOOL(^JobsReturnBOOLByCGFloatBlock)(CGFloat data);
typedef BOOL(^JobsReturnBOOLByBOOLBlock)(BOOL data);
typedef BOOL(^JobsReturnBOOLByNSUIntegerBlock)(NSUInteger data);
typedef BOOL(^JobsReturnBOOLByNSIntegerBlock)(NSInteger data);
typedef BOOL(^JobsReturnBOOLByIDBlock)(id _Nullable data);
typedef BOOL(^JobsReturnBOOLByViewControllerBlock)(UIViewController *_Nullable viewController);
typedef BOOL(^JobsReturnBOOLByStringBlock)(__kindof NSString *_Nullable data);
typedef BOOL(^JobsReturnBOOLByDateBlock)(NSDate *_Nullable date);
typedef BOOL(^JobsReturnBOOLByArrBlock)(__kindof NSArray *_Nullable arr);

typedef int(^JobsReturnIntByVoidBlock)(void);
typedef int(^JobsReturnIntByIntBlock)(int data);
typedef int(^JobsReturnIntByIDBlock)(id _Nullable data);
typedef NSInteger(^JobsReturnIntegerByDateBlock)(NSDate *_Nullable data);

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
typedef unsigned short(^JobsReturnUnsignedShortByNSUIntegerBlock)(NSUInteger data);

typedef long(^JobsReturnLongByVoidBlock)(void);
typedef long(^JobsReturnByLongBlock)(long data);
typedef long(^JobsReturnLongByIDBlock)(id _Nullable data);

typedef unsigned long(^JobsReturnUnsignedLongByVoidBlock)(void);
typedef unsigned long(^JobsReturnByUnsignedLongBlock)(unsigned long data);
typedef unsigned long(^JobsReturnUnsignedLongByIDBlock)(id _Nullable data);

typedef unsigned long long(^JobsReturnUnsignedLongLongByIDBlock)(id _Nullable data);
typedef unsigned long long(^JobsReturnUnsignedLongLongByVoidBlock)(void);
typedef unsigned long long(^JobsReturnByUnsignedLongLongBlock)(unsigned long long data);

typedef NSIndexPath *_Nonnull(^JobsReturnIndexPathByXYBlock)(CGFloat x,CGFloat y);
#pragma mark —— 其他
typedef UIEditMenuInteraction *_Nullable(^JobsReturnUIEditMenuInteractionByIDBlock)(id<UIEditMenuInteractionDelegate>_Nullable data);
typedef UIContextMenuInteraction *_Nonnull(^JobsReturnContextMenuInteractionByIDBlock)(id <UIContextMenuInteractionDelegate>_Nullable data);
typedef __kindof NSXMLParser *_Nonnull(^JobsReturnNSXMLParserByNSDataBlock)(__kindof NSData *_Nullable data);
typedef PHAssetChangeRequest *_Nonnull(^JobsReturnPHAssetChangeRequestByURLBlock)(NSURL *_Nullable url);
typedef __kindof AVAssetImageGenerator *_Nonnull(^JobsReturnAVAssetImageGeneratorByAVURLAssetBlock)(__kindof AVURLAsset *_Nullable data);
typedef __kindof NSArray <PHAssetResource *>*_Nonnull(^JobsReturnArrayByPHAssetBlock)(__kindof PHAsset *_Nullable data);

#pragma clang diagnostic pop

#endif /* ReturnByCertainParameters_h */
