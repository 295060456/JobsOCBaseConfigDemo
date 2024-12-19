//
//  NSObject+URLManager_6.m
//  FM
//
//  Created by User on 10/11/24.
//

#import "NSObject+URLManager_6.h"
/// 来自  http://18.162.73.145:19201/doc.html#/home
@implementation NSObject (URLManager_6)
#pragma mark —— C2C-充提黑名单
/// 新增C2C充提黑名单@POST
-(URLManagerModel *)post_fund_c2c_dw_blackList_add{
    NSString *url = @"/fund/c2c/dw/blackList/add";
    return JobsURL(url);
}
/// 修改C2C充提黑名单状态@PUT
-(URLManagerModel *)put_fund_c2c_dw_blackList_change_status{
    NSString *url = @"/fund/c2c/dw/blackList/change/status";
    return JobsURL(url);
}
/// 删除C2C充提黑名单@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_c2c_dw_blackList_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ids){
        NSString *url = @"/fund/c2c/dw/blackList/delete/{".add(ids).add(@"}");
        return JobsURL(url);
    };
}
/// 查询C2C充提黑名单列表@GET
-(URLManagerModel *)get_fund_c2c_dw_blackList_list{
    NSString *url = @"/fund/c2c/dw/blackList/list";
    return JobsURL(url);
}
#pragma mark —— C2C-存取款占比
/// 新增C2C存取款占比配置@POST
-(URLManagerModel *)post_fund_c2c_dwRatio_add{
    NSString *url = @"/fund/c2c/dwRatio/add";
    return JobsURL(url);
}
/// 删除C2C存取款占比配置@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_fund_c2c_dwRatio_deleteBy{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ids){
        NSString *url = @"/fund/c2c/dwRatio/delete/{".add(ids).add(@"}");
        return JobsURL(url);
    };
}
/// 修改C2C存取款占比配置@PUT
-(URLManagerModel *)put_fund_c2c_dwRatio_edit{
    NSString *url = @"/fund/c2c/dwRatio/edit";
    return JobsURL(url);
}
/// 获取C2C存取款占比配置详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_c2c_dwRatio_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/fund/c2c/dwRatio/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询C2C存取款占比配置列表@GET
-(URLManagerModel *)get_fund_c2c_dwRatio_list{
    NSString *url = @"fund/c2c/dwRatio/list";
    return JobsURL(url);
}
#pragma mark —— C2C-提款搁置列表
/// 批量操作搁置订单@POST
-(URLManagerModel *)post_fund_c2c_withdraw_hold_batch_update{
    NSString *url = @"/fund/c2c/withdraw/hold/batch/update";
    return JobsURL(url);
}
/// 查询C2C提款搁置列表@GET
-(URLManagerModel *)get_fund_c2c_withdraw_hold_list{
    NSString *url = @"/fund/c2c/withdraw/hold/list";
    return JobsURL(url);
}
#pragma mark —— C2C-提款搁置设置
/// 修改C2C提现风控配置@PUT
-(URLManagerModel *)put_fund_c2c_risk_config_edit{
    NSString *url = @"/fund/c2c/risk/config/edit";
    return JobsURL(url);
}
/// 获取C2C提现风控配置信息@GET
-(URLManagerModel *)get_fund_c2c_risk_config_getInfo{
    NSString *url = @"/fund/c2c/risk/config/getInfo";
    return JobsURL(url);
}
#pragma mark —— C2C-提现拆单开关设置
/// 拆单开关状态修改@PUT
-(URLManagerModel *)put_fund_c2c_split_switch_edit{
    NSString *url = @"/fund/c2c/split/switch/edit";
    return JobsURL(url);
}
/// 查询拆单开关状态@GET
-(URLManagerModel *)get_fund_c2c_split_switch_status{
    NSString *url = @"/fund/c2c/split/switch/status";
    return JobsURL(url);
}
#pragma mark —— C2C-提现拆单配置
/// 新增C2C提现拆单规则配置@POST
-(URLManagerModel *)post_fund_c2c_split_rule_add{
    NSString *url = @"/fund/c2c/split/rule/add";
    return JobsURL(url);
}
/// 删除C2C提现拆单规则配置@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_fund_c2c_split_rule_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/fund/c2c/split/rule/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 修改C2C提现拆单规则配置@PUT
-(URLManagerModel *)put_fund_c2c_split_switch_status{
    NSString *url = @"/fund/c2c/split/rule/edit";
    return JobsURL(url);
}
/// 查询C2C提现拆单规则配置列表@GET
-(URLManagerModel *)get_fund_c2c_split_rule_list{
    NSString *url = @"/fund/c2c/split/rule/list";
    return JobsURL(url);
}
#pragma mark —— C2C-提现风控配置日志
/// 查询C2C提现风控配置日志列表@GET
-(URLManagerModel *)get_fund_c2c_risk_config_log_list{
    NSString *url = @"/fund/c2c/risk/config/log/list";
    return JobsURL(url);
}
#pragma mark —— PH_AGT-代理转账审核接口
/// 保存代理转账@POST
-(URLManagerModel *)post_agent_agentTransferAudit_agentTransferSave{
    NSString *url = @"/agent/agentTransferAudit/agentTransferSave";
    return JobsURL(url);
}
/// 代理转账一审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentTransferAudit_firstPassOrRejection{
    NSString *url = @"/agent/agentTransferAudit/firstPassOrRejection";
    return JobsURL(url);
}
/// 查询代理转账审核列表@POST
-(URLManagerModel *)post_agent_agentTransferAudit_getAgentTransferAuditList{
    NSString *url = @"/agent/agentTransferAudit/getAgentTransferAuditList";
    return JobsURL(url);
}
/// 代理转账二审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentTransferAudit_secondPassOrRejection{
    NSString *url = @"/agent/agentTransferAudit/secondPassOrRejection";
    return JobsURL(url);
}
#pragma mark —— PH_AGT-配置中心_代存转账配置
/// 代存转账配置-查询@POST
-(URLManagerModel *)post_configs_deposit_list{
    NSString *url = @"/configs/deposit/list";
    return JobsURL(url);
}
/// 代存转账配置-编辑@PUT
-(URLManagerModel *)put_configs_deposit_saveOrUpdate{
    NSString *url = @"/configs/deposit/saveOrUpdate";
    return JobsURL(url);
}
#pragma mark —— PH_AGT-配置中心_帮助中心(内容)
/// 帮助中心-查询问题分类@POST
-(URLManagerModel *)post_config_help_center_classify_lists{
    NSString *url = @"/config/help/center/classify/lists";
    return JobsURL(url);
}
/// 帮助中心-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)config_help_center_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/config/help/center/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 帮助中心-查询@POST
-(URLManagerModel *)post_config_help_center_list{
    NSString *url = @"/config/help/center/list";
    return JobsURL(url);
}
/// 帮助中心-新增@POST
-(URLManagerModel *)post_config_help_center_save{
    NSString *url = @"/config/help/center/save";
    return JobsURL(url);
}
/// 帮助中心-编辑@POST
-(URLManagerModel *)post_config_help_center_update{
    NSString *url = @"/config/help/center/update";
    return JobsURL(url);
}
#pragma mark —— PH_AGT-配置中心_帮助中心(分类)
/// 帮助中心分类问题-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_config_help_center_classify_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/config/help/center/classify/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 帮助中心分类问题-查询@POST
-(URLManagerModel *)post_config_help_center_classify_list{
    NSString *url = @"/config/help/center/classify/list";
    return JobsURL(url);
}
/// 帮助中心分类问题-新增@POST
-(URLManagerModel *)post_config_help_center_classify_save{
    NSString *url = @"/config/help/center/classify/save";
    return JobsURL(url);
}
/// 帮助中心分类问题-编辑@POST
-(URLManagerModel *)post_config_help_center_classify_update{
    NSString *url = @"/config/help/center/classify/update";
    return JobsURL(url);
}
#pragma mark —— PH_AGT-配置中心_提现配置
/// 提款配置-查询@POST
-(URLManagerModel *)post_configs_withdrawal_list{
    NSString *url = @"/configs/withdrawal/list";
    return JobsURL(url);
}
/// 提款配置-编辑@PUT
-(URLManagerModel *)put_configs_withdrawal_saveOrUpdate{
    NSString *url = @"/configs/withdrawal/saveOrUpdate";
    return JobsURL(url);
}
#pragma mark —— PH_AGT-配置中心_标签关系配置
/// 新增代理标签关系@POST
-(URLManagerModel *)post_configs_tags_ref_add{
    NSString *url = @"/configs/tags/ref/add";
    return JobsURL(url);
}
/// 删除代理标签关系@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_configs_tags_ref_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/configs/tags/ref/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理标签信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_configs_tags_ref_getAgentTagRefListByAgentId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable agentId){
        NSString *url = @"/configs/tags/ref/getAgentTagRefList/{".add(agentId).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理所有标签信息@GET
