//
//  NSObject+AppTools.h
//  DouYin
//
//  Created by Jobs on 2021/4/6.
//

#import <Foundation/Foundation.h>

#import "AppToolsProtocol.h"
#import "NSObject+UserInfo.h"
#import "NSObject+Extras.h"
#import "UIView+Extras.h"
#import "AppDelegate+TabBarCtr.h"
#import "DefineConstString.h" /// 常量字符串的定义

#import "AppDelegate.h"
#import "JobsAppDoorVC.h"
#import "AppLanguageVC.h"

#import "JobsHotLabelBySingleLine.h"
#import "JobsCustomTabBar.h"
#import "FMTermsOfUseView.h"
//#import "CasinoUpgradePopupView.h"

#import "JobsNetworkingHeader.h"
#import "UIViewModel.h"

#import "NSString+Check.h"

#ifndef MakeCustomTabBarBy
#define MakeCustomTabBarBy(view) NSObject.makeCustomTabBarBy(view)
#endif /*MakeCustomTabBarBy*/

#ifndef CustomTabBar
#define CustomTabBar MakeCustomTabBarBy(jobsGetMainWindow())
#endif /*CustomTabBar*/

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AppTools)
<
AppToolsProtocol
,UITextViewDelegate
>
/// UI
@property(nonatomic,strong,nullable)JobsUserModel *doorModel;
Prop_strong()BaseButton *联系客服;
Prop_strong()BaseButton *立即注册;
Prop_strong()UILabel *separateLab;/// 分割线
Prop_strong()UITextView *connectionTipsTV;/// 承接富文本:如需幫助，請聯繫專屬客服
/// Data
Prop_copy()NSMutableArray<__kindof UIViewModel *> *hotLabelDataMutArr;
Prop_copy()NSMutableArray<NSString *> *jxCategoryViewTitleMutArr;
// 关于富文本:如需幫助，請聯繫專屬客服
Prop_strong()NSMutableAttributedString *attributedStringData;
Prop_copy()NSMutableArray <NSString *>*richTextMutArr;
Prop_copy()NSMutableArray <JobsRichTextConfig *>*richTextConfigMutArr;
#pragma mark —— 测试调试专用
/// 查询当下的本地登录数据
-(jobsByVoidBlock _Nullable)checkLoginData;
#pragma mark —— 一些公共设置
-(JobsReturnNavBarConfigByStringAndActionBlock _Nullable)makeNavByTitleAndAction;
-(JobsReturnNavBarConfigByStringBlock _Nullable)makeNav0ByTitle;
-(jobsByVoidBlock _Nonnull)唤起人工客服;
-(jobsByVoidBlock _Nonnull)唤起Telegram;
-(jobsByVoidBlock _Nonnull)唤起FaceBook;
/// 选择电话号码区位
-(__kindof UIButton *)zoneCodeBtnByBlock:(jobsByIDBlock _Nonnull)block;
/// 配置弹窗数据
-(JobsReturnViewModelByStringBlock _Nonnull)configPopUpDataBy;
/// 适配各种机型的开屏图片
-(NSString * _Nullable)imageNameOrURLString;
/// 适配各种机型的开屏视频
-(NSString * _Nullable)videoNameOrURLString;
/// 检查当前IP是否为菲律宾IP
-(void)checkIfIPInPhilippinesByBlock:(jobsByBOOLBlock _Nonnull)block;
/// 数据组装
-(JobsReturnViewModelByDecorationModelBlock _Nonnull)makeDatas;
/// 默认文本段落样式（两端对齐）
-(NSMutableParagraphStyle *)defaultParagraphStyle;
/// Terms Of Use
-(void)makeTermsOfUseByBlock:(jobsByIDBlock _Nonnull)block;
/// 联系我们.按钮
-(__kindof UIButton *_Nullable)makeContactBtn;
/// 关闭.按钮
-(__kindof UIButton *_Nullable)makeCloseBtnByActionBlock:(jobsByVoidBlock _Nullable)actionBlock;
/// 控制CustomTabBar的显隐
-(jobsByBOOLBlock _Nonnull)showCustomTabBar;
/// 创建JobsCustomTabBar（单例模式）
+(JobsReturnCustomTabBarByViewBlock _Nonnull)makeCustomTabBarBy;
/// 导航返回键的配置
-(UIButtonModel *)makeBackBtnModel;
/// 发通知：登录成功
-(jobsByVoidBlock _Nonnull)loginOK;
/// 发通知：退出登录成功
-(jobsByVoidBlock _Nonnull)logoutOK;
#pragma mark —— <AppToolsProtocol> 关于注册登录
/// Token过期应该做的事情
-(jobsByVoidBlock _Nonnull)tokenExpire;
/// 退出登录应该做的事情
-(jobsByVoidBlock _Nonnull)logout;
/// 清除用户数据资料
-(jobsByVoidBlock _Nonnull)cleanUserData;
/// 去登录？去注册？
-(jobsByNSIntegerBlock _Nonnull)toLoginOrRegister;
/// 强制登录：没登录（本地用户数据为空）就去登录
-(jobsByVoidBlock _Nonnull)forcedLogin;
/// 去登录：有限制makeDataArr
-(jobsByVoidBlock _Nonnull)toLogin;
/// 限制条件：在某些页面（noNeedLoginArr）不调取登录页
-(void)toLoginOrRegisterWithRestricted:(__kindof NSArray <Class>*_Nullable)dataArr
                    appDoorContentType:(CurrentPage)appDoorContentType;
