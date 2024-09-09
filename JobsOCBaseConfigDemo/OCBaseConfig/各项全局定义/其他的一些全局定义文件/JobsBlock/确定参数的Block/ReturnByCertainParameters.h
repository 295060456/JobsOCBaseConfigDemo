//
//  ReturnByCertainParameters.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/27.
//

#ifndef ReturnByCertainParameters_h
#define ReturnByCertainParameters_h
///【 确定入参个数 并且 有返回值的Block定义】
#pragma mark —— 单形参
typedef id _Nullable(^JobsReturnIDByVoidBlock)(void);
typedef id _Nullable(^JobsReturnIDByIDBlock)(id _Nullable data);
typedef id _Nullable(^JobsReturnIDByStringBlock)(NSString *_Nullable data);
typedef id _Nonnull(^JobsReturnIDBySaltStrBlock)(NSString *_Nullable salt);
typedef id _Nullable(^JobsReturnIDBySELBlock)(SEL _Nullable data);
typedef id _Nullable(^JobsReturnIDByGestureRecognizerBlock)(__kindof UIGestureRecognizer *_Nullable data);
typedef id _Nullable(^JobsReturnIDByDicBlock)(NSDictionary *_Nullable data);

typedef __kindof NSArray *_Nullable(^JobsReturnArrByArrBlock)(__kindof NSArray *_Nullable data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByIDBlock)(id _Nullable data);
typedef __kindof NSArray *_Nullable(^JobsReturnArrayByMutableArrayBlock)(__kindof NSMutableArray *_Nullable data);
typedef __kindof UIWindow *_Nullable(^JobsReturnWindowByVoidBlock)(void);
typedef __kindof UIView *_Nullable(^JobsReturnViewByVoidBlock)(void);
typedef __kindof UIView *_Nullable(^JobsReturnViewByClassBlock)(Class _Nonnull cls);
typedef __kindof UIBarButtonItem *_Nullable(^JobsReturnBarButtonItemByViewBlock)(__kindof UIView *_Nullable view);
typedef __kindof UIBarButtonItem *_Nullable(^JobsReturnBarButtonItemByVoidBlock)(void);

typedef NSTimer *_Nullable(^JobsReturnTimerByVoidBlock)(void);
typedef UIImageView *_Nonnull(^JobsReturnImageViewByImageBlock)(UIImage *_Nullable data);
typedef UIImageView *_Nonnull(^JobsReturnImageViewByURLBlock)(NSURL *_Nullable data);
typedef UIImage *_Nullable(^JobsReturnImageByCorBlock)(UIColor *_Nullable data);
typedef UIImage *_Nullable(^JobsReturnImageByDataBlock)(NSData *_Nullable data);
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByView)(__kindof UIView *_Nonnull view);
typedef __kindof UIViewController *_Nullable(^JobsReturnVCByVC)(__kindof UIViewController *_Nonnull vc);
typedef __kindof UINavigationController *_Nullable(^JobsReturnNavCtrByVC)(__kindof UIViewController *_Nonnull vc);

