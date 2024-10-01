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
/// 对三目运算符的封装
NS_INLINE id _Nullable Jobs3TO(id _Nullable Obj1, id _Nonnull Obj2) {
    /// 三目运算符（Ternary Operator）之所以被称为 "三目" 运算符，是因为它涉及三个操作数。它是唯一一个需要三个操作数的运算符。
    return Obj1 ? Obj1 : Obj2;
}
NS_ASSUME_NONNULL_BEGIN
//在 Objective-C 中，向 nil 对象发送消息不会崩溃
//但是如果你尝试对 nil 对象调用分类中的方法，可能会导致问题。
//这是因为 nil 对象并不会执行任何方法实现，分类中的方法也不会被调用。
@interface NSObject (CallBackInfoByBlock)

@property(nonatomic,copy,nullable)jobsByVoidBlock voidBlock;/// 无入参，无返回值的回调
-(void)actionVoidBlock:(jobsByVoidBlock _Nullable)voidBlock;

@property(nonatomic,copy,nullable)jobsByIDBlock objectBlock;/// 入参为ID类型，无返回值的回调
@property(nonatomic,copy,nullable)jobsByGestureRecognizerBlock gestureRecognizerBlock;/// 入参为UIGestureRecognizer，无返回值的回调
@property(nonatomic,copy,nullable)jobsBySELBlock selBlock;///入参为SEL，无返回值的回调
@property(nonatomic,copy,nullable)jobsByStringBlock stringBlock;///入参为NSString，无返回值的回调
-(void)actionObjectBlock:(jobsByIDBlock _Nullable)objectBlock;
-(void)actionGestureRecognizerBlock:(jobsByGestureRecognizerBlock _Nullable)gestureRecognizerBlock;
-(void)actionSELBlock:(jobsBySELBlock _Nullable)selBlock;
-(void)actionStringBlock:(jobsByStringBlock _Nullable)stringBlock;

@property(nonatomic,copy,nullable)jobsByNSIntegerBlock NSIntegerBlock;/// 入参为NSInteger，无返回值的回调
@property(nonatomic,copy,nullable)jobsByNSUIntegerBlock NSUIntegerBlock;/// 入参为NSUInteger，无返回值的回调
@property(nonatomic,copy,nullable)jobsByCGFloatBlock CGFloatBlock;/// 入参CGFloat，无返回值的回调
@property(nonatomic,copy,nullable)jobsByBOOLBlock BOOLBlock;/// 入参为BOOL，无返回值的回调
@property(nonatomic,copy,nullable)jobsByIntBlock IntBlock;/// 入参为Int，无返回值的回调
@property(nonatomic,copy,nullable)jobsByUnsignedIntBlock UnsignedIntBlock;/// 入参为UnsignedInt，无返回值的回调
@property(nonatomic,copy,nullable)jobsByFloatBlock FloatBlock;/// 入参为Float，无返回值的回调
@property(nonatomic,copy,nullable)jobsByDoubleBlock DoubleBlock;/// 入参为Double，无返回值的回调
@property(nonatomic,copy,nullable)jobsByCharBlock CharBlock;/// 入参为Char，无返回值的回调
@property(nonatomic,copy,nullable)jobsByUnsignedCharBlock UnsignedCharBlock;/// 入参为IUnsignedChar，无返回值的回调
@property(nonatomic,copy,nullable)jobsByShortBlock ShortBlock;/// 入参为Short，无返回值的回调
@property(nonatomic,copy,nullable)jobsByUnsignedShortBlock UnsignedShortBlock;/// 入参为UnsignedShort，无返回值的回调
@property(nonatomic,copy,nullable)jobsByLongBlock LongBlock;/// 入参为Long，无返回值的回调
@property(nonatomic,copy,nullable)jobsByUnsignedLongBlock UnsignedLongBlock;/// 入参为UnsignedLong，无返回值的回调
@property(nonatomic,copy,nullable)jobsByUnsignedLongLongBlock UnsignedLongLongBlock;/// 入参为IUnsignedLongLong，无返回值的回调
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

