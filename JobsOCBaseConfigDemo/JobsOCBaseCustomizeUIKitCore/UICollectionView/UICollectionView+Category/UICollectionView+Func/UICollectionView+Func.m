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

-(jobsByIDBlock _Nonnull)dataLink{
    @jobs_weakify(self)
    return ^(id _Nonnull target) {
        @jobs_strongify(self)
        self.delegate = target;
        self.dataSource = target;
    };
}

-(UICollectionViewCell *)didSelectItemAtIndexPath:(NSIndexPath *)indexPath
                          collectionViewCellClass:(Class _Nullable)collectionViewCellClass{
    NSLog(@"%s", __FUNCTION__);
    if (collectionViewCellClass) {
        for (UICollectionViewCell *cell in self.visibleCells) {
            if ([cell isKindOfClass:collectionViewCellClass]) {
                cell.selected = NO;
            }
        }
    }
    UICollectionViewCell *cell = (UICollectionViewCell *)[self cellForItemAtIndexPath:indexPath];
    cell.selected = YES;
    return cell;
}

-(UICollectionViewCell *)didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
                            collectionViewCellClass:(Class _Nullable)collectionViewCellClass{
    NSLog(@"%s", __FUNCTION__);
    UICollectionViewCell *cell = (UICollectionViewCell *)[self cellForItemAtIndexPath:indexPath];
    cell.selected = YES;
    return cell;
}

@end
