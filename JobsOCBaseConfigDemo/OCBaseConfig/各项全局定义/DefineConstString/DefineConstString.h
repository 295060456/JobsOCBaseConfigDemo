//
//  DefineConstString.h
//  Casino
//
//  Created by Jobs on 2021/12/13.
//

#import <Foundation/Foundation.h>
///
FOUNDATION_EXTERN const NSRange NSRangeZero;
/// SDK内部类
FOUNDATION_EXTERN NSString *_Nonnull const UISystemBackgroundView;
FOUNDATION_EXTERN NSString *_Nonnull const UITableViewHeaderFooterViewBackground;
FOUNDATION_EXTERN NSString *_Nonnull const UIScrollViewScrollIndicator;
FOUNDATION_EXTERN NSString *_Nonnull const UIBarBackground;
FOUNDATION_EXTERN NSString *_Nonnull const UINavigationBarContentView;
FOUNDATION_EXTERN NSString *_Nonnull const UITableViewCellSwipeContainerView;
FOUNDATION_EXTERN NSString *_Nonnull const UISwipeActionPullView;
FOUNDATION_EXTERN NSString *_Nonnull const UITableViewCellDeleteConfirmationView;
FOUNDATION_EXTERN NSString *_Nonnull const UITabBarButtonLabel;
FOUNDATION_EXTERN NSString *_Nonnull const UITabBarSwappableImageView;
FOUNDATION_EXTERN NSString *_Nonnull const UITAMICAdaptorView;
FOUNDATION_EXTERN NSString *_Nonnull const UITextContainerView;
FOUNDATION_EXTERN NSString *_Nonnull const UIBackdropView;
FOUNDATION_EXTERN NSString *_Nonnull const UIBackdropEffectView;
FOUNDATION_EXTERN NSString *_Nonnull const UIStatusBar;
FOUNDATION_EXTERN NSString *_Nonnull const UIStatusBarModern;
FOUNDATION_EXTERN NSString *_Nonnull const UIStatusBarData;
FOUNDATION_EXTERN NSString *_Nonnull const UIStatusBarRegion;
FOUNDATION_EXTERN NSString *_Nonnull const UIStatusBarCellularItem;
FOUNDATION_EXTERN NSString *_Nonnull const UIStatusBarWifiItem;
FOUNDATION_EXTERN NSString *_Nonnull const UIStatusBarBatteryItem;
FOUNDATION_EXTERN NSString *_Nonnull const UITextEffectsWindow;
FOUNDATION_EXTERN NSString *_Nonnull const UIRemoteKeyboardWindow;
FOUNDATION_EXTERN NSString *_Nonnull const UIRemoteKeyboardPlaceholderView;
FOUNDATION_EXTERN NSString *_Nonnull const UITableViewCellContentView;
FOUNDATION_EXTERN NSString *_Nonnull const UITableViewHeaderFooterContentView;
FOUNDATION_EXTERN NSString *_Nonnull const UICollectionViewPlaceholderView;
FOUNDATION_EXTERN NSString *_Nonnull const UICollectionViewCellActionsView;
FOUNDATION_EXTERN NSString *_Nonnull const UICollectionViewListCellSeparator;
FOUNDATION_EXTERN NSString *_Nonnull const UINavigationBarLargeTitleView;
FOUNDATION_EXTERN NSString *_Nonnull const UIButtonBarStackView;
FOUNDATION_EXTERN NSString *_Nonnull const UIButtonBarButton;
FOUNDATION_EXTERN NSString *_Nonnull const UIButtonBar;
FOUNDATION_EXTERN NSString *_Nonnull const UIToolbarContentView;
FOUNDATION_EXTERN NSString *_Nonnull const UIToolbarNavigationButton;
FOUNDATION_EXTERN NSString *_Nonnull const UIToolbarButton;
FOUNDATION_EXTERN NSString *_Nonnull const UIInterfaceActionGroupView;
FOUNDATION_EXTERN NSString *_Nonnull const UIInterfaceActionRepresentationView;
FOUNDATION_EXTERN NSString *_Nonnull const UIInterfaceActionSeparatorView;
FOUNDATION_EXTERN NSString *_Nonnull const UIAlertControllerView;
FOUNDATION_EXTERN NSString *_Nonnull const UIAlertControllerShadowedScrollView;
FOUNDATION_EXTERN NSString *_Nonnull const UIAlertControllerTextFieldView;
FOUNDATION_EXTERN NSString *_Nonnull const UIContextMenuContainerView;
FOUNDATION_EXTERN NSString *_Nonnull const UIContextMenuActionsListView;
FOUNDATION_EXTERN NSString *_Nonnull const UIPlatterMenuController;
FOUNDATION_EXTERN NSString *_Nonnull const UILegacyPopoverController;
FOUNDATION_EXTERN NSString *_Nonnull const UIPopoverView;
FOUNDATION_EXTERN NSString *_Nonnull const UITableViewCellEditControl;
FOUNDATION_EXTERN NSString *_Nonnull const UITabBarButton;
/// 系统环境一览
FOUNDATION_EXTERN NSString *_Nonnull const 应用程序的发布版本号;
FOUNDATION_EXTERN NSString *_Nonnull const APP编译构建的版本号;
FOUNDATION_EXTERN NSString *_Nonnull const APP的名字;
/// App 首次启动
FOUNDATION_EXTERN NSString *_Nonnull const APP安装以后首次启动;
FOUNDATION_EXTERN NSString *_Nonnull const APP今日首次启动;
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
FOUNDATION_EXTERN NSString *_Nonnull const HTTP;
FOUNDATION_EXTERN NSString *_Nonnull const HTTPS;
FOUNDATION_EXTERN NSString *_Nonnull const HTTP分割符;
FOUNDATION_EXTERN NSString *_Nonnull const GET;
FOUNDATION_EXTERN NSString *_Nonnull const POST;
FOUNDATION_EXTERN NSString *_Nonnull const PUT;
FOUNDATION_EXTERN NSString *_Nonnull const DELETE;
FOUNDATION_EXTERN NSString *_Nonnull const PATCH;
FOUNDATION_EXTERN NSString *_Nonnull const HEAD;
FOUNDATION_EXTERN NSString *_Nonnull const APP_JSON;
/// 网络请求参数
FOUNDATION_EXTERN NSString *_Nonnull const ContentType;
FOUNDATION_EXTERN NSString *_Nonnull const Authorization;
/// 网络数据处理后的标志位
FOUNDATION_EXTERN NSString *_Nonnull const HTTPServiceErrorDomain;/// The Http request error domain
FOUNDATION_EXTERN NSString *_Nonnull const HTTPServiceErrorResponseCodeKey;/// 请求成功，但statusCode != 0
FOUNDATION_EXTERN NSString *_Nonnull const HTTPServiceErrorRequestURLKey;/// 请求地址错误
FOUNDATION_EXTERN NSString *_Nonnull const HTTPServiceErrorHTTPStatusCodeKey;/// 请求错误的code码key: 请求成功了，但code码是错误提示的code,比如参数错误
FOUNDATION_EXTERN NSString *_Nonnull const HTTPServiceErrorDescriptionKey;/// 请求错误，详细描述key
FOUNDATION_EXTERN NSString *_Nonnull const HTTPServiceErrorMessagesKey;/// 服务端错误提示，信息key
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
FOUNDATION_EXTERN NSString *_Nonnull const JobsPercent;         /// 百分号
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
FOUNDATION_EXTERN NSString *_Nonnull const 菲律宾货币符号;
FOUNDATION_EXTERN NSString *_Nonnull const 已点击;
FOUNDATION_EXTERN NSString *_Nonnull const 未点击;
FOUNDATION_EXTERN NSString *_Nonnull const 拍照;
FOUNDATION_EXTERN NSString *_Nonnull const 从相册中选取;
FOUNDATION_EXTERN NSString *_Nonnull const 取消;
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
FOUNDATION_EXTERN NSString *_Nonnull const BSPORTS;
/// 其他
FOUNDATION_EXTERN NSString *_Nonnull const RoundedBorderLayer;