@property(nonatomic,copy,nullable)JobsSelectorBlock SelectorBlock;
-(void)actionSelectorBlock:(JobsSelectorBlock _Nullable)SelectorBlock;

@property(nonatomic,copy,nullable)JobsReturnIDByVoidBlock returnObjectByVoidBlock;/// 无入参，返回值为ID的回调
-(void)actionReturnIDByVoidBlock:(JobsReturnIDByVoidBlock _Nullable)returnObjectByVoidBlock;

@property(nonatomic,copy,nullable)JobsReturnIDByGestureRecognizerBlock returnObjectByGestureRecognizerBlock;/// 入参为UIGestureRecognizer，返回值为ID的回调
@property(nonatomic,copy,nullable)JobsReturnIDBySELBlock returnObjectBySELBlock;/// 入参为SEL，返回值为ID的回调
@property(nonatomic,copy,nullable)JobsReturnIDByStringBlock returnObjectByStringBlock;/// 入参为NSString，返回值为ID的回调
@property(nonatomic,copy,nullable)JobsReturnNSIntegerByIDBlock returnNSIntegerByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnNSUIntegerByIDBlock returnNSUIntegerByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnCGFloatByIDBlock returnCGFloatByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnBOOLByIDBlock returnBoolByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnIntByIDBlock returnIntByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnUnsignedIntByIDBlock returnUnsignedIntByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnFloatByIDBlock returnFloatByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnDoubleByIDBlock returnDoubleByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnCharByIDBlock returnCharByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnUnsignedCharByIDBlock returnUnsignedCharByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnShortByIDBlock returnShortByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnUnsignedShortByIDBlock returnUnsignedShortByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnLongByIDBlock returnLongByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnUnsignedLongByIDBlock returnUnsignedLongByIDBlock;
@property(nonatomic,copy,nullable)JobsReturnUnsignedLongLongByIDBlock returnUnsignedLongLongByIDBlock;
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

@property(nonatomic,copy,nullable)JobsReturnIDByIDBlock returnObjectBlock;/// 返回值为ID的回调
@property(nonatomic,copy,nullable)JobsReturnByNSIntegerBlock returnNSIntegerBlock;/// 返回值为NSInteger的回调
@property(nonatomic,copy,nullable)JobsReturnByNSUIntegerBlock returnNSUIntegerBlock;/// 返回值为UInteger的回调
@property(nonatomic,copy,nullable)JobsReturnByCGFloatBlock returnCGFloatBlock;/// 返回值为CGFloat的回调
@property(nonatomic,copy,nullable)JobsReturnByBOOLBlock returnBoolBlock;/// 返回值为BOOL的回调
@property(nonatomic,copy,nullable)JobsReturnBOOLByNSUIntegerBlock returnBoolByNSUIntegerBlock;/// 入参为NSUInteger，返回值为BOOL的回调
@property(nonatomic,copy,nullable)JobsReturnByIntBlock returnIntBlock;/// 返回值为Int的回调
@property(nonatomic,copy,nullable)JobsReturnByUnsignedIntBlock returnUnsignedIntBlock;/// 返回值为UnsignedInt的回调
@property(nonatomic,copy,nullable)JobsReturnByFloatBlock returnFloatBlock;/// 返回值为Float的回调
@property(nonatomic,copy,nullable)JobsReturnByDoubleBlock returnDoubleBlock;/// 返回值为Double的回调
@property(nonatomic,copy,nullable)JobsReturnByCharBlock returnCharBlock;/// 返回值为Char的回调
@property(nonatomic,copy,nullable)JobsReturnByUnsignedCharBlock returnUnsignedCharBlock;/// 返回值为UnsignedChar的回调
@property(nonatomic,copy,nullable)JobsReturnByShortBlock returnShortBlock;/// 返回值为Short的回调
@property(nonatomic,copy,nullable)JobsReturnByUnsignedShortBlock returnUnsignedShortBlock;/// 返回值为UnsignedShort的回调
@property(nonatomic,copy,nullable)JobsReturnByLongBlock returnLongBlock;/// 返回值为Long的回调
@property(nonatomic,copy,nullable)JobsReturnByUnsignedLongBlock returnUnsignedLongBlock;/// 返回值为UnsignedLong的回调
@property(nonatomic,copy,nullable)JobsReturnByUnsignedLongLongBlock returnUnsignedLongLongBlock;/// 返回值为UnsignedLongLong的回调
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

