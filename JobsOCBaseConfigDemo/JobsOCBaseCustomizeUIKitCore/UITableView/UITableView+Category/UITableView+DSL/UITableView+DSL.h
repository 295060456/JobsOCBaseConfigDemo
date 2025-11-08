//
//  UITableView+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (DSL)

-(JobsRetTableViewByDataSourceBlock _Nonnull)byDataSource;
-(JobsRetTableViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetTableViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource;
-(JobsRetTableViewByBOOLBlock _Nonnull)byPrefetchingEnabled;
-(JobsRetTableViewByDragDelegateBlock _Nonnull)byDragDelegate;
-(JobsRetTableViewByDropDelegateBlock _Nonnull)byDropDelegate;
#pragma mark - Heights & Estimations
-(JobsRetTableViewByCGFloatBlock _Nonnull)byRowHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionHeaderHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionFooterHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedRowHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedSectionHeaderHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedSectionFooterHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)byFillerRowHeight;
-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionHeaderTopPadding;
#pragma mark - Separators & Insets
-(JobsRetTableViewByEdgeInsetsBlock _Nonnull)bySeparatorInset;
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySeparatorInsetReference;
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySeparatorStyle;
-(JobsRetTableViewByCorBlock _Nonnull)bySeparatorColor;
-(JobsRetTableViewByVisualEffectBlock _Nonnull)bySeparatorEffect;
#pragma mark —— Self-Sizing invalidation
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation API_AVAILABLE(ios(16.0), tvos(16.0)) API_UNAVAILABLE(watchos);
#pragma mark —— Background
-(JobsRetTableViewByViewBlock _Nonnull)byBackgroundView;
#pragma mark —— Appearance / Index
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySectionIndexMinimumDisplayRowCount;
-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexColor;
-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexBackgroundColor;
-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexTrackingBackgroundColor;
#pragma mark —— Layout behavior
-(JobsRetTableViewByBOOLBlock _Nonnull)byCellLayoutMarginsFollowReadableWidth;
-(JobsRetTableViewByBOOLBlock _Nonnull)byInsetsContentViewsToSafeArea;
#pragma mark —— Header / Footer views
-(JobsRetTableViewByViewBlock _Nonnull)byTableHeaderView;
-(JobsRetTableViewByViewBlock _Nonnull)byTableFooterView;
#pragma mark —— Editing / Selection
-(JobsRetTableViewByBOOLBlock _Nonnull)byEditing;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsSelection;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelection;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing;
#pragma mark —— Focus
-(JobsRetTableViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath;
-(JobsRetTableViewByBOOLBlock _Nonnull)bySelectionFollowsFocus;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsFocus;
-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing;
#pragma mark —— Drag & Drop
-(JobsRetTableViewByBOOLBlock _Nonnull)byDragInteractionEnabled;
#pragma mark —— Content Hugging Elements (iOS 18+)
-(JobsRetTableViewByNSIntegerBlock _Nonnull)byContentHuggingElements API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos);

@end

NS_ASSUME_NONNULL_END
