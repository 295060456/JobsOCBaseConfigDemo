//
//  NSObject+URLManager_3.m
//  FM
//
//  Created by User on 10/11/24.
//

#import "NSObject+URLManager_3.h"
/// 来自 http://16.163.191.190:8100/api/promotion/doc.html
@implementation NSObject (URLManager_3)
#pragma mark —— feign-support-controller
/// 查看是否有流水卷或者存送卷【POST】
-(URLManagerModel *)post_promotion_feign_rolls_list{
    return JobsURL(@"/api/promotion/feign/rolls/list");
}
/// 批量使用流水卷或者存送卷【POST】
-(URLManagerModel *)post_promotion_feign_rolls_use{
    return JobsURL(@"/api/promotion/feign/rolls/use");
}
#pragma mark —— health-controller
/// hearbeat【GET】
-(URLManagerModel *)get_promotion_heartbeat{
    return JobsURL(@"/api/promotion/heartbeat");
}
#pragma mark —— 大转盘
/// 查询大转盘活动参数配置【GET】
-(URLManagerModel *)get_promotion_activity_turntable_detail{
    return JobsURL(@"/api/promotion/activity/turntable/detail");
}
/// 大转盘抽奖【GET】
-(URLManagerModel *)get_promotion_activity_turntable_prize_get{
    return JobsURL(@"/api/promotion/activity/turntable/prize/get");
}
/// 分页查询大转盘活动抽奖记录【POST】
-(URLManagerModel *)post_promotion_activity_turntable_record{
    return JobsURL(@"/api/promotion/activity/turntable/record");
}
/// 查询用户大转盘抽奖次数【GET】
-(URLManagerModel *)get_promotion_activity_turntable_user_num{
    return JobsURL(@"/api/promotion/activity/turntable/user/num");
}
/// 查询用户大转盘活动抽奖记录【GET】
-(URLManagerModel *)get_promotion_activity_turntable_user_record{
    return JobsURL(@"/api/promotion/activity/turntable/user/record");
}
#pragma mark —— 广告配置所有接口
/// 查询广告列表-支持游客:活动推广专区【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_activity{
    return JobsURL(@"/api/promotion/advertise/info/list/activity");
}
/// 查询广告列表-支持游客:APP首页右下3Banner【GET】
-(URLManagerModel *)get_promotion_advertise_infoP_list_appIndex{
    return JobsURL(@"/api/promotion/advertise/info/list/app-index");
}
/// 查询广告列表-支持游客:APP会员中心【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_appMember{
    return JobsURL(@"/api/promotion/advertise/info/list/app-member");
}
/// 查询广告列表-支持游客:首页天顶轮播大Banner【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_index{
    return JobsURL(@"/api/promotion/advertise/info/list/index");
}
/// 查询广告列表-支持游客:导航栏4小Banner【GET】
-(URLManagerModel *)get_promotion_advertise_info_list_navigationBar{
    return JobsURL(@"/api/promotion/advertise/info/list/navigation-bar");
}
/// 查询广告列表-支持游客【GET】
-(URLManagerModel *)get_promotion_advertise_list{
    return JobsURL(@"/api/promotion/advertise/list");
}
/// 根据类型查询广告列表【GET】
-(URLManagerModel *)get_promotion_advertise_list_type{
    return JobsURL(@"/api/promotion/advertise/list/type");
}
#pragma mark —— 新手活动
/// 查询新手活动参数配置【GET】
-(URLManagerModel *)get_promotion_activity_newbie_detail{
    return JobsURL(@"/api/promotion/activity/newbie/detail");
}
/// 查询登录用户新手大礼包完成情况【GET】
-(URLManagerModel *)get_promotion_get_user_newbie_gift_detail{
    return JobsURL(@"/api/promotion/get/user/newbie/gift/detail");
}
/// 查询登录用户参加新手活动资格【GET】
-(URLManagerModel *)get_promotion_get_user_newbie_qualifications{
    return JobsURL(@"/api/promotion/get/user/newbie/qualifications");
}
/// 查询登录用户签到完成情况【GET】
-(URLManagerModel *)get_promotion_get_user_sign_gift_detail{
    return JobsURL(@"/api/promotion/get/user/sign/gift/detail");
}
/// 新手活动复活大礼包用户领取【GET】
-(URLManagerModel *)get_promotion_newbie_user_resurrection_receive{
    return JobsURL(@"/api/promotion/newbie/user/resurrection/receive");
}
/// 新手活动用户复活大礼包状态查询【GET】
-(URLManagerModel *)get_promotion_newbie_user_resurrection_statusGet{
    return JobsURL(@"/api/promotion/newbie/user/resurrection/status/get");
}
/// 新手活动签到大礼包用户签到【GET】
-(URLManagerModel *)get_promotion_newbie_user_sign{
    return JobsURL(@"/api/promotion/newbie/user/sign");
}
#pragma mark —— 活动相关接口
/// 存款优惠活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getActivity{
    return JobsURL(@"/api/promotion/api/client/activity/getActivity");
}
/// 存款优惠活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getDepositDiscountActivityRecord{
    return JobsURL(@"/api/promotion/api/client/activity/getDepositDiscountActivityRecord");
}
/// 会员签到活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getMemberSignActivityRecord{
    return JobsURL(@"/api/promotion/api/client/activity/getMemberSignActivityRecord");
}
/// 获取存款金额奖励【POST】
-(URLManagerModel *)post_promotion_api_client_activity_getObtainDepositBonus{
    return JobsURL(@"/api/promotion/api/client/activity/getObtainDepositBonus");
}
/// 查询活动信息【POST】
-(URLManagerModel *)post_promotion_api_client_activity_queryActivityInfo{
    return JobsURL(@"/api/promotion/api/client/activity/queryActivityInfo");
}
/// 查询用户123存款活动的在途订单数量【POST】
-(URLManagerModel *)post_promotion_api_client_activity_queryInTransit123DepositOrdersCount{
    return JobsURL(@"/api/promotion/api/client/activity/queryInTransit123DepositOrdersCount");
}
/// 会员签到【POST】
-(URLManagerModel *)post_promotion_api_client_activity_sign{
    return JobsURL(@"/api/promotion/api/client/activity/sign");
}
/// 首存活动-查询累计流水【GET】
-(URLManagerModel *)get_promotion_event_activity_bet_total{
    return JobsURL(@"/api/promotion/event/activity/bet/total");
}
/// 活动领取-传返回记录的id【POST】
-(URLManagerModel *)post_promotion_event_activity_claimp{
    return JobsURL(@"/api/promotion/event/activity/claim");
}
/// 查询首存活动记录【GET】
-(URLManagerModel *)get_promotion_event_activity_record{
    return JobsURL(@"/api/promotion/event/activity/record");
}
/// 会员签到【POST】
-(URLManagerModel *)post_promotion_event_memberSign{
    return JobsURL(@"/api/promotion/event/memberSign");
}
/// 会员签到活动信息【POST】
-(URLManagerModel *)post_promotion_event_memberSignEvent{
    return JobsURL(@"/api/promotion/event/memberSignEvent");
}
#pragma mark —— 福利中心所有接口
/// 福利领取 ，目前只限2现金券 3存送卷 4流水卷【GET】
-(URLManagerModel *)get_promotion_welfare_claim{
    return JobsURL(@"/api/promotion/welfare/claim");
}
/// 用户查询福利中心列表【POST】
-(URLManagerModel *)post_promotion_welfare_list{
    return JobsURL(@"/api/promotion/welfare/list");
}
/// 用户福利中心统计【GET】
-(URLManagerModel *)get_promotion_welfare_statistic{
    return JobsURL(@"/api/promotion/welfare/statistic");
}
/// vip模块领取福利【POST】
-(URLManagerModel *)post_promotion_welfare_vip_claim{
    return JobsURL(@"/api/promotion/welfare/vip/claim");
}

@end
