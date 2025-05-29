//
//  JXCategoryBaseView+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/29.
//

#import "JXCategoryBaseView+Extra.h"

@implementation JXCategoryBaseView (Extra)

-(JobsReturnCategoryBaseViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(id<JXCategoryViewDelegate> _Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsReturnCategoryBaseViewByCGFloatBlock _Nonnull)byCellSpacing{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.cellSpacing = data;
        return self;
    };
}

-(JobsReturnCategoryBaseViewByViewBlock _Nonnull)byContentScrollView{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(__kindof UIView *_Nullable view){
        @jobs_strongify(self)
        self.contentScrollView = view;
        return self;
    };
}

-(JobsReturnCategoryTitleViewByNSIntegerBlock _Nonnull)byDefaultSelectedIndex{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(NSInteger data){
        @jobs_strongify(self)
        self.defaultSelectedIndex = data;
        return self;
    };
}

-(JobsReturnCategoryBaseViewByListContainerBlock _Nonnull)byListContainer{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(id<JXCategoryViewListContainer> _Nullable listContainer){
        @jobs_strongify(self)
        self.listContainer = listContainer;
        return self;
    };
}

-(JobsReturnCategoryBaseViewByVoidBlock _Nonnull)reloadDatasWithoutListContainer{
    @jobs_weakify(self)
    return ^__kindof JXCategoryBaseView *_Nullable(){
        @jobs_strongify(self)
        [self reloadDataWithoutListContainer];
        return self;
    };
}

@end
