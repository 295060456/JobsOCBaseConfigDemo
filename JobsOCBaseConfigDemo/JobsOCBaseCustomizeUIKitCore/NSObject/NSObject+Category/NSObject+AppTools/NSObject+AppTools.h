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

#define PicSalt @"RRU4JZTV5WZXPCVZ"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (AppTools)
<
AppToolsProtocol
,UITextViewDelegate
>
/// UI
@property(nonatomic,strong,nullable)JobsUserModel *loginModel;
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
#pragma mark —— 一些公共设置
/// 创建默认的广告数据源
-(NSMutableArray<FMBannerAdsModel *> *)makeDataMutArr;
/// 创建个人中心广告默认的数据源
-(NSMutableArray<FMBannerAdsModel *> *)makeSubViewModelMutArr;
/// 创建公告默认的数据源
-(NSMutableArray<FMBannerAdsModel *> *)makeSubViewModelMutArr2;

-(JobsReturnWMZBannerParamByArrBlock _Nonnull)makeBaseBannerParam;
/// 广告轮播图的数据源
-(JobsReturnWMZBannerParamByArrBlock)makeADBannerParamBy;
/// 广告点击逻辑
-(jobsByIDBlock _Nonnull)adsAction;
/// 公告的数据源
-(JobsReturnWMZBannerParamByArrBlock _Nonnull)makeAnnouncementBannerParamBy;
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
