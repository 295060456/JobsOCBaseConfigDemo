//
//  UITableView+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import "UITableView+DSL.h"

@implementation UITableView (DSL)

-(JobsReturnTableViewByDataSourceBlock _Nonnull)byDataSource {
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDataSource> _Nullable ds) {
        @jobs_strongify(self) 
        self.dataSource = ds;
        return self;
    };
}

-(JobsReturnTableViewByDelegateBlock _Nonnull)byDelegate {
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDelegate> _Nullable dg) {
        @jobs_strongify(self) 
        self.delegate = dg;
        return self;
    };
}

-(JobsReturnTableViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource {
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDataSourcePrefetching> _Nullable pds) {
        @jobs_strongify(self) 
        if (@available(iOS 10.0, *)) {
            self.prefetchDataSource = pds;
        }return self;
    };
}

-(JobsReturnTableViewByBOOLBlock _Nonnull)byPrefetchingEnabled {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL enabled) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.prefetchingEnabled = enabled;
        }return self;
    };
}

-(JobsReturnTableViewByDragDelegateBlock _Nonnull)byDragDelegate {
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDragDelegate> _Nullable dd) {
        @jobs_strongify(self) 
        if (@available(iOS 11.0, *)) {
            self.dragDelegate = dd;
        }return self;
    };
}

-(JobsReturnTableViewByDropDelegateBlock _Nonnull)byDropDelegate {
    @jobs_weakify(self)
    return ^__kindof UITableView * (id<UITableViewDropDelegate> _Nullable dp) {
        @jobs_strongify(self) 
        if (@available(iOS 11.0, *)) {
            self.dropDelegate = dp;
        }return self;
    };
}
#pragma mark - Heights & Estimations
-(JobsReturnTableViewByCGFloatBlock _Nonnull)byRowHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        self.rowHeight = v;
        return self;
    };
}

-(JobsReturnTableViewByCGFloatBlock _Nonnull)bySectionHeaderHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        self.sectionHeaderHeight = v;
        return self;
    };
}

-(JobsReturnTableViewByCGFloatBlock _Nonnull)bySectionFooterHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        self.sectionFooterHeight = v;
        return self;
    };
}

-(JobsReturnTableViewByCGFloatBlock _Nonnull)byEstimatedRowHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)) {
            self.estimatedRowHeight = v;
        }return self;
    };
}

-(JobsReturnTableViewByCGFloatBlock _Nonnull)byEstimatedSectionHeaderHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)) {
            self.estimatedSectionHeaderHeight = v;
        }return self;
    };
}

-(JobsReturnTableViewByCGFloatBlock _Nonnull)byEstimatedSectionFooterHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)) {
            self.estimatedSectionFooterHeight = v;
        }return self;
    };
}

-(JobsReturnTableViewByCGFloatBlock _Nonnull)byFillerRowHeight {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.fillerRowHeight = v;
        }return self;
    };
}

-(JobsReturnTableViewByCGFloatBlock _Nonnull)bySectionHeaderTopPadding {
    @jobs_weakify(self)
    return ^__kindof UITableView * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.sectionHeaderTopPadding = v;
        }return self;
    };
}
#pragma mark - Separators & Insets
-(JobsReturnTableViewByEdgeInsetsBlock _Nonnull)bySeparatorInset {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIEdgeInsets insets) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)) {
            self.separatorInset = insets;
        }return self;
    };
}

-(JobsReturnTableViewByNSIntegerBlock _Nonnull)bySeparatorInsetReference {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewSeparatorInsetReference ref) {
        @jobs_strongify(self) 
        if (@available(iOS 11.0, tvOS 11.0, *)) {
            self.separatorInsetReference = ref;
        }return self;
    };
}

-(JobsReturnTableViewByNSIntegerBlock _Nonnull)bySeparatorStyle {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewCellSeparatorStyle style) {
        @jobs_strongify(self) 
        self.separatorStyle = style; // tvOS 已在 .h 层标注不可用
        return self;
    };
}

-(JobsReturnTableViewByCorBlock _Nonnull)bySeparatorColor {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color) {
        @jobs_strongify(self) 
        self.separatorColor = color; // tvOS 已在 .h 层标注不可用
        return self;
    };
}

