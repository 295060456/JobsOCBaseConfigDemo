//
//  KFZShopCatoryFlowLayput.h
//  UBallLive
//
//  Created by Jobs on 2020/10/30.
//

#import <UIKit/UIKit.h>
#import "UIView+Extras.h"

NS_ASSUME_NONNULL_BEGIN
/// 给UICollectionView的每个section加背景
@interface KFZShopCatoryFlowLayput : UICollectionViewFlowLayout

Prop_copy()NSMutableArray <NSNumber *>*affectedSectionsMutArr;//受影响的section组
Prop_assign()CGFloat offsetX;
Prop_assign()CGFloat offsetY;
Prop_assign()CGFloat offsetWidth;
Prop_assign()CGFloat offsetHeight;

@end

NS_ASSUME_NONNULL_END
