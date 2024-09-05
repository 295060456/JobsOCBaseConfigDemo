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
-(void)actionVoidBlock:(jobsByVoidBlock)voidBlock;

@property(nonatomic,assign)jobsByIDBlock objectBlock;/// 入参为ID类型，无返回值的回调
@property(nonatomic,assign)jobsByGestureRecognizerBlock gestureRecognizerBlock;/// 入参为UIGestureRecognizer，无返回值的回调
@property(nonatomic,assign)jobsBySELBlock selBlock;///入参为SEL，无返回值的回调
@property(nonatomic,assign)jobsByStringBlock stringBlock;///入参为NSString，无返回值的回调
-(void)actionObjectBlock:(jobsByIDBlock)objectBlock;
-(void)actionGestureRecognizerBlock:(jobsByGestureRecognizerBlock)gestureRecognizerBlock;
-(void)actionSELBlock:(jobsBySELBlock)selBlock;
-(void)actionStringBlock:(jobsByStringBlock)stringBlock;

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
-(void)actionNSIntegerBlock:(jobsByNSIntegerBlock)NSIntegerBlock;
-(void)actionNSUIntegerBlock:(jobsByNSUIntegerBlock)NSUIntegerBlock;
-(void)actionCGFloatBlock:(jobsByCGFloatBlock)CGFloatBlock;
-(void)actionBOOLBlock:(jobsByBOOLBlock)BOOLBlock;
-(void)actionIntBlock:(jobsByIntBlock)IntBlock;
-(void)actionUnsignedIntBlock:(jobsByUnsignedIntBlock)UnsignedIntBlock;
-(void)actionFloatBlock:(jobsByFloatBlock)FloatBlock;
-(void)actionDoubleBlock:(jobsByDoubleBlock)DoubleBlock;
-(void)actionCharBlock:(jobsByCharBlock)CharBlock;
-(void)actionUnsignedCharBlock:(jobsByUnsignedCharBlock)UnsignedCharBlock;
-(void)actionShortBlock:(jobsByShortBlock)ShortBlock;
-(void)actionUnsignedShortBlock:(jobsByUnsignedShortBlock)UnsignedShortBlock;
-(void)actionLongBlock:(jobsByLongBlock)LongBlock;
-(void)actionUnsignedLongBlock:(jobsByUnsignedLongBlock)UnsignedLongBlock;
-(void)actionUnsignedLongLongBlock:(jobsByUnsignedLongLongBlock)UnsignedLongLongBlock;

@property(nonatomic,assign)JobsSelectorBlock SelectorBlock;
-(void)actionSelectorBlock:(JobsSelectorBlock)SelectorBlock;

