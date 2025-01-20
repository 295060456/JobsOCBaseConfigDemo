//
//  JobsObject.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsObject_h
#define JobsObject_h
#pragma mark —— Base
/// 完整的文件名 = 文件名 + 后缀名
#import "FileNameModel.h"
/// 只执行一次
#import "JobsOnceExecutor.h"
/// 作用于全局的工具类（单例模式）
#import "JobsAppTools.h"
/// App 开屏广告
#import "JobsLaunchAdMgr.h"
/// App 语言国际化
#import "JobsLanguageManager.h"
/// 文件夹操作
#import "FileFolderHandleTool.h"
/// 时间管理
#import "JobsTimerManager.h"
/// 网络监控
#import "JobsMonitorNetwoking.h"
/// SockeIO
//#import "JobsSocketIOTools.h"
/// TouchID
#import "TouchID.h"
/// 记录SEL和IMP
#import "JobsSEL_IMP.h"
/// 用Objective-C仿写Swift中的元祖
#import "JobsTuple.h"
/// 钥匙串🔑
#import "JobsKeychainHelper.h"
/// 数据模型
#import "JobsModel.h"
#pragma mark —— Category【3rd】
/// 平替UIPickerView
#import "NSObject+BRPickerView.h"
/// 图片查看器
#import "NSObject+GKPhotoBrowser.h"
/// 对 NTESVerifyCodeManager 的二次封装
/// https://github.com/yidun/NTESVerifyCode
#import "NSObject+NTESVerifyCodeManager.h"
/// 极验验证码
/// https://www2.geetest.com/
#import "NSObject+GTCaptcha4.h"
/// LiveChat
#import "NSObject+LiveChat.h"
/// 猿题库网络框架的集成
#import "NSObject+YTKRequest.h"
///【二次封装HXPhotoPicker】弹出系统相册选择页面 + 调取系统相机进行拍摄
#import "NSObject+HXPhotoPicker.h"
/// 本地弹出View
#import "NSObject+TFPopup.h"
/// NSObject+Alert
#import "NSObject+SPAlertController.h"
#import "NSObject+SYSAlertController.h"
/// 网络监控
#import "NSObject+AFNReachability.h"
/// RAC
#import "NSObject+RAC.h"
/// 提示
#import "NSObject+WHToast.h"
#pragma mark —— Category【Sys.】
/// runtime方式获取对象的一些属性
#import "NSObject+RunrtimeGet.h"
/// 弹框提示退出登录清空本地用户数据
#import "NSObject+PopViewToLogOut.h"
/// 动态调用方法
#import "NSObject+DynamicInvoke.h"
/// 本机设备信息
#import "NSObject+CurrentDevice.h"
/// 本地推送通知封装
#import "NSObject+UserNotifications.h"
/// App更改图标
#import "NSObject+ChangeAppicon.h"
/// 正则表达式鉴定
#import "NSObject+RegularExpression.h"
/// 关于本机IP
#import "NSObject+DeviceIP.h"
/// 一些其他的拓展
#import "NSObject+Extras.h"
/// iOS设备唯一标识符
#import "NSObject+ID.h"
/// 测量数据
#import "NSObject+Measure.h"
/// 线程定义
#import "NSObject+DefConfig.h"
/// 全局的通知定义
#import "NSObject+Notification.h"
/// 万物回调
#import "NSObject+CallBackInfoByBlock.h"
/// runtime方法交换
#import "NSObject+Swizzling.h"
/// 打开URL
#import "NSObject+OpenURL.h"
/// 路径获取
#import "NSObject+Path.h"
/// 取随机
#import "NSObject+Random.h"
/// 富文本
#import "NSObject+RichText.h"
/// 振动反馈
#import "NSObject+Shake.h"
/// 声音反馈
#import "NSObject+Sound.h"
/// 对类的查看
#import "NSObject+Class.h"
/// 时间相关方法
#import "NSObject+Time.h"
/// UIScrollViewDelegate 协议
#import "NSObject+UIScrollViewDelegate.h"
/// Cell 部署策略
#import "NSObject+JobsDeployCellConfig.h"
/// 文本对齐
#import "NSObject+NSMutableParagraphStyle.h"
/// 关于数据
#import "NSObject+Data.h"
/// 关于算法
#import "NSObject+Algorithm.h"
/// 作为 NSObject 的替代者使用
#import "This.h"
/// 获取系统环境变量
#import "NSObject+SysInfo.h"
/// 处理 HTML 字符串
#import "NSObject+HTML.h"
/// 锁🔐
#import "JobsLocker.h"

#endif /* JobsObject_h */
