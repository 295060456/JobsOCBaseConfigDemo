//
//  NSObject+URLManager_2.h
//  FM
//
//  Created by User on 10/11/24.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extras.h"
#import "URLManagerModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 来自 http://16.163.191.190:8097/doc.html
@interface NSObject (URLManager_2)
#pragma mark —— APP游戏首页娱乐城
/// 菲站APP首页- 受欢迎的游戏列表查询【POST】
-(URLManagerModel *)post_game_home_queryTopGamesList;
#pragma mark —— CQ9电子游戏接口19
/// CheckPlayer【GET】
-(URLManagerModel *)get_CQ9_checkPlayer:(NSString *)playerName;
/// getBalance【GET】
-(URLManagerModel *)get_CQ9_getBalance:(NSString *)playerName;
/// bet【POST】
-(URLManagerModel *)post_CQ9_bet;
/// credit【POST】
-(URLManagerModel *)post_CQ9_credit;
/// debit【POST】
-(URLManagerModel *)post_CQ9_debit;
/// EndRound【POST】
-(URLManagerModel *)post_CQ9_EndRound;
/// refund【POST】
-(URLManagerModel *)post_CQ9_refund;
/// rollin【POST】
-(URLManagerModel *)post_CQ9_rollin;
/// rollOut【POST】
-(URLManagerModel *)post_CQ9_rollOut;
/// takeAll【POST】
-(URLManagerModel *)post_CQ9_takeAll;
/// record【GET】
-(URLManagerModel *)get_CQ9_record:(NSString *)mtcode;
/// payoff【POST】
-(URLManagerModel *)post_CQ9_payoff;
/// errorHtml【GET】
-(URLManagerModel *)get_CQ9_errorHtml;
/// errorHtml【POST】
-(URLManagerModel *)post_CQ9_errorHtml;
/// errorHtml【PUT】
-(URLManagerModel *)put_CQ9_errorHtml;
/// errorHtml【DELETE】
-(URLManagerModel *)delete_CQ9_errorHtml;
#pragma mark —— EVO真人游戏接口
/// balance【POST】
-(URLManagerModel *)post_EVO_balance;
/// cancel【POST】
-(URLManagerModel *)post_EVO_cancel;
/// check【POST】
-(URLManagerModel *)post_EVO_check;
/// credit【POST】
-(URLManagerModel *)post_EVO_credit;
/// debit【POST】
-(URLManagerModel *)post_EVO_debit;
/// promo_payout【POST】
-(URLManagerModel *)post_EVO_promo_payout;
/// sid【POST】
-(URLManagerModel *)post_EVO_sid;
#pragma mark —— FC电子游戏接口
/// activityReward【POST】
-(URLManagerModel *)post_FC_activityReward;
/// bet【POST】
-(URLManagerModel *)post_FC_bet;
/// betCancel【POST】
-(URLManagerModel *)post_FC_betCancel;
/// BetNInfo【POST】
-(URLManagerModel *)post_FC_betNInfo;
/// CancelBetNInfo【POST】
-(URLManagerModel *)post_FC_cancelBetNInfo;
/// 余额回调【POST】
-(URLManagerModel *)post_FC_getBalance;
/// settle【POST】
-(URLManagerModel *)post_FC_settle;
#pragma mark —— JDB
/// 捕鱼游戏接口【POST】
-(URLManagerModel *)post_JDB_fish;
/// 棋牌游戏接口【POST】
-(URLManagerModel *)post_JDB_poker;
/// 电子接口【POST】
-(URLManagerModel *)post_JDB_;
/// 电子游戏接口【POST】
-(URLManagerModel *)post_JDB_slot;
#pragma mark —— JiLi
/// slot_auth【POST】
-(URLManagerModel *)post_JiLi_slot_auth;
/// slot_bet【POST】
-(URLManagerModel *)post_JiLi_slot_bet;
/// slot_cancelBet【POST】
-(URLManagerModel *)post_JiLi_slot_cancelBet;
/// slot_cancelSessionBet【POST】
-(URLManagerModel *)post_JiLi_slot_cancelSessionBet;
/// slot_sessionBet【POST】
-(URLManagerModel *)post_JiLi_slot_sessionBet;
#pragma mark —— KA电子游戏接口
/// balance【POST】
-(URLManagerModel *)post_KA_balance;
/// credit【POST】
-(URLManagerModel *)post_KA_credit;
/// end【POST】
-(URLManagerModel *)post_KA_end;
/// play【POST】
-(URLManagerModel *)post_KA_play;
/// revoke【POST】
-(URLManagerModel *)post_KA_revoke;
/// start【POST】
-(URLManagerModel *)post_KA_start;
#pragma mark —— PB体育游戏接口
/// ping【POST】
-(URLManagerModel *)post_PB_ping;
/// wagering⚠️【POST】
-(URLManagerModel *)post_PB_wagering;
#pragma mark —— PG电子游戏接口
/// cashAdjustment【POST】
-(URLManagerModel *)post_PG_cashAdjustment;
/// cashGet【POST】
-(URLManagerModel *)post_PG_cashGet;
/// cashTransferInOut【POST】
-(URLManagerModel *)post_PG_cashTransferInOut;
/// verifySession【POST】
-(URLManagerModel *)post_PG_verifySession;
#pragma mark —— 个人中心
/// 一键回收 返回中心钱包余额【POST】
-(URLManagerModel *)post_game_fund_collect;
/// 转入【POST】
-(URLManagerModel *)post_game_fund_transferIn;
/// 获取会员与转账场馆余额：缓存3秒【POST】
-(URLManagerModel *)post_game_fund_wallet;
#pragma mark —— 全平台投注记录相关接口
/// 跟单记录【POST】
-(URLManagerModel *)post_game_bet_followList;
/// mageXcess审计【GET】
-(URLManagerModel *)get_game_bet_mageXcess_queryRecord;
/// 根据传入的天数计算，返回超过days天数未登录的用户idlist【POST】
-(URLManagerModel *)post_game_bet_noLoginMemberIdList;
/// 按时间范围查询注单【POST】
-(URLManagerModel *)post_game_bet_orders;
/// 全平台投注记录列表【POST】
-(URLManagerModel *)post_game_bet_pageList;
#pragma mark —— 场馆转入转出记录列表
/// 场馆转入转出记录列表【POST】
-(URLManagerModel *)post_game_pay_pageList;
#pragma mark —— 子游戏数据导入测试
/// 游戏gameLobby数据导入【GET】
-(URLManagerModel *)get_game_pagcor_gameLobbyImport;
#pragma mark —— 对接PAGCOR的API
/// 游戏gameLobby数据导入【GET】
-(URLManagerModel *)get_game_pagcor_order_list;
#pragma mark —— 数据同步相关
/// 同步厅方订单数据【POST】
-(URLManagerModel *)post_game_job_fetchBetOrders;
/// 查询是否已经生成用户钱包【POST】
-(URLManagerModel *)post_game_syncData_checkExistWallet;
/// 同步用户钱包数据【POST】
-(URLManagerModel *)post_game_syncData_syncFundWallet;
#pragma mark —— 游戏数据统计
/// 统计注单流水稽核金额【POST】
-(URLManagerModel *)post_game_statis_queryAuditAmount;
/// 查询会员投注记录统计【POST】
-(URLManagerModel *)post_game_statis_queryBetByLobbyName;
/// 统计下注会员数&投注金额【POST】
-(URLManagerModel *)post_game_statis_queryBetInfoByAgent;
/// 查询游戏投注记录【POST】
-(URLManagerModel *)post_game_statis_queryBetListByPage;
/// 查询投注会员详情【POST】
-(URLManagerModel *)post_game_statis_queryGameOrderBetByPage;
/// 统计会员输赢【POST】
-(URLManagerModel *)post_game_statis_queryProfit;
/// 查询会员总输赢【POST】
-(URLManagerModel *)post_game_statis_queryUserProfitLoss;
/// 统计游戏有效投注额【POST】
-(URLManagerModel *)post_game_statis_queryValidBet;
/// 统计游戏有效投注额【POST】
-(URLManagerModel *)post_game_statis_queryValidBet2;
#pragma mark —— 游戏首页娱乐城
/// 游戏导航列表：缓存1分钟【GET】
-(URLManagerModel *)get_game_home_bar_list;
/// 游戏大厅喜爱的游戏-添加【POST】
-(URLManagerModel *)post_game_home_favoriteGames_add;
/// 游戏大厅喜爱的游戏-删除【POST】
-(URLManagerModel *)post_game_home_favoriteGames_delete;
/// 菲站首页- 查询所有厂商提供的老虎机游戏收藏列表【POST】
-(URLManagerModel *)post_game_home_favoriteGames_query;
/// 菲站游戏大厅-模糊查询【POST】
-(URLManagerModel *)post_game_home_gameZone_fuzzyQuery;
/// 菲站首页大厅场馆对应游戏列表-查询【POST】
-(URLManagerModel *)post_game_home_homeLobbyGame_query;
/// 菲站首页大厅场馆对应累加资金-查询【POST】
-(URLManagerModel *)post_game_home_jackpotsGamesFunds_query;
/// 菲站热门游戏/百家乐/轮盘/21点-查询【POST】
-(URLManagerModel *)post_game_home_liveCasino_quer;
/// 菲站首页- 受欢迎的游戏列表查询【POST】
-(URLManagerModel *)post_game_home_popularGames_query;
/// 菲站电子游戏页面/热门游戏及最新游戏-查询【POST】
-(URLManagerModel *)post_game_home_slot_query;
/// 前端- 查询所有厂商提供的老虎机游戏列表【POST】
-(URLManagerModel *)post_game_home_sub_list;
#pragma mark —— 进出游戏相关接口
/// 查询我的游戏注单详情【POST】
-(URLManagerModel *)post_game_bet_order_mybet_detail;
/// 查询我的游戏注单【POST】
-(URLManagerModel *)post_game_bet_order_mybet_sum;
/// 获取游戏url【POST】
-(URLManagerModel *)post_game_bet_single_wallet_jump;

@end

NS_ASSUME_NONNULL_END
