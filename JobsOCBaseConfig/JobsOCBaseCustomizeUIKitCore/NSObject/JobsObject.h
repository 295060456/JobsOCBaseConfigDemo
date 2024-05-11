//
//  JobsObject.h
//  Casino
//
//  Created by Jobs on 2021/12/9.
//

#ifndef JobsObject_h
#define JobsObject_h

#pragma mark —— Base
/// App语言国际化
#import "CLLanguageManager.h"
/// 文件夹操作
#import "FileFolderHandleTool.h"
/// 时间管理
#import "JobsTimerManager.h"
/// 时间格式转换、时间相关模型 【包含  JobsTimeModel 和 JobsTimeFormatterModel 两个类】
#import "JobsTimeModel.h"
/// 网络监控
#import "JobsMonitorNetwoking.h"
/// SockeIO
//#import "JobsSocketIOTools.h"
/// TouchID
#import "TouchID.h"
/// 移除系统自带的UITabBarButton
#import "DeleteSystemUITabBarButton.h"
/// 本类是自定义类，但是是对系统类的仿写，目的是承接上下文数据 成一束，方便管理
#import "UIViewModel.h"
#import "JobsHeaderFooterViewModel.h"
/// 时间格式化
#import "JobsFormatTime.h"
/// 记录SEL和IMP
#import "JobsSEL_IMP.h"
/// 用Objective-C仿写Swift中的元祖
#import "JobsTuple.h"
/// 按钮数据源
#import "UIButtonModel.h"
/// 文本数据源
#import "UITextModel.h"

#pragma mark —— Category
/// 【二次封装HXPhotoPicker】弹出系统相册选择页面 + 调取系统相机进行拍摄
#import "NSObject+HXPhotoPicker.h"
/// runtime方式获取对象的一些属性
#import "NSObject+RunrtimeGet.h"
/// 弹框提示退出登录清空本地用户数据
#import "NSObject+PopViewToLogOut.h"
/// 动态调用方法
#import "NSObject+DynamicInvoke.h"
/// 本机设备信息
#import "NSObject+CurrentDevice.h"
/// 本地弹出View
#import "NSObject+Popup.h"
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
/// 万物数据绑定
#import "NSObject+DataBinding.h"
/// runtime方法交换
#import "NSObject+Swizzling.h"
/// 打开URL
#import "NSObject+OpenURL.h"
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
/// 提示
#import "NSObject+WHToast.h"
/// NSObject+Alert
#import "NSObject+SPAlertController.h"
#import "NSObject+SYSAlertController.h"
/// 网络监控
#import "NSObject+AFNReachability.h"
///【对FileFolderHandleTool的二次封装】 存数据，储存成功返回地址
#import "NSObject+DataSave.h"
/// UIScrollViewDelegate 协议
#import "NSObject+UIScrollViewDelegate.h"
/// Cell 部署策略
#import "NSObject+JobsDeployCellConfig.h"
/// 文本对齐
#import "NSObject+NSMutableParagraphStyle.h"
/// 平替UIPickerView
#import "NSObject+BRPickerView.h"
/// 图片查看器
#import "NSObject+GKPhotoBrowser.h"

#endif /* JobsObject_h */
