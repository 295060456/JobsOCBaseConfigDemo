//
//  NSObject+CallBackInfoByBlock.h
//  DouDong-II
//
//  Created by Jobs on 2021/2/26.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "JobsBlock.h"

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif
/**
【命名规则】：
    1、无返回值省略Return
    2、无入参标志为Void
    3、入参、返回值同一类型，标识为ReturnBy
    4、有返回值前缀Jobs、无返回值前缀jobs
 */
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CallBackInfoByBlock)

@property(nonatomic,assign)jobsByVoidBlock voidBlock;/// 无入参，无返回值的回调
-(void)actionVoidBlock:(jobsByVoidBlock _Nullable)voidBlock;

@property(nonatomic,assign)jobsByIDBlock objectBlock;/// 入参为ID类型，无返回值的回调
@property(nonatomic,assign)jobsByGestureRecognizerBlock gestureRecognizerBlock;/// 入参为UIGestureRecognizer，无返回值的回调
@property(nonatomic,assign)jobsBySELBlock selBlock;///入参为SEL，无返回值的回调
@property(nonatomic,assign)jobsByStringBlock stringBlock;///入参为NSString，无返回值的回调
-(void)actionObjectBlock:(jobsByIDBlock _Nullable)objectBlock;
-(void)actionGestureRecognizerBlock:(jobsByGestureRecognizerBlock _Nullable)gestureRecognizerBlock;
-(void)actionSELBlock:(jobsBySELBlock _Nullable)selBlock;
-(void)actionStringBlock:(jobsByStringBlock _Nullable)stringBlock;

@property(nonatomic,assign)jobsByNSIntegerBlock NSIntegerBlock;/// 入参为NSInteger，无返回值的回调
@property(nonatomic,assign)jobsByNSUIntegerBlock NSUIntegerBlock;/// 入参为NSUInteger，无返回值的回调
@property(nonatomic,assign)jobsByCGFloatBlock CGFloatBlock;/// 入参CGFloat，无返回值的回调
@property(nonatomic,assign)jobsByBOOLBlock BOOLBlock;/// 入参为BOOL，无返回值的回调
@property(nonatomic,assign)jobsByIntBlock IntBlock;/// 入参为Int，无返回值的回调
@property(nonatomic,assign)jobsByUnsignedIntBlock UnsignedIntBlock;/// 入参为UnsignedInt，无返回值的回调
@property(nonatomic,assign)jobsByFloatBlock FloatBlock;/// 入参为Float，无返回值的回调
@property(nonatomic,assign)jobsByDoubleBlock DoubleBlock;/// 入参为Double，无返回值的回调
@property(nonatomic,assign)jobsByCharBlock CharBlock;/// 入参为Char，无返回值的回调
@property(nonatomic,assign)jobsByUnsignedCharBlock UnsignedCharBlock;/// 入参为IUnsignedChar，无返回值的回调
@property(nonatomic,assign)jobsByShortBlock ShortBlock;/// 入参为Short，无返回值的回调
@property(nonatomic,assign)jobsByUnsignedShortBlock UnsignedShortBlock;/// 入参为UnsignedShort，无返回值的回调
@property(nonatomic,assign)jobsByLongBlock LongBlock;/// 入参为Long，无返回值的回调
@property(nonatomic,assign)jobsByUnsignedLongBlock UnsignedLongBlock;/// 入参为UnsignedLong，无返回值的回调
@property(nonatomic,assign)jobsByUnsignedLongLongBlock UnsignedLongLongBlock;/// 入参为IUnsignedLongLong，无返回值的回调
-(void)actionNSIntegerBlock:(jobsByNSIntegerBlock _Nullable)NSIntegerBlock;
-(void)actionNSUIntegerBlock:(jobsByNSUIntegerBlock _Nullable)NSUIntegerBlock;
-(void)actionCGFloatBlock:(jobsByCGFloatBlock _Nullable)CGFloatBlock;
-(void)actionBOOLBlock:(jobsByBOOLBlock _Nullable)BOOLBlock;
-(void)actionIntBlock:(jobsByIntBlock _Nullable)IntBlock;
-(void)actionUnsignedIntBlock:(jobsByUnsignedIntBlock _Nullable)UnsignedIntBlock;
-(void)actionFloatBlock:(jobsByFloatBlock _Nullable)FloatBlock;
-(void)actionDoubleBlock:(jobsByDoubleBlock _Nullable)DoubleBlock;
-(void)actionCharBlock:(jobsByCharBlock _Nullable)CharBlock;
-(void)actionUnsignedCharBlock:(jobsByUnsignedCharBlock _Nullable)UnsignedCharBlock;
-(void)actionShortBlock:(jobsByShortBlock _Nullable)ShortBlock;
-(void)actionUnsignedShortBlock:(jobsByUnsignedShortBlock _Nullable)UnsignedShortBlock;
-(void)actionLongBlock:(jobsByLongBlock _Nullable)LongBlock;
-(void)actionUnsignedLongBlock:(jobsByUnsignedLongBlock _Nullable)UnsignedLongBlock;
-(void)actionUnsignedLongLongBlock:(jobsByUnsignedLongLongBlock _Nullable)UnsignedLongLongBlock;

