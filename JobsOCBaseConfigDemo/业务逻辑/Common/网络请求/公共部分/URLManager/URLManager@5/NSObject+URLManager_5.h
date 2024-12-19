//
//  NSObject+URLManager_5.h
//  FM
//
//  Created by User on 10/11/24.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extras.h"
#import "URLManagerModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 来自 http://18.162.73.145:18193/doc.html#/default/
@interface NSObject (URLManager_5)
#pragma mark —— adjust-order-controller
/// 资金调整@POST
-(URLManagerModel *)post_fund_adjust_adjustOrder;
/// 资金调整审核@POST
-(URLManagerModel *)post_fund_adjust_auditFundAdjust;
/// 批量资金调整@POST
-(URLManagerModel *)post_fund_adjust_batchAdjustOrderList;
#pragma mark —— ai-pay-controller
/// MantaPayGcash支付订单回调@POST
-(URLManagerModel *)post_fund_deposit_aipay_callback;
/// MantaPayGcash提现订单回调@POST
-(URLManagerModel *)post_fund_payment_aipay_callback;
#pragma mark —— bbpay-controller
/// BB支付-充值回调@POST
-(URLManagerModel *)post_fund_callback_bbpay_depositCallback;
#pragma mark —— cb-pay-controller
/// 九五支付订单回调@POST
-(URLManagerModel *)post_fund_deposit_jwpay_callback;
#pragma mark —— da-xin-yu-pay-controller
/// 大信誉支付充值订单回调@POST
-(URLManagerModel *)post_fund_callback_daxinyupay_depositCallbac;
#pragma mark —— gt-pay-ph-controller
/// GTpayPH支付订单回调@POST
-(URLManagerModel *)post_fund_deposit_gtpay_ph_callback;
/// GTpayPH提现订单回调@POST
-(URLManagerModel *)post_fund_payment_gtpay_ph_callback;
#pragma mark —— gtpay-controller
/// GT支付充值订单回调@POST
-(URLManagerModel *)post_fund_callback_gtpay_depositCallback;
#pragma mark —— hsct-pay-controller
/// 合胜财通支付订单回调@POST
-(URLManagerModel *)post_fund_callback_hsCtPay_depositCallback;
#pragma mark —— joy-pay-service
/// depositCallBack@POST
-(URLManagerModel *)post_fund_gcash_deposit_joypay_callback;
#pragma mark —— lh-pay-controller
/// 领航支付订单回调@POST
-(URLManagerModel *)post_fund_deposit_lhpay_callback;
#pragma mark —— lubupay-controller
/// 吕布支付充值订单回调@POST
-(URLManagerModel *)post_fund_callback_lubupay_depositCallback;
#pragma mark —— manta-pay-controller
/// MantaPayGcash支付订单回调@GET
-(URLManagerModel *)get_fund_deposit_mantapay_gcash_callback;
/// MantaPayMaya支付订单回调@POST
-(URLManagerModel *)post_fund_deposit_mantapay_maya_callback;
/// MantaPayGcash提现订单回调@GET
-(URLManagerModel *)get_fund_payment_mantapay_gcash_callback;
/// MantaPayMaya提现订单回调@POST
-(URLManagerModel *)post_fund_payment_mantapay_maya_callback;
#pragma mark —— ptsg-cash-service
/// depositCallBack@POST
-(URLManagerModel *)post_fund_gcash_deposit_pts_callback;
/// paymentCallBack@POST
-(URLManagerModel *)post_fund_gcash_payment_pts_callback;
/// withdrawConfirmation@POST
-(URLManagerModel *)post_fund_gcash_pts_withdraw_confirmation;
#pragma mark —— ttpay-controller
/// TT支付充值订单回调@POST
-(URLManagerModel *)post_fund_callback_ttpay_depositCallbackn;
#pragma mark —— wuyoupay-controller
/// TT支付充值订单回调@POST
-(URLManagerModel *)post_fund_callback_ttpay_depositCallback;
#pragma mark —— wy-pay-controller
/// WYPay支付订单回调@POST
-(URLManagerModel *)post_fund_deposit_wypay_callback;
#pragma mark —— xh-pay-controller
/// 幸汇支付订单回调@POST
-(URLManagerModel *)post_fund_deposit_xhPay_callback;
#pragma mark —— yf-pay-controller
/// 远方支付订单回调@POST
-(URLManagerModel *)post_fund_deposit_yfpay_callback;
#pragma mark —— yh-pay-controller
/// 123pay支付订单回调@POST
-(URLManagerModel *)post_fund_deposit_yhpay_callback;
/// 123pay提现订单回调@POST
-(URLManagerModel *)post_fund_payment_yhpay_callback;
#pragma mark —— 资金明细接口
/// 查询会员资金明细@POST
-(URLManagerModel *)post_fund_report_trade_page;
#pragma mark —— 资金模块-微服务内部使用-四方商户接口
/// 查询电子钱包商户余额@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_eWallet_balance_fiatByMCHID;
/// 会员电子钱包出款下单@POST
-(URLManagerModel *)post_fund_eWallet_payment_fiat;
/// 代理法币出款下单@POST
-(URLManagerModel *)post_fund_merchantBiz_agentPayment_fiat;
/// 代理USDT出款下单@POST
-(URLManagerModel *)post_fund_merchantBiz_agentPayment_usdt;
/// 查询法币商户余额@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_merchantBiz_balance_fiatByMCHID;
/// 查询USDT商户余额@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_merchantBiz_balance_usdtByMCHID;
/// 会员法币充值创建订单@POST`
-(URLManagerModel *)post_fund_merchantBiz_deposit_fiat;
/// 会员USDT充值创建订单@POST
-(URLManagerModel *)post_fund_merchantBiz_deposit_usdt;
/// 会员法币出款下单@POST
-(URLManagerModel *)post_fund_merchantBiz_payment_fiat;
/// 会员USDT出款下单@POST
-(URLManagerModel *)post_fund_merchantBiz_payment_usdt;
#pragma mark —— 资金模块-提现接口
/// 提现拆单的子单进行状态确认-确认收款@POST
-(URLManagerModel *)post_fund_withdraw_confirmOrder;
/// eWallet提现下单@POST
-(URLManagerModel *)post_fund_withdraw_eWallet_order;
/// EB币提现下单@POST
-(URLManagerModel *)post_fund_withdraw_ebpay_order;
/// 查询提现订单状态@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_withdraw_get_order_statusByOrderNo;
/// 查询正在进行中的提现订单的收银台详情@POST
-(URLManagerModel *)post_fund_withdraw_getOrder;
/// 法币提现下单@POST
-(URLManagerModel *)post_fund_withdraw_order;
/// 虚拟币提现下单@POST
-(URLManagerModel *)post_fund_withdraw_usdtOrder;
#pragma mark —— 资金模块-虚拟币汇率
/// 获取USDT虚拟币的参考汇率@GET
-(URLManagerModel *)get_fund_crypto_getRate_usdt_rateType:(NSString *)rateType fiatCurrency:(NSString *)fiatCurrency;
#pragma mark —— 资金管理-充值接口
/// 代理充值@POST
-(URLManagerModel *)post_fund_deposit_agentDepositRecor;
/// C2C银行转账充值@POST
-(URLManagerModel *)post_fund_deposit_c2cOrder;
/// 用户撤销充值订单@PUT
-(URLManagerModel *)put_fund_deposit_cancel_order;
/// 查询用户充值加送剩余额度@GET
-(URLManagerModel *)get_fund_deposit_getChanelDeposit_Limit;
/// 查询用户充值加送剩余额度@GET
-(URLManagerModel *)get_fund_deposit_getDeposit_gift;
/// 查询充值订单状态@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_deposit_getOrder_statusByOrderNo;
/// 查询用户充值当日已加送额度@POST
-(URLManagerModel *)post_fund_deposit_getChannelDepositGift;
/// 获取系统当前时间@POST
-(URLManagerModel *)post_fund_deposit_getCurrentDate;
/// 查询正在进行中的充值订单的收银台详情@POST
-(URLManagerModel *)post_fund_deposit_getOrder;
/// 普通充值@POST
-(URLManagerModel *)post_fund_deposit_order;
/// 上传支付凭证@POST
-(URLManagerModel *)post_fund_deposit_upload;
/// USDT充值@POST
-(URLManagerModel *)post_fund_deposit_usdtOrder;
#pragma mark —— 资金管理-充值通道列表接口
/// 查询代理可用的充值通道@GET
-(URLManagerModel *)get_fund_dpChannel_agentDepositChannelList;
/// 拉取充值通道类型页面提示文案@GET
-(JobsReturnURLManagerModelByStringBlock _Nonnull)get_fund_dpChannel_contentByChannelTypeId;
/// 拉取会员可用的充值通道列表@GET
-(URLManagerModel *)get_fund_dpChannel_list;
#pragma mark —— 资金管理-提现类型列表接口
/// 拉取提现页面提示文案@GET
-(URLManagerModel *)get_fund_wdChannel_content;
/// 拉取大额提现规则信息@GET
-(URLManagerModel *)get_fund_wdChannel_largeWithdrawLimit;
/// 拉取会员可用的提现通道列表@GET
-(URLManagerModel *)get_fund_wdChannel_list;
#pragma mark —— 资金管理-银行管理接口
/// 查询平台所支持的银行@GET
-(URLManagerModel *)get_fund_bank_list_support;
/// 查询平台可用的银行列表（C2C提现）@GET
-(URLManagerModel *)get_fund_bank_list_c2c;

@end

NS_ASSUME_NONNULL_END
