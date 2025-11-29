//
//  UICollectionViewDSLProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UICollectionViewDSLProtocol <NSObject>
@optional
/// 核心属性
-(JobsRetCollectionViewByLayoutBlock _Nonnull)byCollectionViewLayout;
-(JobsRetCollectionViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetCollectionViewByDataSourceBlock _Nonnull)byDataSource;
-(JobsRetCollectionViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byPrefetchingEnabled;
-(JobsRetCollectionViewByDragDelegateBlock _Nonnull)byDragDelegate;
-(JobsRetCollectionViewByDropDelegateBlock _Nonnull)byDropDelegate;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byDragInteractionEnabled;
-(JobsRetCollectionViewByNSIntegerBlock _Nonnull)byReorderingCadence;
-(JobsRetCollectionViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation;
-(JobsRetCollectionViewByViewBlock _Nonnull)byBackgroundView;
/// 选择 / 编辑
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelection;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelection;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byEditing;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing;
/// Focus 相关
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)bySelectionFollowsFocus;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocus;
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing;

@end

NS_ASSUME_NONNULL_END
