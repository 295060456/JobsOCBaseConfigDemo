//
//  NSObject+JobsDeployCellConfig.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/23.
//

#import <Foundation/Foundation.h>
#import "JobsDeployDataForCellHeader.h"
#import "UICollectionViewCellProtocol.h"
#import "UITableViewCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN
/// UITableView
#ifndef ReturnJobsBaseTableViewCell
#define ReturnJobsBaseTableViewCell \
    return JobsBaseTableViewCell.cellStyleDefaultWithTableView(tableView);
#endif
/// UICollectionView
#ifndef ReturnRichJobsBaseCollectionViewCell
#define ReturnRichJobsBaseCollectionViewCell \
    JobsBaseCollectionViewCell *cell = [JobsBaseCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];\
    [cell richElementsInCellWithModel:nil];\
    return cell;
#endif

#ifndef ReturnJobsBaseCollectionViewCell
#define ReturnJobsBaseCollectionViewCell \
    return [JobsBaseCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
#endif

#ifndef ReturnBaseCollectionReusableHeaderView
#define ReturnBaseCollectionReusableHeaderView \
    return [collectionView UICollectionElementKindSectionHeaderClass:BaseCollectionReusableView.class forIndexPath:indexPath];
#endif

#ifndef ReturnBaseCollectionReusableFooterView
#define ReturnBaseCollectionReusableFooterView \
    return [collectionView UICollectionElementKindSectionFooterClass:BaseCollectionReusableView.class forIndexPath:indexPath];
#endif

@interface NSObject (JobsDeployCellConfig)
#pragma mark —— UICollectionViewCell 和 UITableViewCell 的部署策略
-(UICollectionViewCell *_Nullable)jobsCollectionViewCellPlanAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                                         collectionView:(UICollectionView *_Nonnull)collectionView
                                               collectionViewCellBlock0:(JobsReturnCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock0
                                               collectionViewCellBlock1:(JobsReturnCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock1
                                               collectionViewCellBlock2:(JobsReturnCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock2
                                               collectionViewCellBlock3:(JobsReturnCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock3
                                               collectionViewCellBlock4:(JobsReturnCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock4;

-(UITableViewCell *_Nullable)jobsTableViewCellPlanAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                                    tableView:(UITableView *_Nonnull)tableView
                                          tableViewCellBlock0:(JobsReturnTableViewCellByVoidBlock _Nullable)tableViewCellBlock0
                                          tableViewCellBlock1:(JobsReturnTableViewCellByVoidBlock _Nullable)tableViewCellBlock1
                                          tableViewCellBlock2:(JobsReturnTableViewCellByVoidBlock _Nullable)tableViewCellBlock2
                                          tableViewCellBlock3:(JobsReturnTableViewCellByVoidBlock _Nullable)tableViewCellBlock3
                                          tableViewCellBlock4:(JobsReturnTableViewCellByVoidBlock _Nullable)tableViewCellBlock4;

-(CGSize)jobsCellplanSizeAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                          cellBlock0:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock0
                          cellBlock1:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock1
                          cellBlock2:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock2
                          cellBlock3:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock3
                          cellBlock4:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock4;
//
-(CGSize)jobsCellPlanSizeForSectionAtIndexPath:(NSInteger)section
                                    cellBlock0:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock0
                                    cellBlock1:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock1
                                    cellBlock2:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock2
                                    cellBlock3:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock3
                                    cellBlock4:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock4;
/// minimumInteritemSpacingForSectionAtIndex & minimumLineSpacingForSectionAtIndex
-(CGFloat)jobsCellPlanSpacingForSectionAtIndex:(NSInteger)section
                                    cellBlock0:(JobsReturnCGFloatByVoidBlock _Nullable)cellBlock0
                                    cellBlock1:(JobsReturnCGFloatByVoidBlock _Nullable)cellBlock1
                                    cellBlock2:(JobsReturnCGFloatByVoidBlock _Nullable)cellBlock2
                                    cellBlock3:(JobsReturnCGFloatByVoidBlock _Nullable)cellBlock3
                                    cellBlock4:(JobsReturnCGFloatByVoidBlock _Nullable)cellBlock4;
/// insetForSectionAtIndex
-(UIEdgeInsets)jobsCellplaninsetForSectionAtIndex:(NSInteger)section
                                       cellBlock0:(JobsReturnUIEdgeInsetsByVoidBlock _Nullable)cellBlock0
                                       cellBlock1:(JobsReturnUIEdgeInsetsByVoidBlock _Nullable)cellBlock1
                                       cellBlock2:(JobsReturnUIEdgeInsetsByVoidBlock _Nullable)cellBlock2
                                       cellBlock3:(JobsReturnUIEdgeInsetsByVoidBlock _Nullable)cellBlock3
                                       cellBlock4:(JobsReturnUIEdgeInsetsByVoidBlock _Nullable)cellBlock4;


@end

NS_ASSUME_NONNULL_END
