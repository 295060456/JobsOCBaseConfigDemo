//
//  UICollectionView+Func.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/24.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "UICollectionViewCell+BaseViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (Func)

+(JobsReturnCollectionViewByLayoutBlock _Nonnull)initByLayout;
/// 对系统方法 cellForItemAtIndexPath 的二次封装
-(JobsReturnCollectionViewCellByIndexPathBlock _Nonnull)cellBy;
-(jobsByIDBlock _Nonnull)dataLink;
-(JobsReturnCollectionViewByDelegateBlock _Nonnull)byDelegate;
-(JobsReturnCollectionViewByDataSourceBlock _Nonnull)byDataSource;
-(JobsReturnCollectionViewByDragDelegateBlock _Nonnull)byDragDelegate;
-(JobsReturnCollectionViewByDropDelegateBlock _Nonnull)byDropDelegate;
-(JobsReturnCollectionViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource;
-(UICollectionViewCell *)didSelectItemAtIndexPath:(NSIndexPath *)indexPath
                          collectionViewCellClass:(Class _Nullable)collectionViewCellClass;
-(UICollectionViewCell *)didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
                            collectionViewCellClass:(Class _Nullable)collectionViewCellClass;

@end

NS_ASSUME_NONNULL_END