typedef NSParagraphStyle *_Nullable(^_Nullable JobsReturnParagraphStyleByVoidBlock)(void);
typedef NSParagraphStyle *_Nullable(^_Nullable JobsReturnParagraphStyleByTextAlignmentBlock)(NSTextAlignment data);
typedef NSMutableAttributedString *_Nullable(^JobsReturnMutAttributedStringByStringBlock)(NSString *_Nullable data);
typedef NSMutableAttributedString *_Nullable(^JobsReturnMutAttributedStringByAttributedStringBlock)(NSAttributedString *_Nonnull data);
typedef NSAttributedString *_Nullable(^JobsReturnAttributedStringByStringBlock)(NSString *_Nullable data);
typedef NSAttributedString *_Nullable(^JobsReturnAttributedStringByAttributedStringBlock)(NSAttributedString *_Nonnull data);
typedef NSString *_Nullable(^JobsReturnStringByVoidBlock)(void);
typedef NSString *_Nullable(^JobsReturnStringByIDBlock)(id _Nullable data);
typedef NSString *_Nullable(^JobsReturnStringByDateBlock)(NSDate *_Nullable date);
typedef NSString *_Nullable(^JobsReturnStringByNumberBlock)(NSNumber *_Nullable data);
typedef NSString *_Nullable(^JobsReturnStringByStringBlock)(NSString *_Nullable data);
typedef NSString *_Nullable(^JobsReturnStrByCorBlock)(UIColor *_Nullable data);
typedef NSString *_Nullable(^JobsReturnStringByIntegerBlock)(NSInteger data);
typedef NSString *_Nullable(^JobsReturnStringByTimeIntervalBlock)(NSTimeInterval data);
typedef NSString *_Nullable(^JobsReturnStringByTimeIntervalAndDateFormatterBlock)(NSTimeInterval data,NSDateFormatter *_Nullable dateFormatter);
typedef NSMutableString *_Nullable(^JobsReturnMutableStringByStringBlock)(NSString *_Nullable data);
typedef NSMutableArray *_Nullable(^JobsReturnMutableArrayByIntegerBlock)(NSInteger data);
typedef NSMutableArray *_Nullable(^JobsReturnMutableArrayByVoidBlock)(void);

typedef NSDate *_Nullable(^JobsReturnDateByTimeIntervalBlock)(NSTimeInterval data);
typedef NSDate *_Nullable(^JobsReturnDateByDateFormatterBlock)(NSDateFormatter *_Nullable data);
typedef NSData *_Nullable(^JobsReturnDataByAssetBlock)(AVAsset *_Nullable asset);
typedef NSTimeInterval(^JobsReturnTimeIntervalByDateBlock)(NSDate *_Nullable);

typedef PHAsset *_Nullable(^JobsReturnAssetByStrBlock)(NSString *_Nullable Key);

typedef UIFont *_Nullable(^JobsReturnFontByVoidBlock)(void);
typedef UIFont *_Nullable(^JobsReturnFontByConfigurationTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable transformer);
typedef UIColor *_Nullable(^JobsReturnColorByConfigurationTextAttributesTransformerBlock)(UIConfigurationTextAttributesTransformer _Nullable transformer);
typedef UIColor *_Nullable(^JobsReturnColorByStringBlock)(NSString *_Nonnull cor);
typedef UIColor *_Nullable(^JobsReturnColorByHexAlphaBlock)(uint32_t hexValue, CGFloat alpha);
typedef UIColor *_Nullable(^JobsReturnColorByHexBlock)(uint32_t hexValue);
typedef UIColor *_Nonnull(^JobsReturnColorByCGFloatBlock)(CGFloat data);
typedef UIColor *_Nullable(^JobsReturnColorByImageBlock)(UIImage *_Nonnull cor);

typedef UIImage *_Nonnull(^JobsReturnImageByVoidBlock)(void);
typedef UIImage *_Nonnull(^JobsReturnImageByCGRectBlock)(CGRect data);
typedef UIImage *_Nonnull(^JobsReturnImageByCGSizeBlock)(CGSize data);
typedef UIImage *_Nonnull(^JobsReturnImageByAVURLAssetBlock)(AVURLAsset *_Nonnull data);
typedef UIImage *_Nonnull(^JobsReturnImageByViewBlock)(__kindof UIView *_Nonnull data);

typedef __kindof UIView *_Nullable(^JobsReturnViewByTableViewHeaderFooterViewBlock)(__kindof UITableViewHeaderFooterView *_Nonnull headerFooterView);

typedef __kindof UITableViewHeaderFooterView *_Nullable(^JobsReturnTableViewHeaderFooterViewByClsAndSaltStrBlock)(Class _Nonnull cls,NSString *_Nullable salt);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByTableViewCellStyleBlock)(UITableViewCellStyle tableViewCellStyle);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByTableViewBlock)(UITableView *_Nonnull tableView);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByVoidBlock)(void);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByClsBlock)(Class _Nonnull cls);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByClsAndSaltStrBlock)(Class _Nonnull cls,
                                                                                           NSString *_Nullable salt);
