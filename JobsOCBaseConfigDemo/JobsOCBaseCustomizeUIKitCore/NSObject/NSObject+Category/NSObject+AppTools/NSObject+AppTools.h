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

#import "AppDelegate.h"
#import "JobsAppDoorVC.h"
#import "AppLanguageVC.h"
//#import "CasinoUpgradePopupView.h"
#import "JobsHotLabelWithSingleLine.h"

#import "JobsNetworkingHeader.h"
#import "UIViewModel.h"

#import "NSString+Check.h"

#ifndef PicSalt
#define PicSalt @"RRU4JZTV5WZXPCVZ"
#endif /*PicSalt*/

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
@property(nonatomic,strong)BaseButton *联系客服;
@property(nonatomic,strong)BaseButton *立即注册;
@property(nonatomic,strong)UILabel *separateLab;/// 分割线
@property(nonatomic,strong)UITextView *connectionTipsTV;/// 承接富文本:如需幫助，請聯繫專屬客服
/// Data
@property(nonatomic,strong)NSMutableArray<UIViewModel *> *hotLabelDataMutArr;
@property(nonatomic,strong)NSMutableArray<NSString *> *jxCategoryViewTitleMutArr;
// 关于富文本:如需幫助，請聯繫專屬客服
@property(nonatomic,strong)NSMutableAttributedString *attributedStringData;
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*richTextConfigMutArr;
#pragma mark —— 测试调试专用
/// 查询当下的本地登录数据
-(jobsByVoidBlock _Nullable)checkLoginData;
#pragma mark —— 一些公共设置
/// 适配各种机型的开屏图片
-(NSString * _Nullable)imageNameOrURLString;
/// 适配各种机型的开屏视频
-(NSString * _Nullable)videoNameOrURLString;
/// 数据组装
-(JobsReturnViewModelByDecorationModelBlock _Nonnull)makeDatas;
/// 默认文本段落样式
-(NSMutableParagraphStyle *)defaultParagraphStyle;
/// 联系我们.按钮
-(__kindof UIButton *_Nullable)makeContactBtn;
/// 关闭.按钮
-(__kindof UIButton *_Nullable)makeCloseBtnByActionBlock:(jobsByVoidBlock _Nullable)actionBlock;
/// 控制CustomTabBar的显隐
-(jobsByBOOLBlock _Nonnull)showCustomTabBar;
/// 创建JobsCustomTabBar（单例模式）
+(JobsReturnCustomTabBarByViewBlock _Nonnull)makeCustomTabBarBy;
-(UIButtonModel *)makeBackBtnModel;
#pragma mark —— 弹出框。为了防止业务层的变化，弹出框定义在NSObject层
/// Debug模式下的弹出框 及其相关的数据封装。在外层进行调用，[ 需要被展现的视图 popupShowScaleWithView:popupView];
//-(JobsOCBaseConfigTestPopupView *)JobsTestPopView:(NSString *)string;
/// 在外层进行调用，[ 需要被展现的视图 popupShowScaleWithView:popupView];
//-(JobsOCBaseConfigTestPopupView *)jobsTestPopView:(UIViewModel *_Nullable)viewModel;
/// 测试和业务密切相关的弹窗 ：在外层进行调用，[ 需要被展现的视图 popupShowScaleWithView:popupView];
/// @param popViewClass 被测试的弹窗视图
/// @param viewModel 此视图所绑定的数据。传nil则使用testPopViewData的数据、传UIViewModel.new则使用popViewClass预埋的数据
-(UIView<BaseViewProtocol> *)jobsPopView:(Class<BaseViewProtocol> _Nullable)popViewClass
                               viewModel:(UIViewModel *_Nullable)viewModel;
#pragma mark —— 设备横屏的方向判定
-(BOOL)isLandscapeRight;
-(BOOL)isLandscapeLeft;
#pragma mark —— 通过验证返回YES
-(BOOL)userAndPasswordNotUpTo:(NSString *)value;
-(BOOL)telNotUpTo:(NSString *)value;
/// 用户账号由6-15个字符组成，只能输入字母大小写和数字
-(BOOL)checkUserName:(NSString *)userName;
/// 用户密码由6-15个字符组成，只能输入字母大小写和数字
-(BOOL)checkUserPassword:(NSString *)userPassword;
/// 登录的数据检验
-(BOOL)checkLoginData:(JobsAppDoorModel *)model;
/// 注册的数据检验
-(BOOL)checkRegisterData:(JobsAppDoorModel *)model;
/// 电话号码可以最多20位数，超过后无法输入，且电话号码中无法包含特殊字符或者空格
-(BOOL)checkTelNum:(NSString *)telNum;

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