@property(nonatomic,assign)JobsSelectorBlock SelectorBlock;
-(void)actionSelectorBlock:(JobsSelectorBlock _Nullable)SelectorBlock;

@property(nonatomic,assign)JobsReturnIDByVoidBlock returnObjectByVoidBlock;/// 无入参，返回值为ID的回调
-(void)actionReturnIDByVoidBlock:(JobsReturnIDByVoidBlock _Nullable)returnObjectByVoidBlock;

@property(nonatomic,assign)JobsReturnIDByGestureRecognizerBlock returnObjectByGestureRecognizerBlock;/// 入参为UIGestureRecognizer，返回值为ID的回调
@property(nonatomic,assign)JobsReturnIDBySELBlock returnObjectBySELBlock;/// 入参为SEL，返回值为ID的回调
@property(nonatomic,assign)JobsReturnIDByStringBlock returnObjectByStringBlock;/// 入参为NSString，返回值为ID的回调
@property(nonatomic,assign)JobsReturnNSIntegerByIDBlock returnNSIntegerByIDBlock;
@property(nonatomic,assign)JobsReturnNSUIntegerByIDBlock returnNSUIntegerByIDBlock;
@property(nonatomic,assign)JobsReturnCGFloatByIDBlock returnCGFloatByIDBlock;
@property(nonatomic,assign)JobsReturnBOOLByIDBlock returnBoolByIDBlock;
@property(nonatomic,assign)JobsReturnIntByIDBlock returnIntByIDBlock;
@property(nonatomic,assign)JobsReturnUnsignedIntByIDBlock returnUnsignedIntByIDBlock;
@property(nonatomic,assign)JobsReturnFloatByIDBlock returnFloatByIDBlock;
@property(nonatomic,assign)JobsReturnDoubleByIDBlock returnDoubleByIDBlock;
@property(nonatomic,assign)JobsReturnCharByIDBlock returnCharByIDBlock;
@property(nonatomic,assign)JobsReturnUnsignedCharByIDBlock returnUnsignedCharByIDBlock;
@property(nonatomic,assign)JobsReturnShortByIDBlock returnShortByIDBlock;
@property(nonatomic,assign)JobsReturnUnsignedShortByIDBlock returnUnsignedShortByIDBlock;
@property(nonatomic,assign)JobsReturnLongByIDBlock returnLongByIDBlock;
@property(nonatomic,assign)JobsReturnUnsignedLongByIDBlock returnUnsignedLongByIDBlock;
@property(nonatomic,assign)JobsReturnUnsignedLongLongByIDBlock returnUnsignedLongLongByIDBlock;
-(void)actionReturnIDByGestureRecognizerBlock:(JobsReturnIDByGestureRecognizerBlock _Nullable)returnObjectByGestureRecognizerBlock;
-(void)actionReturnIDBySELBlock:(JobsReturnIDBySELBlock _Nullable)returnObjectBySELBlock;
-(void)actionReturnIDByStringBlock:(JobsReturnIDByStringBlock _Nullable)returnObjectByStringBlock;
-(void)actionReturnNSIntegerByIDBlock:(JobsReturnNSIntegerByIDBlock _Nullable)returnNSIntegerByIDBlock;
-(void)actionReturnNSUIntegerByIDBlock:(JobsReturnNSUIntegerByIDBlock _Nullable)returnNSUIntegerByIDBlock;
-(void)actionReturnCGFloatByIDBlock:(JobsReturnCGFloatByIDBlock _Nullable)returnCGFloatByIDBlock;
-(void)actionReturnBoolByIDBlock:(JobsReturnBOOLByIDBlock _Nullable)returnBoolByIDBlock;
-(void)actionReturnIntByIDBlock:(JobsReturnIntByIDBlock _Nullable)returnIntByIDBlock;
-(void)actionReturnUnsignedIntByIDBlock:(JobsReturnUnsignedIntByIDBlock _Nullable)returnUnsignedIntByIDBlock;
-(void)actionReturnFloatByIDBlock:(JobsReturnFloatByIDBlock _Nullable)returnFloatByIDBlock;
-(void)actionReturnDoubleByIDBlock:(JobsReturnDoubleByIDBlock _Nullable)returnDoubleByIDBlock;
-(void)actionReturnCharByIDBlock:(JobsReturnCharByIDBlock _Nullable)returnCharByIDBlock;
-(void)actionReturnUnsignedCharByIDBlock:(JobsReturnUnsignedCharByIDBlock _Nullable)returnUnsignedCharByIDBlock;
-(void)actionReturnShortByIDBlock:(JobsReturnShortByIDBlock _Nullable)returnShortByIDBlock;
-(void)actionReturnUnsignedShortByIDBlock:(JobsReturnUnsignedShortByIDBlock _Nullable)returnUnsignedShortByIDBlock;
-(void)actionReturnLongByIDBlock:(JobsReturnLongByIDBlock _Nullable)returnLongByIDBlock;
-(void)actionReturnUnsignedLongByIDBlock:(JobsReturnUnsignedLongByIDBlock _Nullable)returnUnsignedLongByIDBlock;
-(void)actionReturnUnsignedLongLongByIDBlock:(JobsReturnUnsignedLongLongByIDBlock _Nullable)returnUnsignedLongLongByIDBlock;