@property(nonatomic,assign)JobsReturnIDByVoidBlock returnObjectByVoidBlock;/// 无入参，返回值为ID的回调
-(void)actionReturnIDByVoidBlock:(JobsReturnIDByVoidBlock)returnObjectByVoidBlock;

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
-(void)actionReturnIDByGestureRecognizerBlock:(JobsReturnIDByGestureRecognizerBlock)returnObjectByGestureRecognizerBlock;
-(void)actionReturnIDBySELBlock:(JobsReturnIDBySELBlock)returnObjectBySELBlock;
-(void)actionReturnIDByStringBlock:(JobsReturnIDByStringBlock)returnObjectByStringBlock;
-(void)actionReturnNSIntegerByIDBlock:(JobsReturnNSIntegerByIDBlock)returnNSIntegerByIDBlock;
-(void)actionReturnNSUIntegerByIDBlock:(JobsReturnNSUIntegerByIDBlock)returnNSUIntegerByIDBlock;
-(void)actionReturnCGFloatByIDBlock:(JobsReturnCGFloatByIDBlock)returnCGFloatByIDBlock;
-(void)actionReturnBoolByIDBlock:(JobsReturnBOOLByIDBlock)returnBoolByIDBlock;
-(void)actionReturnIntByIDBlock:(JobsReturnIntByIDBlock)returnIntByIDBlock;
-(void)actionReturnUnsignedIntByIDBlock:(JobsReturnUnsignedIntByIDBlock)returnUnsignedIntByIDBlock;
-(void)actionReturnFloatByIDBlock:(JobsReturnFloatByIDBlock)returnFloatByIDBlock;
-(void)actionReturnDoubleByIDBlock:(JobsReturnDoubleByIDBlock)returnDoubleByIDBlock;
-(void)actionReturnCharByIDBlock:(JobsReturnCharByIDBlock)returnCharByIDBlock;
-(void)actionReturnUnsignedCharByIDBlock:(JobsReturnUnsignedCharByIDBlock)returnUnsignedCharByIDBlock;
-(void)actionReturnShortByIDBlock:(JobsReturnShortByIDBlock)returnShortByIDBlock;
-(void)actionReturnUnsignedShortByIDBlock:(JobsReturnUnsignedShortByIDBlock)returnUnsignedShortByIDBlock;
-(void)actionReturnLongByIDBlock:(JobsReturnLongByIDBlock)returnLongByIDBlock;
-(void)actionReturnUnsignedLongByIDBlock:(JobsReturnUnsignedLongByIDBlock)returnUnsignedLongByIDBlock;
-(void)actionReturnUnsignedLongLongByIDBlock:(JobsReturnUnsignedLongLongByIDBlock)returnUnsignedLongLongByIDBlock;

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
-(void)actionReturnObjectBlock:(JobsReturnIDByIDBlock)returnObjectBlock;
-(void)actionReturnNSIntegerBlock:(JobsReturnByNSIntegerBlock)returnNSIntegerBlock;
-(void)actionReturnNSUIntegerBlock:(JobsReturnByNSUIntegerBlock)returnNSUIntegerBlock;
-(void)actionReturnCGFloatBlock:(JobsReturnByCGFloatBlock)returnCGFloatBlock;
-(void)actionReturnBOOLBlock:(JobsReturnByBOOLBlock)returnBoolBlock;
-(void)actionReturnBoolByNSUIntegerBlock:(JobsReturnBOOLByNSUIntegerBlock)returnBoolByNSUIntegerBlock;
-(void)actionReturnIntBlock:(JobsReturnByIntBlock)returnIntBlock;
-(void)actionReturnUnsignedIntBlock:(JobsReturnByUnsignedIntBlock)returnUnsignedIntBlock;
-(void)actionReturnFloatBlock:(JobsReturnByFloatBlock)returnFloatBlock;
-(void)actionReturnDoubleBlock:(JobsReturnByDoubleBlock)returnDoubleBlock;
-(void)actionReturnCharBlock:(JobsReturnByCharBlock)returnCharBlock;
-(void)actionReturnUnsignedCharBlock:(JobsReturnByUnsignedCharBlock)returnUnsignedCharBlock;
-(void)actionReturnShortBlock:(JobsReturnByShortBlock)returnShortBlock;
-(void)actionReturnUnsignedShortBlock:(JobsReturnByUnsignedShortBlock)returnUnsignedShortBlock;
-(void)actionReturnLongBlock:(JobsReturnByLongBlock)returnLongBlock;
-(void)actionReturnUnsignedLongBlock:(JobsReturnByUnsignedLongBlock)returnUnsignedLongBlock;
-(void)actionReturnUnsignedLongLongBlock:(JobsReturnByUnsignedLongLongBlock)returnUnsignedLongLongBlock;

@property(nonatomic,assign)JobsReturnIDBySelectorBlock returnIDBySelectorBlock;
-(void)actionReturnIDBySelectorBlock:(JobsReturnIDBySelectorBlock)returnIDBySelectorBlock;

@end