typedef __kindof UITableViewCell *_Nullable(^JobsReturnTableViewCellByCls_SaltStr_IndexPath_Block)(Class _Nonnull cls,
                                                                                                   NSString *_Nullable salt,
                                                                                                   NSIndexPath *_Nonnull indexPath);

typedef NSDictionary *_Nullable(^JobsReturnDicByStringBlock)(NSString *_Nullable data);
typedef id _Nonnull(^JobsReturnIDByClsAndSaltStrBlock)(Class _Nullable cls,NSString *_Nullable salt);

typedef __kindof UICollectionView *_Nullable(^JobsReturnCollectionViewByFlowLayoutBlock)(__kindof UICollectionViewFlowLayout *_Nullable data);
typedef __kindof UICollectionViewCell *_Nullable(^JobsReturnCollectionViewCellByVoidBlock)(void);

typedef CGPoint(^JobsReturnCGPointByVoidBlock)(void);
typedef CGPoint(^JobsReturnCGPointByIDBlock)(id _Nullable data);
typedef CGSize(^JobsReturnCGSizeByVoidBlock)(void);
typedef CGSize(^JobsReturnCGSizeByIDBlock)(id _Nullable data);

typedef CGRect(^JobsReturnCGRectByVoidBlock)(void);
typedef CGRect(^JobsReturnCGRectByIDBlock)(id _Nullable data);
typedef CGRect(^JobsReturnRectByViewBlock)(__kindof UIView *_Nonnull data);
typedef CGRect(^JobsReturnCGRectByCGPointBlock)(CGPoint data);
typedef CGRect(^JobsReturnCGRectByCGSizeBlock)(CGSize data);
typedef CGRect(^JobsReturnCGRectByCGFloatBlock)(CGFloat data);
typedef CGRect(^JobsReturnCGRectByCGFloatAndUIViewBlock)(CGFloat data,__kindof UIView *_Nonnull superView);

typedef UIEdgeInsets(^JobsReturnUIEdgeInsetsByVoidBlock)(void);
typedef UIEdgeInsets(^JobsReturnUIEdgeInsetsByIDBlock)(id _Nullable data);
/// 关于按钮配置信息
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

typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTitleBlock)(NSString *_Nonnull title);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTitleAndFontBlock)(NSString *_Nonnull title,UIFont *_Nonnull font);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByTitleAndFontAndTitleCorBlock)(NSString *_Nonnull title,UIFont *_Nonnull font,UIColor *_Nonnull titleCor);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByNormalImageBlock)(UIImage *_Nonnull image);
typedef __kindof UIButton *_Nullable(^JobsReturnButtonByBackgroundImageBlock)(UIImage *_Nonnull BackgroundImage);

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

typedef NSInteger(^JobsReturnByNSIntegerBlock)(NSInteger data);
typedef NSUInteger(^JobsReturnByNSUIntegerBlock)(NSUInteger data);
typedef CGFloat(^JobsReturnByCGFloatBlock)(CGFloat data);

typedef BOOL(^JobsReturnBOOLByArrBlock)(NSArray *_Nullable data);
typedef BOOL(^JobsReturnBOOLByDateBlock)(NSDate *_Nullable date);
typedef BOOL(^JobsReturnBOOLByStringBlock)(NSString *_Nullable data);
typedef BOOL(^JobsReturnByBOOLBlock)(BOOL data);
typedef BOOL(^JobsReturnBOOLByNSUIntegerBlock)(NSUInteger data);
typedef BOOL(^JobsReturnBOOLByNSIntegerBlock)(NSInteger data);
typedef int(^JobsReturnByIntBlock)(int data);
typedef unsigned int(^JobsReturnByUnsignedIntBlock)(unsigned int data);
typedef float(^JobsReturnByFloatBlock)(float data);
typedef double(^JobsReturnByDoubleBlock)(double data);
typedef char(^JobsReturnByCharBlock)(char data);
typedef unsigned char(^JobsReturnByUnsignedCharBlock)(unsigned char data);
typedef short(^JobsReturnByShortBlock)(short data);
typedef unsigned short(^JobsReturnByUnsignedShortBlock)(unsigned short data);
typedef long(^JobsReturnByLongBlock)(long data);
typedef unsigned long(^JobsReturnByUnsignedLongBlock)(unsigned long data);
typedef unsigned long long(^JobsReturnByUnsignedLongLongBlock)(unsigned long long data);

