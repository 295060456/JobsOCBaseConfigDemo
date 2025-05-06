//
//  AppToolsProtocol.h
//  Casino
//
//  Created by Jobs on 2021/12/7.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"
#import "BaseProtocol.h"
#import "XProtocol.h"
#import "JobsBlock.h"
#import "JobsAppDoorConfig.h"
#import "NetworkingConstant.h"

@class UIViewModel;
@class UIButtonModel;
@class UITextModel;
@class JobsHotLabelBySingleLine;
@class CasinoGetiOSNewestVersionModel;
@class JobsRichTextConfig;

NS_ASSUME_NONNULL_BEGIN
/// App工具协议
@protocol AppToolsProtocol <BaseProtocol,XProtocol>
@optional
#pragma mark —— 关于挂载的数据资料
Prop_strong(nullable)UIViewModel *viewModel;
Prop_weak(nullable)UIViewModel *viewModel_weak;
Prop_strong(nullable)UIButtonModel *buttonModel;
Prop_strong(nullable)UIButtonModel *subButtonModel;
Prop_strong(nullable)UITextModel *textModel;
Prop_strong(nullable)UITextModel *subTextModel;
Prop_strong(nullable)UITextModel *backBtnTitleModel;/// 在具体的子类去实现，以覆盖父类的方法实现
Prop_copy(nullable)NSMutableArray <__kindof UIViewModel *> *viewModels;
Prop_copy(nullable)NSMutableArray <__kindof UIButtonModel *> *buttonModels;
/// JobsRichTextConfig
Prop_copy(nullable)NSMutableArray <JobsRichTextConfig *> *titleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > titleAttributedStr
Prop_copy(nullable)NSMutableArray <JobsRichTextConfig *> *subTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > titleAttributedStr
Prop_copy(nullable)NSMutableArray <JobsRichTextConfig *> *selectedTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > selectedAttributedText
Prop_copy(nullable)NSMutableArray <JobsRichTextConfig *> *selectedSubTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > selectedAttributedText
#pragma mark —— 关于导航栏
Prop_strong(nullable)UIButtonModel *closeBtnModel;
Prop_strong(nullable)UIButtonModel *backBtnModel;
Prop_strong(nullable)UIViewModel *titleModel;
/// 配置GKNavigationBar（不包括返回键的设定）
-(jobsByViewModelBlock _Nonnull)setGKNav;
/// 配置 JobsNavBarConfig
-(JobsReturnNavBarConfigByButtonModelBlock _Nonnull)makeNavBarConfig;
/// 配置GKNavigationBar的返回按钮（从上个页面推过来才有返回键）
-(jobsByBtnBlock _Nonnull)setGKNavBackBtn;
/// 配置GKNavigationBar的返回按钮
-(jobsByBtnBlock _Nonnull)setGKNavBackBtnBy;
/// 配置GKNavigationBar的标题（按钮）
-(jobsByButtonModelBlock _Nonnull)setGKNavTitleBtnBy;
/// 返回按钮的回调
-(JobsReturnNavBarByVoidBtnBlock _Nullable)JobsNavBarBackBtnClickBlock;
/// 关闭按钮的回调
-(JobsReturnNavBarByVoidBtnBlock _Nullable)JobsNavBarCloseBtnClickBlock;
#pragma mark —— 获取绑定的数据源
-(UIViewModel *_Nullable)getViewModel;
-(__kindof UIButtonModel *_Nullable)getButtonModel;
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
-(void)toLoginOrRegisterWithRestricted:(__kindof NSArray <Class>*_Nullable)dataArr
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
-(NSMutableArray <__kindof UIViewController *>*)appRootVC;
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

-(jobsByHotLabelBlock _Nonnull)actionForHotLabel;

@end

NS_ASSUME_NONNULL_END

#ifndef AppToolsProtocol_synthesize
#define AppToolsProtocol_synthesize \
\
@synthesize viewModel = _viewModel; \
@synthesize viewModel_weak = _viewModel_weak; \
@synthesize buttonModel = _buttonModel; \
@synthesize subButtonModel = _subButtonModel; \
@synthesize textModel = _textModel; \
@synthesize subTextModel = _subTextModel; \
@synthesize backBtnTitleModel = _backBtnTitleModel; \
@synthesize viewModels = _viewModels; \
@synthesize buttonModels = _buttonModels; \
@synthesize titleAttributedDataMutArr = _titleAttributedDataMutArr; \
@synthesize subTitleAttributedDataMutArr = _subTitleAttributedDataMutArr; \
@synthesize selectedTitleAttributedDataMutArr = _selectedTitleAttributedDataMutArr; \
@synthesize selectedSubTitleAttributedDataMutArr = _selectedSubTitleAttributedDataMutArr; \
@synthesize closeBtnModel = _closeBtnModel; \
@synthesize backBtnModel = _backBtnModel; \
@synthesize titleModel = _titleModel; \

#endif /* AppToolsProtocol_synthesize */

#ifndef AppToolsProtocol_dynamic
#define AppToolsProtocol_dynamic \
\
@dynamic viewModel;\
@dynamic viewModel_weak;\
@dynamic buttonModel;\
@dynamic subButtonModel;\
@dynamic textModel;\
@dynamic subTextModel;\
@dynamic backBtnTitleModel;\
@dynamic viewModels;\
@dynamic buttonModels;\
@dynamic titleAttributedDataMutArr;\
@dynamic subTitleAttributedDataMutArr;\
@dynamic selectedTitleAttributedDataMutArr;\
@dynamic selectedSubTitleAttributedDataMutArr;\
@dynamic closeBtnModel;\
@dynamic backBtnModel;\
@dynamic titleModel;\

#endif /* AppToolsProtocol_dynamic */
