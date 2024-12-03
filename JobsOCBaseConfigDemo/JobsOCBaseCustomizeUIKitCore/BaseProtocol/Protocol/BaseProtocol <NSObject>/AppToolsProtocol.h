//
//  AppToolsProtocol.h
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"
#import "JobsBlock.h"
#import "JobsAppDoorConfig.h"
#import "NetworkingConstant.h"
#import "NetworkingConstant.h"

@class JobsHotLabelBySingleLine;
@class CasinoGetiOSNewestVersionModel;

NS_ASSUME_NONNULL_BEGIN
/// App工具协议
@protocol AppToolsProtocol <BaseProtocol>
@optional
#pragma mark —— <AppToolsProtocol> 关于注册登录
/// Token过期应该做的事情
-(jobsByVoidBlock _Nonnull)tokenExpire;
/// 退出登录应该做的事情
-(jobsByVoidBlock _Nonnull)logout;
/// 清除用户数据资料
-(jobsByVoidBlock _Nonnull)cleanUserData;
/// 去登录？去注册？
-(jobsByNSIntegerBlock _Nonnull)toLoginOrRegister;
/// 在某些页面不调取登录页
-(void)toLoginOrRegisterWithRestricted:(NSArray <Class>*_Nullable)dataArr
                    appDoorContentType:(CurrentPage)appDoorContentType;
/// 去登录
-(jobsByVoidBlock _Nonnull)toLogin;
/// 强制去登录
-(jobsByVoidBlock _Nonnull)forcedLogin;
/// 触发退出登录模块之前，弹窗提示二次确认，确认以后再删除本地用户数据
-(void)popUpViewToLogout;
#pragma mark —— <AppToolsProtocol> 关于 TabBar
/// TabBar
-(UITabBar *)getTabBar;
/// JobsTabbarVC 关闭手势
-(jobsByVoidBlock _Nonnull)tabBarClosePan;
/// JobsTabbarVC 打开手势
-(jobsByVoidBlock _Nonnull)tabBarOpenPan;
/// 跳到首页
-(void)jumpToHome;
/// 获取Tabbar管理的，不含导航的根控制器
-(NSMutableArray <UIViewController *>*)appRootVC;
/// 当前对象是否是 Tabbar管理的，不含导航的根控制器
-(BOOL)isRootVC;
#pragma mark —— 关于图片编解码
/// 图片base64编码，再固定50字符的位置加入固定盐。盐码（盐需大写、长度 16位）：RRU4JZTV5WZXPCVZ
/// 编码
-(JobsReturnStringByStringBlock _Nonnull)encodePicStr;
/// 解码
-(JobsReturnStringByStringBlock _Nonnull)decodePicStr;
#pragma mark —— <AppToolsProtocol> 其他
/// 设置普通文本
-(UIViewModel *)configViewModelWithTitle:(NSString *_Nullable)title
                                subTitle:(NSString *_Nullable)subTitle;
/// 带段落配置的文本
-(UIViewModel *)configViewModelWithAttributeTitle:(NSString *_Nullable)title
                                attributeSubTitle:(NSString *_Nullable)subTitle;
/// 打开游戏
-(jobsByStringBlock _Nonnull)openGameWithUrl;
/// 默认头像👤
-(UIImage *)defaultHeaderImage;
/// 当前语言【字符串形式】
-(NSString *)currentLanguage;
/// 当前语言【枚举形式】
-(HTTPRequestHeaderLanguageType)currentLanguageType;
/// App 升级弹窗：在根控制器下实现，做到覆盖全局的统一
-(void)appUpdateWithData:(CasinoGetiOSNewestVersionModel *_Nonnull)updateData
               sureBlock:(jobsByIDBlock _Nullable)sureBlock
             cancelBlock:(jobsByIDBlock _Nullable)cancelBlock;

-(jobsByHotLabelBlock)actionForHotLabel;

@end

NS_ASSUME_NONNULL_END
