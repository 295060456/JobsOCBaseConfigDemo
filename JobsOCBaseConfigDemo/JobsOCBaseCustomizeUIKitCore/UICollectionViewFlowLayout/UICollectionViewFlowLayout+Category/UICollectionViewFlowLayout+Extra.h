//
//  UICollectionViewFlowLayout+Extra.h
//  FM
//
//  Created by User on 9/16/24.
//

#import <UIKit/UIKit.h>

NS_INLINE UICollectionViewFlowLayout *_Nonnull jobsMakeCollectionViewFlowLayout(jobsByCollectionViewFlowLayoutBlock _Nonnull block){
    UICollectionViewFlowLayout *data = UICollectionViewFlowLayout.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE UICollectionViewFlowLayout *_Nonnull jobsMakeHorizontalCollectionViewFlowLayout(jobsByCollectionViewFlowLayoutBlock _Nonnull block){
    UICollectionViewFlowLayout *data = UICollectionViewFlowLayout.alloc.init;
    data.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    if (block) block(data);
    return data;
}

NS_INLINE UICollectionViewFlowLayout *_Nonnull jobsMakeVerticalCollectionViewFlowLayout(jobsByCollectionViewFlowLayoutBlock _Nonnull block){
    UICollectionViewFlowLayout *data = UICollectionViewFlowLayout.alloc.init;
    data.scrollDirection = UICollectionViewScrollDirectionVertical;
    if (block) block(data);
    return data;
}

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewFlowLayout (Extra)

@end

NS_ASSUME_NONNULL_END
