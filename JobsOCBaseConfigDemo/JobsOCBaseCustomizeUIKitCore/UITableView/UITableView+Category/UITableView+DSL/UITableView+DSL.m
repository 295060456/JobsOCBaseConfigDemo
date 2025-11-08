//
//  UITableView+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import "UITableView+DSL.h"

@implementation UITableView (DSL)

-(JobsRetTableViewByDataSourceBlock _Nonnull)byDataSource {
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDataSource> _Nullable ds) {
        @jobs_strongify(self) 
        self.dataSource = ds;
        return self;
    };
}

-(JobsRetTableViewByDelegateBlock _Nonnull)byDelegate {
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDelegate> _Nullable dg) {
        @jobs_strongify(self) 
        self.delegate = dg;
        return self;
    };
}

-(JobsRetTableViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource {
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDataSourcePrefetching> _Nullable pds) {
        @jobs_strongify(self) 
        if (@available(iOS 10.0, *)) {
            self.prefetchDataSource = pds;
        }return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byPrefetchingEnabled {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL enabled) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.prefetchingEnabled = enabled;
        }return self;
    };
}

-(JobsRetTableViewByDragDelegateBlock _Nonnull)byDragDelegate {
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDragDelegate> _Nullable dd) {
        @jobs_strongify(self) 
        if (@available(iOS 11.0, *)) {
            self.dragDelegate = dd;
        }return self;
    };
}

-(JobsRetTableViewByDropDelegateBlock _Nonnull)byDropDelegate {
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDropDelegate> _Nullable dp) {
        @jobs_strongify(self) 
        if (@available(iOS 11.0, *)) {
            self.dropDelegate = dp;
        }return self;
    };
}
#pragma mark - Heights & Estimations
-(JobsRetTableViewByCGFloatBlock _Nonnull)byRowHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        self.rowHeight = v;
        return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionHeaderHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        self.sectionHeaderHeight = v;
        return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionFooterHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        self.sectionFooterHeight = v;
        return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedRowHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)) {
            self.estimatedRowHeight = v;
        }return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedSectionHeaderHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)) {
            self.estimatedSectionHeaderHeight = v;
        }return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)byEstimatedSectionFooterHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)) {
            self.estimatedSectionFooterHeight = v;
        }return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)byFillerRowHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.fillerRowHeight = v;
        }return self;
    };
}

-(JobsRetTableViewByCGFloatBlock _Nonnull)bySectionHeaderTopPadding {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.sectionHeaderTopPadding = v;
        }return self;
    };
}
#pragma mark - Separators & Insets
-(JobsRetTableViewByEdgeInsetsBlock _Nonnull)bySeparatorInset {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIEdgeInsets insets) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)) {
            self.separatorInset = insets;
        }return self;
    };
}

-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySeparatorInsetReference {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewSeparatorInsetReference ref) {
        @jobs_strongify(self) 
        if (@available(iOS 11.0, tvOS 11.0, *)) {
            self.separatorInsetReference = ref;
        }return self;
    };
}

-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySeparatorStyle {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewCellSeparatorStyle style) {
        @jobs_strongify(self) 
        self.separatorStyle = style; // tvOS 已在 .h 层标注不可用
        return self;
    };
}

-(JobsRetTableViewByCorBlock _Nonnull)bySeparatorColor {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color) {
        @jobs_strongify(self) 
        self.separatorColor = color; // tvOS 已在 .h 层标注不可用
        return self;
    };
}

