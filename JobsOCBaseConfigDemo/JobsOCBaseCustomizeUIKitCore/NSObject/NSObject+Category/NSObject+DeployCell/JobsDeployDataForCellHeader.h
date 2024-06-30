//
//  JobsDeployDataForCellHeader.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/23.
//

#ifndef JobsDeployDataForCellHeader_h
#define JobsDeployDataForCellHeader_h
/// 5 个 Section 的UICollectionViewCell部署策略
#ifndef JobsDeployCollectionViewCellBySection5Block
#define JobsDeployCollectionViewCellBySection5Block(indexPath_section) \
    if (indexPath_section == 0) {\
        if (collectionViewCellBlock0) return collectionViewCellBlock0();\
        ReturnJobsBaseCollectionViewCell\
    }else if (indexPath_section == 1){\
        if (collectionViewCellBlock1) return collectionViewCellBlock1();\
        ReturnJobsBaseCollectionViewCell\
    }else if (indexPath_section == 2){\
        if (collectionViewCellBlock2) return collectionViewCellBlock2();\
        ReturnJobsBaseCollectionViewCell\
    }else if(indexPath_section == 3){\
        if (collectionViewCellBlock3) return collectionViewCellBlock3();\
        ReturnJobsBaseCollectionViewCell\
    }else if(indexPath_section == 4){\
        if (collectionViewCellBlock4) return collectionViewCellBlock4();\
        ReturnJobsBaseCollectionViewCell\
    }
#endif
/// 5 个 Section 的UITableViewCell部署策略
#ifndef JobsDeployTableViewCellBySection5Block
#define JobsDeployTableViewCellBySection5Block(indexPath_section) \
    if (indexPath_section == 0) {\
        if (tableViewCellBlock0) return tableViewCellBlock0();\
        ReturnJobsBaseTableViewCell\
    }else if (indexPath_section == 1){\
        if (tableViewCellBlock1) return tableViewCellBlock1();\
        ReturnJobsBaseTableViewCell\
    }else if (indexPath_section == 2){\
        if (tableViewCellBlock2) return tableViewCellBlock2();\
        ReturnJobsBaseTableViewCell\
    }else if(indexPath_section == 3){\
        if (tableViewCellBlock3) return tableViewCellBlock3();\
        ReturnJobsBaseTableViewCell\
    }else if(indexPath_section == 4){\
        if (tableViewCellBlock4) return tableViewCellBlock4();\
        ReturnJobsBaseTableViewCell\
    }
#endif
/// 5 个 Section 的UITableViewCell 或者UICollectionViewCell 部署策略
#ifndef JobsDeployCellBySection5Block
#define JobsDeployCellBySection5Block(indexPath_section) \
    if (indexPath_section == 0) {\
        if (cellBlock0) return cellBlock0();\
    }else if (indexPath_section == 1){\
        if (cellBlock1) return cellBlock1();\
    }else if (indexPath_section == 2){\
        if (cellBlock2) return cellBlock2();\
    }else if(indexPath_section == 3){\
        if (cellBlock3) return cellBlock3();\
    }else if(indexPath_section == 4){\
        if (cellBlock4) return cellBlock4();\
    }
#endif
/// 5 个 item 的UICollectionViewCell部署策略
#ifndef JobsDeployCollectionViewCellByItem5Block
#define JobsDeployCollectionViewCellByItem5Block(indexPath) \
    if (indexPath.item == 0) {\
        if (collectionViewCellBlock0) return collectionViewCellBlock0();\
        ReturnJobsBaseCollectionViewCell\
    }else if (indexPath.item == 1){\
        if (collectionViewCellBlock1) return collectionViewCellBlock1();\
        ReturnJobsBaseCollectionViewCell\
    }else if (indexPath.item == 2){\
        if (collectionViewCellBlock2) return collectionViewCellBlock2();\
        ReturnJobsBaseCollectionViewCell\
    }else if(indexPath.item == 3){\
        if (collectionViewCellBlock3) return collectionViewCellBlock3();\
        ReturnJobsBaseCollectionViewCell\
    }else if(indexPath.item == 4){\
        if (collectionViewCellBlock4) return collectionViewCellBlock4();\
        ReturnJobsBaseCollectionViewCell\
    }
#endif
/// 5 个 row 的UITableViewCell部署策略
#ifndef JobsDeployTableViewCellByRow5Block
#define JobsDeployTableViewCellByRow5Block(indexPath) \
    if (indexPath.row == 0) {\
        if (tableViewCellBlock0) return tableViewCellBlock0();\
        ReturnJobsBaseTableViewCell\
    }else if (indexPath.row == 1){\
        if (tableViewCellBlock1) return tableViewCellBlock1();\
        ReturnJobsBaseTableViewCell\
    }else if (indexPath.row == 2){\
        if (tableViewCellBlock2) return tableViewCellBlock2();\
        ReturnJobsBaseTableViewCell\
    }else if(indexPath.row == 3){\
        if (tableViewCellBlock3) return tableViewCellBlock3();\
        ReturnJobsBaseTableViewCell\
    }else if(indexPath.row == 4){\
        if (tableViewCellBlock4) return tableViewCellBlock4();\
        ReturnJobsBaseTableViewCell\
    }
#endif

#endif /* JobsDeployDataForCellHeader_h */