/// 触发退出登录模块之前，弹窗提示二次确认，确认以后再删除本地用户数据
-(void)popUpViewToLogout;
#pragma mark —— <AppToolsProtocol> 关于 TabBar
/// TabBar
-(UITabBar *)getTabBar;
/// 跳到首页
-(void)jumpToHome;
/// JobsTabbarVC 关闭手势
-(jobsByVoidBlock _Nonnull)tabBarClosePan;
/// JobsTabbarVC 打开手势
-(jobsByVoidBlock _Nonnull)tabBarOpenPan;
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
/// （在登陆与否的情况下）默认的用户头像
-(UIImage *)defaultHeaderImage;
/// 字符串当前语言环境
-(NSString *)currentLanguage;
/// 首页的假数据
-(NSMutableArray <__kindof UIButtonModel *>*)gameDataMutArr;
/// 收藏的假数据 JobsIMG(@"PG");JobsIMG(@"点赞");
-(NSMutableArray <__kindof UIViewModel *>*)favDataMutArr;
-(HTTPRequestHeaderLanguageType)currentLanguageType;
#pragma mark —— 弹出框。为了防止业务层的变化，弹出框定义在NSObject层
/// Debug模式下的弹出框 及其相关的数据封装
-(UIViewModel *)testPopViewData;
/// 测试和业务密切相关的弹窗 ：在外层进行调用，[ 需要被展现的视图 popupWithView:popupView];
/// @param popViewClass 被测试的弹窗视图
/// @param viewModel 此视图所绑定的数据。传nil则使用testPopViewData的数据、传UIViewModel.new则使用popViewClass预埋的数据
-(UIView<BaseViewProtocol> *)jobsPopView:(Class<BaseViewProtocol> _Nullable)popViewClass
                               viewModel:(UIViewModel *_Nullable)viewModel;
/// Debug模式下的弹出框 及其相关的数据封装。在外层进行调用，[ 需要被展现的视图 popupShowScaleWithView:popupView];
//-(JobsOCBaseConfigTestPopupView *)JobsTestPopView:(NSString *)string;
/// 在外层进行调用，[ 需要被展现的视图 popupShowScaleWithView:popupView];
//-(JobsOCBaseConfigTestPopupView *)jobsTestPopView:(UIViewModel *_Nullable)viewModel;
#pragma mark —— 设备横屏的方向判定
-(BOOL)isLandscapeRight;
-(BOOL)isLandscapeLeft;
#pragma mark —— 通过验证返回YES
-(JobsReturnBOOLByStringBlock _Nonnull)userAndPasswordNotUpTo;

-(JobsReturnBOOLByStringBlock _Nonnull)telNotUpTo;
/// 用户账号由6-15个字符组成，只能输入字母大小写和数字
-(JobsReturnBOOLByStringBlock _Nonnull)checkUserName;
/// 用户密码由6-15个字符组成，只能输入字母大小写和数字
-(JobsReturnBOOLByStringBlock _Nonnull)checkUserPassword;
/// 登录的数据检验
-(JobsReturnBOOLByAppDoorModelBlock _Nonnull)checkLoginDataBy;
/// 注册的数据检验
-(JobsReturnBOOLByAppDoorModelBlock _Nonnull)checkRegisterData;
/// 电话号码可以最多20位数，超过后无法输入，且电话号码中无法包含特殊字符或者空格
-(JobsReturnBOOLByStringBlock _Nonnull)checkTelNum;

@end

NS_ASSUME_NONNULL_END
/**
 switch (customerContactElementModel.customerMark) {
     case CustomerContactStyle_QQ:{
         self.jobsOpenURL(@"mqq://im/chat?chat_type=wpa&uin=".add(customerContactElementModel.customerAccount).add(@"&version=1&src_type=web"));
     }break;
     case CustomerContactStyle_Skype:{
         self.jobsOpenURL(@"skype://".add(customerContactElementModel.customerAccount).add(@"?chat"));
     }break;
     case CustomerContactStyle_Telegram:{
         self.jobsOpenURL(@"https://t.me/".add(customerContactElementModel.customerAccount));
     }break;
     case CustomerContactStyle_whatsApp:{
         self.jobsOpenURL(@"https://wa.me/".add(customerContactElementModel.customerAccount));
     }break;
     case CustomerContactStyle_手机号码:{
         self.jobsToastMsg(@"打开手机号码未配置");
     }break;
     case CustomerContactStyle_onlineURL:{
         self.jobsToastMsg(@"打开onlineURL未配置");
     }break;

     default:
         break;
 }
 */
