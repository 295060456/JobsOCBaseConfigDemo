//
//  UICollectionViewFlowLayout+Extra.h
//  FM
//
//  Created by User on 9/16/24.
//

#import <UIKit/UIKit.h>

static inline UICollectionViewFlowLayout *_Nonnull jobsMakeCollectionViewFlowLayout(jobsByCollectionViewFlowLayoutBlock _Nonnull block){
    UICollectionViewFlowLayout *data = UICollectionViewFlowLayout.alloc.init;
    if (block) block(data);
    return data;
}

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewFlowLayout (Extra)

@end

NS_ASSUME_NONNULL_END