typedef NSInteger(^JobsReturnNSIntegerByIDBlock)(id _Nullable data);
typedef NSUInteger(^JobsReturnNSUIntegerByIDBlock)(id _Nullable data);
typedef CGFloat(^JobsReturnCGFloatByIDBlock)(CGFloat data);
typedef BOOL(^JobsReturnBOOLByIDBlock)(id _Nullable data);
typedef int(^JobsReturnIntByIDBlock)(id _Nullable data);
typedef unsigned int(^JobsReturnUnsignedIntByIDBlock)(id _Nullable data);
typedef float(^JobsReturnFloatByIDBlock)(id _Nullable data);
typedef double(^JobsReturnDoubleByIDBlock)(id _Nullable data);
typedef char(^JobsReturnCharByIDBlock)(id _Nullable data);
typedef unsigned char(^JobsReturnUnsignedCharByIDBlock)(id _Nullable data);
typedef short(^JobsReturnShortByIDBlock)(id _Nullable data);
typedef unsigned short(^JobsReturnUnsignedShortByIDBlock)(id _Nullable data);
typedef long(^JobsReturnLongByIDBlock)(id _Nullable data);
typedef unsigned long(^JobsReturnUnsignedLongByIDBlock)(id _Nullable data);
typedef unsigned long long(^JobsReturnUnsignedLongLongByIDBlock)(id _Nullable data);

typedef NSInteger(^JobsReturnNSIntegerByVoidBlock)(void);
typedef NSUInteger(^JobsReturnNSUIntegerByVoidBlock)(void);
typedef CGFloat(^JobsReturnCGFloatByVoidBlock)(void);
typedef BOOL(^JobsReturnBOOLByVoidBlock)(void);
typedef int(^JobsReturnIntByVoidBlock)(void);
typedef unsigned int(^JobsReturnUnsignedIntByVoidBlock)(void);
typedef float(^JobsReturnFloatByVoidBlock)(void);
typedef double(^JobsReturnDoubleByVoidBlock)(void);
typedef char(^JobsReturnCharByVoidBlock)(void);
typedef unsigned char(^JobsReturnUnsignedCharByVoidBlock)(void);
typedef short(^JobsReturnShortByVoidBlock)(void);
typedef unsigned short(^JobsReturnUnsignedShortByVoidBlock)(void);
typedef long(^JobsReturnLongByVoidBlock)(void);
typedef unsigned long(^JobsReturnUnsignedLongByVoidBlock)(void);
typedef unsigned long long(^JobsReturnUnsignedLongLongByVoidBlock)(void);

typedef CGSize(^JobsReturnSizeByNSIntegerBlock)(NSInteger data);
typedef CGSize(^JobsReturnSizeByUIntegerBlock)(NSUInteger data);
typedef CGSize(^JobsReturnSizeByCGFloatBlock)(CGFloat data);
typedef CGSize(^JobsReturnSizeByBOOLBlock)(BOOL data);
typedef CGSize(^JobsReturnSizeByIntBlock)(int data);
typedef CGSize(^JobsReturnSizeByUnsignedIntBlock)(unsigned int data);
typedef CGSize(^JobsReturnSizeByFloatBlock)(float data);
typedef CGSize(^JobsReturnSizeByDoubleBlock)(double data);
typedef CGSize(^JobsReturnSizeByCharBlock)(char data);
typedef CGSize(^JobsReturnSizeByUnsignedCharBlock)(unsigned char data);
typedef CGSize(^JobsReturnSizeByShortBlock)(short data);
typedef CGSize(^JobsReturnSizeByUnsignedShortBlock)(unsigned short data);
typedef CGSize(^JobsReturnSizeByLongBlock)(long data);
typedef CGSize(^JobsReturnSizeByUnsignedLongBlock)(unsigned long data);
typedef CGSize(^JobsReturnSizeByUnsignedLongLongBlock)(unsigned long long data);

