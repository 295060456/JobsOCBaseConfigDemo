//
//  NSObject+URLManager_4.h
//  FM
//
//  Created by User on 10/11/24.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extras.h"
#import "URLManagerModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 来自 http://16.163.191.190:8099/doc.html
@interface NSObject (URLManager_4)
#pragma mark —— 信息配置
/// 跑马灯信息查询【建议前端每20s-30s可以刷新请求一次】【GET】
-(URLManagerModel *)get_operation_announce_config_queryAnnByMember;
/// 站内信全部变为已读【建议前端每5s刷新一次】【PUT】
-(URLManagerModel *)put_operation_letter_config_allReadStatus;
/// 站内信全部删除【PUT】
-(URLManagerModel *)put_operation_letter_config_deleteAll;
/// 站内信删除【PUT】
-(URLManagerModel *)put_operation_letter_config_deleteLetter;
/// 是否有未读站内信【建议前端每5s刷新一次】【POST】
-(URLManagerModel *)post_operation_letter_config_hasUnRead;
/// 站内信记录查询【POST】
-(URLManagerModel *)post_operation_letter_config_queryLetterConfigSendList;
/// 站内信变为已读【PUT】
-(URLManagerModel *)put_operation_letter_config_toReadStatus;
#pragma mark —— 全站维护
/// 全站维护【POST】
-(URLManagerModel *)post_operation_siteMain_queryDetail;
#pragma mark —— 公共资源
/// 教程子项详情【POST】
-(URLManagerModel *)post_operation_tutorial_config_detailItem;
/// 教程列表【POST】
-(URLManagerModel *)post_api_operation_tutorial_config_list;
/// 教程子项列表【POST】
-(URLManagerModel *)post_operation_tutorial_config_listItem;
#pragma mark —— 资源配置
/// 意见保存【POST】
-(URLManagerModel *)post_operation_advice_config_saveAdviceConfig;
#pragma mark —— 赞助模块
/// 查询赞助集锦列表【GET】
-(URLManagerModel *)get_operation_sponsor_high_list;
/// 查询赞助图集列表【GET】
-(URLManagerModel *)get_operation_sponsor_list;
#pragma mark —— 接口文档里面没有的
/// 获取好友邀请规则（邀请人数）【GET】
-(URLManagerModel *)get_invite_getInviteTerms;
/// 收益统计【POST】
-(URLManagerModel *)get_invite_inviteBetAwardStatistic;
/// 邀请好友链接【GET】
-(URLManagerModel *)get_getReferralCode;
/// 银行-Deposit 提交【POST】
-(URLManagerModel *)post_fundDepositOrder;
/// 获取支付渠道【GET】
-(URLManagerModel *)get_fundDP_channelList;

@end

NS_ASSUME_NONNULL_END
