//
//  ThreeClassCell.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "UICollectionViewCellProtocol.h"
#import "JobsVerticalMenuDefineHeader.h"
#import "TreeClassItemCell.h"
#import "JobsBaseCollectionViewCell.h"

#import "GoodsClassModel.h"

NS_ASSUME_NONNULL_BEGIN
/// 这个类用于计算，不用于显示
@interface ThreeClassCell : JobsBaseCollectionViewCell
<
UICollectionViewDelegate
,UICollectionViewDataSource
>

Prop_assign()CGFloat sectionInsetTop;
Prop_assign()CGFloat sectionInsetLeft;
Prop_assign()CGFloat sectionInsetBottom;
Prop_assign()CGFloat sectionInsetRight;
Prop_assign()CGFloat minimumLineSpacing;/// 上下行间距
Prop_assign()CGFloat minimumInteritemSpacing;/// 左右列间距
Prop_strong()Class <UICollectionViewCellProtocol>cellCls;
#pragma mark —— 一些公有方法
-(JobsReturnCGFloatByArrBlock _Nonnull)getCollectionHeight;
-(JobsReturnViewByVoidBlock _Nonnull)reloadDatas;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof ThreeClassCell *_Nonnull jobsMakeThreeClassCell(jobsByThreeClassCellBlock _Nonnull block){
    ThreeClassCell *data = ThreeClassCell.alloc.init;
    if (block) block(data);
    return data;
}
