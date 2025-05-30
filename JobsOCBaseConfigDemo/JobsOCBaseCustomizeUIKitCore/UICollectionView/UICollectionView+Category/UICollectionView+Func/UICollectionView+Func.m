//
//  UICollectionView+Func.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/24.
//

#import "UICollectionView+Func.h"

@implementation UICollectionView (Func)

+(JobsReturnCollectionViewByLayoutBlock _Nonnull)initByLayout{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(__kindof UICollectionViewLayout *_Nullable data){
        @jobs_strongify(self)
        return [self.class.alloc initWithFrame:CGRectZero collectionViewLayout:data];
    };
}
/// 对系统方法 cellForItemAtIndexPath 的二次封装
-(JobsReturnCollectionViewCellByIndexPathBlock _Nonnull)cellBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewCell *_Nullable(NSIndexPath *_Nullable indexPath){
        @jobs_strongify(self)
        return [self cellForItemAtIndexPath:indexPath];
    };
}

-(JobsReturnCollectionViewByMJRefreshHeaderBlock _Nonnull)byMJRefreshHeader{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(__kindof MJRefreshHeader * _Nullable header){
        @jobs_strongify(self)
        self.mj_header = header;
        self.mj_header.automaticallyChangeAlpha = YES; /// 根据拖拽比例自动切换透明度
        return self;
    };
}

-(JobsReturnCollectionViewByMJRefreshFooterBlock _Nonnull)byMJRefreshFooter{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(__kindof MJRefreshFooter * _Nullable header){
        @jobs_strongify(self)
        self.mj_footer = header;
        self.mj_footer.automaticallyChangeAlpha = YES; /// 根据拖拽比例自动切换透明度
        return self;
    };
}

-(JobsReturnScrollViewByIDBlock _Nonnull)dataLink{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id _Nonnull target) {
        @jobs_strongify(self)
        self.byDelegate(target);
        self.byDataSource(target);
        return self;
    };
}

-(JobsReturnCollectionViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id <UICollectionViewDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsReturnCollectionViewByDataSourceBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id <UICollectionViewDataSource>_Nullable dataSource){
        @jobs_strongify(self)
        self.dataSource = dataSource;
        return self;
    };
}

-(JobsReturnCollectionViewByDragDelegateBlock _Nonnull)byDragDelegate{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id <UICollectionViewDragDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.dragDelegate = delegate;
        return self;
    };
}

-(JobsReturnCollectionViewByDropDelegateBlock _Nonnull)byDropDelegate{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id <UICollectionViewDropDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.dropDelegate = delegate;
        return self;
    };
}

-(JobsReturnCollectionViewByDataSourcePrefetchingBlock _Nonnull)byPrefetchDataSource{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable(id <UICollectionViewDataSourcePrefetching>_Nullable dataSourcePrefetching){
        @jobs_strongify(self)
        self.prefetchDataSource = dataSourcePrefetching;
        return self;
    };
}

-(__kindof UICollectionViewCell *)didSelectItemAtIndexPath:(NSIndexPath *)indexPath
                                   collectionViewCellClass:(Class _Nullable)collectionViewCellClass{
    JobsLog(@"%s", __FUNCTION__);
    if (collectionViewCellClass) {
        for (UICollectionViewCell *cell in self.visibleCells) {
            if ([cell isKindOfClass:collectionViewCellClass]) {
                cell.selected = NO;
            }
        }
    }return self.cellBy(indexPath).bySelected(YES);;
}

-(__kindof UICollectionViewCell *)didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
                                     collectionViewCellClass:(Class _Nullable)collectionViewCellClass{
    JobsLog(@"%s", __FUNCTION__);
    return self.cellBy(indexPath).bySelected(YES);
}

@end
