//
//  ASCollectionNode+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/6/25.
//

#import "ASCollectionNode+DSL.h"

@implementation ASCollectionNode (DSL)

-(JobsRetCollectionNodeByDelegateBlock _Nonnull)byDelegate {
    @jobs_weakify(self)
    return ^ASCollectionNode* (id<ASCollectionDelegate> delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsRetCollectionNodeByDataSourceBlock _Nonnull)byDataSource {
    @jobs_weakify(self)
    return ^ASCollectionNode* (id<ASCollectionDataSource> dataSource){
        @jobs_strongify(self)
        self.dataSource = dataSource;
        return self;
    };
}

-(JobsRetCollectionNodeByCGFloatBlock _Nonnull)byLeadingScreensForBatching {
    @jobs_weakify(self)
    return ^ASCollectionNode* (CGFloat v){
        @jobs_strongify(self)
        self.leadingScreensForBatching = v;
        return self;
    };
}

-(JobsRetCollectionNodeByBoolBlock _Nonnull)byInverted {
    @jobs_weakify(self)
    return ^ASCollectionNode* (BOOL flag){
        @jobs_strongify(self)
        self.inverted = flag;
        return self;
    };
}

-(JobsRetCollectionNodeByBoolBlock _Nonnull)byAllowsSelection {
    @jobs_weakify(self)
    return ^ASCollectionNode* (BOOL flag){
        @jobs_strongify(self)
        self.allowsSelection = flag;
        return self;
    };
}

-(JobsRetCollectionNodeByBoolBlock _Nonnull)byAllowsMultipleSelection {
    @jobs_weakify(self)
    return ^ASCollectionNode* (BOOL flag){
        @jobs_strongify(self)
        self.allowsMultipleSelection = flag;
        return self;
    };
}

-(JobsRetCollectionNodeByBoolBlock _Nonnull)byAlwaysBounceVertical {
    @jobs_weakify(self)
    return ^ASCollectionNode* (BOOL flag){
        @jobs_strongify(self)
        self.alwaysBounceVertical = flag;
        return self;
    };
}

-(JobsRetCollectionNodeByBoolBlock _Nonnull)byAlwaysBounceHorizontal {
    @jobs_weakify(self)
    return ^ASCollectionNode* (BOOL flag){
        @jobs_strongify(self)
        self.alwaysBounceHorizontal = flag;
        return self;
    };
}

-(JobsRetCollectionNodeByBoolBlock _Nonnull)byShowsVerticalScrollIndicator {
    @jobs_weakify(self)
    return ^ASCollectionNode* (BOOL flag){
        @jobs_strongify(self)
        self.showsVerticalScrollIndicator = flag;
        return self;
    };
}

-(JobsRetCollectionNodeByBoolBlock _Nonnull)byShowsHorizontalScrollIndicator {
    @jobs_weakify(self)
    return ^ASCollectionNode* (BOOL flag){
        @jobs_strongify(self)
        self.showsHorizontalScrollIndicator = flag;
        return self;
    };
}

-(JobsRetCollectionNodeByBoolBlock _Nonnull)byPagingEnabled {
    @jobs_weakify(self)
    return ^ASCollectionNode* (BOOL flag){
        @jobs_strongify(self)
        self.pagingEnabled = flag;
        return self;
    };
}

-(JobsRetCollectionNodeByLayoutBlock _Nonnull)byLayout {
    @jobs_weakify(self)
    return ^ASCollectionNode* (UICollectionViewLayout *layout){
        @jobs_strongify(self)
        self.collectionViewLayout = layout;
        return self;
    };
}

-(JobsRetCollectionNodeByInspectorBlock _Nonnull)byLayoutInspector {
    @jobs_weakify(self)
    return ^ASCollectionNode* (id<ASCollectionViewLayoutInspecting> inspector){
        @jobs_strongify(self)
        self.layoutInspector = inspector;
        return self;
    };
}

-(JobsRetCollectionNodeByInsetsBlock _Nonnull)byContentInset {
    @jobs_weakify(self)
    return ^ASCollectionNode* (UIEdgeInsets insets){
        @jobs_strongify(self)
        self.contentInset = insets;
        return self;
    };
}

-(JobsRetCollectionNodeByPointBlock _Nonnull)byContentOffset {
    @jobs_weakify(self)
    return ^ASCollectionNode* (CGPoint p){
        @jobs_strongify(self)
        self.contentOffset = p;
        return self;
    };
}

-(JobsRetCollectionNodeByPointAnimatedBlock _Nonnull)bySetContentOffsetAnimated {
    @jobs_weakify(self)
    return ^ASCollectionNode* (CGPoint p, BOOL animated){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self setContentOffset:p animated:animated];
        });return self;
    };
}