-(JobsRetTableViewByVisualEffectBlock _Nonnull)bySeparatorEffect {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIVisualEffect * _Nullable effect) {
        @jobs_strongify(self) 
        if (@available(iOS 8.0, *)) {
            self.separatorEffect = effect; // tvOS 不可用，.h 已标注
        }return self;
    };
}
#pragma mark —— Self-Sizing invalidation
- (JobsRetTableViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation API_AVAILABLE(ios(16.0), tvos(16.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewSelfSizingInvalidation v) {
        @jobs_strongify(self)
        self.selfSizingInvalidation = v;
        return self;
    };
}
#pragma mark —— Background
-(JobsRetTableViewByViewBlock _Nonnull)byBackgroundView {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIView * _Nullable v) {
        @jobs_strongify(self) 
        if (@available(iOS 3.2, *)) {
            self.backgroundView = v;
        }return self;
    };
}
#pragma mark —— Appearance / Index
-(JobsRetTableViewByNSIntegerBlock _Nonnull)bySectionIndexMinimumDisplayRowCount {
    @jobs_weakify(self)
    return ^__kindof UITableView * (NSInteger v) {
        @jobs_strongify(self) 
        self.sectionIndexMinimumDisplayRowCount = v;
        return self;
    };
}

-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexColor {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color) {
        @jobs_strongify(self) 
        if (@available(iOS 6.0, *)) {
            self.sectionIndexColor = color;
        }return self;
    };
}

-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexBackgroundColor {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)) {
            self.sectionIndexBackgroundColor = color;
        }return self;
    };
}

-(JobsRetTableViewByCorBlock _Nonnull)bySectionIndexTrackingBackgroundColor {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color) {
        @jobs_strongify(self) 
        if (@available(iOS 6.0, *)) {
            self.sectionIndexTrackingBackgroundColor = color;
        }return self;
    };
}
#pragma mark —— Layout behavior
-(JobsRetTableViewByBOOLBlock _Nonnull)byCellLayoutMarginsFollowReadableWidth {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 9.0, *)) {
            self.cellLayoutMarginsFollowReadableWidth = on;
        }return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byInsetsContentViewsToSafeArea {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 11.0, tvOS 11.0, *)) {
            self.insetsContentViewsToSafeArea = on;
        }return self;
    };
}
#pragma mark —— Header / Footer views
-(JobsRetTableViewByViewBlock _Nonnull)byTableHeaderView {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIView * _Nullable v) {
        @jobs_strongify(self) 
        self.tableHeaderView = v;
        return self;
    };
}

-(JobsRetTableViewByViewBlock _Nonnull)byTableFooterView {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIView * _Nullable v) {
        @jobs_strongify(self) 
        self.tableFooterView = v;
        return self;
    };
}
#pragma mark —— Editing / Selection
-(JobsRetTableViewByBOOLBlock _Nonnull)byEditing {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL editing) {
        @jobs_strongify(self) 
        self.editing = editing;
        return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsSelection {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 3.0, *)) {
            self.allowsSelection = on;
        }return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        self.allowsSelectionDuringEditing = on;
        return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelection {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 5.0, *)) {
            self.allowsMultipleSelection = on;
        }return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 5.0, *)) {
            self.allowsMultipleSelectionDuringEditing = on;
        }return self;
    };
}
#pragma mark —— Focus
-(JobsRetTableViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 9.0, *)) {
            self.remembersLastFocusedIndexPath = on;
        }return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)bySelectionFollowsFocus {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 14.0, *)) {
            self.selectionFollowsFocus = on; // watchOS/tvOS 限制已在 .h 标
        }return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsFocus {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.allowsFocus = on;
        }return self;
    };
}

-(JobsRetTableViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.allowsFocusDuringEditing = on;
        }return self;
    };
}
#pragma mark —— Drag & Drop
-(JobsRetTableViewByBOOLBlock _Nonnull)byDragInteractionEnabled {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 11.0, *)) {
            self.dragInteractionEnabled = on;
        }return self;
    };
}
#pragma mark —— Content Hugging Elements (iOS 18+)
-(JobsRetTableViewByNSIntegerBlock _Nonnull)byContentHuggingElements API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewContentHuggingElements v) {
        @jobs_strongify(self)
        self.contentHuggingElements = v;
        return self;
    };
}

@end