typedef CGRect(^JobsReturnRectByNSIntegerBlock)(NSInteger data);
typedef CGRect(^JobsReturnRectByUIntegerBlock)(NSUInteger data);
typedef CGRect(^JobsReturnRectByCGFloatBlock)(CGFloat data);
typedef CGRect(^JobsReturnRectByBOOLBlock)(BOOL data);
typedef CGRect(^JobsReturnRectByIntBlock)(int data);
typedef CGRect(^JobsReturnRectByUnsignedIntBlock)(unsigned int data);
typedef CGRect(^JobsReturnRectByFloatBlock)(float data);
typedef CGRect(^JobsReturnRectByDoubleBlock)(double data);
typedef CGRect(^JobsReturnRectByCharBlock)(char data);
typedef CGRect(^JobsReturnRectByUnsignedCharBlock)(unsigned char data);
typedef CGRect(^JobsReturnRectByShortBlock)(short data);
typedef CGRect(^JobsReturnRectByUnsignedShortBlock)(unsigned short data);
typedef CGRect(^JobsReturnRectByLongBlock)(long data);
typedef CGRect(^JobsReturnRectByUnsignedLongBlock)(unsigned long data);
typedef CGRect(^JobsReturnRectByUnsignedLongLongBlock)(unsigned long long data);

typedef CGPoint(^JobsReturnCGPointByNSIntegerBlock)(NSInteger data);
typedef CGPoint(^JobsReturnCGPointByUIntegerBlock)(NSUInteger data);
typedef CGPoint(^JobsReturnCGPointByCGFloatBlock)(CGFloat data);
typedef CGPoint(^JobsReturnCGPointByBOOLBlock)(BOOL data);
typedef CGPoint(^JobsReturnCGPointByIntBlock)(int data);
typedef CGPoint(^JobsReturnCGPointByUnsignedIntBlock)(unsigned int data);
typedef CGPoint(^JobsReturnCGPointByFloatBlock)(float data);
typedef CGPoint(^JobsReturnCGPointByDoubleBlock)(double data);
typedef CGPoint(^JobsReturnCGPointByCharBlock)(char data);
typedef CGPoint(^JobsReturnCGPointByUnsignedCharBlock)(unsigned char data);
typedef CGPoint(^JobsReturnCGPointByShortBlock)(short data);
typedef CGPoint(^JobsReturnCGPointByUnsignedShortBlock)(unsigned short data);
typedef CGPoint(^JobsReturnCGPointByLongBlock)(long data);
typedef CGPoint(^JobsReturnCGPointByUnsignedLongBlock)(unsigned long data);
typedef CGPoint(^JobsReturnCGPointByUnsignedLongLongBlock)(unsigned long long data);
#pragma mark —— 多形参
/// weakSelf 方便使用，用来打破循环引用。使用时需要改成实际类型，否则没有代码提示
/// selector 实际调用的方法
/// arg 事件默认传递的对象，比如`NSNotification`，`UIButton`
typedef void(^_Nullable JobsSelectorBlock)(id _Nullable weakSelf,
                                           id _Nullable arg);
typedef void(^_Nullable JobsSelectorBlock1)(id _Nullable weakSelf,
                                            id _Nullable arg,
                                            id _Nullable data);
typedef id _Nullable(^JobsReturnIDBySelectorBlock)(id _Nullable weakSelf,
                                                   id _Nullable arg);
typedef id _Nullable(^JobsReturnIDBySelectorBlock2)(id _Nullable weakSelf,
                                                    id _Nullable arg,
                                                    id _Nullable data);