-(JobsRetCollectionNodeByStringBlock _Nonnull)byRegisterSupplementaryKind {
    @jobs_weakify(self)
    return ^ASCollectionNode* (NSString *kind){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self registerSupplementaryNodeOfKind:kind];
        });return self;
    };
}

-(JobsRetCollectionNodeByScrollToItemBlock _Nonnull)byScrollToItem {
    @jobs_weakify(self)
    return ^ASCollectionNode* (NSIndexPath *indexPath,
                               UICollectionViewScrollPosition pos,
                               BOOL animated){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self scrollToItemAtIndexPath:indexPath
                                     atScrollPosition:pos
                                             animated:animated];
        });return self;
    };
}

-(JobsRetCollectionNodeBySelectBlock _Nonnull)bySelectItem {
    @jobs_weakify(self)
    return ^ASCollectionNode* (NSIndexPath *indexPath,
                               BOOL animated,
                               UICollectionViewScrollPosition pos){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self selectItemAtIndexPath:indexPath
                                           animated:animated
                                     scrollPosition:pos];
        });return self;
    };
}

-(JobsRetCollectionNodeByDeselectBlock _Nonnull)byDeselectItem {
    @jobs_weakify(self)
    return ^ASCollectionNode* (NSIndexPath *indexPath, BOOL animated){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self deselectItemAtIndexPath:indexPath animated:animated];
        });return self;
    };
}

-(JobsRetCollectionNodeByBatchAnimatedBlock _Nonnull)byPerformBatchAnimated {
    @jobs_weakify(self)
    return ^ASCollectionNode* (BOOL animated,
                               dispatch_block_t updates,
                               void (^completion)(BOOL)){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self performBatchAnimated:animated
                               updates:updates
                            completion:completion];
        });return self;
    };
}

-(JobsRetCollectionNodeByBatchBlock _Nonnull)byPerformBatchUpdates {
    @jobs_weakify(self)
    return ^ASCollectionNode* (dispatch_block_t updates,
                               void (^completion)(BOOL)){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self performBatchUpdates:updates completion:completion];
        });return self;
    };
}

-(JobsRetCollectionNodeByReloadWithCompletionBlock _Nonnull)byReloadWithCompletion {
    @jobs_weakify(self)
    return ^ASCollectionNode* (dispatch_block_t completion){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self reloadDataWithCompletion:completion];
        });return self;
    };
}

-(JobsRetCollectionNodeByVoidBlock _Nonnull)byReload {
    @jobs_weakify(self)
    return ^ASCollectionNode* (){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self reloadData];
        });return self;
    };
}

-(JobsRetCollectionNodeByVoidBlock _Nonnull)byRelayoutItems {
    @jobs_weakify(self)
    return ^ASCollectionNode* (){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self relayoutItems];
        });return self;
    };
}

-(JobsRetCollectionNodeBySetTuningBlock _Nonnull)bySetTuningForRangeType {
    @jobs_weakify(self)
    return ^ASCollectionNode* (ASRangeTuningParameters params,
                               ASLayoutRangeType type){
        @jobs_strongify(self)
        [self setTuningParameters:params forRangeType:type];
        return self;
    };
}

-(JobsRetCollectionNodeBySetTuningForModeBlock _Nonnull)bySetTuningForModeRangeType {
    @jobs_weakify(self)
    return ^ASCollectionNode* (ASRangeTuningParameters params,
                               ASLayoutRangeMode mode,
                               ASLayoutRangeType type){
        @jobs_strongify(self)
        [self setTuningParameters:params
                     forRangeMode:mode
                        rangeType:type];
        return self;
    };
}

-(JobsRetCollectionNodeByVoidBlock _Nonnull)byOnDidFinishProcessingUpdatesOnce {
    @jobs_weakify(self)
    return ^ASCollectionNode* (){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self onDidFinishProcessingUpdates:^{}];
        });return self;
    };
}

-(JobsRetCollectionNodeByDispatchBlock _Nonnull)byOnDidFinishProcessingUpdates {
    @jobs_weakify(self)
    return ^ASCollectionNode* (dispatch_block_t block){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self onDidFinishProcessingUpdates:block];
        });return self;
    };
}

-(JobsRetCollectionNodeByVoidBlock _Nonnull)byWaitUntilAllUpdatesProcessed {
    @jobs_weakify(self)
    return ^ASCollectionNode* (){
        jobs_on_main(^{
            @jobs_strongify(self)
            [self waitUntilAllUpdatesAreProcessed];
        });return self;
    };
}

@end
