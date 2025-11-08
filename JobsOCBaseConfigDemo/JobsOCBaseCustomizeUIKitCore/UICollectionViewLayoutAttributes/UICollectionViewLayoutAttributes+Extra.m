//
//  UICollectionViewLayoutAttributes+Extra.m
//  FM
//
//  Created by Admin on 21/12/2024.
//

#import "UICollectionViewLayoutAttributes+Extra.h"

@implementation UICollectionViewLayoutAttributes (Extra)

+(JobsRetCollectionViewLayoutAttributesByNSIndexPathBlock _Nonnull)initBy{
    return ^__kindof UICollectionViewLayoutAttributes *_Nullable(__kindof NSIndexPath *_Nullable indexPath){
        return [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    };
}

@end
