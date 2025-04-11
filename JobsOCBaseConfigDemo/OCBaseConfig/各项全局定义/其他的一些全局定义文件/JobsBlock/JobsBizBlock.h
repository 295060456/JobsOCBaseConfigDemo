//
//  JobsBizBlock.h
//  FM
//
//  Created by Admin on 6/3/2025.
//
/// 关于业务（不与JobsOCBaseConfigDemo同步）
#ifndef JobsBizBlock_h
#define JobsBizBlock_h

@class JobsTabBarVC;
typedef void(^jobsByTabBarVCBlock)(__kindof JobsTabBarVC *_Nullable tabBarVC);

@class JobsCustomTabBarVC;
typedef void(^jobsByCustomTabBarVCBlock)(__kindof JobsCustomTabBarVC *_Nullable tabBarVC);

@class JobsCustomTabBarConfig;
typedef void(^jobsByCustomTabBarConfigBlock)(__kindof JobsCustomTabBarConfig *_Nullable tabBarConfig);

@class KYCModel;
typedef void(^jobsByKYCModelBlock)(__kindof KYCModel *_Nullable model);

@class FMTableHeaderView1;
typedef void(^jobsByTableHeaderView1Block)(__kindof FMTableHeaderView1 *_Nullable tableHeaderView);

@class FMBannerAdsModel;
@class WMZBannerParam;
@class JobsBtnStyleCVCell;
typedef void(^jobsByBannerAdsModelBlock)(__kindof FMBannerAdsModel *_Nullable data);
typedef void(^jobsByBannerAdsModelAndCellBlock)(__kindof FMBannerAdsModel *_Nullable
                                                data,JobsBtnStyleCVCell *_Nonnull cell);

typedef WMZBannerParam *_Nonnull(^JobsReturnWMZBannerParamByArrBlock)(__kindof NSMutableArray <FMBannerAdsModel *>*_Nullable data);
typedef WMZBannerParam *_Nonnull(^JobsReturnWMZBannerParamByArrAndADTypeBlock)(__kindof NSMutableArray <FMBannerAdsModel *>*_Nullable data,FMAdsType ADType);
typedef void(^jobsByWMZBannerParamBlock)(WMZBannerParam *_Nullable data);

@class JobsMsgDataModel;
typedef void(^jobsByMsgDataModelBlock)(__kindof JobsMsgDataModel *_Nullable data);

@class JobsToggleBaseView;
typedef JobsToggleBaseView *_Nonnull(^JobsReturnToggleBaseViewByArrBlock)(NSMutableArray *_Nullable data);

@class FM_updatePassword_model;
typedef void(^jobsByUpdatePasswordModelBlock)(__kindof FM_updatePassword_model *_Nullable data);

@class FMLikeModel;
typedef void(^jobsByLikeModelBlock)(__kindof FMLikeModel *_Nullable data);

@class FMKYCInfoModel;
typedef void(^jobsByKYCInfoModelBlock)(__kindof FMKYCInfoModel *_Nullable data);

@class FMHotGameListModel;
typedef void(^jobsByHotGameListModelBlock)(__kindof FMHotGameListModel *_Nullable data);

@class FMGameHomeSubMobileModel;
typedef void(^jobsByGameHomeSubMobileModelBlock)(__kindof FMGameHomeSubMobileModel *_Nullable data);

@class FMInboxModel;
typedef void(^jobsByInboxModelBlock)(__kindof FMInboxModel *_Nullable inboxModel);

@class FMInboxTitleModel;
typedef void(^jobsByInboxTitleModelBlock)(__kindof FMInboxTitleModel *_Nullable inboxTitleModel);

@class FMSubjectModel;
typedef void(^jobsBySubjectModelBlock)(__kindof FMSubjectModel *_Nullable subjectModel);

@class FMDateModel;
typedef void(^jobsByFMDateModelBlock)(__kindof FMDateModel *_Nullable dateModel);

@class FMTypeModel;
typedef void(^jobsByTypeModelBlock)(__kindof FMTypeModel *_Nullable typeModel);

@class FMMyBetOrderDetailModel;
typedef void(^jobsByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable data);

@class FMPagerModel;
typedef void(^jobsByPagerModelBlock)(__kindof FMPagerModel *_Nullable data);

@class FMReportTradeModel;
typedef void(^jobsByReportTradeModelBlock)(__kindof FMReportTradeModel *_Nullable model);

@class FMMyBetOrderDetailModel;
typedef void(^jobsByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable data);
typedef JobsExcelConfigureViewModel *_Nullable(^JobsReturnExcelConfigureDataByMyBetOrderDetailModelBlock)(__kindof FMMyBetOrderDetailModel *_Nullable data);
typedef JobsExcelConfigureViewModel *_Nullable(^JobsReturnExcelConfigureDataByReportTradeModelBlock)(__kindof FMReportTradeModel *_Nullable data);

@class FMBankDataSubModel;
typedef void(^jobsByBankDataSubModelBlock)(__kindof FMBankDataSubModel *_Nullable subModel);

@class FMBankDataModel;
typedef void(^jobsByBankDataModelBlock)(__kindof FMBankDataModel *_Nullable model);

@class FMMyGameBetOrderSumModel;
typedef void(^jobsByMyGameBetOrderSumModelBlock)(__kindof FMMyGameBetOrderSumModel *_Nullable model);

@class GetDepositDiscountActivityRecordModel;
typedef UIViewModel *_Nullable(^jobsByGetDepositDiscountActivityRecordModelBlock)(__kindof GetDepositDiscountActivityRecordModel *_Nullable model);

@class FMAccModel;
typedef FMAccModel *_Nullable(^JobsReturnAccModelByArrBlock)(__kindof NSArray *_Nullable arr);
typedef void(^jobsByFMAccModelBlock)(__kindof FMAccModel *_Nullable model);

#endif /* JobsBizBlock_h */