-(URLManagerModel *)get_configs_tags_ref_getAllTagList{
    NSString *url = @"/configs/tags/ref/getAllTagList";
    return JobsURL(url);
}
#pragma mark —— PH_AGT-配置中心_标签配置
/// 删除标签@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_configs_tags_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/configs/tags/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询标签用户数列表@POST
-(URLManagerModel *)post_configs_tags_getTagAgentList{
    NSString *url = @"/configs/tags/getTagAgentList";
    return JobsURL(url);
}
/// 查询标签列表@POST
-(URLManagerModel *)post_configs_tags_getTagList{
    NSString *url = @"/configs/tags/getTagList";
    return JobsURL(url);
}
/// 新增标签@POST
-(URLManagerModel *)post_configs_tags_save{
    NSString *url = @"/configs/tags/save";
    return JobsURL(url);
}
/// 修改标签@POST
-(URLManagerModel *)post_configs_tags_update{
    NSString *url = @"/configs/tags/update";
    return JobsURL(url);
}
#pragma mark —— PH_AGT-配置中心_联系方式配置
/// 代理后台帮助中心联系方式查询@POST
-(URLManagerModel *)post_configs_contact_getContactListForHelp{
    NSString *url = @"/configs/contact/getContactListForHelp";
    return JobsURL(url);
}
/// 联系方式配置-查询@POST
-(URLManagerModel *)post_configs_contact_list{
    NSString *url = @"/configs/contact/list";
    return JobsURL(url);
}
/// 联系方式配置-查询@POST
-(URLManagerModel *)post_configs_contact_list_noLogin{
    NSString *url = @"/configs/contact/list/noLogin";
    return JobsURL(url);
}
/// 联系方式配置-查询@POST
-(URLManagerModel *)post_configs_contact_saveOrUpdate{
    NSString *url = @"/configs/contact/saveOrUpdate";
    return JobsURL(url);
}
#pragma mark —— PH_AGT-门店设备所有相关接口
/// 删除门店设备@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_store_device_info_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/store/device/info/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询门店设备列表@POST
-(URLManagerModel *)post_store_device_info_getStoreDeviceInfoList{
    NSString *url = @"/store/device/info/getStoreDeviceInfoList";
    return JobsURL(url);
}
/// 新增门店设备@POST
-(URLManagerModel *)post_store_device_info_save{
    NSString *url = @"/store/device/info/save";
    return JobsURL(url);
}
/// 修改门店设备@PUT
-(URLManagerModel *)put_store_device_info_update{
    NSString *url = @"/store/device/info/update";
    return JobsURL(url);
}
#pragma mark —— PH_AGT-门店资讯接口
/// 查询ip所属区域名称@POST
-(URLManagerModel *)post_ip_region_getRegion{
    NSString *url = @"/ip/region/getRegion";
    return JobsURL(url);
}
/// 删除门店@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_store_info_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/store/info/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询门店列表@POST
-(URLManagerModel *)post_store_info_getStoreIfoByStoreId{
    NSString *url = @"/store/info/getStoreIfoByStoreId";
    return JobsURL(url);
}
/// 查询门店列表@POST
-(URLManagerModel *)post_store_info_getStoreIfoList{
    NSString *url = @"/store/info/getStoreIfoList";
    return JobsURL(url);
}
/// 新增门店@POST
-(URLManagerModel *)post_store_info_save{
    NSString *url = @"/store/info/save";
    return JobsURL(url);
}
/// 修改门店@PUT
-(URLManagerModel *)put_store_info_update{
    NSString *url = @"/store/info/update";
    return JobsURL(url);
}
/// 修改门店为停业@PUT
-(URLManagerModel *)put_store_info_update_forstop{
    NSString *url = @"/store/info/update/forstop";
    return JobsURL(url);
}
#pragma mark —— VIP变更记录接口
/// 会员VIP等级自动降级--后台任务测试用@GET
-(URLManagerModel *)get_member_vipLog_dwMemberVipLevel{
    NSString *url = @"/member/vipLog/dwMemberVipLevel";
    return JobsURL(url);
}
/// 查询会员VIP变更列表@GET
-(URLManagerModel *)get_member_vipLog_list{
    NSString *url = @"/member/vipLog/list";
    return JobsURL(url);
}
/// 查询某一个会员VIP变更列表@GET
-(URLManagerModel *)get_member_vipLog_memberList{
    NSString *url = @"/member/vipLog/memberList";
    return JobsURL(url);
}
/// 会员VIP等级自动升级--后台任务测试用@GET
-(URLManagerModel *)get_member_vipLog_upMemberVipLevel{
    NSString *url = @"/member/vipLog/upMemberVipLevel";
    return JobsURL(url);
}
/// upMemberVipZero@POST
-(URLManagerModel *)post_member_vipLog_upMemberVipZero{
    NSString *url = @"/member/vipLog/upMemberVipZero";
    return JobsURL(url);
}
#pragma mark —— VIP权益配置接口
/// 查询VIP权益配置列表@GET
-(URLManagerModel *)get_vipRights_list{
    NSString *url = @"/vipRights/list";
    return JobsURL(url);
}
/// 查询vip开关配置---对外提供的接口@GET
-(URLManagerModel *)get_vipRights_queryVipSwitchConfig{
    NSString *url = @"/vipRights/queryVipSwitchConfig";
    return JobsURL(url);
}
/// 查询VIP权益配置列表--对外提供的接口@POST
-(URLManagerModel *)post_vipRights_rightsList{
    NSString *url = @"/vipRights/rightsList";
    return JobsURL(url);
}
/// 保存VIP权益配置@PUT
-(URLManagerModel *)put_vipRights_save{
    NSString *url = @"/vipRights/save";
    return JobsURL(url);
}
/// 修改权益开关状态@PUT
-(URLManagerModel *)put_vipRights_update_status{
    NSString *url = @"/vipRights/update/status";
    return JobsURL(url);
}
#pragma mark —— VIP等级配置内部服务接口
/// getVipLevelConfig@GET
-(URLManagerModel *)get_vip_api_levelConfigByTenantId:(NSString *)tenantId vipLevel:(NSString *)vipLevel{
    NSString *url = @"/vip/api/levelConfig/{".add(tenantId).add(@"}/{").add(vipLevel).add(@"}");
    return JobsURL(url);
}
#pragma mark —— VIP等级配置接口
/// 保存VIP等级配置@PUT
-(URLManagerModel *)put_member_vipLevel_edit{
    NSString *url = @"/member/vipLevel/edit";
    return JobsURL(url);
}
/// 查询VIP等级配置列表--对外接口@POST
-(URLManagerModel *)post_member_vipLevel_levelList{
    NSString *url = @"/member/vipLevel/levelList";
    return JobsURL(url);
}
/// 查询VIP等级配置列表@GET
-(URLManagerModel *)get_member_vipLevel_list{
    NSString *url = @"/member/vipLevel/list";
    return JobsURL(url);
}
/// 查询所有VIP等级@GET
-(URLManagerModel *)get_member_vipLevel_selectAll{
    NSString *url = @"/member/vipLevel/selectAll";
    return JobsURL(url);
}
#pragma mark —— VIP返水配置接口
/// 根据等级获取VIP返水子项配置--代理服务用@POST
-(URLManagerModel *)post_vipRebate_getConfigByLevel{
    NSString *url = @"/vipRebate/getConfigByLevel";
    return JobsURL(url);
}
/// 查询VIP返水配置列表@GET
-(URLManagerModel *)get_vipRebate_list{
    NSString *url = @"/vipRebate/list";
    return JobsURL(url);
}
/// 查询VIP返水配置子项@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_vipRebate_queryConfigItem{
    return ^URLManagerModel *_Nullable(NSString *_Nullable lobbyCode){
        NSString *url = @"/vipRebate/queryConfigItem/{".add(lobbyCode).add(@"}");
        return JobsURL(url);
    };
}
/// 查询VIP返水配置列表--对外提供的接口@POST
-(URLManagerModel *)post_vipRebate_rebateList{
    NSString *url = @"/vipRebate/rebateList";
    return JobsURL(url);
}
/// 修改VIP返水配置@PUT
-(URLManagerModel *)put_vipRebate_save{
    NSString *url = @"/vipRebate/save";
    return JobsURL(url);
}
/// 保存VIP返水配置子项@POST
-(URLManagerModel *)post_vipRebate_saveConfigItem{
    NSString *url = @"/vipRebate/saveConfigItem";
    return JobsURL(url);
}
/// 修改返水开关状态@PUT
-(URLManagerModel *)put_vipRebate_update_status{
    NSString *url = @"/vipRebate/update/status";
    return JobsURL(url);
}
/// 修改返水提款流水倍数@PUT
-(URLManagerModel *)put_vipRebate_updateRebateMultiple{
    NSString *url = @"/vipRebate/updateRebateMultiple";
    return JobsURL(url);
}
#pragma mark —— activity-report-controller
/// 查询新手大礼包记录@POST
-(URLManagerModel *)post_activity_newbie_gift_record_list{
    NSString *url = @"/activity/newbie/gift/record/list";
    return JobsURL(url);
}
/// 导出新手大礼包记录@POST
-(URLManagerModel *)post_activity_newbie_gift_record_list_export{
    NSString *url = @"/activity/newbie/gift/record/list/export";
    return JobsURL(url);
}
/// 查询新手活动总详情@POST
-(URLManagerModel *)post_activity_newbie_record_list{
    NSString *url = @"/activity/newbie/record/list";
    return JobsURL(url);
}
/// 导出活动总详情@POST
-(URLManagerModel *)post_activity_newbie_record_list_export{
    NSString *url = @"/activity/newbie/record/list/export";
    return JobsURL(url);
}
/// 导出活动总详情@POST
-(URLManagerModel *)post_activity_newbie_report_export{
    NSString *url = @"/activity/newbie/report/export";
    return JobsURL(url);
}
/// 查询新手活动统计报表@POST
-(URLManagerModel *)post_activity_newbie_report_list{
    NSString *url = @"/activity/newbie/report/list";
    return JobsURL(url);
}
/// 查询复活大礼包记录@POST
-(URLManagerModel *)post_activity_resurrection_gift_record_list{
    NSString *url = @"/activity/resurrection/gift/record/list";
    return JobsURL(url);
}
/// 导出复活大礼包记录@POST
-(URLManagerModel *)post_activity_resurrection_gift_record_list_export{
    NSString *url = @"/activity/resurrection/gift/record/list/export";
    return JobsURL(url);
}
/// 查询签到大礼包记录@POST
-(URLManagerModel *)post_activity_sign_gift_record_list{
    NSString *url = @"/activity/sign/gift/record/list";
    return JobsURL(url);
}
/// 导出签到大礼包记录@POST
-(URLManagerModel *)post_activity_sign_gift_record_list_export{
    NSString *url = @"/activity/sign/gift/record/list/export";
    return JobsURL(url);
}
/// 查询签到记录@POST
-(URLManagerModel *)post_activity_sign_record_list{
    NSString *url = @"/activity/sign/record/list";
    return JobsURL(url);
}
/// 导出签到记录@POST
-(URLManagerModel *)post_activity_sign_record_list_export{
    NSString *url = @"/activity/sign/record/list/export";
    return JobsURL(url);
}
#pragma mark —— agent-auto-package-controller
/// 保存自动打包信息@POST
-(URLManagerModel *)post_agent_autoPackage_saveAutoPackageInfo{
    NSString *url = @"/agent/autoPackage/saveAutoPackageInfo";
    return JobsURL(url);
}
#pragma mark —— member-kyc-controller
/// 查询用户KYC认证信息详情@GET
-(URLManagerModel *)get_member_kyc_detail{
    NSString *url = @"/member/kyc/detail";
    return JobsURL(url);
}
/// 用户KYC认证信息编辑@POST
-(URLManagerModel *)post_member_kyc_edit{
    NSString *url = @"/member/kyc/edit";
    return JobsURL(url);
}
/// 查询KYC列表@POST
-(URLManagerModel *)post_member_kyc_page_list{
    NSString *url = @"/member/kyc/page/list";
    return JobsURL(url);
}
/// 用户KYC认证信息重置@GET
-(URLManagerModel *)get_member_kyc_reset{
    NSString *url = @"/member/kyc/reset";
    return JobsURL(url);
}
/// 查询KYC审核记录@GET
-(URLManagerModel *)get_member_kyc_review_list{
    NSString *url = @"/member/kyc/review/list";
    return JobsURL(url);
}
/// 用户KYC认证信息审批@POST
-(URLManagerModel *)post_member_kyc_review_option{
    NSString *url = @"/member/kyc/review/option";
    return JobsURL(url);
}
#pragma mark —— report-user-controller
-(URLManagerModel *)get_oms_report_user_heartBeatSaveLogin{
    NSString *url = @"/oms/report/user/heartBeatSaveLogin";
    return JobsURL(url);
}
#pragma mark —— 专家信息接口
/// 删除专家信息@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_expert_info_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/expert/info/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取专家信息详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_expert_info_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/expert/info/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询专家信息列表@GET
-(URLManagerModel *)get_expert_info_list{
    NSString *url = @"/expert/info/list";
    return JobsURL(url);
}
/// 新增专家信息@POST
-(URLManagerModel *)post_expert_info_save{
    NSString *url = @"/expert/info/save";
    return JobsURL(url);
}
/// 修改专家信息@PUT
-(URLManagerModel *)put_expert_info_update{
    NSString *url = @"/expert/info/update";
    return JobsURL(url);
}
/// 删除专家爆料方案信息@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_expert_plan_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/expert/plan/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取专家爆料方案信息详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_expert_plan_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/expert/plan/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询专家爆料方案信息列表@GET
-(URLManagerModel *)get_expert_plan_list{
    NSString *url = @"/expert/plan/list";
    return JobsURL(url);
}
/// 新增专家爆料方案信息@POST
-(URLManagerModel *)post_expert_plan_save{
    NSString *url = @"/expert/plan/save";
    return JobsURL(url);
}
/// 修改专家爆料方案信息@PUT
-(URLManagerModel *)put_expert_plan_update{
    NSString *url = @"/expert/plan/update";
    return JobsURL(url);
}
#pragma mark —— 业务字典国际化管理
/// 创建字典类型@POST
-(URLManagerModel *)post_oms_dict_bussiness_add{
    NSString *url = @"/oms/dict/bussiness/add";
    return JobsURL(url);
}
/// 删除业务字典类型@GET
-(URLManagerModel *)get_oms_dict_bussiness_delete{
    NSString *url = @"/oms/dict/bussiness/delete";
    return JobsURL(url);
}
/// 修改业务字典类型@POST
-(URLManagerModel *)post_oms_dict_bussiness_edit{
    NSString *url = @"/oms/dict/bussiness/edit";
    return JobsURL(url);
}
/// 获得字典类型的分页列表@GET
-(URLManagerModel *)get_oms_dict_bussiness_list{
    NSString *url = @"/oms/dict/bussiness/list";
    return JobsURL(url);
}
#pragma mark —— 个人中心接口
/// 获取个人信息@GET
-(URLManagerModel *)get_user_profile{
    NSString *url = @"/user/profile";
    return JobsURL(url);
}
/// 修改个人信息@PUT
-(URLManagerModel *)put_user_profile{
    NSString *url = @"/user/profile";
    return JobsURL(url);
}
/// 修改用户头像@POST
-(URLManagerModel *)post_user_profile_avatar{
    NSString *url = @"/user/profile/avatar";
    return JobsURL(url);
}
/// 修改密码@PUT
-(URLManagerModel *)put_user_profile_updatePwd{
    NSString *url = @"/user/profile/updatePwd";
    return JobsURL(url);
}
#pragma mark —— 中心钱包
/// 一键回收@POST
-(JobsReturnURLManagerModelByStringBlock _Nonnull)post_fund_wallet_collectWalletByUserName{
    return ^URLManagerModel *_Nullable(NSString *_Nullable userName){
        NSString *url = @"/fund/wallet/collectWallet/{".add(userName).add(@"}");
        return JobsURL(url);
    };
}
/// 获取会员与转账场馆余额@POST
-(JobsReturnURLManagerModelByStringBlock _Nonnull)post_fund_wallet_getMemberWallet{
    return ^URLManagerModel *_Nullable(NSString *_Nullable userName){
        NSString *url = @"/fund/wallet/getMemberWallet/{".add(userName).add(@"}");
        return JobsURL(url);
    };
}
/// 转入@POST
-(URLManagerModel *)post_fund_wallet_transferIn{
    NSString *url = @"/fund/wallet/transferIn";
    return JobsURL(url);
}
#pragma mark —— 主播动态接口
/// 删除主播动态@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_presenter_dynamics_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ids){
        NSString *url = @"/presenter/dynamics/delete/{".add(ids).add(@"}");
        return JobsURL(url);
    };
}
/// 获取主播动态详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_presenter_dynamics_getInfo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ids){
        NSString *url = @"/presenter/dynamics/getInfo/{".add(ids).add(@"}");
        return JobsURL(url);
    };
}
/// 查询主播动态列表@GET
-(URLManagerModel *)get_presenter_dynamics_list{
    NSString *url = @"/presenter/dynamics/list";
    return JobsURL(url);
}
/// 新增主播动态@POST
-(URLManagerModel *)post_presenter_dynamics_save{
    NSString *url = @"/presenter/dynamics/save";
    return JobsURL(url);
}
/// 修改主播动态@PUT
-(URLManagerModel *)put_presenter_dynamics_update{
    NSString *url = @"/presenter/dynamics/update";
    return JobsURL(url);
}
#pragma mark —— 主播管理接口
/// 删除超管信息@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_managerdelete{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ids){
        NSString *url = @"/manager/delete/{".add(ids).add(@"}");
        return JobsURL(url);
    };
}
/// 导出超管信息列表@POST
-(URLManagerModel *)post_manager_export{
    NSString *url = @"/manager/export";
    return JobsURL(url);
}
/// 获取超管详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_manager_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/manager/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询超管信息列表@GET
-(URLManagerModel *)get_manager_list{
    NSString *url = @"/manager/list";
    return JobsURL(url);
}
/// 新增超管信息@POST
-(URLManagerModel *)post_manager_save{
    NSString *url = @"/manager/save";
    return JobsURL(url);
}
/// 修改超管信息@PUT
-(URLManagerModel *)put_manager_update{
    NSString *url = @"/manager/update";
    return JobsURL(url);
}
/// 删除主播信息@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_presenter_delete{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/presenter/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 导出主播信息列表@POST
-(URLManagerModel *)post_presenter_export{
    NSString *url = @"/presenter/export";
    return JobsURL(url);
}
/// 获取主播详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_presenter_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/presenter/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询主播信息列表@GET
-(URLManagerModel *)get_presenter_list{
    NSString *url = @"/presenter/list";
    return JobsURL(url);
}
/// 新增主播信息@POST
-(URLManagerModel *)post_presenter_save{
    NSString *url = @"/presenter/save";
    return JobsURL(url);
}
/// 修改主播信息@PUT
-(URLManagerModel *)put_presenter_update{
    NSString *url = @"/presenter/update";
    return JobsURL(url);
}
#pragma mark —— 代理-代理配置-所有接口
/// 银行管理 禁用或者开启【 0、禁用】【1、开启】@PUT
-(URLManagerModel *)put_agent_config_bank_ban{
    NSString *url = @"/agent/config/bank/ban";
    return JobsURL(url);
}
/// 银行管理-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_config_bank_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/config/bank/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 银行管理-查询@POST
-(URLManagerModel *)post_agent_config_bank_list{
    NSString *url = @"/agent/config/bank/list";
    return JobsURL(url);
}
/// 银行管理-新增@POST
-(URLManagerModel *)post_agent_config_bank_save{
    NSString *url = @"/agent/config/bank/save";
    return JobsURL(url);
}
/// 银行管理-编辑@PUT
-(URLManagerModel *)put_agent_config_bank_update{
    NSString *url = @"/agent/config/bank/update";
    return JobsURL(url);
}
/// 帮助中心分类问题-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_config_classify_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/config/classify/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 帮助中心分类问题-查询@POST
-(URLManagerModel *)post_agent_config_classify_list{
    NSString *url = @"/agent/config/classify/list";
    return JobsURL(url);
}
/// 帮助中心分类问题-新增@POST
-(URLManagerModel *)post_agent_config_classify_save{
    NSString *url = @"/agent/config/classify/save";
    return JobsURL(url);
}
/// 帮助中心分类问题-编辑@PUT
-(URLManagerModel *)put_agent_config_classify_update{
    NSString *url = @"/agent/config/classify/update";
    return JobsURL(url);
}
/// 佣金配置-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_config_commission_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/config/commission/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 佣金配置-新增初始化@POST
-(URLManagerModel *)post_agent_config_commission_init{
    NSString *url = @"/agent/config/commission/init";
    return JobsURL(url);
}
/// 佣金配置-查询@GET
-(URLManagerModel *)get_agent_config_commission_init{
    NSString *url = @"/agent/config/commission/list";
    return JobsURL(url);
}
/// 佣金算法配置-查询@GET
-(URLManagerModel *)get_agent_config_commission_math_list{
    NSString *url = @"/agent/config/commission/math/list";
    return JobsURL(url);
}
/// 佣金算法配置-编辑@PUT
-(URLManagerModel *)put_agent_config_commission_math_update{
    NSString *url = @"/agent/config/commission/math/update";
    return JobsURL(url);
}
/// 佣金配置-新增@POST
-(URLManagerModel *)post_agent_config_commission_save{
    NSString *url = @"/agent/config/commission/save";
    return JobsURL(url);
}
/// 佣金配置-编辑-不含场馆费率@PUT
-(URLManagerModel *)put_agent_config_commission_update{
    NSString *url = @"/agent/config/commission/update";
    return JobsURL(url);
}
/// 佣金配置-编辑-场馆费率@PUT
-(URLManagerModel *)put_agent_config_commission_update_venue{
    NSString *url = @"/agent/config/commission/update/venue";
    return JobsURL(url);
}
/// 代存配置-查询@GET
-(URLManagerModel *)get_agent_config_common_deposit_list{
    NSString *url = @"/agent/config/common/deposit/list";
    return JobsURL(url);
}
/// 代存配置-编辑@PUT
-(URLManagerModel *)put_agent_config_common_deposit_update{
    NSString *url = @"/agent/config/common/deposit/update";
    return JobsURL(url);
}
/// 提现汇率配置-查询@GET
-(URLManagerModel *)get_agent_config_common_rate_list{
    NSString *url = @"/agent/config/common/rate/list";
    return JobsURL(url);
}
/// 提现汇率配置-编辑@PUT
-(URLManagerModel *)put_agent_config_common_rate_update{
    NSString *url = @"/agent/config/common/rate/update";
    return JobsURL(url);
}
/// 代理相关配置-查询@GET
-(URLManagerModel *)get_agent_config_common_relation_list{
    NSString *url = @"/agent/config/common/relation/list";
    return JobsURL(url);
}
/// 代理相关配置-编辑@PUT
-(URLManagerModel *)put_agent_config_common_relation_update{
    NSString *url = @"/agent/config/common/relation/update";
    return JobsURL(url);
}
/// 提现方式配置-查询@GET
-(URLManagerModel *)get_agent_config_common_type_list{
    NSString *url = @"/agent/config/common/type/list";
    return JobsURL(url);
}
/// 提现方式配置-编辑@PUT
-(URLManagerModel *)put_agent_config_common_type_update{
    NSString *url = @"/agent/config/common/type/update";
    return JobsURL(url);
}
/// 佣金配置-场馆费列表@GET
-(URLManagerModel *)get_agent_config_getGameLobbyList{
    NSString *url = @"/agent/config/getGameLobbyList";
    return JobsURL(url);
}
/// 帮助中心-查询问题分类@POST
-(URLManagerModel *)post_agent_config_help_classify_list{
    NSString *url = @"/agent/config/help/classify/list";
    return JobsURL(url);
}
/// 帮助中心-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_config_help_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/config/help/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 帮助中心-查询@POST
-(URLManagerModel *)post_agent_config_help_list{
    NSString *url = @"/agent/config/help/list";
    return JobsURL(url);
}
/// 帮助中心-新增@POST
-(URLManagerModel *)post_agent_config_help_save{
    NSString *url = @"/agent/config/help/save";
    return JobsURL(url);
}
/// 帮助中心-编辑@PUT
-(URLManagerModel *)put_agent_config_help_update{
    NSString *url = @"/agent/config/help/update";
    return JobsURL(url);
}
/// 出款通道-禁用或者开启@PUT
-(URLManagerModel *)put_agent_config_outward_ban{
    NSString *url = @"/agent/config/outward/ban";
    return JobsURL(url);
}
/// 出款通道-删除@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_config_outward_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/config/outward/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 出款通道-查询@POST
-(URLManagerModel *)post_agent_config_outward_list{
    NSString *url = @"/agent/config/outward/list";
    return JobsURL(url);
}
/// 出款通道-新增@POST
-(URLManagerModel *)post_agent_config_outward_save{
    NSString *url = @"/agent/config/outward/save";
    return JobsURL(url);
}
/// 出款通道-编辑@PUT
-(URLManagerModel *)put_agent_config_outward_update{
    NSString *url = @"/agent/config/outward/update";
    return JobsURL(url);
}
/// 佣金配置-同步场馆费@POST
-(URLManagerModel *)post_agent_config_synchronizeVenueRate{
    NSString *url = @"/agent/config/synchronizeVenueRate";
    return JobsURL(url);
}
#pragma mark —— 代理代存记录接口
/// 查询代理存款记录@POST
-(URLManagerModel *)post_agent_depositRecord_getDepositRecord{
    NSString *url = @"/agent/depositRecord/getDepositRecord";
    return JobsURL(url);
}
/// 查询代存记录列表@POST
-(URLManagerModel *)post_agent_depositRecord_getDepositRecordList{
    NSString *url = @"/agent/depositRecord/getDepositRecordList";
    return JobsURL(url);
}
/// 更新代理存款记录状态@POST
-(URLManagerModel *)post_agent_depositRecord_updateDepositRecordStatus{
    NSString *url = @"/agent/depositRecord/updateDepositRecordStatus";
    return JobsURL(url);
}
#pragma mark —— 代理代理接口
/// 查询代理树形列表@GET
-(URLManagerModel *)get_agent_agentProxy_getCommissionAuditAgentProxyList{
    NSString *url = @"/agent/agentProxy/getCommissionAuditAgentProxyList";
    return JobsURL(url);
}
/// 查询代理代理列表@GET
-(URLManagerModel *)get_agent_agentProxy_getSuperiorAgentProxyList{
    NSString *url = @"/agent/agentProxy/getSuperiorAgentProxyList";
    return JobsURL(url);
}
/// 根据佣金审核id查询代理@GET
-(URLManagerModel *)get_agent_agentProxy_queryByAuditId{
    NSString *url = @"/agent/agentProxy/queryByAuditId";
    return JobsURL(url);
}
/// 根据代理id获取下级代理数据@GET
-(URLManagerModel *)get_agent_agentProxy_querySubAgentByAgentId{
    NSString *url = @"/agent/agentProxy/querySubAgentByAgentId";
    return JobsURL(url);
}
#pragma mark —— 代理佣金审核接口
/// 佣金一审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_commissionRecordAudit_firstPassOrRejection{
    NSString *url = @"/agent/commissionRecordAudit/firstPassOrRejection";
    return JobsURL(url);
}
/// 查询佣金方案详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_commissionRecordAudit_getCommissionRebateDetailInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/commissionRecordAudit/getCommissionRebateDetailInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询佣金审核列表@POST
-(URLManagerModel *)post_agent_commissionRecordAudit_getCommissionRecordAuditList{
    NSString *url = @"/agent/commissionRecordAudit/getCommissionRecordAuditList";
    return JobsURL(url);
}
/// 查询佣金场馆费列表@POST
-(URLManagerModel *)post_agent_commissionRecordAudit_getCommissionVenueRateList{
    NSString *url = @"/agent/commissionRecordAudit/getCommissionVenueRateList";
    return JobsURL(url);
}
/// 查询公司输赢调整列表@GET
-(URLManagerModel *)get_agent_commissionRecordAudit_getCompanyProfitAndLossAdjustRecordList{
    NSString *url = @"/agent/commissionRecordAudit/getCompanyProfitAndLossAdjustRecordList";
    return JobsURL(url);
}
/// 查询佣金审核详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_commissionRecordAudit_getDetailInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/commissionRecordAudit/getDetailInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询下级代理佣金记录列表@POST
-(URLManagerModel *)post_agent_commissionRecordAudit_getSubProxyCommissionDetailList{
    NSString *url = @"/agent/commissionRecordAudit/getSubProxyCommissionDetailList";
    return JobsURL(url);
}
/// 佣金二审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_commissionRecordAudit_secondPassOrRejection{
    NSString *url = @"/agent/commissionRecordAudit/secondPassOrRejection";
    return JobsURL(url);
}
#pragma mark —— 代理佣金记录明细接口
/// 查询佣金记录列表@POST
-(URLManagerModel *)post_agent_commissionDetail_getCommissionDetailList{
    NSString *url = @"/agent/commissionDetail/getCommissionDetailList";
    return JobsURL(url);
}
/// 查询场馆费明细列表@POST
-(URLManagerModel *)post_agent_commissionDetail_getVenueFeeDetail{
    NSString *url = @"/agent/commissionDetail/getVenueFeeDetail";
    return JobsURL(url);
}
#pragma mark —— 代理佣金调加减录接口
/// 新增佣金加减记录@POST
-(URLManagerModel *)post_agent_commissionAddSubRecord_add{
    NSString *url = @"/agent/commissionAddSubRecord/add";
    return JobsURL(url);
}
/// 查询佣金加减记录列表@POST
-(URLManagerModel *)post_agent_commissionAddSubRecord_getCommissionAddSubRecordList{
    NSString *url = @"/agent/commissionAddSubRecord/getCommissionAddSubRecordList";
    return JobsURL(url);
}
#pragma mark —— 代理信息调整审核接口
/// 代理信息调整审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentInfoAdjustAudit_auditPassOrRejection{
    NSString *url = @"/agent/agentInfoAdjustAudit/auditPassOrRejection";
    return JobsURL(url);
}
/// 查询佣金加减记录列表@POST
-(URLManagerModel *)post_agent_agentInfoAdjustAudit_getAgentInfoAdjustAuditList{
    NSString *url = @"/agent/agentInfoAdjustAudit/getAgentInfoAdjustAuditList";
    return JobsURL(url);
}
#pragma mark —— 代理公告配置接口
/// 删除代理公告@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_agent_notice_config_deleteByIDList{
    return ^URLManagerModel *_Nullable(NSString *_Nullable idList){
        NSString *url = @"/agent/notice/config/delete/{".add(idList).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_notice_config_getAgentNoticeDetailByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/notice/config/getAgentNoticeDetail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取公告未读条数@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_notice_config_getAgentNoticeUnreadByAgentName{
    return ^URLManagerModel *_Nullable(NSString *_Nullable agentName){
        NSString *url = @"/agent/notice/config/getAgentNoticeUnread/{".add(agentName).add(@"}");
        return JobsURL(url);
    };
}
/// 查询代理公告列表@POST
-(URLManagerModel *)post_agent_notice_config_getNoticeList{
    NSString *url = @"/agent/notice/config/getNoticeList";
    return JobsURL(url);
}
/// 新增代理公告@POST
-(URLManagerModel *)post_agent_notice_config_save{
    NSString *url = @"/agent/notice/config/save";
    return JobsURL(url);
}
/// 公告发送@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_notice_config_sendNoticeByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/notice/config/sendNotice/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 修改代理公告@PUT
-(URLManagerModel *)put_agent_notice_config_update{
    NSString *url = @"/agent/notice/config/update";
    return JobsURL(url);
}
#pragma mark —— 代理备注接口
/// 新增代理备注@POST
-(URLManagerModel *)post_agent_agentRemark_add{
    NSString *url = @"/agent/agentRemark/add";
    return JobsURL(url);
}
/// 查询代理备注列表@POST
-(URLManagerModel *)post_agent_agentRemark_getAgentRemarkList{
    NSString *url = @"/agent/agentRemark/getAgentRemarkList";
    return JobsURL(url);
}
#pragma mark —— 代理提款风控审核接口-NEW
/// 提现审核通过或拒绝或搁置@POST
-(URLManagerModel *)post_agent_withdrawalAudit_auditPassOrRejectionOrShunt{
    NSString *url = @"/agent/withdrawalAudit/auditPassOrRejectionOrShunt";
    return JobsURL(url);
}
/// 获取提款审核详细信息@POST
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_withdrawalAudit_getWithdrawalAuditDetail{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/withdrawalAudit/getWithdrawalAuditDetail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询提款审核列表@POST
-(URLManagerModel *)post_agent_withdrawalAudit_getWithdrawalAuditList{
    NSString *url = @"/agent/withdrawalAudit/getWithdrawalAuditList";
    return JobsURL(url);
}
#pragma mark —— 代理新增审核接口
/// 代理新增审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentAddAudit_auditPassOrRejection{
    NSString *url = @"/agent/agentAddAudit/auditPassOrRejection";
    return JobsURL(url);
}
/// 查询代理新增审核列表@POST
-(URLManagerModel *)post_agent_agentAddAudit_getAgentAddAuditList{
    NSString *url = @"/agent/agentAddAudit/getAgentAddAuditList";
    return JobsURL(url);
}
/// 查询代理新增审核详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_agentAddAudit_getDetailInfo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/agentAddAudit/getDetailInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 代理新增接口
/// 新增代理(运营后台)@POST
-(URLManagerModel *)post_agent_agentAdd_add{
    NSString *url = @"/agent/agentAdd/add";
    return JobsURL(url);
}
/// 新增代理(会员pc)@POST
-(URLManagerModel *)post_agent_agentAdd_add_noLogin{
    NSString *url = @"/agent/agentAdd/add/noLogin";
    return JobsURL(url);
}
/// 查询佣金方案列表@GET
-(URLManagerModel *)get_agent_agentAdd_getCommissionRebateConfigList{
    NSString *url = @"/agent/agentAdd/getCommissionRebateConfigList";
    return JobsURL(url);
}
/// 查询上级代理账号@GET
-(URLManagerModel *)get_agent_agentAdd_queryAgentUsername{
    NSString *url = @"/agent/agentAdd/queryAgentUsername";
    return JobsURL(url);
}
/// 查询会员账号@GET
-(URLManagerModel *)get_agent_agentAdd_queryMemberByUsername{
    NSString *url = @"/agent/agentAdd/queryMemberByUsername";
    return JobsURL(url);
}
#pragma mark —— 代理管理接口
/// 查询代理列表@POST
-(URLManagerModel *)post_agent_manage_agentList{
    NSString *url = @"/agent/manage/agentList";
    return JobsURL(url);
}
/// 查询代理直属活跃会员列表@POST
-(URLManagerModel *)post_agent_manage_agentSubActiveMemberList{
    NSString *url = @"/agent/manage/agentSubActiveMemberList";
    return JobsURL(url);
}
/// 查询代理直属下级列表@POST
-(URLManagerModel *)post_agent_manage_agentSubList{
    NSString *url = @"/agent/manage/agentSubList";
    return JobsURL(url);
}
/// 查询代理直属会员列表@POST
-(URLManagerModel *)post_agent_manage_agentSubMemberList{
    NSString *url = @"/agent/manage/agentSubMemberList";
    return JobsURL(url);
}
/// 根据代理名模糊搜索@POST
-(URLManagerModel *)post_agent_manage_list{
    NSString *url = @"/agent/manage/list";
    return JobsURL(url);
}
/// 获取代理信息查询下级所有@GET
-(URLManagerModel *)get_agent_manage_queryActiveAgentInfo{
    NSString *url = @"/agent/manage/queryActiveAgentInfo";
    return JobsURL(url);
}
/// 获取代理信息@GET
-(URLManagerModel *)get_agent_manage_queryAgentInfo{
    NSString *url = @"/agent/manage/queryAgentInfo";
    return JobsURL(url);
}
#pragma mark —— 代理记录-提款记录接口-NEW
/// 强制成功@PUT
-(URLManagerModel *)put_agent_withdrawalRecord_forcedSuccess{
    NSString *url = @"/agent/withdrawalRecord/forcedSuccess";
    return JobsURL(url);
}
/// 查询提现订单日志列表@POST
-(URLManagerModel *)post_agent_withdrawalRecord_getWithdrawalOrderLogList{
    NSString *url = @"/agent/withdrawalRecord/getWithdrawalOrderLogList";
    return JobsURL(url);
}
/// 查询代理取款记录@POST
-(URLManagerModel *)post_agent_withdrawalRecord_getWithdrawalRecord{
    NSString *url = @"/agent/withdrawalRecord/getWithdrawalRecord";
    return JobsURL(url);
}
/// 获取提款记录详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_withdrawalRecord_getWithdrawalRecordDetail{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/withdrawalRecord/getWithdrawalRecordDetail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理提现订单信息@GET
-(URLManagerModel *)get_agent_withdrawalRecord_getWithdrawalRecordDetailByOrderNo{
    NSString *url = @"/agent/withdrawalRecord/getWithdrawalRecordDetailByOrderNo";
    return JobsURL(url);
}
/// 查询提款记录列表@POST
-(URLManagerModel *)post_agent_withdrawalRecord_getWithdrawalRecordList{
    NSString *url = @"/agent/withdrawalRecord/getWithdrawalRecordList";
    return JobsURL(url);
}
/// 人工出款@PUT
-(URLManagerModel *)put_agent_withdrawalRecord_manualPayout{
    NSString *url = @"/agent/withdrawalRecord/manualPayout";
    return JobsURL(url);
}
/// 拒绝出款@PUT
-(URLManagerModel *)put_agent_withdrawalRecord_paymentReject{
    NSString *url = @"/agent/withdrawalRecord/paymentReject";
    return JobsURL(url);
}
/// 代理三方出款回调通知@POST
-(URLManagerModel *)post_agent_withdrawalRecord_thirdCallBackNotify{
    NSString *url = @"/agent/withdrawalRecord/thirdCallBackNotify";
    return JobsURL(url);
}
/// 通过出款@PUT
-(URLManagerModel *)put_agent_withdrawalRecord_thirdPayout{
    NSString *url = @"/agent/withdrawalRecord/thirdPayout";
    return JobsURL(url);
}
/// 三方出款失败@PUT
-(URLManagerModel *)put_agent_withdrawalRecord_thirdPayoutFail{
    NSString *url = @"/agent/withdrawalRecord/thirdPayoutFail";
    return JobsURL(url);
}
/// 更新代理取款记录状态@POST
-(URLManagerModel *)post_agent_withdrawalRecord_updateWithdrawalRecordStatus{
    NSString *url = @"/agent/withdrawalRecord/updateWithdrawalRecordStatus";
    return JobsURL(url);
}
#pragma mark —— 代理详情接口
/// 修改代理信息@POST
-(URLManagerModel *)post_agent_agentDetail_agentUpdateStatus{
    NSString *url = @"/agent/agentDetail/agentUpdateStatus";
    return JobsURL(url);
}
/// 修改代理信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_agentDetail_clearAgentPaymentPassword{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/agentDetail/clearAgentPaymentPassword/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_agentDetail_getAgentDetail{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/agentDetail/getAgentDetail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 获取代理详细信息根据代理账号@GET
-(URLManagerModel *)get_agent_agentDetail_getAgentDetailByAgentUserName{
    NSString *url = @"/agent/agentDetail/getAgentDetailByAgentUserName";
    return JobsURL(url);
}
/// 获取代理财务信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_agentDetail_getAgentFinanceInfo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/agentDetail/getAgentFinanceInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询代理登录列表@POST
-(URLManagerModel *)post_agent_agentDetail_getAgentLoginList{
    NSString *url = @"/agent/agentDetail/getAgentLoginList";
    return JobsURL(url);
}
/// 获取代理团队信息@POST
-(URLManagerModel *)post_agent_agentDetail_getAgentTeamInfo{
    NSString *url = @"/agent/agentDetail/getAgentTeamInfo";
    return JobsURL(url);
}
#pragma mark —— 代理账变记录接口
/// 代理账变记录@POST
-(URLManagerModel *)post_agent_wallet_operatorWalletRecord{
    NSString *url = @"/agent/wallet/operatorWalletRecord";
    return JobsURL(url);
}
/// 查询账变记录列表@POST
-(URLManagerModel *)post_agent_walletRecord_getWalletRecordList{
    NSString *url = @"/agent/walletRecord/getWalletRecordList";
    return JobsURL(url);
}
#pragma mark —— 代理资金调整审核接口
/// 资金调整一审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_fundAdjustAudit_firstPassOrRejection{
    NSString *url = @"/agent/fundAdjustAudit/firstPassOrRejection";
    return JobsURL(url);
}
/// 查询资金调整审核列表@POST
-(URLManagerModel *)post_agent_fundAdjustAudit_getFundAdjustAuditList{
    NSString *url = @"/agent/fundAdjustAudit/getFundAdjustAuditList";
    return JobsURL(url);
}
/// 资金调整二审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_fundAdjustAudit_secondPassOrRejection{
    NSString *url = @"/agent/fundAdjustAudit/secondPassOrRejection";
    return JobsURL(url);
}
#pragma mark —— 代理资金调整接口
/// 保存资金调整@POST
-(URLManagerModel *)post_agent_fundAdjust_fundAdjustSave{
    NSString *url = @"/agent/fundAdjust/fundAdjustSave";
    return JobsURL(url);
}
/// 保存资金调整@POST
-(URLManagerModel *)post_agent_fundAdjust_getCreditWalletStatus{
    NSString *url = @"/agent/fundAdjust/getCreditWalletStatus";
    return JobsURL(url);
}
/// 保存资金调整@POST
-(URLManagerModel *)post_agent_fundAdjust_getFundAdjustWalletBalance{
    NSString *url = @"/agent/fundAdjust/getFundAdjustWalletBalance";
    return JobsURL(url);
}
/// 保存资金调整@POST
-(URLManagerModel *)post_agent_fundAdjust_getTransferWalletBalance{
    NSString *url = @"/agent/fundAdjust/getTransferWalletBalance";
    return JobsURL(url);
}
#pragma mark —— 代理转代审核接口
/// 代理转代申请@POST
-(URLManagerModel *)post_agent_agentTransformAudit_agentTransformAuditSave{
    NSString *url = @"/agent/agentTransformAudit/agentTransformAuditSave";
    return JobsURL(url);
}
/// 代理转代一审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentTransformAudit_firstPassOrRejection{
    NSString *url = @"/agent/agentTransformAudit/firstPassOrRejection";
    return JobsURL(url);
}
/// 查询代理转代审核详情@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_agent_agentTransformAudit_getAgentTransformAuditDetail{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/agent/agentTransformAudit/getAgentTransformAuditDetail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询代理转代审核列表@POST
-(URLManagerModel *)post_agent_agentTransformAudit_getAgentTransformAuditList{
    NSString *url = @"/agent/agentTransformAudit/getAgentTransformAuditList";
    return JobsURL(url);
}
/// 获取当前会员的代理信息@POST
-(URLManagerModel *)post_agent_agentTransformAudit_getMemberAgent{
    NSString *url = @"/agent/agentTransformAudit/getMemberAgent";
    return JobsURL(url);
}
/// 获取会员上级代理@POST
-(URLManagerModel *)post_agent_agentTransformAudit_getMemberSuperiorAgentName{
    NSString *url = @"/agent/agentTransformAudit/getMemberSuperiorAgentName";
    return JobsURL(url);
}
/// 代理转代二审审核通过或拒绝@POST
-(URLManagerModel *)post_agent_agentTransformAudit_secondPassOrRejection{
    NSString *url = @"/agent/agentTransformAudit/secondPassOrRejection";
    return JobsURL(url);
}
#pragma mark —— 代理转账记录接口
/// 查询转账记录列表@POST
-(URLManagerModel *)post_agent_transferRecord_getTransferRecordList{
    NSString *url = @"/agent/transferRecord/getTransferRecordListn";
    return JobsURL(url);
}
#pragma mark —— 会员信息接口
/// 同存款USDT查询@GET
-(URLManagerModel *)get_member_user_OrderSameUSDT{
    NSString *url = @"/member/user/OrderSameUSDT";
    return JobsURL(url);
}
/// 批量删除会员标签@POST
-(URLManagerModel *)post_member_user_batchDeleteMemberLabel{
    NSString *url = @"/member/user/batchDeleteMemberLabel";
    return JobsURL(url);
}
/// 获取会员信息详细修改项集合@POST
-(URLManagerModel *)post_member_user_changeItem{
    NSString *url = @"/member/user/changeItem";
    return JobsURL(url);
}
/// 查询代理所有会员@POST
-(URLManagerModel *)post_member_user_count{
    NSString *url = @"/member/user/count";
    return JobsURL(url);
}
/// 修改会员信息@POST
-(URLManagerModel *)post_member_user_edit{
    NSString *url = @"/member/user/edit";
    return JobsURL(url);
}
/// 导出会员信息列表@POST
-(URLManagerModel *)post_member_user_export{
    NSString *url = @"/member/user/export";
    return JobsURL(url);
}
/// 提交编辑会员指定字段信息申请@POST
-(URLManagerModel *)post_member_user_field{
    NSString *url = @"/member/user/field";
    return JobsURL(url);
}
/// 查询会员审核中的基本信息字段@POST
-(URLManagerModel *)post_member_user_field_listStatus{
    NSString *url = @"/member/user/field/list-status";
    return JobsURL(url);
}
/// getMemberListByConditions@POST
-(URLManagerModel *)post_member_user_get_list{
    NSString *url = @"/member/user/get/list";
    return JobsURL(url);
}
/// 获取会员信息详细信息@POST
-(URLManagerModel *)post_member_user_getInfo{
    NSString *url = @"/member/user/getInfo";
    return JobsURL(url);
}
/// 获取会员门店id@POST
-(URLManagerModel *)post_member_user_getUser{
    NSString *url = @"/member/user/getUser";
    return JobsURL(url);
}
/// 后台会员踢下线@GET
-(URLManagerModel *)get_member_user_kickOffline{
    NSString *url = @"/member/user/kickOffline";
    return JobsURL(url);
}
/// 查询会员列表@GET
-(URLManagerModel *)get_member_user_list{
    NSString *url = @"/member/user/list";
    return JobsURL(url);
}
/// 手机号码修改@POST
-(URLManagerModel *)post_member_user_mobile_modify{
    NSString *url = @"/member/user/mobile/modify";
    return JobsURL(url);
}
/// 查询在线会员列表@GET
-(URLManagerModel *)get_member_user_onlineList{
    NSString *url = @"/member/user/onlineList";
    return JobsURL(url);
}
/// 套利分析-同存款ip查询-上部分@GET
-(URLManagerModel *)get_member_user_orderSameIp{
    NSString *url = @"/member/user/orderSameIp";
    return JobsURL(url);
}
/// queryLoginUserByIp@GET
-(URLManagerModel *)get_member_user_queryLoginUserByIp{
    NSString *url = @"/member/user/queryLoginUserByIp";
    return JobsURL(url);
}
/// 同存款ip查询@GET
-(URLManagerModel *)get_member_user_queryOrderByOrderIp{
    NSString *url = @"/member/user/queryOrderByOrderIp";
    return JobsURL(url);
}
/// 重置会员短信次数@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_member_user_restVerifyCodeByMemberId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable memberId){
        NSString *url = @"/member/user/restVerifyCode/{".add(memberId).add(@"}");
        return JobsURL(url);
    };
}
/// queryLoginUserByIp@GET
-(URLManagerModel *)get_member_user_sameIp{
    NSString *url = @"/member/user/sameIp";
    return JobsURL(url);
}
/// 修改详情会员标签集合@POST
-(URLManagerModel *)post_member_user_updateLabel{
    NSString *url = @"/member/user/updateLabel";
    return JobsURL(url);
}
/// 会员状态更新@POST
-(URLManagerModel *)post_member_user_updateStatus{
    NSString *url = @"/member/user/updateStatus";
    return JobsURL(url);
}
#pragma mark —— 会员后台操作记录接口
/// 查询会员账号变更记录列表@GET
-(URLManagerModel *)get_member_backendlog_changeList{
    NSString *url = @"/member/backendlog/changeList";
    return JobsURL(url);
}
/// 查询会员账号详情变更记录列表@GET
-(URLManagerModel *)get_member_backendlog_changeListByName{
    NSString *url = @"/member/backendlog/changeListByName";
    return JobsURL(url);
}
/// 会员一审核状态修改@PUT
-(URLManagerModel *)put_member_backendlog_editState{
    NSString *url = @"/member/backendlog/editState";
    return JobsURL(url);
}
/// 会员二审核状态修改@PUT
-(URLManagerModel *)put_member_backendlog_editStateSecond{
    NSString *url = @"/member/backendlog/editStateSecond";
    return JobsURL(url);
}
/// 获取会员后台操作记录详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_member_backendlog_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/member/backendlog/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询会员账号修改审核列表一审@GET
-(URLManagerModel *)get_member_backendlog_list{
    NSString *url = @"/member/backendlog/list";
    return JobsURL(url);
}
/// 查询会员账号修改审核列表结果单@GET
-(URLManagerModel *)get_member_backendlog_listFinal{
    NSString *url = @"/member/backendlog/listFinal";
    return JobsURL(url);
}
/// 查询会员账号修改审核列表结果单@GET
-(URLManagerModel *)get_member_backendlog_listSecond{
    NSString *url = @"/member/backendlog/listSecond";
    return JobsURL(url);
}
/// 查询会员账号修改审核列表结果单@GET
-(URLManagerModel *)get_member_backendlog_queryBackendLogTypes{
    NSString *url = @"/member/backendlog/queryBackendLogTypes";
    return JobsURL(url);
}
/// 查询会员账号详情变更前端操作项目类型集合@GET
-(URLManagerModel *)get_member_backendlog_queryWebLogTypes{
    NSString *url = @"/member/backendlog/queryWebLogTypes";
    return JobsURL(url);
}
#pragma mark —— 会员备注接口
/// 新增会员备注信息@POST
-(URLManagerModel *)post_member_remark_add{
    NSString *url = @"/member/remark/add";
    return JobsURL(url);
}
/// 查询会员备注列表@POST
-(URLManagerModel *)post_member_remark_list{
    NSString *url = @"/member/remark/list";
    return JobsURL(url);
}
#pragma mark —— 会员异常记录接口
/// 查询会员备注列表@POST
-(URLManagerModel *)post_member_excelog_list{
    NSString *url = @"/member/excelog/list";
    return JobsURL(url);
}
#pragma mark —— 会员操作日志接口
/// 查询会员备注列表@POST
-(URLManagerModel *)get_member_operlog_list{
    NSString *url = @"/member/operlog/list";
    return JobsURL(url);
}
#pragma mark —— 会员标签接口
/// 新增会员标签@POST
-(URLManagerModel *)post_label_add{
    NSString *url = @"/label/add";
    return JobsURL(url);
}
/// 查询会员备注列表@PUT
-(URLManagerModel *)put_label_edit{
    NSString *url = @"/label/edit";
    return JobsURL(url);
}
/// 获取会员标签详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_label_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/label/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询会员标签列表@GET
-(URLManagerModel *)get_label_list{
    NSString *url = @"/label/list";
    return JobsURL(url);
}
/// 获取标签选择框列表@GET
-(URLManagerModel *)get_label_member_optionSelect{
    NSString *url = @"/label/member/optionSelect";
    return JobsURL(url);
}
/// 获取会员关联的标签列表@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_label_memberByMemberId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable memberId){
        NSString *url = @"/label/member/{".add(memberId).add(@"}");
        return JobsURL(url);
    };
}
/// 删除会员标签@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_label_removeByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/label/remove/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询标签的所有会员@POST
-(URLManagerModel *)post_label_selectMemberByLabelId{
    NSString *url = @"/label/selectMemberByLabelId";
    return JobsURL(url);
}
/// 标签启用禁用@POST
-(URLManagerModel *)post_label_updateStatus{
    NSString *url = @"/label/updateStatus";
    return JobsURL(url);
}
#pragma mark —— 会员登录日志接口
/// 查询会员登录日志列表@GET
-(URLManagerModel *)get_member_loginlog_list{
    NSString *url = @"/member/loginlog/list";
    return JobsURL(url);
}
#pragma mark —— 会员短信验证码记录接口
/// 分页查询会员短信验证码记录
-(URLManagerModel *)post_vercodelog_list{
    NSString *url = @"/vercodelog/list";
    return JobsURL(url);
}
#pragma mark —— 会员禁言记录接口
/// 批量解禁@POST
-(URLManagerModel *)post_member_banLog_batchUntie{
    NSString *url = @"/member/banLog/batchUntie";
    return JobsURL(url);
}
/// 获取会员禁言记录详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_member_banLog_getInfo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/member/banLog/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询会员禁言记录列表@POST
-(URLManagerModel *)post_member_banLog_list{
    NSString *url = @"/member/banLog/list";
    return JobsURL(url);
}
/// 查询某个会员禁言记录列表@POST
-(URLManagerModel *)post_member_banLog_memberList{
    NSString *url = @"/member/banLog/memberList";
    return JobsURL(url);
}
/// 修改会员禁言记录@PUT
-(URLManagerModel *)put_member_banLog_update{
    NSString *url = @"/member/banLog/update";
    return JobsURL(url);
}
#pragma mark —— 会员称号记录接口
/// 查询会员称号记录列表
-(URLManagerModel *)get_member_titlelog_list{
    NSString *url = @"/member/titlelog/list";
    return JobsURL(url);
}
#pragma mark —— 会员管理-会员详情基本信息-财务信息
/// 查询会员个人充提信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_memberReport_depositAndWithdraw{
    return ^URLManagerModel *_Nullable(NSString *_Nullable memberId){
        NSString *url = @"/fund/memberReport/depositAndWithdraw/{".add(memberId).add(@"}");
        return JobsURL(url);
    };
}
/// 查询会员个人提现流水信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_memberReport_withdrawBetRequest{
    return ^URLManagerModel *_Nullable(NSString *_Nullable memberId){
        NSString *url = @"/fund/memberReport/withdrawBetRequest/{".add(memberId).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 会员虚拟货币账号接口
/// 新增会员虚拟货币账号@POST
-(URLManagerModel *)post_member_cryptocy_add{
    NSString *url = @"/member/cryptocy/add";
    return JobsURL(url);
}
/// 新增会员EB币钱包@POST
-(URLManagerModel *)post_member_cryptocy_eb_add{
    NSString *url = @"/member/cryptocy/eb/add";
    return JobsURL(url);
}
/// 查询会员EB币钱包列表@POST
-(URLManagerModel *)post_member_cryptocy_eb_list{
    NSString *url = @"/member/cryptocy/eb/list";
    return JobsURL(url);
}
/// 删除会员EB币钱包@POST
-(URLManagerModel *)post_member_cryptocy_eb_remove{
    NSString *url = @"/member/cryptocy/eb/remove";
    return JobsURL(url);
}
/// 启用禁用会员EB币钱包@PUT
-(URLManagerModel *)put_member_cryptocy_eb_status{
    NSString *url = @"/member/cryptocy/eb/status";
    return JobsURL(url);
}
/// 查询会员虚拟货币账号列表@GET
-(URLManagerModel *)get_member_cryptocy_list{
    NSString *url = @"/member/cryptocy/list";
    return JobsURL(url);
}
/// 删除会员虚拟货币账号@POST
-(URLManagerModel *)post_member_cryptocy_remove{
    NSString *url = @"/member/cryptocy/remove";
    return JobsURL(url);
}
/// 启用禁用会员虚拟货币账号@PUT
-(URLManagerModel *)put_member_cryptocy_status{
    NSString *url = @"/member/cryptocy/status";
    return JobsURL(url);
}
#pragma mark —— 会员虚拟货币账号操作记录接口
/// 查询员EB币钱包操作记录列表@GET
-(URLManagerModel *)get_member_cryptolog_eb_list{
    NSString *url = @"/member/cryptolog/eb/list";
    return JobsURL(url);
}
/// 查询员虚拟货币账号操作记录列表@GET
-(URLManagerModel *)get_member_cryptolog_list{
    NSString *url = @"/member/cryptolog/list";
    return JobsURL(url);
}
#pragma mark —— 会员跟单信息接口
/// 查询会员跟单信息列表@GET
-(URLManagerModel *)get_follow_order_list{
    NSString *url = @"/follow/order/list";
    return JobsURL(url);
}
#pragma mark —— 会员银行卡接口
/// 新增会员银行卡@POST
-(URLManagerModel *)post_member_bankcard_add{
    NSString *url = @"/member/bankcard/add";
    return JobsURL(url);
}
/// 删除会员银行卡@POST
-(URLManagerModel *)get_member_bankcard_delete{
    NSString *url = @"/member/bankcard/delete";
    return JobsURL(url);
}
/// 查询会员跟单信息列表@GET
-(URLManagerModel *)get_member_bankcard_list{
    NSString *url = @"/member/bankcard/list";
    return JobsURL(url);
}
/// 查询会员跟单信息列表@GET
-(URLManagerModel *)get_member_bankcard_status{
    NSString *url = @"/member/bankcard/status";
    return JobsURL(url);
}
#pragma mark —— 会员银行卡操作记录接口
/// 查询会员银行卡操作记录列表@GET
-(URLManagerModel *)get_member_bankcardlog_list{
    NSString *url = @"/member/bankcardlog/list";
    return JobsURL(url);
}
#pragma mark —— 会员限制记录接口
/// 查询会员限制记录日志列表@GET
-(URLManagerModel *)get_member_blocklog_list{
    NSString *url = @"/member/blocklog/list";
    return JobsURL(url);
}
/// 查询会员限制记录日志列表@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_member_blocklog_updateStatusByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/member/blocklog/updateStatus/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 批量解除会员限制@POST
-(URLManagerModel *)post_member_blocklog_updateStatusBatch{
    NSString *url = @"/member/blocklog/updateStatusBatch";
    return JobsURL(url);
}
#pragma mark —— 佣金档位接口
/// 根据佣金审核记录id查询佣金档位@GET
-(URLManagerModel *)get_agent_manage_queryByCommissionAuditId{
    NSString *url = @"/agent/manage/queryByCommissionAuditId";
    return JobsURL(url);
}
#pragma mark —— 参数配置接口
/// 新增参数配置@POST
-(URLManagerModel *)post_config{
    NSString *url = @"/config";
    return JobsURL(url);
}
/// 修改参数配置@PUT
-(URLManagerModel *)put_config{
    NSString *url = @"/config";
    return JobsURL(url);
}
/// 根据参数键名查询参数值@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_config_configKeyByConfigKey{
    return ^URLManagerModel *_Nullable(NSString *_Nullable configKey){
        NSString *url = @"/config/configKey/{".add(configKey).add(@"}");
        return JobsURL(url);
    };
}
/// 导出参数配置@POST
-(URLManagerModel *)post_config_export{
    NSString *url = @"/config/export";
    return JobsURL(url);
}
/// 获取参数配置分页列表@GET
-(URLManagerModel *)get_config_list{
    NSString *url = @"/config/list";
    return JobsURL(url);
}
/// 地址动态关联查询@POST
-(URLManagerModel *)post_config_province{
    NSString *url = @"/config/province";
    return JobsURL(url);
}
/// 刷新参数缓存@DELETE
-(URLManagerModel *)delete_config_refreshCache{
    NSString *url = @"/config/refreshCache";
    return JobsURL(url);
}
/// 删除参数配置@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_configByConfigIds{
    return ^URLManagerModel *_Nullable(NSString *_Nullable configIds){
        NSString *url = @"/config/{".add(configIds).add(@"}");
        return JobsURL(url);
    };
}
/// 根据参数编号获取详细信息
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_configByConfigId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable configId){
        NSString *url = @"/config/{".add(configId).add(@"}");
        return JobsURL(url);
    };
}
/// add@POST
-(URLManagerModel *)post_notice{
    NSString *url = @"/notice";
    return JobsURL(url);
}
/// edit@PUT
-(URLManagerModel *)put_notice{
    NSString *url = @"/notice";
    return JobsURL(url);
}
/// list@GET
-(URLManagerModel *)put_notice_list{
    NSString *url = @"/notice/list";
    return JobsURL(url);
}
/// remove@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_noticeByNoticeIds{
    return ^URLManagerModel *_Nullable(NSString *_Nullable noticeIds){
        NSString *url = @"/notice/{".add(noticeIds).add(@"}");
        return JobsURL(url);
    };
}
/// getInfo@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_noticeByNoticeIds{
    return ^URLManagerModel *_Nullable(NSString *_Nullable noticeIds){
        NSString *url = @"/notice/{".add(noticeIds).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 国家-区号-编码-语言信息接口
/// 新增（国家-区号-编码-语言）信息@POST
-(URLManagerModel *)post_countrycode_add{
    NSString *url = @"/countrycode/add";
    return JobsURL(url);
}
/// 修改（国家-区号-编码-语言）状态@PUT
-(URLManagerModel *)put_countrycode_changeStatus{
    NSString *url = @"/countrycode/changeStatus";
    return JobsURL(url);
}
/// 修改（国家-区号-编码-语言）信息@PUT
-(URLManagerModel *)put_countrycode_edit{
    NSString *url = @"/countrycode/edit";
    return JobsURL(url);
}
/// 根据ID获取(国家-区号-编码-语言)信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_countrycode_getInfo{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/countrycode/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询（国家-区号-编码-语言）列表@GET
-(URLManagerModel *)get_countrycode_list{
    NSString *url = @"/countrycode/list";
    return JobsURL(url);
}
#pragma mark —— 国家编码服务接口
/// 获取单个国家编码详细信息@POST
-(URLManagerModel *)post_countrycode_getInfo{
    NSString *url = @"/countrycode/get-info";
    return JobsURL(url);
}
/// 获取国家编码信息列表@GET
-(URLManagerModel *)get_countrycode_listInfo{
    NSString *url = @"/countrycode/list-info";
    return JobsURL(url);
}
#pragma mark —— 场馆费管理
/// 场馆费率查询@GET
-(URLManagerModel *)get_agent_manage_queryVenueRateConfigByCommissionAudit{
    NSString *url = @"/agent/manage/queryVenueRateConfigByCommissionAudit";
    return JobsURL(url);
}
/// 场馆费查询@GET
-(URLManagerModel *)get_agent_manage_queryVenueRateConfigFeeByCommissionAudit{
    NSString *url = @"/agent/manage/queryVenueRateConfigFeeByCommissionAudit";
    return JobsURL(url);
}
#pragma mark —— 场馆转入转出记录相关接口
/// 场馆转入转出记录列表@POST
-(URLManagerModel *)post_api_game_pay_pageList{
    NSString *url = @"/api/game/pay/pageList";
    return JobsURL(url);
}
#pragma mark —— 媒体配置接口
/// 新增媒体配置@POST
-(URLManagerModel *)post_media_add{
    NSString *url = @"/media/add";
    return JobsURL(url);
}
/// 删除媒体配置@POST
-(URLManagerModel *)post_media_del{
    NSString *url = @"/media/del";
    return JobsURL(url);
}
/// 应用端媒体配置查询 - 用于 web,h5,ios,android 调用@POST
-(URLManagerModel *)post_media_list{
    NSString *url = @"/media/list";
    return JobsURL(url);
}
/// 媒体配置查询@POST
-(URLManagerModel *)post_media_query{
    NSString *url = @"/media/query";
    return JobsURL(url);
}
/// 修改媒体配置@POST
-(URLManagerModel *)post_media_update{
    NSString *url = @"/media/update";
    return JobsURL(url);
}
#pragma mark —— 字典数据管理接口
/// 新增字典数据@POST
-(URLManagerModel *)post_dict_data{
    NSString *url = @"/dict/data";
    return JobsURL(url);
}
/// 修改字典数据@PUT
-(URLManagerModel *)put_dict_data{
    NSString *url = @"/dict/data";
    return JobsURL(url);
}
/// 导出字典数据@POST
-(URLManagerModel *)post_dict_data_export{
    NSString *url = @"/dict/data/export";
    return JobsURL(url);
}
/// 获得字典数据的分页列表@GET
-(URLManagerModel *)get_dict_data_list{
    NSString *url = @"/dict/data/list";
    return JobsURL(url);
}
/// 根据字典类型查询字典数据信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_dict_data_typeByDictType{
    return ^URLManagerModel *_Nullable(NSString *_Nullable dictType){
        NSString *url = @"/dict/data/type/{".add(dictType).add(@"}");
        return JobsURL(url);
    };
}
/// 删除字典数据@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_dict_dataByDictCodes{
    return ^URLManagerModel *_Nullable(NSString *_Nullable dictCodes){
        NSString *url = @"/dict/data/{".add(dictCodes).add(@"}");
        return JobsURL(url);
    };
}
/// 查询字典数据详细@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_dict_dataByDictCode{
    return ^URLManagerModel *_Nullable(NSString *_Nullable dictCode){
        NSString *url = @"/dict/data/{".add(dictCode).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 字典类型管理接口
/// 创建字典类型@POST
-(URLManagerModel *)post_dict_type{
    NSString *url = @"/dict/type";
    return JobsURL(url);
}
/// 修改字典类型@PUT
-(URLManagerModel *)put_dict_type{
    NSString *url = @"/dict/type";
    return JobsURL(url);
}
/// 导出字典类型数据@POST
-(URLManagerModel *)post_dict_type_export{
    NSString *url = @"/dict/type/export";
    return JobsURL(url);
}
/// 获得字典类型的分页列表@GET
-(URLManagerModel *)get_dict_type_list{
    NSString *url = @"/dict/type/list";
    return JobsURL(url);
}
/// 获取字典选择框列表@GET
-(URLManagerModel *)get_dict_type_optionselect{
    NSString *url = @"/dict/type/optionselect";
    return JobsURL(url);
}
/// 刷新字典缓存@DELETE
-(URLManagerModel *)delete_dict_type_refreshCache{
    NSString *url = @"/dict/type/refreshCache";
    return JobsURL(url);
}
/// 删除字典类型@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_dict_typeByDictCode{
    return ^URLManagerModel *_Nullable(NSString *_Nullable dictCode){
        NSString *url = @"/dict/type/{".add(dictCode).add(@"}");
        return JobsURL(url);
    };
}
/// 查询字典类型详细@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_dict_typeByDictCode{
    return ^URLManagerModel *_Nullable(NSString *_Nullable dictCode){
        NSString *url = @"/dict/type/{".add(dictCode).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 封面标签信息接口
/// 删除封面标签信息@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_front_cover_tag_deleteByIDs{
    return ^URLManagerModel *_Nullable(NSString *_Nullable IDs){
        NSString *url = @"/front/cover/tag/delete/{".add(IDs).add(@"}");
        return JobsURL(url);
    };
}
/// 获取封面标签信息详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_front_cover_tag_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable IDs){
        NSString *url = @"/front/cover/tag/getInfo/{".add(IDs).add(@"}");
        return JobsURL(url);
    };
}
/// 查询封面标签信息列表@GET
-(URLManagerModel *)get_front_cover_tag_list{
    NSString *url = @"/front/cover/tag/list";
    return JobsURL(url);
}
/// 新增封面标签信息@GET
-(URLManagerModel *)get_front_cover_tag_save{
    NSString *url = @"/front/cover/tag/save";
    return JobsURL(url);
}
/// 修改封面标签信息@PUT
-(URLManagerModel *)put_front_cover_tag_update{
    NSString *url = @"/front/cover/tag/update";
    return JobsURL(url);
}
#pragma mark —— 岗位管理接口
/// 创建岗位@POST
-(URLManagerModel *)post_post{
    NSString *url = @"/post";
    return JobsURL(url);
}
/// 修改岗位细信息@PUT
-(URLManagerModel *)put_post{
    NSString *url = @"/post";
    return JobsURL(url);
}
/// 导出岗位列表@POST
-(URLManagerModel *)post_post_export{
    NSString *url = @"/post/export";
    return JobsURL(url);
}
/// 获取岗位分页列表@GET
-(URLManagerModel *)get_post_list{
    NSString *url = @"/post/list";
    return JobsURL(url);
}
/// 获取平台的所有岗位@GET
-(URLManagerModel *)get_post_optionselect{
    NSString *url = @"/post/optionselect";
    return JobsURL(url);
}
/// 删除岗位@DELETE
-(JobsReturnURLManagerModelByStringBlock _Nonnull)delete_postByPostIds{
    return ^URLManagerModel *_Nullable(NSString *_Nullable postIds){
        NSString *url = @"/post/{".add(postIds).add(@"}");
        return JobsURL(url);
    };
}
/// 根据岗位编号获取详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_postByPostIds{
    return ^URLManagerModel *_Nullable(NSString *_Nullable postId){
        NSString *url = @"/post/{".add(postId).add(@"}");
        return JobsURL(url);
    };
}
#pragma mark —— 平台管理接口
///新增平台@POST
-(URLManagerModel *)post_tenant_add{
    NSString *url = @"/tenant/add";
    return JobsURL(url);
}
/// 修改平台状态@PUT
-(URLManagerModel *)put_tenant_changeStatus{
    NSString *url = @"/tenant/changeStatus";
    return JobsURL(url);
}
/// 修改平台@PUT
-(URLManagerModel *)put_tenant_edit{
    NSString *url = @"/tenant/edit";
    return JobsURL(url);
}
/// 获取平台详细信息@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_tenant_getInfoByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/tenant/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 查询平台列表@GET
-(URLManagerModel *)get_tenant_list{
    NSString *url = @"/tenant/list";
    return JobsURL(url);
}
#pragma mark —— 廣告管理接口
/// 新增廣告@POST
-(URLManagerModel *)post_advertise_manage_add{
    NSString *url = @"/advertise/manage/add";
    return JobsURL(url);
}
/// 刪除廣告@POST
-(URLManagerModel *)post_advertise_manage_delete{
    NSString *url = @"/advertise/manage/delete";
    return JobsURL(url);
}
/// 後端內部調用前台廣告列表@POST
-(URLManagerModel *)post_advertise_manage_getAdvertiseList{
    NSString *url = @"/advertise/manage/getAdvertiseList";
    return JobsURL(url);
}
/// 取得廣告列表@POST
-(URLManagerModel *)post_advertise_manage_list{
    NSString *url = @"/advertise/manage/list";
    return JobsURL(url);
}
/// 禁用廣告@POST
-(URLManagerModel *)post_advertise_manage_stop{
    NSString *url = @"/advertise/manage/stop";
    return JobsURL(url);
}
/// 禁用廣告@POST
-(URLManagerModel *)post_advertise_manage_update{
    NSString *url = @"/advertise/manage/update";
    return JobsURL(url);
}
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
