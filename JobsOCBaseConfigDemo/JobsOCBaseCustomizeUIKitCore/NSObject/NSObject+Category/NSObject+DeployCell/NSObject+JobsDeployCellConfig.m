//
//  NSObject+JobsDeployCellConfig.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/23.
//

#import "NSObject+JobsDeployCellConfig.h"

@implementation NSObject (JobsDeployCellConfig)
#pragma mark —— UICollectionViewCell 和 UITableViewCell 的部署策略
-(UICollectionViewCell *_Nullable)jobsCollectionViewCellPlanAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                                         collectionView:(UICollectionView *_Nonnull)collectionView
                                               collectionViewCellBlock0:(JobsRetCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock0
                                               collectionViewCellBlock1:(JobsRetCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock1
                                               collectionViewCellBlock2:(JobsRetCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock2
                                               collectionViewCellBlock3:(JobsRetCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock3
                                               collectionViewCellBlock4:(JobsRetCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock4{
    JobsDeployCollectionViewCellBySection5Block(indexPath.section)
    ReturnJobsBaseCollectionViewCell
}

-(UITableViewCell *_Nullable)jobsTableViewCellPlanAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                                    tableView:(UITableView *_Nonnull)tableView
                                          tableViewCellBlock0:(JobsRetTableViewCellByVoidBlock _Nullable)tableViewCellBlock0
                                          tableViewCellBlock1:(JobsRetTableViewCellByVoidBlock _Nullable)tableViewCellBlock1
                                          tableViewCellBlock2:(JobsRetTableViewCellByVoidBlock _Nullable)tableViewCellBlock2
                                          tableViewCellBlock3:(JobsRetTableViewCellByVoidBlock _Nullable)tableViewCellBlock3
                                          tableViewCellBlock4:(JobsRetTableViewCellByVoidBlock _Nullable)tableViewCellBlock4{
    JobsDeployTableViewCellBySection5Block(indexPath.section)
    ReturnJobsBaseTableViewCell
}

-(CGSize)jobsCellplanSizeAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                          cellBlock0:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock0
                          cellBlock1:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock1
                          cellBlock2:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock2
                          cellBlock3:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock3
                          cellBlock4:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock4{
    JobsDeployCellBySection5Block(indexPath.section);
    return CGSizeZero;
}

-(CGSize)jobsCellPlanSizeForSectionAtIndexPath:(NSInteger)section
                                    cellBlock0:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock0
                                    cellBlock1:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock1
                                    cellBlock2:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock2
                                    cellBlock3:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock3
                                    cellBlock4:(JobsRetCGSizeByVoidBlock _Nullable)cellBlock4{
    JobsDeployCellBySection5Block(section);
    return CGSizeZero;
}
/// minimumInteritemSpacingForSectionAtIndex & minimumLineSpacingForSectionAtIndex
-(CGFloat)jobsCellPlanSpacingForSectionAtIndex:(NSInteger)section
                                    cellBlock0:(JobsRetCGFloatByVoidBlock _Nullable)cellBlock0
                                    cellBlock1:(JobsRetCGFloatByVoidBlock _Nullable)cellBlock1
                                    cellBlock2:(JobsRetCGFloatByVoidBlock _Nullable)cellBlock2
                                    cellBlock3:(JobsRetCGFloatByVoidBlock _Nullable)cellBlock3
                                    cellBlock4:(JobsRetCGFloatByVoidBlock _Nullable)cellBlock4{
    JobsDeployCellBySection5Block(section);
    return 0.f;
}
/// insetForSectionAtIndex
-(UIEdgeInsets)jobsCellplaninsetForSectionAtIndex:(NSInteger)section
                                       cellBlock0:(JobsRetUIEdgeInsetsByVoidBlock _Nullable)cellBlock0
                                       cellBlock1:(JobsRetUIEdgeInsetsByVoidBlock _Nullable)cellBlock1
                                       cellBlock2:(JobsRetUIEdgeInsetsByVoidBlock _Nullable)cellBlock2
                                       cellBlock3:(JobsRetUIEdgeInsetsByVoidBlock _Nullable)cellBlock3
                                       cellBlock4:(JobsRetUIEdgeInsetsByVoidBlock _Nullable)cellBlock4{
    JobsDeployCellBySection5Block(section);
    return UIEdgeInsetsZero;
}

@end
