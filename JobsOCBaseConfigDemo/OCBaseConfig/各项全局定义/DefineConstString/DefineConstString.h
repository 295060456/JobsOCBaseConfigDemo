//
//  DefineConstString.h
//  Casino
//
//  Created by Jobs on 2021/12/13.
//

#import <Foundation/Foundation.h>
/// 系统环境一览
FOUNDATION_EXTERN NSString *_Nonnull const 应用程序的发布版本号;
FOUNDATION_EXTERN NSString *_Nonnull const APP编译构建的版本号;
FOUNDATION_EXTERN NSString *_Nonnull const APP的名字;
/// 网速监控
FOUNDATION_EXTERN NSString *_Nonnull const GSDownloadNetworkSpeedNotificationKey;/// 下载通知的key
FOUNDATION_EXTERN NSString *_Nonnull const GSUploadNetworkSpeedNotificationKey;/// 上传通知的key
FOUNDATION_EXTERN NSString *_Nonnull const GSUploadAndDownloadNetworkSpeedNotificationKey;/// 上传和下载 通知的key
/// 🔑钥匙串记录
FOUNDATION_EXTERN NSString *_Nonnull const 设备ID;
/// 多语言
FOUNDATION_EXTERN NSString *_Nonnull const 菲律宾语_不带区域组合;
FOUNDATION_EXTERN NSString *_Nonnull const 菲律宾语_菲律宾;
FOUNDATION_EXTERN NSString *_Nonnull const 简体中文;
FOUNDATION_EXTERN NSString *_Nonnull const 繁体中文;
FOUNDATION_EXTERN NSString *_Nonnull const 英文_不带区域组合;
/// HTTP 协议
FOUNDATION_EXTERN NSString *_Nonnull const GET;
FOUNDATION_EXTERN NSString *_Nonnull const POST;
FOUNDATION_EXTERN NSString *_Nonnull const PUT;
FOUNDATION_EXTERN NSString *_Nonnull const DELETE;
FOUNDATION_EXTERN NSString *_Nonnull const PATCH;
FOUNDATION_EXTERN NSString *_Nonnull const HEAD;
/// 网络请求参数
FOUNDATION_EXTERN NSString *_Nonnull const ContentType;
FOUNDATION_EXTERN NSString *_Nonnull const Authorization;
/// 特殊字符串
FOUNDATION_EXTERN NSString *_Nonnull const 回车符号转义字符;       /// 回车符号转义字符
FOUNDATION_EXTERN NSString *_Nonnull const 零宽转义字符;          /// 零宽转义字符
FOUNDATION_EXTERN NSString *_Nonnull const JobsSeparation;      /// 分隔符
FOUNDATION_EXTERN NSString *_Nonnull const JobsNewline;         /// 换行符
FOUNDATION_EXTERN NSString *_Nonnull const JobsTab;             /// 制表符
FOUNDATION_EXTERN NSString *_Nonnull const JobsSpace;           /// 空格
FOUNDATION_EXTERN NSString *_Nonnull const JobsEmpty;           /// 空字符串
FOUNDATION_EXTERN NSString *_Nonnull const JobsComma;           /// 逗号
FOUNDATION_EXTERN NSString *_Nonnull const JobsDot;             /// 句号
FOUNDATION_EXTERN NSString *_Nonnull const JobsColon;           /// 冒号
FOUNDATION_EXTERN NSString *_Nonnull const JobsSemicolon;       /// 分号
FOUNDATION_EXTERN NSString *_Nonnull const JobsDash;            /// 连字符
FOUNDATION_EXTERN NSString *_Nonnull const JobsUnderscore;      /// 下划线
FOUNDATION_EXTERN NSString *_Nonnull const JobsAsterisk;        /// 星号
FOUNDATION_EXTERN NSString *_Nonnull const JobsEqual;           /// 等于
/// 业务功能相关
FOUNDATION_EXTERN NSString *_Nonnull const 网络状态监控;/// 网络状态监控
FOUNDATION_EXTERN NSString *_Nonnull const 退到后台停止播放ZFPlayer;/// 退到后台停止播放ZFPlayer
FOUNDATION_EXTERN NSString *_Nonnull const 语言切换;/// 语言切换
FOUNDATION_EXTERN NSString *_Nonnull const 登录成功;/// 登录成功
FOUNDATION_EXTERN NSString *_Nonnull const 退出登录成功;/// 退出登录成功
FOUNDATION_EXTERN NSString *_Nonnull const 用户信息;
FOUNDATION_EXTERN NSString *_Nonnull const 用户名数组;
FOUNDATION_EXTERN NSString *_Nonnull const FM个人中心Tab切换;
FOUNDATION_EXTERN NSString *_Nonnull const FM用户数据;
FOUNDATION_EXTERN NSString *_Nonnull const FM用户协议;
FOUNDATION_EXTERN NSString *_Nonnull const App当日首次进入;
FOUNDATION_EXTERN NSString *_Nonnull const 获取极验验证码成功;
FOUNDATION_EXTERN NSString *_Nonnull const 获取极验验证码失败;
FOUNDATION_EXTERN NSString *_Nonnull const JobsLanguageKey;
FOUNDATION_EXTERN NSString *_Nonnull const KYC状态;
/*
 * 常用符号大全
 * 特殊符号 编号序号 数学符号 爱心符号 标点符号 单位符号 货币符号 箭头符号 符号图案 制表符 皇冠符号
 * 汉语拼音 中文字符 日语字符 希腊字母 俄语字母
 */