-(JobsReturnTableViewByVisualEffectBlock _Nonnull)bySeparatorEffect {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIVisualEffect * _Nullable effect) {
        @jobs_strongify(self) 
        if (@available(iOS 8.0, *)) {
            self.separatorEffect = effect; // tvOS 不可用，.h 已标注
        }return self;
    };
}
#pragma mark —— Self-Sizing invalidation
- (JobsReturnTableViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation API_AVAILABLE(ios(16.0), tvos(16.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewSelfSizingInvalidation v) {
        @jobs_strongify(self)
        self.selfSizingInvalidation = v;
        return self;
    };
}
#pragma mark —— Background
-(JobsReturnTableViewByViewBlock _Nonnull)byBackgroundView {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIView * _Nullable v) {
        @jobs_strongify(self) 
        if (@available(iOS 3.2, *)) {
            self.backgroundView = v;
        }return self;
    };
}
#pragma mark —— Appearance / Index
-(JobsReturnTableViewByNSIntegerBlock _Nonnull)bySectionIndexMinimumDisplayRowCount {
    @jobs_weakify(self)
    return ^__kindof UITableView * (NSInteger v) {
        @jobs_strongify(self) 
        self.sectionIndexMinimumDisplayRowCount = v;
        return self;
    };
}

-(JobsReturnTableViewByCorBlock _Nonnull)bySectionIndexColor {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color) {
        @jobs_strongify(self) 
        if (@available(iOS 6.0, *)) {
            self.sectionIndexColor = color;
        }return self;
    };
}

-(JobsReturnTableViewByCorBlock _Nonnull)bySectionIndexBackgroundColor {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, *)) {
            self.sectionIndexBackgroundColor = color;
        }return self;
    };
}

-(JobsReturnTableViewByCorBlock _Nonnull)bySectionIndexTrackingBackgroundColor {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIColor * _Nullable color) {
        @jobs_strongify(self) 
        if (@available(iOS 6.0, *)) {
            self.sectionIndexTrackingBackgroundColor = color;
        }return self;
    };
}
#pragma mark —— Layout behavior
-(JobsReturnTableViewByBOOLBlock _Nonnull)byCellLayoutMarginsFollowReadableWidth {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 9.0, *)) {
            self.cellLayoutMarginsFollowReadableWidth = on;
        }return self;
    };
}

-(JobsReturnTableViewByBOOLBlock _Nonnull)byInsetsContentViewsToSafeArea {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 11.0, tvOS 11.0, *)) {
            self.insetsContentViewsToSafeArea = on;
        }return self;
    };
}
#pragma mark —— Header / Footer views
-(JobsReturnTableViewByViewBlock _Nonnull)byTableHeaderView {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIView * _Nullable v) {
        @jobs_strongify(self) 
        self.tableHeaderView = v;
        return self;
    };
}

-(JobsReturnTableViewByViewBlock _Nonnull)byTableFooterView {
    @jobs_weakify(self)
    return ^__kindof UITableView * (UIView * _Nullable v) {
        @jobs_strongify(self) 
        self.tableFooterView = v;
        return self;
    };
}
#pragma mark —— Editing / Selection
-(JobsReturnTableViewByBOOLBlock _Nonnull)byEditing {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL editing) {
        @jobs_strongify(self) 
        self.editing = editing;
        return self;
    };
}

-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsSelection {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 3.0, *)) {
            self.allowsSelection = on;
        }return self;
    };
}

-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        self.allowsSelectionDuringEditing = on;
        return self;
    };
}

-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelection {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 5.0, *)) {
            self.allowsMultipleSelection = on;
        }return self;
    };
}

-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 5.0, *)) {
            self.allowsMultipleSelectionDuringEditing = on;
        }return self;
    };
}
#pragma mark —— Focus
-(JobsReturnTableViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 9.0, *)) {
            self.remembersLastFocusedIndexPath = on;
        }return self;
    };
}

-(JobsReturnTableViewByBOOLBlock _Nonnull)bySelectionFollowsFocus {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 14.0, *)) {
            self.selectionFollowsFocus = on; // watchOS/tvOS 限制已在 .h 标
        }return self;
    };
}

-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsFocus {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.allowsFocus = on;
        }return self;
    };
}

-(JobsReturnTableViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.allowsFocusDuringEditing = on;
        }return self;
    };
}
#pragma mark —— Drag & Drop
-(JobsReturnTableViewByBOOLBlock _Nonnull)byDragInteractionEnabled {
    @jobs_weakify(self)
    return ^__kindof UITableView * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 11.0, *)) {
            self.dragInteractionEnabled = on;
        }return self;
    };
}
#pragma mark —— Content Hugging Elements (iOS 18+)
-(JobsReturnTableViewByNSIntegerBlock _Nonnull)byContentHuggingElements API_AVAILABLE(ios(18.0), tvos(18.0), visionos(2.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^__kindof UITableView * (UITableViewContentHuggingElements v) {
        @jobs_strongify(self)
        self.contentHuggingElements = v;
        return self;
    };
}

@end