@property(nonatomic,assign)JobsReturnIDByIDBlock returnObjectBlock;/// 返回值为ID的回调
@property(nonatomic,assign)JobsReturnByNSIntegerBlock returnNSIntegerBlock;/// 返回值为NSInteger的回调
@property(nonatomic,assign)JobsReturnByNSUIntegerBlock returnNSUIntegerBlock;/// 返回值为UInteger的回调
@property(nonatomic,assign)JobsReturnByCGFloatBlock returnCGFloatBlock;/// 返回值为CGFloat的回调
@property(nonatomic,assign)JobsReturnByBOOLBlock returnBoolBlock;/// 返回值为BOOL的回调
@property(nonatomic,assign)JobsReturnBOOLByNSUIntegerBlock returnBoolByNSUIntegerBlock;/// 入参为NSUInteger，返回值为BOOL的回调
@property(nonatomic,assign)JobsReturnByIntBlock returnIntBlock;/// 返回值为Int的回调
@property(nonatomic,assign)JobsReturnByUnsignedIntBlock returnUnsignedIntBlock;/// 返回值为UnsignedInt的回调
@property(nonatomic,assign)JobsReturnByFloatBlock returnFloatBlock;/// 返回值为Float的回调
@property(nonatomic,assign)JobsReturnByDoubleBlock returnDoubleBlock;/// 返回值为Double的回调
@property(nonatomic,assign)JobsReturnByCharBlock returnCharBlock;/// 返回值为Char的回调
@property(nonatomic,assign)JobsReturnByUnsignedCharBlock returnUnsignedCharBlock;/// 返回值为UnsignedChar的回调
@property(nonatomic,assign)JobsReturnByShortBlock returnShortBlock;/// 返回值为Short的回调
@property(nonatomic,assign)JobsReturnByUnsignedShortBlock returnUnsignedShortBlock;/// 返回值为UnsignedShort的回调
@property(nonatomic,assign)JobsReturnByLongBlock returnLongBlock;/// 返回值为Long的回调
@property(nonatomic,assign)JobsReturnByUnsignedLongBlock returnUnsignedLongBlock;/// 返回值为UnsignedLong的回调
@property(nonatomic,assign)JobsReturnByUnsignedLongLongBlock returnUnsignedLongLongBlock;/// 返回值为UnsignedLongLong的回调
-(void)actionReturnObjectBlock:(JobsReturnIDByIDBlock _Nullable)returnObjectBlock;
-(void)actionReturnNSIntegerBlock:(JobsReturnByNSIntegerBlock _Nullable)returnNSIntegerBlock;
-(void)actionReturnNSUIntegerBlock:(JobsReturnByNSUIntegerBlock _Nullable)returnNSUIntegerBlock;
-(void)actionReturnCGFloatBlock:(JobsReturnByCGFloatBlock _Nullable)returnCGFloatBlock;
-(void)actionReturnBOOLBlock:(JobsReturnByBOOLBlock _Nullable)returnBoolBlock;
-(void)actionReturnBoolByNSUIntegerBlock:(JobsReturnBOOLByNSUIntegerBlock _Nullable)returnBoolByNSUIntegerBlock;
-(void)actionReturnIntBlock:(JobsReturnByIntBlock _Nullable)returnIntBlock;
-(void)actionReturnUnsignedIntBlock:(JobsReturnByUnsignedIntBlock _Nullable)returnUnsignedIntBlock;
-(void)actionReturnFloatBlock:(JobsReturnByFloatBlock _Nullable)returnFloatBlock;
-(void)actionReturnDoubleBlock:(JobsReturnByDoubleBlock _Nullable)returnDoubleBlock;
-(void)actionReturnCharBlock:(JobsReturnByCharBlock _Nullable)returnCharBlock;
-(void)actionReturnUnsignedCharBlock:(JobsReturnByUnsignedCharBlock _Nullable)returnUnsignedCharBlock;
-(void)actionReturnShortBlock:(JobsReturnByShortBlock _Nullable)returnShortBlock;
-(void)actionReturnUnsignedShortBlock:(JobsReturnByUnsignedShortBlock _Nullable)returnUnsignedShortBlock;
-(void)actionReturnLongBlock:(JobsReturnByLongBlock _Nullable)returnLongBlock;
-(void)actionReturnUnsignedLongBlock:(JobsReturnByUnsignedLongBlock _Nullable)returnUnsignedLongBlock;
-(void)actionReturnUnsignedLongLongBlock:(JobsReturnByUnsignedLongLongBlock _Nullable)returnUnsignedLongLongBlock;

