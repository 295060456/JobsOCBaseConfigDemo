//
//  NSObject+URLManager_6.h
//  FM
//
//  Created by User on 10/11/24.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extras.h"
#import "URLManagerModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 来自  http://18.162.73.145:19201/doc.html#/home
@interface NSObject (URLManager_6)
#pragma mark —— C2C-充提黑名单
/// 新增C2C充提黑名单@POST
-(URLManagerModel *)post_fund_c2c_dw_blackList_add;
/// 修改C2C充提黑名单状态@PUT
-(URLManagerModel *)put_fund_c2c_dw_blackList_change_status;
/// 删除C2C充提黑名单@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_c2c_dw_blackList_deleteByID;
/// 查询C2C充提黑名单列表@GET
-(URLManagerModel *)get_fund_c2c_dw_blackList_list;
#pragma mark —— C2C-存取款占比
/// 新增C2C存取款占比配置@POST
-(URLManagerModel *)post_fund_c2c_dwRatio_add;
/// 删除C2C存取款占比配置@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_fund_c2c_dwRatio_deleteBy;
/// 修改C2C存取款占比配置@PUT
-(URLManagerModel *)put_fund_c2c_dwRatio_edit;
/// 获取C2C存取款占比配置详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_c2c_dwRatio_getInfoByID;
/// 查询C2C存取款占比配置列表@GET
-(URLManagerModel *)get_fund_c2c_dwRatio_list;
#pragma mark —— C2C-提款搁置列表
/// 批量操作搁置订单@POST
-(URLManagerModel *)post_fund_c2c_withdraw_hold_batch_update;
/// 查询C2C提款搁置列表@GET
-(URLManagerModel *)get_fund_c2c_withdraw_hold_list;
#pragma mark —— C2C-提款搁置设置
/// 修改C2C提现风控配置@PUT
-(URLManagerModel *)put_fund_c2c_risk_config_edit;
/// 获取C2C提现风控配置信息@GET
-(URLManagerModel *)get_fund_c2c_risk_config_getInfo;
#pragma mark —— C2C-提现拆单开关设置
/// 拆单开关状态修改@PUT
-(URLManagerModel *)put_fund_c2c_split_switch_edit;
/// 查询拆单开关状态@GET
-(URLManagerModel *)get_fund_c2c_split_switch_status;
#pragma mark —— C2C-提现拆单配置
/// 新增C2C提现拆单规则配置@POST
-(URLManagerModel *)post_fund_c2c_split_rule_add;
/// 删除C2C提现拆单规则配置@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_fund_c2c_split_rule_deleteByID;
/// 修改C2C提现拆单规则配置@PUT
-(URLManagerModel *)put_fund_c2c_split_switch_status;
/// 查询C2C提现拆单规则配置列表@GET
-(URLManagerModel *)get_fund_c2c_split_rule_list;
#pragma mark —— C2C-提现风控配置日志
/// 查询C2C提现风控配置日志列表@GET
-(URLManagerModel *)get_fund_c2c_risk_config_log_list;
#pragma mark —— PH_AGT-代理转账审核接口
/// 保存代理转账@POST
-(URLManagerModel *)post_agent_agentTransferAudit_agentTransferSave;
/// 代理转账一审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentTransferAudit_firstPassOrRejection;
/// 查询代理转账审核列表@POST
-(URLManagerModel *)post_agent_agentTransferAudit_getAgentTransferAuditList;
/// 代理转账二审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentTransferAudit_secondPassOrRejection;
#pragma mark —— PH_AGT-配置中心_代存转账配置
/// 代存转账配置-查询@POST
-(URLManagerModel *)post_configs_deposit_list;
/// 代存转账配置-编辑@PUT
-(URLManagerModel *)put_configs_deposit_saveOrUpdate;
#pragma mark —— PH_AGT-配置中心_帮助中心(内容)
/// 帮助中心-查询问题分类@POST
-(URLManagerModel *)post_config_help_center_classify_lists;
/// 帮助中心-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)config_help_center_deleteByID;
/// 帮助中心-查询@POST
-(URLManagerModel *)post_config_help_center_list;
/// 帮助中心-新增@POST
-(URLManagerModel *)post_config_help_center_save;
/// 帮助中心-编辑@POST
-(URLManagerModel *)post_config_help_center_update;
#pragma mark —— PH_AGT-配置中心_帮助中心(分类)
/// 帮助中心分类问题-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_config_help_center_classify_deleteByID;
/// 帮助中心分类问题-查询@POST
-(URLManagerModel *)post_config_help_center_classify_list;
/// 帮助中心分类问题-新增@POST
-(URLManagerModel *)post_config_help_center_classify_save;
/// 帮助中心分类问题-编辑@POST
-(URLManagerModel *)post_config_help_center_classify_update;
#pragma mark —— PH_AGT-配置中心_提现配置
/// 提款配置-查询@POST
-(URLManagerModel *)post_configs_withdrawal_list;
/// 提款配置-编辑@PUT
-(URLManagerModel *)put_configs_withdrawal_saveOrUpdate;
#pragma mark —— PH_AGT-配置中心_标签关系配置
/// 新增代理标签关系@POST
-(URLManagerModel *)post_configs_tags_ref_add;
/// 删除代理标签关系@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_configs_tags_ref_deleteByID;
/// 获取代理标签信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_configs_tags_ref_getAgentTagRefListByAgentId;
/// 获取代理所有标签信息@GET
-(URLManagerModel *)get_configs_tags_ref_getAllTagList;
#pragma mark —— PH_AGT-配置中心_标签配置
/// 删除标签@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_configs_tags_deleteByID;
/// 查询标签用户数列表@POST
-(URLManagerModel *)post_configs_tags_getTagAgentList;
/// 查询标签列表@POST
-(URLManagerModel *)post_configs_tags_getTagList;
/// 新增标签@POST
-(URLManagerModel *)post_configs_tags_save;
/// 修改标签@POST
-(URLManagerModel *)post_configs_tags_update;
#pragma mark —— PH_AGT-配置中心_联系方式配置
/// 代理后台帮助中心联系方式查询@POST
-(URLManagerModel *)post_configs_contact_getContactListForHelp;
/// 联系方式配置-查询@POST
-(URLManagerModel *)post_configs_contact_list;
/// 联系方式配置-查询@POST
-(URLManagerModel *)post_configs_contact_list_noLogin;
/// 联系方式配置-查询@POST
-(URLManagerModel *)post_configs_contact_saveOrUpdate;
#pragma mark —— PH_AGT-门店设备所有相关接口
/// 删除门店设备@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_store_device_info_deleteByID;
/// 查询门店设备列表@POST
-(URLManagerModel *)post_store_device_info_getStoreDeviceInfoList;
/// 新增门店设备@POST
-(URLManagerModel *)post_store_device_info_save;
/// 修改门店设备@PUT
-(URLManagerModel *)put_store_device_info_update;
#pragma mark —— PH_AGT-门店资讯接口
/// 查询ip所属区域名称@POST
-(URLManagerModel *)post_ip_region_getRegion;
/// 删除门店@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_store_info_deleteByID;
/// 查询门店列表@POST
-(URLManagerModel *)post_store_info_getStoreIfoByStoreId;
/// 查询门店列表@POST
-(URLManagerModel *)post_store_info_getStoreIfoList;
/// 新增门店@POST
-(URLManagerModel *)post_store_info_save;
/// 修改门店@PUT
-(URLManagerModel *)put_store_info_update;
/// 修改门店为停业@PUT
-(URLManagerModel *)put_store_info_update_forstop;
#pragma mark —— VIP变更记录接口
/// 会员VIP等级自动降级--后台任务测试用@GET
-(URLManagerModel *)get_member_vipLog_dwMemberVipLevel;
/// 查询会员VIP变更列表@GET
-(URLManagerModel *)get_member_vipLog_list;
/// 查询某一个会员VIP变更列表@GET
-(URLManagerModel *)get_member_vipLog_memberList;
/// 会员VIP等级自动升级--后台任务测试用@GET
-(URLManagerModel *)get_member_vipLog_upMemberVipLevel;
/// upMemberVipZero@POST
-(URLManagerModel *)post_member_vipLog_upMemberVipZero;
#pragma mark —— VIP权益配置接口
/// 查询VIP权益配置列表@GET
-(URLManagerModel *)get_vipRights_list;
/// 查询vip开关配置---对外提供的接口@GET
-(URLManagerModel *)get_vipRights_queryVipSwitchConfig;
/// 查询VIP权益配置列表--对外提供的接口@POST
-(URLManagerModel *)post_vipRights_rightsList;
/// 保存VIP权益配置@PUT
-(URLManagerModel *)put_vipRights_save;
/// 修改权益开关状态@PUT
-(URLManagerModel *)put_vipRights_update_status;
#pragma mark —— VIP等级配置内部服务接口
/// getVipLevelConfig@GET
-(URLManagerModel *)get_vip_api_levelConfigByTenantId:(NSString *)tenantId
                                             vipLevel:(NSString *)vipLevel;