typedef NSString *_Nullable(^JobsReturnStringByStringStringBlock)(NSString *_Nullable fontString,
                                                                  NSString *_Nullable tailString);
typedef id _Nullable(^JobsReturnIDByTwoIDBlock)Jobs_2_Arguments;
typedef id _Nullable(^JobsReturnIDByThreeIDBlock)Jobs_3_Arguments;
typedef id _Nullable(^JobsReturnIDByFourIDBlock)Jobs_4_Arguments;
typedef id _Nullable(^JobsReturnIDByFiveIDBlock)Jobs_5_Arguments;
typedef id _Nullable(^JobsReturnIDBySixIDBlock)Jobs_6_Arguments;
typedef id _Nullable(^JobsReturnIDBySevenIDBlock)Jobs_7_Arguments;
typedef id _Nullable(^JobsReturnIDByEightIDBlock)Jobs_8_Arguments;
typedef id _Nullable(^JobsReturnIDByNineIDBlock)Jobs_9_Arguments;
typedef id _Nullable(^JobsReturnIDByTenIDBlock)Jobs_10_Arguments;

typedef CGSize(^JobsReturnCGSizeByTwoIDBlock)Jobs_2_Arguments;
typedef CGSize(^JobsReturnCGSizeByThreeIDBlock)Jobs_3_Arguments;
typedef CGSize(^JobsReturnCGSizeByFourIDBlock)Jobs_4_Arguments;
typedef CGSize(^JobsReturnCGSizeByFiveIDBlock)Jobs_5_Arguments;
typedef CGSize(^JobsReturnCGSizeBySixIDBlock)Jobs_6_Arguments;
typedef CGSize(^JobsReturnCGSizeBySevenIDBlock)Jobs_7_Arguments;
typedef CGSize(^JobsReturnCGSizeByEightIDBlock)Jobs_8_Arguments;
typedef CGSize(^JobsReturnCGSizeByNineIDBlock)Jobs_9_Arguments;
typedef CGSize(^JobsReturnCGSizeByTenIDBlock)Jobs_10_Arguments;

typedef CGRect(^JobsReturnCGRectByTwoIDBlock)Jobs_2_Arguments;
typedef CGRect(^JobsReturnCGRectByThreeIDBlock)Jobs_3_Arguments;
typedef CGRect(^JobsReturnCGRectByFourIDBlock)Jobs_4_Arguments;
typedef CGRect(^JobsReturnCGRectByFiveIDBlock)Jobs_5_Arguments;
typedef CGRect(^JobsReturnCGRectBySixIDBlock)Jobs_6_Arguments;
typedef CGRect(^JobsReturnCGRectBySevenIDBlock)Jobs_7_Arguments;
typedef CGRect(^JobsReturnCGRectByEightIDBlock)Jobs_8_Arguments;
typedef CGRect(^JobsReturnCGRectByNineIDBlock)Jobs_9_Arguments;
typedef CGRect(^JobsReturnCGRectByTenIDBlock)Jobs_10_Arguments;

typedef CGPoint(^JobsReturnCGPointByTwoIDBlock)Jobs_2_Arguments;
typedef CGPoint(^JobsReturnCGPointByThreeIDBlock)Jobs_3_Arguments;
typedef CGPoint(^JobsReturnCGPointByFourIDBlock)Jobs_4_Arguments;
typedef CGPoint(^JobsReturnCGPointByFiveIDBlock)Jobs_5_Arguments;
typedef CGPoint(^JobsReturnCGPointBySixIDBlock)Jobs_6_Arguments;
typedef CGPoint(^JobsReturnCGPointBySevenIDBlock)Jobs_7_Arguments;
typedef CGPoint(^JobsReturnCGPointByEightIDBlock)Jobs_8_Arguments;
typedef CGPoint(^JobsReturnCGPointByNineIDBlock)Jobs_9_Arguments;
typedef CGPoint(^JobsReturnCGPointByTenIDBlock)Jobs_10_Arguments;

#endif /* ReturnByCertainParameters_h */
