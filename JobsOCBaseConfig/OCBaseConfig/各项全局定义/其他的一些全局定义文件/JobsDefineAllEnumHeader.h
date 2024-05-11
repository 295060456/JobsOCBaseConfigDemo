//
//  JobsDefineAllEnumHeader.h
//  MataShop
//
//  Created by Jobs Hi on 10/10/23.
//
#pragma mark —— 此文件用来存储记录全局的一些枚举

#ifndef JobsDefineAllEnumHeader_h
#define JobsDefineAllEnumHeader_h

#pragma mark —— 系统相关
/// 开发环境
typedef NS_ENUM(NSInteger,JobsNetworkingEnvir) {
    JobsNetworkingEnvir_Undefined = 0,
    JobsNetworkingEnvir_DevEnviron_Cambodia_Main,/// 柬埔寨（主要）开发环境
    JobsNetworkingEnvir_DevEnviron_Cambodia_Minor,/// 柬埔寨（次要）开发环境
    JobsNetworkingEnvir_DevEnviron_China_Mainland,/// 中国大陆开发环境
    JobsNetworkingEnvir_TestEnviron,/// 测试环境
    JobsNetworkingEnvir_ProductEnviron,/// 生产环境
    JobsNetworkingEnvir_UATEnviron,/// UAT环境地址
    JobsNetworkingEnvir_All
};
/// 平台维护状态
typedef NS_ENUM(NSInteger,JobsAppStatus) {
    JobsAppStatus_Undefined = 0,
    JobsAppStatus_Maintenance,/// 平台维护中
    JobsAppStatus_OK,/// 平台正常
    JobsAppStatus_Close,/// 平台关闭
    JobsAppStatus_All
};
/// 终端类型
typedef NS_ENUM(NSInteger,JobsTerminalType) {
    JobsTerminalType_Undefined = 0,/// 保留字段
    JobsTerminalType_Android,/// 安卓平台
    JobsTerminalType_iOS,/// iOS平台
    JobsTerminalType_Web,/// Web平台
    JobsTerminalType_All
};
/// 更新类型
typedef NS_ENUM(NSInteger,JobsUpdateType) {
    JobsUpdate_Undefined,/// 不更新
    JobsUpdateBySys,/// 系统强制更新
    JobsUpdateByUser,/// 用户手动更新
    JobsUpdate_All,/// 系统自动更新
};

typedef struct{
    NSInteger section;
    NSInteger rowOrItem;
}JobsIndexPath;/// 这样写的话，外面可以JobsIndexPath.section 进行调用

typedef NS_ENUM(NSInteger, CompareRes) {
    CompareRes_Error,
    CompareRes_MoreThan, /// >
    CompareRes_Equal,/// ==
    CompareRes_LessThan /// <
};

typedef NS_ENUM(NSInteger, JobsSearchStrategy) {
    JobsSearchStrategy_Accurate = 0,/// 精确查询
    JobsSearchStrategy_Fuzzy/// 模糊查询
};