NS_ASSUME_NONNULL_END
// UIButton
static inline BOOL KindOfBtnCls(id _Nonnull data) {
    return [data isKindOfClass:UIButton.class];
}
// BaseButton
static inline BOOL KindOfBaseButtonCls(id _Nonnull data) {
    return [data isKindOfClass:BaseButton.class];
}
// UIView
static inline BOOL KindOfViewCls(id _Nonnull data) {
    return [data isKindOfClass:UIView.class];
}
// NSString
static inline BOOL KindOfStrCls(id _Nonnull data) {
    return [data isKindOfClass:NSString.class];
}
// UIViewController
static inline BOOL KindOfVCCls(id _Nonnull data) {
    return [data isKindOfClass:UIViewController.class];
}
// NSData
static inline BOOL KindOfDataCls(id _Nonnull data) {
    return [data isKindOfClass:NSData.class];
}
// NSMutableArray
static inline BOOL KindOfMutArrCls(id _Nonnull data) {
    return [data isKindOfClass:NSMutableArray.class];
}
// NSArray
static inline BOOL KindOfArrCls(id _Nonnull data) {
    return [data isKindOfClass:NSArray.class];
}
// NSMutableDictionary
static inline BOOL KindOfMutDicCls(id _Nonnull data) {
    return [data isKindOfClass:NSMutableDictionary.class];
}
// NSDictionary
static inline BOOL KindOfDicCls(id _Nonnull data) {
    return [data isKindOfClass:NSDictionary.class];
}
// NSJSONSerialization
static inline BOOL KindOfJSONerializationCls(id _Nonnull data) {
    return [data isKindOfClass:NSJSONSerialization.class];
}
// NSMutableString
static inline BOOL KindOfMutStrCls(id _Nonnull data) {
    return [data isKindOfClass:NSMutableString.class];
}
// UIImage
static inline BOOL KindOfImageCls(id _Nonnull data) {
    return [data isKindOfClass:UIImage.class];
}
// UITabBarController
static inline BOOL KindOfTabBarCtrlCls(id _Nonnull data) {
    return [data isKindOfClass:UITabBarController.class];
}
// UINavigationController
static inline BOOL KindOfNavCtrlCls(id _Nonnull data) {
    return [data isKindOfClass:UINavigationController.class];
}
// UIScrollView
static inline BOOL KindOfScrollViewCls(id _Nonnull data) {
    return [data isKindOfClass:UIScrollView.class];
}
// NSNumber
static inline BOOL KindOfNumberCls(id _Nonnull data) {
    return [data isKindOfClass:NSNumber.class];
}
// NSSet
static inline BOOL KindOfSetCls(id _Nonnull data) {
    return [data isKindOfClass:NSSet.class];
}
// NSMutableSet
static inline BOOL KindOfMutSetCls(id _Nonnull data) {
    return [data isKindOfClass:NSMutableSet.class];
}
// UIViewModel
static inline BOOL KindOfViewModelCls(id _Nonnull data) {
    return [data isKindOfClass:UIViewModel.class];
}
// UIButtonModel
static inline BOOL KindOfButtonModelCls(id _Nonnull data) {
    return [data isKindOfClass:UIButtonModel.class];
}
// UILabel
static inline BOOL KindOfLabCls(id _Nonnull data) {
    return [data isKindOfClass:UILabel.class];
}
// UICollectionViewCell
static inline BOOL KindOfCollectionViewCellCls(id _Nonnull data) {
    return [data isKindOfClass:UICollectionViewCell.class];
}
// UITableViewCell
static inline BOOL KindOfTableViewCellCls(id _Nonnull data) {
    return [data isKindOfClass:UITableViewCell.class];
}
// UITableView
static inline BOOL KindOfTableViewCls(id _Nonnull data) {
    return [data isKindOfClass:UITableView.class];
}
// UICollectionView
static inline BOOL KindOfCollectionViewCls(id _Nonnull data) {
    return [data isKindOfClass:UICollectionView.class];
}
// NSError
static inline BOOL KindOfErrorCls(id _Nonnull data) {
    return [data isKindOfClass:NSError.class];
}
// PHAsset
static inline BOOL KindOfPHAssetCls(id _Nonnull data) {
    return [data isKindOfClass:PHAsset.class];
}
// UITextField
static inline BOOL KindOfTextFieldCls(id _Nonnull data) {
    return [data isKindOfClass:UITextField.class];
}
#import "LZTabBarItem.h"
static inline BOOL KindOfLZTabBarItemCls(id _Nonnull data) {
    return [data isKindOfClass:LZTabBarItem.class];
}
// UIControl
static inline BOOL KindOfCtrlCls(id _Nonnull data) {
    return [data isKindOfClass:UIControl.class];
}
// UITextItem
static inline BOOL KindOfTextItemCls(id _Nonnull data) {
    return [data isKindOfClass:UITextItem.class];
}
#import "YTKAnimatingRequestAccessory.h"
static inline BOOL KindOfYTKAnimatingRequestAccessoryCls(id _Nonnull data) {
    return [data isKindOfClass:YTKAnimatingRequestAccessory.class];
}
// NSClassFromString
static inline BOOL KindOfClsFromStr(id _Nonnull data, NSString *_Nonnull ClsName) {
    return [data isKindOfClass:NSClassFromString(ClsName)];
}
