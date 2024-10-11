//
//  NSObject+URLManager_3.h
//  FM
//
//  Created by User on 10/11/24.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extras.h"
#import "URLManagerModel.h"

NS_ASSUME_NONNULL_BEGIN
/// 来自 http://16.163.191.190:8100/api/promotion/doc.html
@interface NSObject (URLManager_3)
#pragma mark —— feign-support-controller
/// 查看是否有流水卷或者存送卷【POST】
-(URLManagerModel *)post_promotion_feign_rolls_list;
/// 批量使用流水卷或者存送卷【POST】
-(URLManagerModel *)post_promotion_feign_rolls_use;
#pragma mark —— health-controller
/// hearbeat【GET】
-(URLManagerModel *)get_promotion_heartbeat;
#pragma mark —— 大转盘
/// 查询大转盘活动参数配置【GET】
-(URLManagerModel *)get_promotion_activity_turntable_detail;
/// 大转盘抽奖【GET】
-(URLManagerModel *)get_promotion_activity_turntable_prize_get;
/// 分页查询大转盘活动抽奖记录【POST】
-(URLManagerModel *)post_promotion_activity_turntable_record;
/// 查询用户大转盘抽奖次数【GET】
-(URLManagerModel *)get_promotion_activity_turntable_user_num;
/// 查询用户大转盘活动抽奖记录【GET】
-(URLManagerModel *)get_promotion_activity_turntable_user_record;
#pragma mark —— 广告配置所有接口
/// 查询广告列表-支持游客:活动推广专区【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_activity;
/// 查询广告列表-支持游客:APP首页右下3Banner【GET】
-(URLManagerModel *)get_promotion_advertise_infoP_list_appIndex;
/// 查询广告列表-支持游客:APP会员中心【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_appMember;
/// 查询广告列表-支持游客:首页天顶轮播大Banner【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_index;
/// 查询广告列表-支持游客:导航栏4小Banner【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_navigationBar;
/// 查询广告列表-支持游客【GET】
-(URLManagerModel *)get_promotion_advertise_list;
/// 根据类型查询广告列表【GET】
-(URLManagerModel *)get_promotion_advertise_list_type;
#pragma mark —— 新手活动
/// 查询新手活动参数配置【GET】
-(URLManagerModel *)get_promotion_activity_newbie_detail;
/// 查询登录用户新手大礼包完成情况【GET】
-(URLManagerModel *)get_promotion_get_user_newbie_gift_detail;
/// 查询登录用户参加新手活动资格【GET】
-(URLManagerModel *)get_promotion_get_user_newbie_qualifications;
/// 查询登录用户签到完成情况【GET】
-(URLManagerModel *)get_promotion_get_user_sign_gift_detail;
/// 新手活动复活大礼包用户领取【GET】
-(URLManagerModel *)get_promotion_newbie_user_resurrection_receive;
/// 新手活动用户复活大礼包状态查询【GET】
-(URLManagerModel *)get_promotion_newbie_user_resurrection_statusGet;
/// 新手活动签到大礼包用户签到【GET】
-(URLManagerModel *)get_promotion_newbie_user_sign;
#pragma mark —— 活动相关接口
/// 存款优惠活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getActivity;
/// 存款优惠活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getDepositDiscountActivityRecord;
/// 会员签到活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getMemberSignActivityRecord;
/// 获取存款金额奖励【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getObtainDepositBonus;
/// 查询活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_queryActivityInfo;
/// 查询用户123存款活动的在途订单数量【POST】
-(URLManagerModel *)post_promotion_api_client_activity_queryInTransit123DepositOrdersCount;
/// 会员签到【POST】
-(URLManagerModel *)post_promotion_api_client_activity_sign;
/// 首存活动-查询累计流水【GET】
-(URLManagerModel *)get_promotion_event_activity_bet_total;
/// 活动领取-传返回记录的id【POST】
-(URLManagerModel *)post_promotion_event_activity_claimp;
/// 查询首存活动记录【GET】
-(URLManagerModel *)get_promotion_event_activity_record;
/// 会员签到【POST】
-(URLManagerModel *)post_promotion_event_memberSign;
/// 会员签到活动信息【POST】
-(URLManagerModel *)post_promotion_event_memberSignEvent;
#pragma mark —— 福利中心所有接口
/// 福利领取 ，目前只限2现金券 3存送卷 4流水卷【GET】
-(URLManagerModel *)get_promotion_welfare_claim;
/// 用户查询福利中心列表【POST】
-(URLManagerModel *)post_promotion_welfare_list;
/// 用户福利中心统计【GET】
-(URLManagerModel *)get_promotion_welfare_statistic;
/// vip模块领取福利【POST】
-(URLManagerModel *)post_promotion_welfare_vip_claim;

@end

NS_ASSUME_NONNULL_END
