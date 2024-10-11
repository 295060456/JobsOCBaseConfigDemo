//
//  NSObject+URLManager_4.m
//  FM
//
//  Created by User on 10/11/24.
//

#import "NSObject+URLManager_4.h"
/// 来自 http://16.163.191.190:8099/doc.html
@implementation NSObject (URLManager_4)
#pragma mark —— 信息配置
/// 跑马灯信息查询【建议前端每20s-30s可以刷新请求一次】【GET】
-(URLManagerModel *)get_operation_announce_config_queryAnnByMember{
    return JobsURL(@"/api/operation/announce/config/queryAnnByMember");
}
/// 站内信全部变为已读【建议前端每5s刷新一次】【PUT】
-(URLManagerModel *)put_operation_letter_config_allReadStatus{
    return JobsURL(@"/api/operation/letter/config/allReadStatus");
}
/// 站内信全部删除【PUT】
-(URLManagerModel *)put_operation_letter_config_deleteAll{
    return JobsURL(@"/api/operation/letter/config/deleteAll");
}
/// 站内信删除【PUT】
-(URLManagerModel *)put_operation_letter_config_deleteLetter{
    return JobsURL(@"/api/operation/letter/config/deleteLetter");
}
/// 是否有未读站内信【建议前端每5s刷新一次】【POST】
-(URLManagerModel *)post_operation_letter_config_hasUnRead{
    return JobsURL(@"/api/operation/letter/config/hasUnRead");
}
/// 站内信记录查询【POST】
-(URLManagerModel *)post_operation_letter_config_queryLetterConfigSendList{
    return JobsURL(@"/api/operation/letter/config/queryLetterConfigSendList");
}
/// 站内信变为已读【PUT】
-(URLManagerModel *)put_operation_letter_config_toReadStatus{
    return JobsURL(@"/api/operation/letter/config/toReadStatus");
}
#pragma mark —— 全站维护
/// 全站维护【POST】
-(URLManagerModel *)post_operation_siteMain_queryDetail{
    return JobsURL(@"/api/operation/siteMain/queryDetail");
}
#pragma mark —— 公共资源
/// 教程子项详情【POST】
-(URLManagerModel *)post_operation_tutorial_config_detailItem{
    return JobsURL(@"/api/operation/tutorial/config/detailItem");
}
/// 教程列表【POST】
-(URLManagerModel *)post_api_operation_tutorial_config_list{
    return JobsURL(@"/api/operation/tutorial/config/listt");
}
/// 教程子项列表【POST】
-(URLManagerModel *)post_operation_tutorial_config_listItem{
    return JobsURL(@"/api/operation/tutorial/config/listItem");
}
#pragma mark —— 资源配置
/// 意见保存【POST】
-(URLManagerModel *)post_operation_advice_config_saveAdviceConfig{
    return JobsURL(@"/api/operation/advice/config/saveAdviceConfig");
}
#pragma mark —— 赞助模块
/// 查询赞助集锦列表【GET】
-(URLManagerModel *)get_operation_sponsor_high_list{
    return JobsURL(@"/api/operation/sponsor/high/list");
}
/// 查询赞助图集列表【GET】
-(URLManagerModel *)get_operation_sponsor_list{
    return JobsURL(@"/api/operation/sponsor/list");
}
#pragma mark —— 接口文档里面没有的
/// 获取好友邀请规则（邀请人数）【GET】
-(URLManagerModel *)get_invite_getInviteTerms{
    return JobsURL(@"/api/member/invite/getInviteTerms");
}
/// 收益统计【POST】
-(URLManagerModel *)get_invite_inviteBetAwardStatistic{
    return JobsURL(@"/api/member/invite/inviteBetAwardStatistic");
}
/// 邀请好友链接【GET】
-(URLManagerModel *)get_getReferralCode{
    return JobsURL(@"/api/member/invite/getReferralCode");
}
/// 银行-Deposit 提交【POST】
-(URLManagerModel *)post_fundDepositOrder{
    return JobsURL(@"/api/fund/deposit/order");
}
/// 获取支付渠道【GET】
-(URLManagerModel *)get_fundDP_channelList{
    return JobsURL(@"/api/fund/dp-channel/list");
}

@end