#pragma mark —— VIP等级配置接口
/// 保存VIP等级配置@PUT
-(URLManagerModel *)put_member_vipLevel_edit;
/// 查询VIP等级配置列表--对外接口@POST
-(URLManagerModel *)post_member_vipLevel_levelList;
/// 查询VIP等级配置列表@GET
-(URLManagerModel *)get_member_vipLevel_list;
/// 查询所有VIP等级@GET
-(URLManagerModel *)get_member_vipLevel_selectAll;
#pragma mark —— VIP返水配置接口
/// 根据等级获取VIP返水子项配置--代理服务用@POST
-(URLManagerModel *)post_vipRebate_getConfigByLevel;
/// 查询VIP返水配置列表@GET
-(URLManagerModel *)get_vipRebate_list;
/// 查询VIP返水配置子项@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_vipRebate_queryConfigItem;
/// 查询VIP返水配置列表--对外提供的接口@POST
-(URLManagerModel *)post_vipRebate_rebateList;
/// 修改VIP返水配置@PUT
-(URLManagerModel *)put_vipRebate_save;
/// 保存VIP返水配置子项@POST
-(URLManagerModel *)post_vipRebate_saveConfigItem;
/// 修改返水开关状态@PUT
-(URLManagerModel *)put_vipRebate_update_status;
/// 修改返水提款流水倍数@PUT
-(URLManagerModel *)put_vipRebate_updateRebateMultiple;
#pragma mark —— activity-report-controller
/// 查询新手大礼包记录@POST
-(URLManagerModel *)post_activity_newbie_gift_record_list;
/// 导出新手大礼包记录@POST
-(URLManagerModel *)post_activity_newbie_gift_record_list_export;
/// 查询新手活动总详情@POST
-(URLManagerModel *)post_activity_newbie_record_list;
/// 导出活动总详情@POST
-(URLManagerModel *)post_activity_newbie_record_list_export;
/// 导出活动总详情@POST
-(URLManagerModel *)post_activity_newbie_report_export;
/// 查询新手活动统计报表@POST
-(URLManagerModel *)post_activity_newbie_report_list;
/// 查询复活大礼包记录@POST
-(URLManagerModel *)post_activity_resurrection_gift_record_list;
/// 导出复活大礼包记录@POST
-(URLManagerModel *)post_activity_resurrection_gift_record_list_export;
/// 查询签到大礼包记录@POST
-(URLManagerModel *)post_activity_sign_gift_record_list;
/// 导出签到大礼包记录@POST
-(URLManagerModel *)post_activity_sign_gift_record_list_export;
/// 查询签到记录@POST
-(URLManagerModel *)post_activity_sign_record_list;
/// 导出签到记录@POST
-(URLManagerModel *)post_activity_sign_record_list_export;
#pragma mark —— agent-auto-package-controller
/// 保存自动打包信息@POST
-(URLManagerModel *)post_agent_autoPackage_saveAutoPackageInfo;
#pragma mark —— member-kyc-controller
/// 查询用户KYC认证信息详情@GET
-(URLManagerModel *)get_member_kyc_detail;
/// 用户KYC认证信息编辑@POST
-(URLManagerModel *)post_member_kyc_edit;
/// 查询KYC列表@POST
-(URLManagerModel *)post_member_kyc_page_list;
/// 用户KYC认证信息重置@GET
-(URLManagerModel *)get_member_kyc_reset;
/// 查询KYC审核记录@GET
-(URLManagerModel *)get_member_kyc_review_list;
/// 用户KYC认证信息审批@POST
-(URLManagerModel *)post_member_kyc_review_option;
#pragma mark —— report-user-controller
-(URLManagerModel *)get_oms_report_user_heartBeatSaveLogin;
#pragma mark —— 专家信息接口
/// 删除专家信息@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_expert_info_deleteByID;
/// 获取专家信息详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_expert_info_getInfoByID;
/// 查询专家信息列表@GET
-(URLManagerModel *)get_expert_info_list;
/// 新增专家信息@POST
-(URLManagerModel *)post_expert_info_save;
/// 修改专家信息@PUT
-(URLManagerModel *)put_expert_info_update;
/// 删除专家爆料方案信息@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_expert_plan_deleteByID;
/// 获取专家爆料方案信息详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_expert_plan_getInfoByID;
/// 查询专家爆料方案信息列表@GET
-(URLManagerModel *)get_expert_plan_list;
/// 新增专家爆料方案信息@POST
-(URLManagerModel *)post_expert_plan_save;
/// 修改专家爆料方案信息@PUT
-(URLManagerModel *)put_expert_plan_update;
#pragma mark —— 业务字典国际化管理
/// 创建字典类型@POST
-(URLManagerModel *)post_oms_dict_bussiness_add;
/// 删除业务字典类型@GET
-(URLManagerModel *)get_oms_dict_bussiness_delete;
/// 修改业务字典类型@POST
-(URLManagerModel *)post_oms_dict_bussiness_edit;
/// 获得字典类型的分页列表@GET
-(URLManagerModel *)get_oms_dict_bussiness_list;
#pragma mark —— 个人中心接口
/// 获取个人信息@GET
-(URLManagerModel *)get_user_profile;
/// 修改个人信息@PUT
-(URLManagerModel *)put_user_profile;
/// 修改用户头像@POST
-(URLManagerModel *)post_user_profile_avatar;
/// 修改密码@PUT
-(URLManagerModel *)put_user_profile_updatePwd;
#pragma mark —— 中心钱包
/// 一键回收@POST
-(JobsReturnURLManagerModelByStringBlock _Nonnull)post_fund_wallet_collectWalletByUserName;
/// 获取会员与转账场馆余额@POST
-(JobsReturnURLManagerModelByStringBlock _Nonnull)post_fund_wallet_getMemberWallet;
/// 转入@POST
-(URLManagerModel *)post_fund_wallet_transferIn;
#pragma mark —— 主播动态接口
/// 删除主播动态@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_presenter_dynamics_deleteByID;
/// 获取主播动态详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_presenter_dynamics_getInfo;
/// 查询主播动态列表@GET
-(URLManagerModel *)get_presenter_dynamics_list;
/// 新增主播动态@POST
-(URLManagerModel *)post_presenter_dynamics_save;
/// 修改主播动态@PUT
-(URLManagerModel *)put_presenter_dynamics_update;
#pragma mark —— 主播管理接口
/// 删除超管信息@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_managerdelete;
/// 导出超管信息列表@POST
-(URLManagerModel *)post_manager_export;
/// 获取超管详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_manager_getInfoByID;
/// 查询超管信息列表@GET
-(URLManagerModel *)get_manager_list;
/// 新增超管信息@POST
-(URLManagerModel *)post_manager_save;
/// 修改超管信息@PUT
-(URLManagerModel *)put_manager_update;
/// 删除主播信息@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_presenter_delete;
/// 导出主播信息列表@POST
-(URLManagerModel *)post_presenter_export;
/// 获取主播详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_presenter_getInfoByID;
/// 查询主播信息列表@GET
-(URLManagerModel *)get_presenter_list;
/// 新增主播信息@POST
-(URLManagerModel *)post_presenter_save;
/// 修改主播信息@PUT
-(URLManagerModel *)put_presenter_update;
#pragma mark —— 代理-代理配置-所有接口
/// 银行管理 禁用或者开启【 0、禁用】【1、开启】@PUT
-(URLManagerModel *)put_agent_config_bank_ban;
/// 银行管理-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_config_bank_deleteByID;
/// 银行管理-查询@POST
-(URLManagerModel *)post_agent_config_bank_list;
/// 银行管理-新增@POST
-(URLManagerModel *)post_agent_config_bank_save;
/// 银行管理-编辑@PUT
-(URLManagerModel *)put_agent_config_bank_update;
/// 帮助中心分类问题-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_config_classify_deleteByID;
/// 帮助中心分类问题-查询@POST
-(URLManagerModel *)post_agent_config_classify_list;
/// 帮助中心分类问题-新增@POST
-(URLManagerModel *)post_agent_config_classify_save;
/// 帮助中心分类问题-编辑@PUT
-(URLManagerModel *)put_agent_config_classify_update;
/// 佣金配置-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_config_commission_deleteByID;
/// 佣金配置-新增初始化@POST
-(URLManagerModel *)post_agent_config_commission_init;
/// 佣金配置-查询@GET
-(URLManagerModel *)get_agent_config_commission_init;
/// 佣金算法配置-查询@GET
-(URLManagerModel *)get_agent_config_commission_math_list;
/// 佣金算法配置-编辑@PUT
-(URLManagerModel *)put_agent_config_commission_math_update;
/// 佣金配置-新增@POST
-(URLManagerModel *)post_agent_config_commission_save;
/// 佣金配置-编辑-不含场馆费率@PUT
-(URLManagerModel *)put_agent_config_commission_update;
/// 佣金配置-编辑-场馆费率@PUT
-(URLManagerModel *)put_agent_config_commission_update_venue;
/// 代存配置-查询@GET
-(URLManagerModel *)get_agent_config_common_deposit_list;
/// 代存配置-编辑@PUT
-(URLManagerModel *)put_agent_config_common_deposit_update;
/// 提现汇率配置-查询@GET
-(URLManagerModel *)get_agent_config_common_rate_list;
/// 提现汇率配置-编辑@PUT
-(URLManagerModel *)put_agent_config_common_rate_update;
/// 代理相关配置-查询@GET
-(URLManagerModel *)get_agent_config_common_relation_list;
/// 代理相关配置-编辑@PUT
-(URLManagerModel *)put_agent_config_common_relation_update;
/// 提现方式配置-查询@GET
-(URLManagerModel *)get_agent_config_common_type_list;
/// 提现方式配置-编辑@PUT
-(URLManagerModel *)put_agent_config_common_type_update;
/// 佣金配置-场馆费列表@GET
-(URLManagerModel *)get_agent_config_getGameLobbyList;
/// 帮助中心-查询问题分类@POST
-(URLManagerModel *)post_agent_config_help_classify_list;
/// 帮助中心-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_config_help_deleteByID;
/// 帮助中心-查询@POST
-(URLManagerModel *)post_agent_config_help_list;
/// 帮助中心-新增@POST
-(URLManagerModel *)post_agent_config_help_save;
/// 帮助中心-编辑@PUT
-(URLManagerModel *)put_agent_config_help_update;
/// 出款通道-禁用或者开启@PUT
-(URLManagerModel *)put_agent_config_outward_ban;
/// 出款通道-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_config_outward_deleteByID;
/// 出款通道-查询@POST
-(URLManagerModel *)post_agent_config_outward_list;
/// 出款通道-新增@POST
-(URLManagerModel *)post_agent_config_outward_save;
/// 出款通道-编辑@PUT
-(URLManagerModel *)put_agent_config_outward_update;
/// 佣金配置-同步场馆费@POST
-(URLManagerModel *)post_agent_config_synchronizeVenueRate;
#pragma mark —— 代理代存记录接口
/// 查询代理存款记录@POST
-(URLManagerModel *)post_agent_depositRecord_getDepositRecord;
/// 查询代存记录列表@POST
-(URLManagerModel *)post_agent_depositRecord_getDepositRecordList;
/// 更新代理存款记录状态@POST
-(URLManagerModel *)post_agent_depositRecord_updateDepositRecordStatus;
#pragma mark —— 代理代理接口
/// 查询代理树形列表@GET
-(URLManagerModel *)get_agent_agentProxy_getCommissionAuditAgentProxyList;
/// 查询代理代理列表@GET
-(URLManagerModel *)get_agent_agentProxy_getSuperiorAgentProxyList;
/// 根据佣金审核id查询代理@GET
-(URLManagerModel *)get_agent_agentProxy_queryByAuditId;
/// 根据代理id获取下级代理数据@GET
-(URLManagerModel *)get_agent_agentProxy_querySubAgentByAgentId;
#pragma mark —— 代理佣金审核接口
/// 佣金一审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_commissionRecordAudit_firstPassOrRejection;
/// 查询佣金方案详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_commissionRecordAudit_getCommissionRebateDetailInfoByID;
/// 查询佣金审核列表@POST
-(URLManagerModel *)post_agent_commissionRecordAudit_getCommissionRecordAuditList;
/// 查询佣金场馆费列表@POST
-(URLManagerModel *)post_agent_commissionRecordAudit_getCommissionVenueRateList;
/// 查询公司输赢调整列表@GET
-(URLManagerModel *)get_agent_commissionRecordAudit_getCompanyProfitAndLossAdjustRecordList;
/// 查询佣金审核详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_commissionRecordAudit_getDetailInfoByID;
/// 查询下级代理佣金记录列表@POST
-(URLManagerModel *)post_agent_commissionRecordAudit_getSubProxyCommissionDetailList;
/// 佣金二审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_commissionRecordAudit_secondPassOrRejection;
#pragma mark —— 代理佣金记录明细接口
/// 查询佣金记录列表@POST
-(URLManagerModel *)post_agent_commissionDetail_getCommissionDetailList;
/// 查询场馆费明细列表@POST
-(URLManagerModel *)post_agent_commissionDetail_getVenueFeeDetail;
#pragma mark —— 代理佣金调加减录接口
/// 新增佣金加减记录@POST
-(URLManagerModel *)post_agent_commissionAddSubRecord_add;
/// 查询佣金加减记录列表@POST
-(URLManagerModel *)post_agent_commissionAddSubRecord_getCommissionAddSubRecordList;
#pragma mark —— 代理信息调整审核接口
/// 代理信息调整审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentInfoAdjustAudit_auditPassOrRejection;
/// 查询佣金加减记录列表@POST
-(URLManagerModel *)post_agent_agentInfoAdjustAudit_getAgentInfoAdjustAuditList;
#pragma mark —— 代理公告配置接口
/// 删除代理公告@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_notice_config_deleteByIDList;
/// 获取代理详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_notice_config_getAgentNoticeDetailByID;
/// 获取公告未读条数@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_notice_config_getAgentNoticeUnreadByAgentName;
/// 查询代理公告列表@POST
-(URLManagerModel *)post_agent_notice_config_getNoticeList;
/// 新增代理公告@POST
-(URLManagerModel *)post_agent_notice_config_save;
/// 公告发送@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_notice_config_sendNoticeByID;
/// 修改代理公告@PUT
-(URLManagerModel *)put_agent_notice_config_update;
#pragma mark —— 代理备注接口
/// 新增代理备注@POST
-(URLManagerModel *)post_agent_agentRemark_add;
/// 查询代理备注列表@POST
-(URLManagerModel *)post_agent_agentRemark_getAgentRemarkList;
#pragma mark —— 代理提款风控审核接口-NEW
/// 提现审核通过或拒绝或搁置@POST
-(URLManagerModel *)post_agent_withdrawalAudit_auditPassOrRejectionOrShunt;
/// 获取提款审核详细信息@POST
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_withdrawalAudit_getWithdrawalAuditDetail;
/// 查询提款审核列表@POST
-(URLManagerModel *)post_agent_withdrawalAudit_getWithdrawalAuditList;
#pragma mark —— 代理新增审核接口
/// 代理新增审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentAddAudit_auditPassOrRejection;
/// 查询代理新增审核列表@POST
-(URLManagerModel *)post_agent_agentAddAudit_getAgentAddAuditList;
/// 查询代理新增审核详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_agentAddAudit_getDetailInfo;
#pragma mark —— 代理新增接口
/// 新增代理(运营后台)@POST
-(URLManagerModel *)post_agent_agentAdd_add;
/// 新增代理(会员pc)@POST
-(URLManagerModel *)post_agent_agentAdd_add_noLogin;
/// 查询佣金方案列表@GET
-(URLManagerModel *)get_agent_agentAdd_getCommissionRebateConfigList;
/// 查询上级代理账号@GET
-(URLManagerModel *)get_agent_agentAdd_queryAgentUsername;
/// 查询会员账号@GET
-(URLManagerModel *)get_agent_agentAdd_queryMemberByUsername;
#pragma mark —— 代理管理接口
/// 查询代理列表@POST
-(URLManagerModel *)post_agent_manage_agentList;
/// 查询代理直属活跃会员列表@POST
-(URLManagerModel *)post_agent_manage_agentSubActiveMemberList;
/// 查询代理直属下级列表@POST
-(URLManagerModel *)post_agent_manage_agentSubList;
/// 查询代理直属会员列表@POST
-(URLManagerModel *)post_agent_manage_agentSubMemberList;
/// 根据代理名模糊搜索@POST
-(URLManagerModel *)post_agent_manage_list;
/// 获取代理信息查询下级所有@GET
-(URLManagerModel *)get_agent_manage_queryActiveAgentInfo;
/// 获取代理信息@GET
-(URLManagerModel *)get_agent_manage_queryAgentInfo;
#pragma mark —— 代理记录-提款记录接口-NEW
/// 强制成功@PUT
-(URLManagerModel *)put_agent_withdrawalRecord_forcedSuccess;
/// 查询提现订单日志列表@POST
-(URLManagerModel *)post_agent_withdrawalRecord_getWithdrawalOrderLogList;
/// 查询代理取款记录@POST
-(URLManagerModel *)post_agent_withdrawalRecord_getWithdrawalRecord;
/// 获取提款记录详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_withdrawalRecord_getWithdrawalRecordDetail;
/// 获取代理提现订单信息@GET
-(URLManagerModel *)get_agent_withdrawalRecord_getWithdrawalRecordDetailByOrderNo;
/// 查询提款记录列表@POST
-(URLManagerModel *)post_agent_withdrawalRecord_getWithdrawalRecordList;
/// 人工出款@PUT
-(URLManagerModel *)put_agent_withdrawalRecord_manualPayout;
/// 拒绝出款@PUT
-(URLManagerModel *)put_agent_withdrawalRecord_paymentReject;
/// 代理三方出款回调通知@POST
-(URLManagerModel *)post_agent_withdrawalRecord_thirdCallBackNotify;
/// 通过出款@PUT
-(URLManagerModel *)put_agent_withdrawalRecord_thirdPayout;
/// 三方出款失败@PUT
-(URLManagerModel *)put_agent_withdrawalRecord_thirdPayoutFail;
/// 更新代理取款记录状态@POST
-(URLManagerModel *)post_agent_withdrawalRecord_updateWithdrawalRecordStatus;
#pragma mark —— 代理详情接口
/// 修改代理信息@POST
-(URLManagerModel *)post_agent_agentDetail_agentUpdateStatus;
/// 修改代理信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_agentDetail_clearAgentPaymentPassword;
/// 获取代理详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_agentDetail_getAgentDetail;
/// 获取代理详细信息根据代理账号@GET
-(URLManagerModel *)get_agent_agentDetail_getAgentDetailByAgentUserName;
/// 获取代理财务信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_agentDetail_getAgentFinanceInfo;
/// 查询代理登录列表@POST
-(URLManagerModel *)post_agent_agentDetail_getAgentLoginList;
/// 获取代理团队信息@POST
-(URLManagerModel *)post_agent_agentDetail_getAgentTeamInfo;
#pragma mark —— 代理账变记录接口
/// 代理账变记录@POST
-(URLManagerModel *)post_agent_wallet_operatorWalletRecord;
/// 查询账变记录列表@POST
-(URLManagerModel *)post_agent_walletRecord_getWalletRecordList;
#pragma mark —— 代理资金调整审核接口
/// 资金调整一审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_fundAdjustAudit_firstPassOrRejection;
/// 查询资金调整审核列表@POST
-(URLManagerModel *)post_agent_fundAdjustAudit_getFundAdjustAuditList;
/// 资金调整二审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_fundAdjustAudit_secondPassOrRejection;
#pragma mark —— 代理资金调整接口
/// 保存资金调整@POST
-(URLManagerModel *)post_agent_fundAdjust_fundAdjustSave;
/// 保存资金调整@POST
-(URLManagerModel *)post_agent_fundAdjust_getCreditWalletStatus;
/// 保存资金调整@POST
-(URLManagerModel *)post_agent_fundAdjust_getFundAdjustWalletBalance;
/// 保存资金调整@POST
-(URLManagerModel *)post_agent_fundAdjust_getTransferWalletBalance;
#pragma mark —— 代理转代审核接口
/// 代理转代申请@POST
-(URLManagerModel *)post_agent_agentTransformAudit_agentTransformAuditSave;
/// 代理转代一审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentTransformAudit_firstPassOrRejection;
/// 查询代理转代审核详情@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_agentTransformAudit_getAgentTransformAuditDetail;
/// 查询代理转代审核列表@POST
-(URLManagerModel *)post_agent_agentTransformAudit_getAgentTransformAuditList;
/// 获取当前会员的代理信息@POST
-(URLManagerModel *)post_agent_agentTransformAudit_getMemberAgent;
/// 获取会员上级代理@POST
-(URLManagerModel *)post_agent_agentTransformAudit_getMemberSuperiorAgentName;
/// 代理转代二审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentTransformAudit_secondPassOrRejection;
#pragma mark —— 代理转账记录接口
/// 查询转账记录列表@POST
-(URLManagerModel *)post_agent_transferRecord_getTransferRecordList;
#pragma mark —— 会员信息接口
/// 同存款USDT查询@GET
-(URLManagerModel *)get_member_user_OrderSameUSDT;
/// 批量删除会员标签@POST
-(URLManagerModel *)post_member_user_batchDeleteMemberLabel;
/// 获取会员信息详细修改项集合@POST
-(URLManagerModel *)post_member_user_changeItem;
/// 查询代理所有会员@POST
-(URLManagerModel *)post_member_user_count;
/// 修改会员信息@POST
-(URLManagerModel *)post_member_user_edit;
/// 导出会员信息列表@POST
-(URLManagerModel *)post_member_user_export;
/// 提交编辑会员指定字段信息申请@POST
-(URLManagerModel *)post_member_user_field;
/// 查询会员审核中的基本信息字段@POST
-(URLManagerModel *)post_member_user_field_listStatus;
/// getMemberListByConditions@POST
-(URLManagerModel *)post_member_user_get_list;
/// 获取会员信息详细信息@POST
-(URLManagerModel *)post_member_user_getInfo;
/// 获取会员门店id@POST
-(URLManagerModel *)post_member_user_getUser;
/// 后台会员踢下线@GET
-(URLManagerModel *)get_member_user_kickOffline;
/// 查询会员列表@GET
-(URLManagerModel *)get_member_user_list;
/// 手机号码修改@POST
-(URLManagerModel *)post_member_user_mobile_modify;
/// 查询在线会员列表@GET
-(URLManagerModel *)get_member_user_onlineList;
/// 套利分析-同存款ip查询-上部分@GET
-(URLManagerModel *)get_member_user_orderSameIp;
/// queryLoginUserByIp@GET
-(URLManagerModel *)get_member_user_queryLoginUserByIp;
/// 同存款ip查询@GET
-(URLManagerModel *)get_member_user_queryOrderByOrderIp;
/// 重置会员短信次数@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_member_user_restVerifyCodeByMemberId;
/// queryLoginUserByIp@GET
-(URLManagerModel *)get_member_user_sameIp;
/// 修改详情会员标签集合@POST
-(URLManagerModel *)post_member_user_updateLabel;
/// 会员状态更新@POST
-(URLManagerModel *)post_member_user_updateStatus;
#pragma mark —— 会员后台操作记录接口
/// 查询会员账号变更记录列表@GET
-(URLManagerModel *)get_member_backendlog_changeList;
/// 查询会员账号详情变更记录列表@GET
-(URLManagerModel *)get_member_backendlog_changeListByName;
/// 会员一审核状态修改@PUT
-(URLManagerModel *)put_member_backendlog_editState;
/// 会员二审核状态修改@PUT
-(URLManagerModel *)put_member_backendlog_editStateSecond;
/// 获取会员后台操作记录详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_member_backendlog_getInfoByID;
/// 查询会员账号修改审核列表一审@GET
-(URLManagerModel *)get_member_backendlog_list;
/// 查询会员账号修改审核列表结果单@GET
-(URLManagerModel *)get_member_backendlog_listFinal;
/// 查询会员账号修改审核列表结果单@GET
-(URLManagerModel *)get_member_backendlog_listSecond;
/// 查询会员账号修改审核列表结果单@GET
-(URLManagerModel *)get_member_backendlog_queryBackendLogTypes;
/// 查询会员账号详情变更前端操作项目类型集合@GET
-(URLManagerModel *)get_member_backendlog_queryWebLogTypes;
#pragma mark —— 会员备注接口
/// 新增会员备注信息@POST
-(URLManagerModel *)post_member_remark_add;
/// 查询会员备注列表@POST
-(URLManagerModel *)post_member_remark_list;
#pragma mark —— 会员异常记录接口
/// 查询会员备注列表@POST
-(URLManagerModel *)post_member_excelog_list;
#pragma mark —— 会员操作日志接口
/// 查询会员备注列表@POST
-(URLManagerModel *)get_member_operlog_list;
#pragma mark —— 会员标签接口
/// 新增会员标签@POST
-(URLManagerModel *)post_label_add;
/// 查询会员备注列表@PUT
-(URLManagerModel *)put_label_edit;
/// 获取会员标签详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_label_getInfoByID;
/// 查询会员标签列表@GET
-(URLManagerModel *)get_label_list;
/// 获取标签选择框列表@GET
-(URLManagerModel *)get_label_member_optionSelect;
/// 获取会员关联的标签列表@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_label_memberByMemberId;
/// 删除会员标签@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_label_removeByID;
/// 查询标签的所有会员@POST
-(URLManagerModel *)post_label_selectMemberByLabelId;
/// 标签启用禁用@POST
-(URLManagerModel *)post_label_updateStatus;
#pragma mark —— 会员登录日志接口
/// 查询会员登录日志列表@GET
-(URLManagerModel *)get_member_loginlog_list;
#pragma mark —— 会员短信验证码记录接口
/// 分页查询会员短信验证码记录
-(URLManagerModel *)post_vercodelog_list;
#pragma mark —— 会员禁言记录接口
/// 批量解禁@POST
-(URLManagerModel *)post_member_banLog_batchUntie;
/// 获取会员禁言记录详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_member_banLog_getInfo;
/// 查询会员禁言记录列表@POST
-(URLManagerModel *)post_member_banLog_list;
/// 查询某个会员禁言记录列表@POST
-(URLManagerModel *)post_member_banLog_memberList;
/// 修改会员禁言记录@PUT
-(URLManagerModel *)put_member_banLog_update;
#pragma mark —— 会员称号记录接口
/// 查询会员称号记录列表
-(URLManagerModel *)get_member_titlelog_list;
#pragma mark —— 会员管理-会员详情基本信息-财务信息
/// 查询会员个人充提信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_memberReport_depositAndWithdraw;
/// 查询会员个人提现流水信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_memberReport_withdrawBetRequest;
#pragma mark —— 会员虚拟货币账号接口
/// 新增会员虚拟货币账号@POST
-(URLManagerModel *)post_member_cryptocy_add;
/// 新增会员EB币钱包@POST
-(URLManagerModel *)post_member_cryptocy_eb_add;
/// 查询会员EB币钱包列表@POST
-(URLManagerModel *)post_member_cryptocy_eb_list;
/// 删除会员EB币钱包@POST
-(URLManagerModel *)post_member_cryptocy_eb_remove;
/// 启用禁用会员EB币钱包@PUT
-(URLManagerModel *)put_member_cryptocy_eb_status;
/// 查询会员虚拟货币账号列表@GET
-(URLManagerModel *)get_member_cryptocy_list;
/// 删除会员虚拟货币账号@POST
-(URLManagerModel *)post_member_cryptocy_remove;
/// 启用禁用会员虚拟货币账号@PUT
-(URLManagerModel *)put_member_cryptocy_status;
#pragma mark —— 会员虚拟货币账号操作记录接口
/// 查询员EB币钱包操作记录列表@GET
-(URLManagerModel *)get_member_cryptolog_eb_list;
/// 查询员虚拟货币账号操作记录列表@GET
-(URLManagerModel *)get_member_cryptolog_list;
#pragma mark —— 会员跟单信息接口
/// 查询会员跟单信息列表@GET
-(URLManagerModel *)get_follow_order_list;
#pragma mark —— 会员银行卡接口
/// 新增会员银行卡@POST
-(URLManagerModel *)post_member_bankcard_add;
/// 删除会员银行卡@POST
-(URLManagerModel *)get_member_bankcard_delete;
/// 查询会员跟单信息列表@GET
-(URLManagerModel *)get_member_bankcard_list;
/// 查询会员跟单信息列表@GET
-(URLManagerModel *)get_member_bankcard_status;
#pragma mark —— 会员银行卡操作记录接口
/// 查询会员银行卡操作记录列表@GET
-(URLManagerModel *)get_member_bankcardlog_list;
#pragma mark —— 会员限制记录接口
/// 查询会员限制记录日志列表@GET
-(URLManagerModel *)get_member_blocklog_list;
/// 查询会员限制记录日志列表@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_member_blocklog_updateStatusByID;
/// 批量解除会员限制@POST
-(URLManagerModel *)post_member_blocklog_updateStatusBatch;
#pragma mark —— 佣金档位接口
/// 根据佣金审核记录id查询佣金档位@GET
-(URLManagerModel *)get_agent_manage_queryByCommissionAuditId;
#pragma mark —— 参数配置接口
/// 新增参数配置@POST
-(URLManagerModel *)post_config;
/// 修改参数配置@PUT
-(URLManagerModel *)put_config;
/// 根据参数键名查询参数值@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_config_configKeyByConfigKey;
/// 导出参数配置@POST
-(URLManagerModel *)post_config_export;
/// 获取参数配置分页列表@GET
-(URLManagerModel *)get_config_list;
/// 地址动态关联查询@POST
-(URLManagerModel *)post_config_province;
/// 刷新参数缓存@DELETE
-(URLManagerModel *)delete_config_refreshCache;
/// 删除参数配置@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_configByConfigIds;
/// 根据参数编号获取详细信息
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_configByConfigId;
/// add@POST
-(URLManagerModel *)post_notice;
/// edit@PUT
-(URLManagerModel *)put_notice;
/// list@GET
-(URLManagerModel *)put_notice_list;
/// remove@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_noticeByNoticeIds;
/// getInfo@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_noticeByNoticeIds;
#pragma mark —— 国家-区号-编码-语言信息接口
/// 新增（国家-区号-编码-语言）信息@POST
-(URLManagerModel *)post_countrycode_add;
/// 修改（国家-区号-编码-语言）状态@PUT
-(URLManagerModel *)put_countrycode_changeStatus;
/// 修改（国家-区号-编码-语言）信息@PUT
-(URLManagerModel *)put_countrycode_edit;
/// 根据ID获取(国家-区号-编码-语言)信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_countrycode_getInfo;
/// 查询（国家-区号-编码-语言）列表@GET
-(URLManagerModel *)get_countrycode_list;
#pragma mark —— 国家编码服务接口
/// 获取单个国家编码详细信息@POST
-(URLManagerModel *)post_countrycode_getInfo;
/// 获取国家编码信息列表@GET
-(URLManagerModel *)get_countrycode_listInfo;
#pragma mark —— 场馆费管理
/// 场馆费率查询@GET
-(URLManagerModel *)get_agent_manage_queryVenueRateConfigByCommissionAudit;
/// 场馆费查询@GET
-(URLManagerModel *)get_agent_manage_queryVenueRateConfigFeeByCommissionAudit;
#pragma mark —— 场馆转入转出记录相关接口
/// 场馆转入转出记录列表@POST
-(URLManagerModel *)post_api_game_pay_pageList;
#pragma mark —— 媒体配置接口
/// 新增媒体配置@POST
-(URLManagerModel *)post_media_add;
/// 删除媒体配置@POST
-(URLManagerModel *)post_media_del;
/// 应用端媒体配置查询 - 用于 web,h5,ios,android 调用@POST
-(URLManagerModel *)post_media_list;
/// 媒体配置查询@POST
-(URLManagerModel *)post_media_query;
/// 修改媒体配置@POST
-(URLManagerModel *)post_media_update;
#pragma mark —— 字典数据管理接口
/// 新增字典数据@POST
-(URLManagerModel *)post_dict_data;
/// 修改字典数据@PUT
-(URLManagerModel *)put_dict_data;
/// 导出字典数据@POST
-(URLManagerModel *)post_dict_data_export;
/// 获得字典数据的分页列表@GET
-(URLManagerModel *)get_dict_data_list;
/// 根据字典类型查询字典数据信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_dict_data_typeByDictType;
/// 删除字典数据@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_dict_dataByDictCodes;
/// 查询字典数据详细@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_dict_dataByDictCode;
#pragma mark —— 字典类型管理接口
/// 创建字典类型@POST
-(URLManagerModel *)post_dict_type;
/// 修改字典类型@PUT
-(URLManagerModel *)put_dict_type;
/// 导出字典类型数据@POST
-(URLManagerModel *)post_dict_type_export;
/// 获得字典类型的分页列表@GET
-(URLManagerModel *)get_dict_type_list;
/// 获取字典选择框列表@GET
-(URLManagerModel *)get_dict_type_optionselect;
/// 刷新字典缓存@DELETE
-(URLManagerModel *)delete_dict_type_refreshCache;
/// 删除字典类型@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_dict_typeByDictCode;
/// 查询字典类型详细@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_dict_typeByDictCode;
#pragma mark —— 封面标签信息接口
/// 删除封面标签信息@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_front_cover_tag_deleteByIDs;
/// 获取封面标签信息详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_front_cover_tag_getInfoByID;
/// 查询封面标签信息列表@GET
-(URLManagerModel *)get_front_cover_tag_list;
/// 新增封面标签信息@GET
-(URLManagerModel *)get_front_cover_tag_save;
/// 修改封面标签信息@PUT
-(URLManagerModel *)put_front_cover_tag_update;
#pragma mark —— 岗位管理接口
/// 创建岗位@POST
-(URLManagerModel *)post_post;
/// 修改岗位细信息@PUT
-(URLManagerModel *)put_post;
/// 导出岗位列表@POST
-(URLManagerModel *)post_post_export;
/// 获取岗位分页列表@GET
-(URLManagerModel *)get_post_list;
/// 获取平台的所有岗位@GET
-(URLManagerModel *)get_post_optionselect;
/// 删除岗位@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_postByPostIds;
/// 根据岗位编号获取详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_postByPostIds;
#pragma mark —— 平台管理接口
///新增平台@POST
-(URLManagerModel *)post_tenant_add;
/// 修改平台状态@PUT
-(URLManagerModel *)put_tenant_changeStatus;
/// 修改平台@PUT
-(URLManagerModel *)put_tenant_edit;
/// 获取平台详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_tenant_getInfoByID;
/// 查询平台列表@GET
-(URLManagerModel *)get_tenant_list;
#pragma mark —— 廣告管理接口
/// 新增廣告@POST
-(URLManagerModel *)post_advertise_manage_add;
/// 刪除廣告@POST
-(URLManagerModel *)post_advertise_manage_delete;
/// 後端內部調用前台廣告列表@POST
-(URLManagerModel *)post_advertise_manage_getAdvertiseList;
/// 取得廣告列表@POST
-(URLManagerModel *)post_advertise_manage_list;
/// 禁用廣告@POST
-(URLManagerModel *)post_advertise_manage_stop;
/// 禁用廣告@POST
-(URLManagerModel *)post_advertise_manage_update;
#pragma mark —— 报表管理-PAG COR报表
#pragma mark —— 报表管理-PAG COR游戏场馆税率
#pragma mark —— 报表管理-分析管理-会员相关统计
#pragma mark —— 报表管理-分析管理-充值统计
#pragma mark —— 报表管理-游戏报表
#pragma mark —— 推单信息接口
#pragma mark —— 推广配置-域名
#pragma mark —— 推广配置-素材
#pragma mark —— 操作日志接口
#pragma mark —— 敏感词屏蔽记录接口
#pragma mark —— 敏感词配置信息接口
#pragma mark —— 活动获奖奖励列表所有接口
#pragma mark —— 活动访问统计列表所有接口
#pragma mark —— 活动访问记录所有接口
#pragma mark —— 活动配置相关接口
#pragma mark —— 流水稽核接口
#pragma mark —— 游戏平台维护
#pragma mark —— 游戏注单模块
#pragma mark —— 游戏配置模块
#pragma mark —— 用户管理接口
#pragma mark —— 电子钱包管理
#pragma mark —— 登录日志接口
#pragma mark —— 直播信息接口
#pragma mark —— 直播配置管理接口
#pragma mark —— 短信管理-->短信服务商信息
#pragma mark —— 短信管理-->短信验证码记录
#pragma mark —— 礼物信息接口
#pragma mark —— 礼物收益信息接口
#pragma mark —— 福利审核记录所有接口
#pragma mark —— 福利记录所有接口
#pragma mark —— 站点配置接口
#pragma mark —— 聊天室配置信息接口
#pragma mark —— 菜单信息管理接口
#pragma mark —— 角色信息管理接口
#pragma mark —— 资金管理-充提配置-充值流水倍率
#pragma mark —— 资金管理-充提配置-提现分单配置
#pragma mark —— 资金管理-充提配置-提现设置（大)
#pragma mark —— 资金管理-充提配置-提现设置（提现提示)
#pragma mark —— 资金管理-充提配置-提现设置（预)
#pragma mark —— 资金管理-充提配置-虚拟币汇率
#pragma mark —— 资金管理-充提配置-通道类型
#pragma mark —— 资金管理-充提配置-银行管理
#pragma mark —— 资金管理-财务审核-资金调整审核
#pragma mark —— 资金管理-财务审核-资金调整审核
#pragma mark —— 资金管理-财务审核-资金调整审核
#pragma mark —— 资金管理-账变记录
#pragma mark —— 资金管理-资金审核-资金订单站内信
#pragma mark —— 资金管理-资金记录-充值异常接口
#pragma mark —— 资金管理-资金记录-充值记录
#pragma mark —— 资金管理-资金记录-充值通道关闭日
#pragma mark —— 资金管理-资金记录-存款加送记录
#pragma mark —— 资金管理-资金记录-提款记录
#pragma mark —— 资金管理-资金记录-通道统计全部
#pragma mark —— 资金管理-资金记录-预约加送记录
#pragma mark —— 资金管理-资金调整
#pragma mark —— 资金管理-通道管理-入款通道分配
#pragma mark —— 资金管理-通道管理-出款方式分配
#pragma mark —— 资金管理-通道管理-商户信息接口
#pragma mark —— 资金管理-通道管理-商户入款通道
#pragma mark —— 赛程列表接口
#pragma mark —— 赛程管理接口
#pragma mark —— 运营配置-信息配置管理
#pragma mark —— 运营配置-公共资源配置模块
#pragma mark —— 运营配置-资源配置管理
#pragma mark —— 运营配置-赞助图集配置模块
#pragma mark —— 运营配置-赞助集锦配置模块
#pragma mark —— 返水记录列表所有接口
#pragma mark —— 邀请人流水奖励 -new
#pragma mark —— 邀请好友规则 -new
#pragma mark —— 邀请码
#pragma mark —— 邀请管理
#pragma mark —— 邀请管理 -new
#pragma mark —— 部门管理接口
#pragma mark —— 门店登录IP白名单接口
#pragma mark —— 门店管理-门店GGR报税报表
#pragma mark —— 风控公共配置接口
#pragma mark —— 风控审核接单人员接口
#pragma mark —— 风控层级与会员关系接口
#pragma mark —— 风控层级接口
#pragma mark —— 风控层级调整记录接口
#pragma mark —— 风控方案与用户关系接口
#pragma mark —— 风控方案设置接口
#pragma mark —— 风控策略与用户关系接口
#pragma mark —— 风控策略配置接口
#pragma mark —— 风控管理-风控审核-体育相似投注
#pragma mark —— 风控管理-风控审核-提现风控审核
#pragma mark —— 风控管理-风控审核-高额盈利统计
#pragma mark —— 风控管理-风控记录-风险调整记录
#pragma mark —— 黑名单信息接口
#pragma mark —— 黑名单调整记录接口
#pragma mark —— 根据佣金审核id查询代理
#pragma mark —— 根据代理id获取下级代理数据
#pragma mark —— 根据代理id获取下级代理数据
#pragma mark —— 代理佣金加减记录接口
#pragma mark —— 场馆费明细列表查询接口
#pragma mark —— 代理存款记录
#pragma mark —— 更新代理存款记录状态
#pragma mark —— 查询资金调整钱包余额接口
#pragma mark —— 代理转账钱包余额接口
#pragma mark —— 获取代理信息查询下级所有
#pragma mark —— 获取代理信息
#pragma mark —— 根据佣金审核记录id查询佣金档位
#pragma mark —— 场馆费率查询
#pragma mark —— 场馆费查询
#pragma mark —— 获取公告未读条数
#pragma mark —— 执行代理账变记录接口
#pragma mark —— 代理提款审核接口
#pragma mark —— 代理提款记录接口
#pragma mark —— 代理佣金钱包取款记录
#pragma mark —— 通过出款-代理提款记录接口
#pragma mark —— 更新代理取款记录状态
#pragma mark —— 第三方游戏注单接口
#pragma mark —— 风控方案信息接口
#pragma mark —— 代理标签接口
#pragma mark —— 代理标签关系接口
#pragma mark —— 推广链接充值会员数统计
#pragma mark —— 查询充值会员
#pragma mark —— 查询存款活动 加送金额 信息
#pragma mark —— 资金管理-通道管理-商户通道(包含
#pragma mark —— 资金管理-通道管理-商户出款通道 接口
#pragma mark —— 查询ip所属区域名称
#pragma mark —— 同存款USDT查询接口
#pragma mark —— 代理会员接口
#pragma mark —— 在线会员信息接口
#pragma mark —— 套利分析-同存款ip查询-上部分
#pragma mark —— 同存款ip查询接口
#pragma mark —— 查询充值分布列表
#pragma mark —— 查询用户分布列表
#pragma mark —— 场馆数据接口
#pragma mark —— 查询代理首页充值排行榜
#pragma mark —— 查询代理首页首充会员
#pragma mark —— 查询代理首页首充排行榜
#pragma mark —— 查询代理首页注册排行榜
#pragma mark —— 查询注册会员
#pragma mark —— 黑名单调整信息接口
#pragma mark —— 删除门店设备接口
#pragma mark —— 门店设备列表接口
#pragma mark —— 新增门店设备接口
#pragma mark —— 修改门店设备接口
#pragma mark —— 删除门店接口
#pragma mark —— 门店列表接口
#pragma mark —— 新增门店接口
#pragma mark —— 修改门店接口
#pragma mark —— 修改门店为停业
#pragma mark —— 删除门店登录IP白名单接口
#pragma mark —— 门店列登录IP白名單接口
#pragma mark —— 新增门店登录IP白名单接口
#pragma mark —— 福利中心数据接口

@end

NS_ASSUME_NONNULL_END
