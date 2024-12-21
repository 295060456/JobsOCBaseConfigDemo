//
//  NSString+ID.m
//  FM
//
//  Created by Admin on 21/12/2024.
//

#import "NSString+ID.h"

@implementation NSString (ID)

-(JobsReturnCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initCollectionViewLayoutAttributesForSupplementaryViewBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewLayoutAttributes *_Nullable(__kindof NSIndexPath *_Nullable indexPath){
        @jobs_strongify(self)
        return [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:self withIndexPath:indexPath];;
    };
}

-(JobsReturnCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initCollectionViewLayoutAttributesForDecorationViewBy{
    @jobs_weakify(self)
    return ^__kindof UICollectionViewLayoutAttributes *_Nullable(__kindof NSIndexPath *_Nullable indexPath){
        @jobs_strongify(self)
        return [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:self withIndexPath:indexPath];;
    };
}

@end
