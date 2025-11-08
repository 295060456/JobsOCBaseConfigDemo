//
//  JobsBizBlock.h
//  FM
//
//  Created by Admin on 6/3/2025.
//
/// 关于业务（不与JobsOCBaseConfigDemo同步）

#import "JobsBlockDef.h"

#ifndef JobsBizBlock_h
#define JobsBizBlock_h

@class JobsFirstCommentCustomCofigModel;
typedef void(^jobsByFirstCommentCustomCofigModelBlock)(__kindof JobsFirstCommentCustomCofigModel *_Nullable model);
@class JobsCommentModel;
typedef void(^jobsByCommentModelBlock)(__kindof JobsCommentModel *_Nullable model);
@class JobsFirstCommentModel;
typedef void(^jobsByFirstCommentModelBlock)(__kindof JobsFirstCommentModel *_Nullable model);
@class JobsChildCommentModel;
typedef void(^jobsByChildCommentModelBlock)(__kindof JobsChildCommentModel *_Nullable model);

@class MSCommentDetailModel;
@class MSCommentModel;
typedef void(^jobsByMSCommentDetailModelBlock)(MSCommentDetailModel *_Nullable model);
typedef void(^jobsByMSCommentModelBlock)(MSCommentModel *_Nullable model);

@class JobsIMListDataModel;
typedef void(^jobsByIMListDataModelBlock)(__kindof JobsIMListDataModel *_Nullable model);

@class TMSCollectionViewLayout;
typedef void(^jobsByTMSCollectionViewLayoutBlock)(__kindof TMSCollectionViewLayout *_Nullable layout);

@class FMHomeMainBizSubView;
typedef void(^jobsByBizSubViewBlock)(__kindof FMHomeMainBizSubView *_Nullable subView);

@class KYCModel;
typedef void(^jobsByKYCModelBlock)(__kindof KYCModel *_Nullable model);

@class FMTableHeaderView1;
typedef void(^jobsByTableHeaderView1Block)(__kindof FMTableHeaderView1 *_Nullable tableHeaderView);

@class ThreeClassCell;
typedef void(^jobsByThreeClassCellBlock)(__kindof ThreeClassCell *_Nullable cell);

@class GoodsClassModel;
typedef void(^jobsByGoodsClassModelBlock)(GoodsClassModel *_Nullable model);
typedef __kindof GoodsClassModel *_Nullable(^JobsReturnGoodsClassModelByIntBlock)(int data);
typedef __kindof GoodsClassModel *_Nullable(^JobsReturnGoodsClassModelByInt2Block)(Jobs_ReturnGoodsClassModelByInt2Block_Arguments);
typedef __kindof GoodsClassModel *_Nullable(^JobsReturnGoodsClassModelByIntStringBlock)(Jobs_ReturnGoodsClassModelByIntStringBlock_Arguments);

@class FMBannerAdsModel;
@class WMZBannerParam;
@class JobsBtnStyleCVCell;
typedef void(^jobsByBannerAdsModelBlock)(__kindof FMBannerAdsModel *_Nullable model);
typedef void(^jobsByBannerAdsModelAndCellBlock)(Jobs_ByBannerAdsModelAndCellBlock_Arguments);

typedef WMZBannerParam *_Nonnull(^JobsReturnWMZBannerParamByArrBlock)(__kindof NSArray <FMBannerAdsModel *>*_Nullable models);
typedef WMZBannerParam *_Nonnull(^JobsReturnWMZBannerParamByArrAndADTypeBlock)(__kindof NSArray <FMBannerAdsModel *>*_Nullable models,FMAdsType ADType);
typedef void(^jobsByWMZBannerParamBlock)(WMZBannerParam *_Nullable data);

@class JobsMsgDataModel;
typedef void(^jobsByMsgDataModelBlock)(__kindof JobsMsgDataModel *_Nullable model);

