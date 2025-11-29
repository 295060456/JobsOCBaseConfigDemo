//
//  UICollectionView+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import "UICollectionView+DSL.h"

@implementation UICollectionView (DSL)
/// 核心属性
-(JobsRetCollectionViewByLayoutBlock _Nonnull)byCollectionViewLayout{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(UICollectionViewLayout *layout){
        @jobs_strongify(self)
        self.collectionViewLayout = layout;
        return self;
    };
}

-(JobsRetCollectionViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id<UICollectionViewDelegate> delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsRetCollectionViewByDataSourceBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id<UICollectionViewDataSource> dataSource){
        @jobs_strongify(self)
        self.dataSource = dataSource;
        return self;
    };
}

-(JobsRetCollectionViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id<UICollectionViewDataSourcePrefetching> prefetchDataSource){
        @jobs_strongify(self)
        if (@available(iOS 10.0, *)) {
            self.prefetchDataSource = prefetchDataSource;
        }return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byPrefetchingEnabled{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 10.0, *)) {
            self.prefetchingEnabled = flag;
        }return self;
    };
}

-(JobsRetCollectionViewByDragDelegateBlock _Nonnull)byDragDelegate{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id<UICollectionViewDragDelegate> dragDelegate){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            self.dragDelegate = dragDelegate;
        }return self;
    };
}

-(JobsRetCollectionViewByDropDelegateBlock _Nonnull)byDropDelegate{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id<UICollectionViewDropDelegate> dropDelegate){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            self.dropDelegate = dropDelegate;
        }return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byDragInteractionEnabled{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            self.dragInteractionEnabled = flag;
        }return self;
    };
}

-(JobsRetCollectionViewByNSIntegerBlock _Nonnull)byReorderingCadence{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(UICollectionViewReorderingCadence cadence){
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            self.reorderingCadence = cadence;
        }return self;
    };
}

-(JobsRetCollectionViewByNSIntegerBlock _Nonnull)bySelfSizingInvalidation{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(UICollectionViewSelfSizingInvalidation invalidation){
        @jobs_strongify(self)
        if (@available(iOS 16.0, tvOS 16.0, *)) {
            self.selfSizingInvalidation = invalidation;
        }return self;
    };
}

-(JobsRetCollectionViewByViewBlock _Nonnull)byBackgroundView{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(UIView *view){
        @jobs_strongify(self)
        self.backgroundView = view;
        return self;
    };
}
/// 选择 / 编辑
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelection{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        self.allowsSelection = flag;
        return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelection{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        self.allowsMultipleSelection = flag;
        return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.editing = flag;
        }return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsSelectionDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.allowsSelectionDuringEditing = flag;
        }return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsMultipleSelectionDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 14.0, tvOS 14.0, *)) {
            self.allowsMultipleSelectionDuringEditing = flag;
        }return self;
    };
}
/// Focus 相关
-(JobsRetCollectionViewByBOOLBlock _Nonnull)byRemembersLastFocusedIndexPath{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 9.0, *)) {
            self.remembersLastFocusedIndexPath = flag;
        }return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)bySelectionFollowsFocus{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 14.0, *)) {
            self.selectionFollowsFocus = flag;
        }return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocus{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.allowsFocus = flag;
        }return self;
    };
}

-(JobsRetCollectionViewByBOOLBlock _Nonnull)byAllowsFocusDuringEditing{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        if (@available(iOS 15.0, tvOS 15.0, *)) {
            self.allowsFocusDuringEditing = flag;
        }return self;
    };
}

@end
