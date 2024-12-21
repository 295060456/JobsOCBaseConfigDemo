//
//  TMSCollectionViewLayoutDelegate.h
//  FM
//
//  Created by Admin on 21/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TMSCollectionViewLayoutDelegate <NSObject>
@required
/** section header */
-(CGFloat)collectionView:(UICollectionView *)collectionView
resuableHeaderViewHeightForIndexPath:(NSIndexPath *)indexPath;
/** section footer */
-(CGFloat)collectionView:(UICollectionView *)collectionView
resuableFooterViewHeightForIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
