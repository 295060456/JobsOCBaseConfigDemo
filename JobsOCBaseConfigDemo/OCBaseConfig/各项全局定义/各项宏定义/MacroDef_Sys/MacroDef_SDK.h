//
//  MacroDef_SDK.h
//  FM
//
//  Created by Admin on 28/12/2024.
//

#ifndef MacroDef_SDK_h
#define MacroDef_SDK_h
/// 对三目运算符的封装
NS_INLINE id _Nullable Jobs3TO(id _Nullable Obj1, id _Nonnull Obj2) {
    /// 三目运算符（Ternary Operator）之所以被称为 "三目" 运算符，是因为它涉及三个操作数。它是唯一一个需要三个操作数的运算符。
    return Obj1 ? : Obj2;
}

NS_INLINE CGFloat jobs3TO(CGFloat Obj1, CGFloat Obj2) {
    /// 三目运算符（Ternary Operator）之所以被称为 "三目" 运算符，是因为它涉及三个操作数。它是唯一一个需要三个操作数的运算符。
    return Obj1 ? : Obj2;
}

NS_INLINE CGSize jobs3TOSize(CGSize Obj1, CGSize Obj2) {
    /// 三目运算符（Ternary Operator）之所以被称为 "三目" 运算符，是因为它涉及三个操作数。它是唯一一个需要三个操作数的运算符。
    return CGSizeEqualToSize(CGSizeZero, Obj1) ? Obj2 : Obj1;
}
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


#endif /* MacroDef_SDK_h */
