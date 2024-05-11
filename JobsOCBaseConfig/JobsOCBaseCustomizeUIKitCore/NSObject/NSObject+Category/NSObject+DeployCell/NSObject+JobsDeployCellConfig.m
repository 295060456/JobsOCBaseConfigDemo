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
                                               collectionViewCellBlock0:(JobsReturnCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock0
                                               collectionViewCellBlock1:(JobsReturnCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock1
                                               collectionViewCellBlock2:(JobsReturnCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock2
                                               collectionViewCellBlock3:(JobsReturnCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock3
                                               collectionViewCellBlock4:(JobsReturnCollectionViewCellByVoidBlock _Nullable)collectionViewCellBlock4{
    JobsDeployCollectionViewCellBySection5Block(indexPath.section)
    ReturnJobsBaseCollectionViewCell
}

-(UITableViewCell *_Nullable)jobsTableViewCellPlanAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                                    tableView:(UITableView *_Nonnull)tableView
                                          tableViewCellBlock0:(JobsReturnTableViewCellByVoidBlock _Nullable)tableViewCellBlock0
                                          tableViewCellBlock1:(JobsReturnTableViewCellByVoidBlock _Nullable)tableViewCellBlock1
                                          tableViewCellBlock2:(JobsReturnTableViewCellByVoidBlock _Nullable)tableViewCellBlock2
                                          tableViewCellBlock3:(JobsReturnTableViewCellByVoidBlock _Nullable)tableViewCellBlock3
                                          tableViewCellBlock4:(JobsReturnTableViewCellByVoidBlock _Nullable)tableViewCellBlock4{
    JobsDeployTableViewCellBySection5Block(indexPath.section)
    ReturnJobsBaseTableViewCell
}

-(CGSize)jobsCellplanSizeAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                          cellBlock0:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock0
                          cellBlock1:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock1
                          cellBlock2:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock2
                          cellBlock3:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock3
                          cellBlock4:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock4{
    JobsDeployCellBySection5Block(indexPath.section);
    return CGSizeZero;
}

-(CGSize)jobsCellPlanSizeForSectionAtIndexPath:(NSInteger)section
                                    cellBlock0:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock0
                                    cellBlock1:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock1
                                    cellBlock2:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock2
                                    cellBlock3:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock3
                                    cellBlock4:(JobsReturnCGSizeByVoidBlock _Nullable)cellBlock4{
    JobsDeployCellBySection5Block(section);
    return CGSizeZero;
}
/// minimumInteritemSpacingForSectionAtIndex & minimumLineSpacingForSectionAtIndex
-(CGFloat)jobsCellPlanSpacingForSectionAtIndex:(NSInteger)section
                                    cellBlock0:(JobsReturnCGFloatByVoidBlock _Nullable)cellBlock0
                                    cellBlock1:(JobsReturnCGFloatByVoidBlock _Nullable)cellBlock1
                                    cellBlock2:(JobsReturnCGFloatByVoidBlock _Nullable)cellBlock2
                                    cellBlock3:(JobsReturnCGFloatByVoidBlock _Nullable)cellBlock3
                                    cellBlock4:(JobsReturnCGFloatByVoidBlock _Nullable)cellBlock4{
    JobsDeployCellBySection5Block(section);
    return 0.f;
}
/// insetForSectionAtIndex
-(UIEdgeInsets)jobsCellplaninsetForSectionAtIndex:(NSInteger)section
                                       cellBlock0:(JobsReturnUIEdgeInsetsByVoidBlock _Nullable)cellBlock0
                                       cellBlock1:(JobsReturnUIEdgeInsetsByVoidBlock _Nullable)cellBlock1
                                       cellBlock2:(JobsReturnUIEdgeInsetsByVoidBlock _Nullable)cellBlock2
                                       cellBlock3:(JobsReturnUIEdgeInsetsByVoidBlock _Nullable)cellBlock3
                                       cellBlock4:(JobsReturnUIEdgeInsetsByVoidBlock _Nullable)cellBlock4{
    JobsDeployCellBySection5Block(section);
    return UIEdgeInsetsZero;
}

@end
