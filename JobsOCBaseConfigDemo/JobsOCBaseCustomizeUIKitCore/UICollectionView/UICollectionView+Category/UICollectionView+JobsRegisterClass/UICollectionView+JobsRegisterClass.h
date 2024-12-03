//
//  UICollectionView+JobsRegisterClass.h
//  UBallLive
//
//  Created by Jobs on 2020/10/31.
//

#import <UIKit/UIKit.h>

#import "JobsHeaderFooterView.h"

#import "JobsBaseCollectionViewCell.h"
#import "BaseCollectionViewCell.h"
#import "JobsSearchDataCVCell.h"
#import "JobsHotLabelByMultiLineCVCell.h"
#import "JobsBtnStyleCVCell.h"
#import "JobsTextFieldStyleCVCell.h"
#import "JobsImageViewStyleCVCell.h"
#import "BaiShaETProjVIPSubCVFooterView.h"
#import "BaiShaETProjOrderDetailsCVCell.h"

#import "BaiShaETProjVIPSubCVCell_01.h"
#import "BaiShaETProjVIPSubCVCell_02.h"
#import "BaiShaETProjVIPSubCVCell_03.h"
#import "BaiShaETProjVIPSubCVCell_04.h"
#import "BaiShaETProjVIPSubCVCell_05.h"

#import "BaiShaETProjBankAccMgmtCVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (JobsRegisterClass)
#pragma mark —— 注册 CollectionReusableView-Header、CollectionReusableView—Footer、CollectionViewCell
/// 注册的时候不开辟内存，只有当用字符串进行取值的时候才开辟内存
-(jobsByVoidBlock _Nonnull)registerCollectionViewClass;
#pragma mark —— 注册 UICollectionViewCell 及其子类
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionViewCellClass;
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionViewCellClass_;
#pragma mark —— 注册 UICollectionElementKindSectionHeader 及其子类
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionHeaderClass;
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionHeaderClass_;
#pragma mark —— 注册 UICollectionElementKindSectionFooter 及其子类
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionFooterClass;
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionFooterClass_;
#pragma mark —— 依据字符串取值
/// 依据字符串取UICollectionElementKindSectionHeader
-(__kindof UICollectionReusableView *)UICollectionElementKindSectionHeaderClass:(Class)cls
                                                                   forIndexPath:(NSIndexPath *)indexPath;
/// 依据字符串取UICollectionElementKindSectionFooter
-(__kindof UICollectionReusableView *)UICollectionElementKindSectionFooterClass:(Class)cls
                                                                   forIndexPath:(NSIndexPath *)indexPath;
/// 一种用字符串取UICollectionViewCell及其子类的方法❤️复用字符串是目标类的类名❤️
-(__kindof UICollectionViewCell *)collectionViewCellClass:(Class)cls
                                             forIndexPath:(NSIndexPath *)indexPath;
#pragma mark ——
/// 先用UICollectionViewLayout生成CollectionView。frame后面设置
+(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;

@end

NS_ASSUME_NONNULL_END
