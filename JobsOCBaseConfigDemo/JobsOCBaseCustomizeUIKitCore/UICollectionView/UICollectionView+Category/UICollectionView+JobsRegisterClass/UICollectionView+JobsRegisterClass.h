//
//  UICollectionView+JobsRegisterClass.h
//  UBallLive
//
//  Created by Jobs on 2020/10/31.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionViewProtocol.h"

#import "JobsHeaderFooterView.h"
#import "TMSWalletCollectionReusableView.h"
#import "JobsBaseCollectionViewCell.h"
#import "BaseCollectionViewCell.h"

#import "JobsSearchDataCVCell.h"
#import "JobsHotLabelByMultiLineCVCell.h"
#import "JobsBtnStyleCVCell.h"
#import "JobsTextFieldStyleCVCell.h"
#import "JobsImageViewStyleCVCell.h"
#import "BaiShaETProjVIPSubCVFooterView.h"
#import "BaiShaETProjOrderDetailsCVCell.h"

#import "BaiShaETProjVIPSubCVCell_01.h"
#import "BaiShaETProjVIPSubCVCell_02.h"
#import "BaiShaETProjVIPSubCVCell_03.h"
#import "BaiShaETProjVIPSubCVCell_04.h"
#import "BaiShaETProjVIPSubCVCell_05.h"

#import "BaiShaETProjBankAccMgmtCVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (JobsRegisterClass)<BaseCollectionViewProtocol>

@end

NS_ASSUME_NONNULL_END
/// 用于 +(instancetype)cellWithCollectionView:(nonnull UICollectionView *)collectionView forIndexPath:(nonnull NSIndexPath *)indexPath；内部
#ifndef JobsRegisterDequeueCollectionViewCell
#define JobsRegisterDequeueCollectionViewCell(CellClass) \
({ \
    CellClass *cell = (CellClass *)[collectionView collectionViewCellClass:CellClass.class forIndexPath:indexPath]; \
    if (!cell) { \
        collectionView.registerCollectionViewCellClass(CellClass.class,@""); \
        cell = (CellClass *)[collectionView collectionViewCellClass:CellClass.class forIndexPath:indexPath]; \
    } \
    cell; \
})
#endif /* JobsRegisterDequeueCollectionViewCell */
