//
//  BaseCollectionViewProtocol.h
//  FMNormal
//
//  Created by Jobs on 2025/5/19.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseCollectionViewProtocol <NSObject>
@optional
#pragma mark —— RegistrationTracking
Prop_strong()NSMutableSet <NSString *>*registeredIdentifiers;/// 自定义标志位
// 检查某个 reuseIdentifier 是否已注册
-(JobsReturnBOOLByStringBlock _Nonnull)isRegisteredForReuseIdentifier;
#pragma mark —— Func
+(JobsReturnCollectionViewByLayoutBlock _Nonnull)initByLayout;
/// 对系统方法 cellForItemAtIndexPath 的二次封装
-(JobsReturnCollectionViewCellByIndexPathBlock _Nonnull)cellBy;
-(JobsReturnScrollViewByIDBlock _Nonnull)dataLink;
-(JobsReturnCollectionViewByDelegateBlock _Nonnull)byDelegate;
-(JobsReturnCollectionViewByDataSourceBlock _Nonnull)byDataSource;
-(JobsReturnCollectionViewByDragDelegateBlock _Nonnull)byDragDelegate;
-(JobsReturnCollectionViewByDropDelegateBlock _Nonnull)byDropDelegate;
-(JobsReturnCollectionViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource;
-(UICollectionViewCell *)didSelectItemAtIndexPath:(NSIndexPath *)indexPath
                          collectionViewCellClass:(Class _Nullable)collectionViewCellClass;
-(UICollectionViewCell *)didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
                            collectionViewCellClass:(Class _Nullable)collectionViewCellClass;
#pragma mark —— JobsRegisterClass
/// 注册 CollectionReusableView-Header、CollectionReusableView—Footer、CollectionViewCell
/// 注册的时候不开辟内存，只有当用字符串进行取值的时候才开辟内存
-(jobsByVoidBlock _Nonnull)registerCollectionViewClass;
/// 注册 UICollectionViewCell 及其子类
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionViewCellClass;
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionViewCellClass_;
/// 注册 UICollectionElementKindSectionHeader 及其子类
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionHeaderClass;
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionHeaderClass_;
/// 注册 UICollectionElementKindSectionFooter 及其子类
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionFooterClass;
-(jobsByClassAndSaltStrBlock _Nonnull)registerCollectionElementKindSectionFooterClass_;
/// 依据字符串取值
/// 依据字符串取UICollectionElementKindSectionHeader
-(__kindof UICollectionReusableView *)UICollectionElementKindSectionHeaderClass:(Class)cls
                                                                   forIndexPath:(NSIndexPath *)indexPath;
/// 依据字符串取UICollectionElementKindSectionFooter
-(__kindof UICollectionReusableView *)UICollectionElementKindSectionFooterClass:(Class)cls
                                                                   forIndexPath:(NSIndexPath *)indexPath;
/// 一种用字符串取UICollectionViewCell及其子类的方法❤️复用字符串是目标类的类名❤️
-(__kindof UICollectionViewCell *)collectionViewCellClass:(Class)cls
                                             forIndexPath:(NSIndexPath *)indexPath;
/// 其他
/// 先用UICollectionViewLayout生成CollectionView。frame后面设置
+(instancetype)initWithCollectionViewLayout:(__kindof UICollectionViewLayout *)layout;

@end

NS_ASSUME_NONNULL_END