typedef NS_ENUM(NSInteger, ScrollDirection) {
    ScrollDirectionNone = 0,
    ScrollDirectionRight,/// 右👉🏻
    ScrollDirectionLeft,/// 左👈🏻
    ScrollDirectionUp,/// 上面👆🏻
    ScrollDirectionDown,/// 下面👇🏻
    ScrollDirectionRight_UP,/// 右上👉🏻👆🏻
    ScrollDirectionLeft_UP,/// 左上👈🏻👆🏻
    ScrollDirectionRight_Down,/// 右下👉🏻👇🏻
    ScrollDirectionLeft_Down,/// 左下👈🏻👇🏻
};
#pragma mark —— 订单相关
/// 时间定义
typedef NS_ENUM(NSInteger,JobsOrderDate) {
    JobsOrderDate_Undefined,
    JobsOrderDate_Today = 0,/// 今天
    JobsOrderDate_Yesterday,/// 昨天
    JobsOrderDate_In7Days,/// 近7天内
    JobsOrderDate_InOneMonth,/// 一个月内
    JobsOrderDate_All/// 全部
};
/// 支付类型
typedef NS_ENUM(NSInteger,JobsPayType) {
    JobsPayType_Undefined,
    JobsPayType_银行卡,
    JobsPayType_支付宝,
    JobsPayType_微信,
    JobsPayType_数字货币,
    JobsPayType_人工后台操作上下分,
    JobsPayType_AppBalance,/// App余额支付
    JobsPayType_MataValue,/// Mata值支付
    JobsPayType_MataCreditScore,/// 信用分支付
    JobsPayType_All
};
/// 默认支付类型
typedef NS_ENUM(NSInteger,JobsPayDefaultType) {
    JobsPayDefaultType_Undefined,
    JobsPayDefaultType_Main,/// 主支付类型
    JobsPayDefaultType_Other,/// 副支付类型
    JobsPayDefaultType_All
};
/// 订单类型
typedef NS_ENUM(NSInteger, JobsOrderType) {
    JobsOrderType_Undefined,
    JobsOrderType_商城订单,
    JobsOrderType_信用分订单,
    JobsOrderType_课程订单,
    JobsOrderType_All
};
/// 订单5大状态：待付款、待发货（已付款）、已发货（在途）、已收货（待评价）、完成订单（已评价）
typedef NS_ENUM(NSInteger, JobsOrderState) {
    JobsOrderState_Undefined,///
    JobsOrderState_Due,/// 待付款订单
    JobsOrderState_WaitSent,/// 已付款.待发货订单
    JobsOrderState_WaitReceived,/// 已发货.待收货订单
    JobsOrderState_Evaluate,/// 已完成收货的订单，并且待评价
    JobsOrderState_Finished,/// 已完成收货的订单，并且已经评价
    JobsOrderState_待审核订单,
    JobsOrderState_已审核订单,
    JobsOrderState_订单出款错误,
    JobsOrderState_订单已经被删除,
    JobsOrderState_All/// 全部订单
};
#pragma mark —— 会员相关
/// 更新用户信息
typedef NS_ENUM(NSInteger, JobsUpdateUserInfoType) {
    JobsUpdateUserInfoType_Undefined = 0,/// 未定义
    JobsUpdateUserInfoType_Nation,/// 国家
    JobsUpdateUserInfoType_Nationality,/// 民族
    JobsUpdateUserInfoType_RealName,/// 真实姓名
    JobsUpdateUserInfoType_NikeName,/// 花名
    JobsUpdateUserInfoType_Age,/// 年龄
    JobsUpdateUserInfoType_Birthday,/// 生日
    JobsUpdateUserInfoType_sex,/// 性别
    JobsUpdateUserInfoType_SexualOrientation,/// 性倾向
    JobsUpdateUserInfoType_Mail,/// 邮箱地址
    JobsUpdateUserInfoType_Wechat,/// 微信账号
    JobsUpdateUserInfoType_QQ,/// QQ账号
    JobsUpdateUserInfoType_Telephone,/// 手机号码
    JobsUpdateUserInfoType_SinaWeibo,/// 新浪微博账号
    JobsUpdateUserInfoType_Telegram,/// 纸飞机账号
    JobsUpdateUserInfoType_Instagram,/// Instagram账号
    JobsUpdateUserInfoType_Facebook,/// Facebook账号
    JobsUpdateUserInfoType_Skype,/// Skype账号
    JobsUpdateUserInfoType_WhatsApp,/// WhatsApp账号
    JobsUpdateUserInfoType_All,/// 全部更新
};
/// 会员等级
typedef NS_ENUM(NSInteger,JobsRankClass) {
    JobsRankClass_Undefined = 0,/// 未定义
    JobsRankClass_VIP0,
    JobsRankClass_VIP1,
    JobsRankClass_VIP2,
    JobsRankClass_VIP3,
    JobsRankClass_VIP4,
    JobsRankClass_VIP5,
    JobsRankClass_VIP6,
    JobsRankClass_VIP7,
    JobsRankClass_VIP8,
    JobsRankClass_VIP9,
    JobsRankClass_VIP10,
    JobsRankClass_All
};
/// 活动状态
typedef NS_ENUM(NSInteger,JobsActiveState) {
    JobsActiveState_Undefined = 0,/// 未定义
    JobsActiveState_参与活动,
    JobsActiveState_等级不符,
    JobsActiveState_正在参与活动,
    JobsActiveState_已参与过活动,
    JobsActiveState_All
};
/// 客服平台状态
typedef NS_ENUM(NSInteger, JobsCustomerContactType) {
    JobsCustomerContactType_Undefined = 0,/// 未定义
    JobsCustomerContactType_Close,/// 停用
    JobsCustomerContactType_Open,/// 启用
    JobsCustomerContactType_All,
};
/// 客服平台标识
typedef NS_ENUM(NSInteger, JobsCustomerContactStyle) {
    JobsCustomerContactStyle_Undefined = 0,/// 未定义
    JobsCustomerContactStyle_QQ = 1,/// QQ
    JobsCustomerContactStyle_Skype,/// Skype
    JobsCustomerContactStyle_Telegram,/// Telegram
    JobsCustomerContactStyle_whatsApp,/// whatsApp
    JobsCustomerContactStyle_手机号码,/// 手机号码
    JobsCustomerContactStyle_OnlineURL,/// onlineURL
    JobsCustomerContactStyle_All,
};
/// 消息类型
typedef NS_ENUM(NSInteger, JobsMsgType) {
    JobsMsgType_Undefined = 0,/// 未定义
    JobsMsgType_Notify,/// 通知
    JobsMsgType_Activity,/// 活动
    JobsMsgType_Notice,/// 公告
    JobsMsgType_Bonus,/// 红利
    JobsMsgType_All,
};

#endif /* JobsDefineAllEnumHeader_h */