@property(nonatomic,copy,nullable)JobsReturnIDBySelectorBlock returnIDBySelectorBlock;
-(void)actionReturnIDBySelectorBlock:(JobsReturnIDBySelectorBlock _Nullable)returnIDBySelectorBlock;

@end

NS_ASSUME_NONNULL_END
/// NSClassFromString
NS_INLINE BOOL KindOfClsFromStr(id _Nonnull data, NSString *_Nonnull ClsName) {
    return [data isKindOfClass:NSClassFromString(ClsName)];
}
/// UIButton
NS_INLINE BOOL KindOfBtnCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIButton");
}
/// BaseButton
NS_INLINE BOOL KindOfBaseButtonCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"BaseButton");
}
/// UIView
NS_INLINE BOOL KindOfViewCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIView");
}
/// NSString
NS_INLINE BOOL KindOfStrCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSString");
}
/// UIViewController
NS_INLINE BOOL KindOfVCCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIViewController");
}
/// NSData
NS_INLINE BOOL KindOfDataCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSData");
}
/// NSMutableArray
NS_INLINE BOOL KindOfMutArrCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSMutableArray");
}
/// NSArray
NS_INLINE BOOL KindOfArrCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSArray");
}
/// NSMutableDictionary
NS_INLINE BOOL KindOfMutDicCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSMutableDictionary");
}
/// NSDictionary
NS_INLINE BOOL KindOfDicCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSDictionary");
}
/// NSJSONSerialization
NS_INLINE BOOL KindOfJSONerializationCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSJSONSerialization");
}
/// NSMutableString
NS_INLINE BOOL KindOfMutStrCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSMutableString");
}
/// UIImage
NS_INLINE BOOL KindOfImageCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIImage");
}
/// UITabBarController
NS_INLINE BOOL KindOfTabBarCtrlCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UITabBarController");
}
/// UINavigationController
NS_INLINE BOOL KindOfNavCtrlCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UINavigationController");
}
/// UIScrollView
NS_INLINE BOOL KindOfScrollViewCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIScrollView");
}
/// NSNumber
NS_INLINE BOOL KindOfNumberCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSNumber");
}
/// NSSet
NS_INLINE BOOL KindOfSetCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSSet");
}
/// NSMutableSet
NS_INLINE BOOL KindOfMutSetCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSMutableSet");
}
/// UIViewModel
NS_INLINE BOOL KindOfViewModelCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIViewModel");
}
/// UIButtonModel
NS_INLINE BOOL KindOfButtonModelCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIButtonModel");
}
/// UILabel
NS_INLINE BOOL KindOfLabCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UILabel");
}
/// UICollectionViewCell
NS_INLINE BOOL KindOfCollectionViewCellCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UICollectionViewCell");
}
/// UITableViewCell
NS_INLINE BOOL KindOfTableViewCellCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UITableViewCell");
}
/// UITableView
NS_INLINE BOOL KindOfTableViewCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UITableView");
}
/// UICollectionView
NS_INLINE BOOL KindOfCollectionViewCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UICollectionView");
}
/// NSError
NS_INLINE BOOL KindOfErrorCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"NSError");
}
/// PHAsset
NS_INLINE BOOL KindOfPHAssetCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"PHAsset");
}
/// UITextField
NS_INLINE BOOL KindOfTextFieldCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UITextField");
}
/// LZTabBarItem
NS_INLINE BOOL KindOfLZTabBarItemCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"LZTabBarItem");
}
/// UIControl
NS_INLINE BOOL KindOfCtrlCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UIControl");
}
/// UITextItem
NS_INLINE BOOL KindOfTextItemCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"UITextItem");
}
/// YTKAnimatingRequestAccessory
NS_INLINE BOOL KindOfYTKAnimatingRequestAccessoryCls(id _Nonnull data) {
    return KindOfClsFromStr(data, @"YTKAnimatingRequestAccessory");
}