@property(nonatomic,assign)JobsReturnIDBySelectorBlock returnIDBySelectorBlock;
-(void)actionReturnIDBySelectorBlock:(JobsReturnIDBySelectorBlock _Nullable)returnIDBySelectorBlock;

@end

NS_ASSUME_NONNULL_END
/// NSClassFromString
static inline BOOL KindOfClsFromStr(id _Nonnull data, NSString *_Nonnull ClsName) {
    return [data isKindOfClass:NSClassFromString(ClsName)];
}
/// UIButton
static inline BOOL KindOfBtnCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIButton");
}
/// BaseButton
static inline BOOL KindOfBaseButtonCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"BaseButton");
}
/// UIView
static inline BOOL KindOfViewCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIView");
}
/// NSString
static inline BOOL KindOfStrCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSString");
}
/// UIViewController
static inline BOOL KindOfVCCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIViewController");
}
/// NSData
static inline BOOL KindOfDataCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSData");
}
/// NSMutableArray
static inline BOOL KindOfMutArrCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSMutableArray");
}
/// NSArray
static inline BOOL KindOfArrCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSArray");
}
/// NSMutableDictionary
static inline BOOL KindOfMutDicCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSMutableDictionary");
}
/// NSDictionary
static inline BOOL KindOfDicCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSDictionary");
}
/// NSJSONSerialization
static inline BOOL KindOfJSONerializationCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSJSONSerialization");
}
/// NSMutableString
static inline BOOL KindOfMutStrCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSMutableString");
}
/// UIImage
static inline BOOL KindOfImageCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIImage");
}
/// UITabBarController
static inline BOOL KindOfTabBarCtrlCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UITabBarController");
}
/// UINavigationController
static inline BOOL KindOfNavCtrlCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UINavigationController");
}
/// UIScrollView
static inline BOOL KindOfScrollViewCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIScrollView");
}
/// NSNumber
static inline BOOL KindOfNumberCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSNumber");
}
/// NSSet
static inline BOOL KindOfSetCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSSet");
}
/// NSMutableSet
static inline BOOL KindOfMutSetCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSMutableSet");
}
/// UIViewModel
static inline BOOL KindOfViewModelCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIViewModel");
}
/// UIButtonModel
static inline BOOL KindOfButtonModelCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIButtonModel");
}
/// UILabel
static inline BOOL KindOfLabCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UILabel");
}
/// UICollectionViewCell
static inline BOOL KindOfCollectionViewCellCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UICollectionViewCell");
}
/// UITableViewCell
static inline BOOL KindOfTableViewCellCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UITableViewCell");
}
/// UITableView
static inline BOOL KindOfTableViewCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UITableView");
}
/// UICollectionView
static inline BOOL KindOfCollectionViewCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UICollectionView");
}
/// NSError
static inline BOOL KindOfErrorCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSError");
}
/// PHAsset
static inline BOOL KindOfPHAssetCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"PHAsset");
}
/// UITextField
static inline BOOL KindOfTextFieldCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UITextField");
}
/// LZTabBarItem
static inline BOOL KindOfLZTabBarItemCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"LZTabBarItem");
}
/// UIControl
static inline BOOL KindOfCtrlCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIControl");
}
/// UITextItem
static inline BOOL KindOfTextItemCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UITextItem");
}
/// YTKAnimatingRequestAccessory
static inline BOOL KindOfYTKAnimatingRequestAccessoryCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"YTKAnimatingRequestAccessory");
}
