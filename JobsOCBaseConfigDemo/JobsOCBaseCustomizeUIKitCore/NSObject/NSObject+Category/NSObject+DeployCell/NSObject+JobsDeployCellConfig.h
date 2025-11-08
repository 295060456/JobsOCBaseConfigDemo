//
//  NSObject+JobsDeployCellConfig.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/23.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
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
    cell.JobsRichViewByModel2(nil);\
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
                                               collectionViewCellBlock0:(JobsRetCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock0
                                               collectionViewCellBlock1:(JobsRetCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock1
                                               collectionViewCellBlock2:(JobsRetCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock2
                                               collectionViewCellBlock3:(JobsRetCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock3
                                               collectionViewCellBlock4:(JobsRetCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock4;

-(UITableViewCell *_Nullable)jobsTableViewCellPlanAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                                    tableView:(UITableView *_Nonnull)tableView
                                          tableViewCellBlock0:(JobsRetTableViewCellByVoidBlock _Nullable)tableViewCellBlock0
                                          tableViewCellBlock1:(JobsRetTableViewCellByVoidBlock _Nullable)tableViewCellBlock1
                                          tableViewCellBlock2:(JobsRetTableViewCellByVoidBlock _Nullable)tableViewCellBlock2
                                          tableViewCellBlock3:(JobsRetTableViewCellByVoidBlock _Nullable)tableViewCellBlock3
                                          tableViewCellBlock4:(JobsRetTableViewCellByVoidBlock _Nullable)tableViewCellBlock4;

-(CGSize)jobsCellplanSizeAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                          cellBlock0:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock0
                          cellBlock1:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock1
                          cellBlock2:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock2
                          cellBlock3:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock3
                          cellBlock4:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock4;
//
-(CGSize)jobsCellPlanSizeForSectionAtIndexPath:(NSInteger)section
                                    cellBlock0:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock0
                                    cellBlock1:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock1
                                    cellBlock2:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock2
                                    cellBlock3:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock3
                                    cellBlock4:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock4;
/// minimumInteritemSpacingForSectionAtIndex & minimumLineSpacingForSectionAtIndex
-(CGFloat)jobsCellPlanSpacingForSectionAtIndex:(NSInteger)section
                                    cellBlock0:(JobsRetCGFloatByVoidBlock _Nullable)cellBlock0
                                    cellBlock1:(JobsRetCGFloatByVoidBlock _Nullable)cellBlock1
                                    cellBlock2:(JobsRetCGFloatByVoidBlock _Nullable)cellBlock2
                                    cellBlock3:(JobsRetCGFloatByVoidBlock _Nullable)cellBlock3
                                    cellBlock4:(JobsRetCGFloatByVoidBlock _Nullable)cellBlock4;
/// insetForSectionAtIndex
-(UIEdgeInsets)jobsCellplaninsetForSectionAtIndex:(NSInteger)section
                                       cellBlock0:(JobsRetUIEdgeInsetsByVoidBlock _Nullable)cellBlock0
                                       cellBlock1:(JobsRetUIEdgeInsetsByVoidBlock _Nullable)cellBlock1
                                       cellBlock2:(JobsRetUIEdgeInsetsByVoidBlock _Nullable)cellBlock2
                                       cellBlock3:(JobsRetUIEdgeInsetsByVoidBlock _Nullable)cellBlock3
                                       cellBlock4:(JobsRetUIEdgeInsetsByVoidBlock _Nullable)cellBlock4;


@end

NS_ASSUME_NONNULL_END