@class JobsToggleBaseView;
typedef JobsToggleBaseView *_Nonnull(^JobsReturnToggleBaseViewByArrBlock)(__kindof NSArray *_Nullable arr);

@class FM_updatePassword_model;
typedef void(^jobsByUpdatePasswordModelBlock)(__kindof FM_updatePassword_model *_Nullable model);

@class FMLikeModel;
typedef void(^jobsByLikeModelBlock)(__kindof FMLikeModel *_Nullable model);

@class FMKYCInfoModel;
typedef void(^jobsByKYCInfoModelBlock)(__kindof FMKYCInfoModel *_Nullable model);

@class FMHotGameListModel;
typedef void(^jobsByHotGameListModelBlock)(__kindof FMHotGameListModel *_Nullable model);

@class FMGameHomeSubMobileModel;
typedef void(^jobsByGameHomeSubMobileModelBlock)(__kindof FMGameHomeSubMobileModel *_Nullable model);

@class FMInboxModel;
typedef void(^jobsByInboxModelBlock)(__kindof FMInboxModel *_Nullable model);

@class FMInboxTitleModel;
typedef void(^jobsByInboxTitleModelBlock)(__kindof FMInboxTitleModel *_Nullable model);

@class FMSubjectModel;
typedef void(^jobsBySubjectModelBlock)(__kindof FMSubjectModel *_Nullable model);

@class FMDateModel;
typedef void(^jobsByFMDateModelBlock)(__kindof FMDateModel *_Nullable model);

@class FMTypeModel;
typedef void(^jobsByTypeModelBlock)(__kindof FMTypeModel *_Nullable model);

@class FMMyBetOrderDetailModel;
typedef void(^jobsByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable model);

@class FMPagerModel;
typedef void(^jobsByPagerModelBlock)(__kindof FMPagerModel *_Nullable model);

@class FMReportTradeModel;
typedef void(^jobsByReportTradeModelBlock)(__kindof FMReportTradeModel *_Nullable model);

@class FMMyBetOrderDetailModel;
typedef void(^jobsByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable model);
typedef JobsExcelConfigureViewModel *_Nullable(^JobsReturnExcelConfigureDataByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable model);
typedef JobsExcelConfigureViewModel *_Nullable(^JobsReturnExcelConfigureDataByReportTradeModelBlock)(__kindof FMReportTradeModel *_Nullable model);

@class FMBankDataSubModel;
typedef void(^jobsByBankDataSubModelBlock)(__kindof FMBankDataSubModel *_Nullable model);

@class FMBankDataModel;
typedef void(^jobsByBankDataModelBlock)(__kindof FMBankDataModel *_Nullable model);

@class FMMyGameBetOrderSumModel;
typedef void(^jobsByMyGameBetOrderSumModelBlock)(__kindof FMMyGameBetOrderSumModel *_Nullable model);

@class GetDepositDiscountActivityRecordModel;
typedef UIViewModel *_Nullable(^jobsByGetDepositDiscountActivityRecordModelBlock)(__kindof GetDepositDiscountActivityRecordModel *_Nullable model);

@class FMAccModel;
typedef FMAccModel *_Nullable(^JobsReturnAccModelByArrBlock)(__kindof NSArray *_Nullable arr);
typedef void(^jobsByFMAccModelBlock)(__kindof FMAccModel *_Nullable model);

@class KYCBaseView;
typedef __kindof KYCBaseView *_Nullable(^JobsReturnKYCBaseViewByStatusBlock)(VerificationStatus status);
typedef __kindof UIScrollView *_Nullable(^JobsReturnScrollViewByStatusBlock)(VerificationStatus status);

@class PhilippinesModel;
typedef void(^jobsByVMArrBlock)(__kindof NSMutableArray<__kindof UIViewModel *> * _Nullable models);
typedef void(^jobsByPhilippinesModelsBlocks)(jobsByVMArrBlock _Nullable completionBlock);


#endif /* JobsBizBlock_h */