FOUNDATION_EXTERN NSString *_Nonnull const 皇冠符号;
FOUNDATION_EXTERN NSString *_Nonnull const 数学符号;
FOUNDATION_EXTERN NSString *_Nonnull const 标点符号;
FOUNDATION_EXTERN NSString *_Nonnull const 单位符号;
FOUNDATION_EXTERN NSString *_Nonnull const 货币符号;
FOUNDATION_EXTERN NSString *_Nonnull const 制表符;
FOUNDATION_EXTERN NSString *_Nonnull const 特殊符号;
FOUNDATION_EXTERN NSString *_Nonnull const 键盘特殊符号;
FOUNDATION_EXTERN NSString *_Nonnull const 编号序号;
FOUNDATION_EXTERN NSString *_Nonnull const 爱心符号;
FOUNDATION_EXTERN NSString *_Nonnull const 箭头符号;
FOUNDATION_EXTERN NSString *_Nonnull const 符号图案;
/// 语言文字类型
FOUNDATION_EXTERN NSString *_Nonnull const 希腊字母;
FOUNDATION_EXTERN NSString *_Nonnull const 俄语字母;
FOUNDATION_EXTERN NSString *_Nonnull const 汉语拼音;
FOUNDATION_EXTERN NSString *_Nonnull const 中文字符;
FOUNDATION_EXTERN NSString *_Nonnull const 日文平假名和片假名;
/// TMSCollectionView
FOUNDATION_EXTERN NSString * _Nonnull const TMSCollectionViewSectionHeader;
FOUNDATION_EXTERN NSString * _Nonnull const TMSCollectionViewSectionFooter;
/// WebSocket
FOUNDATION_EXTERN NSString * _Nonnull const kNeedPayOrderNote;
FOUNDATION_EXTERN NSString * _Nonnull const kWebSocketDidOpenNote;
FOUNDATION_EXTERN NSString * _Nonnull const kWebSocketDidCloseNote;
FOUNDATION_EXTERN NSString * _Nonnull const kWebSocketdidReceiveMessageNote;
/// 默认占位
FOUNDATION_EXTERN NSString *_Nonnull const 主标题文字默认占位内容;
FOUNDATION_EXTERN NSString *_Nonnull const 副标题文字默认占位内容;
FOUNDATION_EXTERN NSString *_Nonnull const B体育;
