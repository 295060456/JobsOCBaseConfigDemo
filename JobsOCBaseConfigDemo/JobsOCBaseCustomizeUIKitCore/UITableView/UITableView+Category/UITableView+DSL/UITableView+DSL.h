//
//  UITableView+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (DSL)

-(JobsReturnTableViewByDataSourceBlock _Nonnull)byDataSource;
-(JobsReturnTableViewByDelegateBlock _Nonnull)byDelegate;
-(JobsReturnTableViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource;
-(JobsReturnTableViewByBOOLBlock _Nonnull)byPrefetchingEnabled;
-(JobsReturnTableViewByDragDelegateBlock _Nonnull)byDragDelegate;
-(JobsReturnTableViewByDropDelegateBlock _Nonnull)byDropDelegate;
#pragma mark - Heights & Estimations
-(JobsReturnTableViewByCGFloatBlock _Nonnull)byRowHeight;
-(JobsReturnTableViewByCGFloatBlock _Nonnull)bySectionHeaderHeight;
-(JobsReturnTableViewByCGFloatBlock _Nonnull)bySectionFooterHeight;
-(JobsReturnTableViewByCGFloatBlock _Nonnull)byEstimatedRowHeight;
-(JobsReturnTableViewByCGFloatBlock _Nonnull)byEstimatedSectionHeaderHeight;
-(JobsReturnTableViewByCGFloatBlock _Nonnull)byEstimatedSectionFooterHeight;
-(JobsReturnTableViewByCGFloatBlock _Nonnull)byFillerRowHeight;
-(JobsReturnTableViewByCGFloatBlock _Nonnull)bySectionHeaderTopPadding;
#pragma mark - Separators & Insets
-(JobsReturnTableViewByEdgeInsetsBlock _Nonnull)bySeparatorInset;
-(JobsReturnTableViewByNSIntegerBlock _Nonnull)bySeparatorInsetReference;
-(JobsReturnTableViewByNSIntegerBlock _Nonnull)bySeparatorStyle;
-(JobsReturnTableViewByCorBlock _Nonnull)bySeparatorColor;
-(JobsReturnTableViewByVisualEffectBlock _Nonnull)bySeparatorEffect;
#pragma mark —— Self-Sizing invalidation
-(JobsReturnTableViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation API_AVAILABLE(ios(16.0), tvos(16.0)) API_UNAVAILABLE(watchos);
#pragma mark —— Background
-(JobsReturnTableViewByViewBlock _Nonnull)byBackgroundView;
#pragma mark —— Appearance / Index
-(JobsReturnTableViewByNSIntegerBlock _Nonnull)bySectionIndexMinimumDisplayRowCount;
-(JobsReturnTableViewByCorBlock _Nonnull)bySectionIndexColor;
-(JobsReturnTableViewByCorBlock _Nonnull)bySectionIndexBackgroundColor;
-(JobsReturnTableViewByCorBlock _Nonnull)bySectionIndexTrackingBackgroundColor;
#pragma mark —— Layout behavior
-(JobsReturnTableViewByBOOLBlock _Nonnull)byCellLayoutMarginsFollowReadableWidth;
-(JobsReturnTableViewByBOOLBlock _Nonnull)byInsetsContentViewsToSafeArea;
#pragma mark —— Header / Footer views
-(JobsReturnTableViewByViewBlock _Nonnull)byTableHeaderView;
-(JobsReturnTableViewByViewBlock _Nonnull)byTableFooterView;
#pragma mark —— Editing / Selection
-(JobsReturnTableViewByBOOLBlock _Nonnull)byEditing;
-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsSelection;
-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing;
-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelection;
-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing;
#pragma mark —— Focus
-(JobsReturnTableViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath;
-(JobsReturnTableViewByBOOLBlock _Nonnull)bySelectionFollowsFocus;
-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsFocus;
-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing;
#pragma mark —— Drag & Drop
-(JobsReturnTableViewByBOOLBlock _Nonnull)byDragInteractionEnabled;
#pragma mark —— Content Hugging Elements (iOS 18+)
-(JobsReturnTableViewByNSIntegerBlock _Nonnull)byContentHuggingElements API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos);

@end

NS_ASSUME_NONNULL_END
