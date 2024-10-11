//
//  NSObject+URLManager_2.m
//  FM
//
//  Created by User on 10/11/24.
//

#import "NSObject+URLManager_2.h"
/// 来自 http://16.163.191.190:8097/doc.html
@implementation NSObject (URLManager_2)
#pragma mark —— APP游戏首页娱乐城
/// 菲站APP首页- 受欢迎的游戏列表查询【POST】
-(URLManagerModel *)post_game_home_queryTopGamesList{
    return JobsURL(@"/api/game/home/app/queryTopGamesList");
}
#pragma mark —— CQ9电子游戏接口19
/// CheckPlayer【GET】
-(URLManagerModel *)get_CQ9_checkPlayer:(NSString *)playerName{
    NSString *url = @"api/game/callback/cq9/slot/player/check/{".add(playerName).add(@"}");
    return JobsURL(url);
}
/// getBalance【GET】
-(URLManagerModel *)get_CQ9_getBalance:(NSString *)playerName{
    NSString *url = @"/api/game/callback/cq9/slot/transaction/balance/{".add(playerName).add(@"}");
    return JobsURL(url);
}
/// bet【POST】
-(URLManagerModel *)post_CQ9_bet{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/bet");
}
/// credit【POST】
-(URLManagerModel *)post_CQ9_credit{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/credit");
}
/// debit【POST】
-(URLManagerModel *)post_CQ9_debit{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/debit");
}
/// EndRound【POST】
-(URLManagerModel *)post_CQ9_EndRound{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/endround");
}
/// refund【POST】
-(URLManagerModel *)post_CQ9_refund{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/refund");
}
/// rollin【POST】
-(URLManagerModel *)post_CQ9_rollin{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/rollin");
}
/// rollOut【POST】
-(URLManagerModel *)post_CQ9_rollOut{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/rollout");
}
/// takeAll【POST】
-(URLManagerModel *)post_CQ9_takeAll{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/game/takeall");
}
/// record【GET】
-(URLManagerModel *)get_CQ9_record:(NSString *)mtcode{
    NSString *url = @"/api/game/callback/cq9/slot/transaction/record/{".add(mtcode).add(@"}");
    return JobsURL(url);
}
/// payoff【POST】
-(URLManagerModel *)post_CQ9_payoff{
    return JobsURL(@"/api/game/callback/cq9/slot/transaction/user/payoff");
}
/// errorHtml【GET】
-(URLManagerModel *)get_CQ9_errorHtml{
    return JobsURL(@"/error");
}
/// errorHtml【POST】
-(URLManagerModel *)post_CQ9_errorHtml{
    return JobsURL(@"/error");
}
/// errorHtml【PUT】
-(URLManagerModel *)put_CQ9_errorHtml{
    return JobsURL(@"/error");
}
/// errorHtml【DELETE】
-(URLManagerModel *)delete_CQ9_errorHtml{
    return JobsURL(@"/error");
}
#pragma mark —— EVO真人游戏接口
/// balance【POST】
-(URLManagerModel *)post_EVO_balance{
    return JobsURL(@"/api/game/callback/evo/real/api/balance");
}
/// cancel【POST】
-(URLManagerModel *)post_EVO_cancel{
    return JobsURL(@"/api/game/callback/evo/real/api/cancel");
}
/// check【POST】
-(URLManagerModel *)post_EVO_check{
    return JobsURL(@"/api/game/callback/evo/real/api/check");
}
/// credit【POST】
-(URLManagerModel *)post_EVO_credit{
    return JobsURL(@"/api/game/callback/evo/real/api/credit");
}
/// debit【POST】
-(URLManagerModel *)post_EVO_debit{
    return JobsURL(@"/api/game/callback/evo/real/api/debit");
}
/// promo_payout【POST】
-(URLManagerModel *)post_EVO_promo_payout{
    return JobsURL(@"/api/game/callback/evo/real/api/promo_payout");
}
/// sid【POST】
-(URLManagerModel *)post_EVO_sid{
    return JobsURL(@"/api/game/callback/evo/real/api/sid");
}
#pragma mark —— FC电子游戏接口
/// activityReward【POST】
-(URLManagerModel *)post_FC_activityReward{
    return JobsURL(@"/api/game/callback/fc/slot/activity");
}
/// bet【POST】
-(URLManagerModel *)post_FC_bet{
    return JobsURL(@"/api/game/callback/fc/slot/bet");
}
/// betCancel【POST】
-(URLManagerModel *)post_FC_betCancel{
    return JobsURL(@"/api/game/callback/fc/slot/betCancel");
}
/// BetNInfo【POST】
-(URLManagerModel *)post_FC_betNInfo{
    return JobsURL(@"/api/game/callback/fc/slot/betInfo");
}
/// CancelBetNInfo【POST】
-(URLManagerModel *)post_FC_cancelBetNInfo{
    return JobsURL(@"/api/game/callback/fc/slot/cancelBetInfo");
}
/// 余额回调【POST】
-(URLManagerModel *)post_FC_getBalance{
    return JobsURL(@"/api/game/callback/fc/slot/getBalance");
}
/// settle【POST】
-(URLManagerModel *)post_FC_settle{
    return JobsURL(@"/api/game/callback/fc/slot/settle");
}
#pragma mark —— JDB
/// 捕鱼游戏接口【POST】
-(URLManagerModel *)post_JDB_fish{
    return JobsURL(@"/api/game/callback/jdb/fish");
}
/// 棋牌游戏接口【POST】
-(URLManagerModel *)post_JDB_poker{
    return JobsURL(@"/api/game/callback/jdb/poker");
}
/// 电子接口【POST】
-(URLManagerModel *)post_JDB_{
    return JobsURL(@"/api/game/callback/jdb");
}
/// 电子游戏接口【POST】
-(URLManagerModel *)post_JDB_slot{
    return JobsURL(@"/api/game/callback/jdb/slot");
}
#pragma mark —— JiLi
/// slot_auth【POST】
-(URLManagerModel *)post_JiLi_slot_auth{
    return JobsURL(@"/api/game/callback/jili/slot/auth");
}
/// slot_bet【POST】
-(URLManagerModel *)post_JiLi_slot_bet{
    return JobsURL(@"/api/game/callback/jili/slot/bet");
}
/// slot_cancelBet【POST】
-(URLManagerModel *)post_JiLi_slot_cancelBet{
    return JobsURL(@"/api/game/callback/jili/slot/cancelBet");
}
/// slot_cancelSessionBet【POST】
-(URLManagerModel *)post_JiLi_slot_cancelSessionBet{
    return JobsURL(@"/api/game/callback/jili/slot/cancelSessionBet");
}
/// slot_sessionBet【POST】
-(URLManagerModel *)post_JiLi_slot_sessionBet{
    return JobsURL(@"/api/game/callback/jili/slot/sessionBet");
}
#pragma mark —— KA电子游戏接口
/// balance【POST】
-(URLManagerModel *)post_KA_balance{
    return JobsURL(@"/api/game/callback/ka/balance");
}
/// credit【POST】
-(URLManagerModel *)post_KA_credit{
    return JobsURL(@"/api/game/callback/ka/credit");
}
/// end【POST】
-(URLManagerModel *)post_KA_end{
    return JobsURL(@"/api/game/callback/ka/end");
}
/// play【POST】
-(URLManagerModel *)post_KA_play{
    return JobsURL(@"/api/game/callback/ka/play");
}
/// revoke【POST】
-(URLManagerModel *)post_KA_revoke{
    return JobsURL(@"/api/game/callback/ka/revoke");
}
/// start【POST】
-(URLManagerModel *)post_KA_start{
    return JobsURL(@"/api/game/callback/ka/start");
}
#pragma mark —— PB体育游戏接口
/// ping【POST】
-(URLManagerModel *)post_PB_ping{
    return JobsURL(@"/api/game/callback/pingbo/sports/ping");
}
/// wagering⚠️【POST】
-(URLManagerModel *)post_PB_wagering{
    return JobsURL(@"/api/game/callback/pingbo/sports/{agentcode}/wagering/usercode/{usercode}/request/{requestid}");
}
#pragma mark —— PG电子游戏接口
/// cashAdjustment【POST】
-(URLManagerModel *)post_PG_cashAdjustment{
    return JobsURL(@"/api/game/callback/pg/slot/Cash/Adjustment");
}
/// cashGet【POST】
-(URLManagerModel *)post_PG_cashGet{
    return JobsURL(@"/api/game/callback/pg/slot/Cash/Get");
}
/// cashTransferInOut【POST】
-(URLManagerModel *)post_PG_cashTransferInOut{
    return JobsURL(@"/api/game/callback/pg/slot/Cash/TransferInOut");
}
/// verifySession【POST】
-(URLManagerModel *)post_PG_verifySession{
    return JobsURL(@"/api/game/callback/pg/slot/VerifySession");
}
#pragma mark —— 个人中心
/// 一键回收 返回中心钱包余额【POST】
-(URLManagerModel *)post_game_fund_collect{
    return JobsURL(@"/api/game/fund/collect");
}
/// 转入【POST】
-(URLManagerModel *)post_game_fund_transferIn{
    return JobsURL(@"/api/game/fund/transferIn");
}
/// 获取会员与转账场馆余额：缓存3秒【POST】
-(URLManagerModel *)post_game_fund_wallet{
    return JobsURL(@"/api/game/fund/wallet");
}
#pragma mark —— 全平台投注记录相关接口
/// 跟单记录【POST】
-(URLManagerModel *)post_game_bet_followList{
    return JobsURL(@"/api/game/bet/followList");
}
/// mageXcess审计【GET】
-(URLManagerModel *)get_game_bet_mageXcess_queryRecord{
    return JobsURL(@"/api/game/bet/mageXcess/queryRecord");
}
/// 根据传入的天数计算，返回超过days天数未登录的用户idlist【POST】
-(URLManagerModel *)post_game_bet_noLoginMemberIdList{
    return JobsURL(@"/api/game/bet/noLoginMemberIdList");
}
/// 按时间范围查询注单【POST】
-(URLManagerModel *)post_game_bet_orders{
    return JobsURL(@"/api/game/bet/orders");
}
/// 全平台投注记录列表【POST】
-(URLManagerModel *)post_game_bet_pageList{
    return JobsURL(@"/api/game/bet/pageList");
}
#pragma mark —— 场馆转入转出记录列表
/// 场馆转入转出记录列表【POST】
-(URLManagerModel *)post_game_pay_pageList{
    return JobsURL(@"/api/game/pay/pageList");
}
#pragma mark —— 子游戏数据导入测试
/// 游戏gameLobby数据导入【GET】
-(URLManagerModel *)get_game_pagcor_gameLobbyImport{
    return JobsURL(@"/api/game/pagcor/gameLobbyImport");
}
#pragma mark —— 对接PAGCOR的API
/// 游戏gameLobby数据导入【GET】
-(URLManagerModel *)get_game_pagcor_order_list{
    return JobsURL(@"/api/game/pagcor/order/list");
}
#pragma mark —— 数据同步相关
/// 同步厅方订单数据【POST】
-(URLManagerModel *)post_game_job_fetchBetOrders{
    return JobsURL(@"/api/game/job/fetchBetOrders");
}
/// 查询是否已经生成用户钱包【POST】
-(URLManagerModel *)post_game_syncData_checkExistWallet{
    return JobsURL(@"/api/game/syncData/checkExistWallet");
}
/// 同步用户钱包数据【POST】
-(URLManagerModel *)post_game_syncData_syncFundWallet{
    return JobsURL(@"/api/game/syncData/syncFundWallet");
}
#pragma mark —— 游戏数据统计
/// 统计注单流水稽核金额【POST】
-(URLManagerModel *)post_game_statis_queryAuditAmount{
    return JobsURL(@"/api/game/statis/queryAuditAmount");
}
/// 查询会员投注记录统计【POST】
-(URLManagerModel *)post_game_statis_queryBetByLobbyName{
    return JobsURL(@"/api/game/statis/queryBetByLobbyName");
}
/// 统计下注会员数&投注金额【POST】
-(URLManagerModel *)post_game_statis_queryBetInfoByAgent{
    return JobsURL(@"/api/game/statis/queryBetInfoByAgent");
}
/// 查询游戏投注记录【POST】
-(URLManagerModel *)post_game_statis_queryBetListByPage{
    return JobsURL(@"/api/game/statis/queryBetListByPage");
}
/// 查询投注会员详情【POST】
-(URLManagerModel *)post_game_statis_queryGameOrderBetByPage{
    return JobsURL(@"/api/game/statis/queryGameOrderBetByPage");
}
/// 统计会员输赢【POST】
-(URLManagerModel *)post_game_statis_queryProfit{
    return JobsURL(@"/api/game/statis/queryProfit");
}
/// 查询会员总输赢【POST】
-(URLManagerModel *)post_game_statis_queryUserProfitLoss{
    return JobsURL(@"/api/game/statis/queryUserProfitLoss");
}
/// 统计游戏有效投注额【POST】
-(URLManagerModel *)post_game_statis_queryValidBet{
    return JobsURL(@"/api/game/statis/queryValidBet");
}
/// 统计游戏有效投注额【POST】
-(URLManagerModel *)post_game_statis_queryValidBet2{
    return JobsURL(@"/api/game/statis/queryValidBet2");
}
#pragma mark —— 游戏首页娱乐城
/// 游戏导航列表：缓存1分钟【GET】
-(URLManagerModel *)get_game_home_bar_list{
    return JobsURL(@"/api/game/home/bar/list");
}
/// 游戏大厅喜爱的游戏-添加【POST】
-(URLManagerModel *)post_game_home_favoriteGames_add{
    return JobsURL(@"/api/game/home/favoriteGames/add");
}
/// 游戏大厅喜爱的游戏-删除【POST】
-(URLManagerModel *)post_game_home_favoriteGames_delete{
    return JobsURL(@"/api/game/home/favoriteGames/delete");
}
/// 菲站首页- 查询所有厂商提供的老虎机游戏收藏列表【POST】
-(URLManagerModel *)post_game_home_favoriteGames_query{
    return JobsURL(@"/api/game/home/favoriteGames/query");
}
/// 菲站游戏大厅-模糊查询【POST】
-(URLManagerModel *)post_game_home_gameZone_fuzzyQuery{
    return JobsURL(@"/api/game/home/gameZone/fuzzyQuery");
}
/// 菲站首页大厅场馆对应游戏列表-查询【POST】
-(URLManagerModel *)post_game_home_homeLobbyGame_query{
    return JobsURL(@"/api/game/home/homeLobbyGame/query");
}
/// 菲站首页大厅场馆对应累加资金-查询【POST】
-(URLManagerModel *)post_game_home_jackpotsGamesFunds_query{
    return JobsURL(@"/api/game/home/jackpotsGamesFunds/query");
}
/// 菲站热门游戏/百家乐/轮盘/21点-查询【POST】
-(URLManagerModel *)post_game_home_liveCasino_quer{
    return JobsURL(@"/api/game/home/liveCasino/query");
}
/// 菲站首页- 受欢迎的游戏列表查询【POST】
-(URLManagerModel *)post_game_home_popularGames_query{
    return JobsURL(@"/api/game/home/popularGames/query");
}
/// 菲站电子游戏页面/热门游戏及最新游戏-查询【POST】
-(URLManagerModel *)post_game_home_slot_query{
    return JobsURL(@"/api/game/home/slot/query");
}
/// 前端- 查询所有厂商提供的老虎机游戏列表【POST】
-(URLManagerModel *)post_game_home_sub_list{
    return JobsURL(@"/api/game/home/sub/list");
}
#pragma mark —— 进出游戏相关接口
/// 查询我的游戏注单详情【POST】
-(URLManagerModel *)post_game_bet_order_mybet_detail{
    return JobsURL(@"/api/game/bet/order/mybet/detail");
}
/// 查询我的游戏注单【POST】
-(URLManagerModel *)post_game_bet_order_mybet_sum{
    return JobsURL(@"/api/game/bet/order/mybet/sum");
}
/// 获取游戏url【POST】
-(URLManagerModel *)post_game_bet_single_wallet_jump{
    return JobsURL(@"/api/game/bet/single-wallet/jump");
}

@end
