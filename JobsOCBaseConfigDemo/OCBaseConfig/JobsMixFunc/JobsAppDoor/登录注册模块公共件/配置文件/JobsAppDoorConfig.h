//
//  JobsAppDoorConfig.h
//  JobsAppDoor
//
//  Created by Jobs on 2020/12/7.
//

#import <Foundation/Foundation.h>
#import "MacroDef_Func.h"
#import "NSString+Replace.h"

#ifndef CURRENT_PAGE_ENUM_DEFINED
#define CURRENT_PAGE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, CurrentPage) {
    CurrentPage_Login = 0,    /// 登录
    CurrentPage_Register,     /// 注册
    CurrentPage_ForgotCode    /// 忘记密码
};
#endif /* CURRENT_PAGE_ENUM_DEFINED */

#ifndef JOBS_APP_DOOR_BG_TYPE_ENUM_DEFINED
#define JOBS_APP_DOOR_BG_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsAppDoorBgType) {
    JobsAppDoorBgType_Image = 0,  /// 背景只是一张图
    JobsAppDoorBgType_Video       /// 背景是视频资源
};
#endif /* JOBS_APP_DOOR_BG_TYPE_ENUM_DEFINED */

/// 页面1：登录
#define JobsAppDoorContentViewLoginX JobsWidth(20)
#define JobsAppDoorContentViewLoginY JobsMainScreen_HEIGHT() / (isiPhoneX_series() ? 4 : 5)
#define JobsAppDoorContentViewLoginWidth JobsMainScreen_WIDTH() - JobsAppDoorContentViewLoginX * 2
#define JobsAppDoorContentViewLoginHeight JobsMainScreen_HEIGHT() / (isiPhoneX_series() ? 2.3 : 2.0)
/// 页面2：注册
#define JobsAppDoorContentViewRegisterX JobsWidth(20)
#define JobsAppDoorContentViewRegisterY JobsMainScreen_HEIGHT() / (isiPhoneX_series() ? 4 : 5)
#define JobsAppDoorContentViewRegisterWidth JobsMainScreen_WIDTH() - JobsAppDoorContentViewRegisterX * 2
#define JobsAppDoorContentViewRegisterHeight JobsMainScreen_HEIGHT() / (isiPhoneX_series() ? 1.6 : 1.3)
/// 页面3：忘记密码
#define JobsAppDoorContentViewFindPasswordX JobsWidth(20)
#define JobsAppDoorContentViewFindPasswordY JobsMainScreen_HEIGHT() / 4
#define JobsAppDoorContentViewFindPasswordWidth JobsMainScreen_WIDTH() - JobsAppDoorContentViewFindPasswordX * 2
#define JobsAppDoorContentViewFindPasswordHeight JobsMainScreen_HEIGHT() / (isiPhoneX_series() ? 1.6 : 1.3)

#define Cor1 JobsBlackColor.colorWithAlphaComponentBy(0.9007f)
#define Cor2 JobsBlackColor.colorWithAlphaComponentBy(0.5984f)
#define Cor3 JobsWhiteColor.colorWithAlphaComponentBy(0.9007f)
#define Cor4 HEXCOLOR(0xE1CD62)
#define Cor5 HEXCOLOR(0x502600)

#define ThingsHeight JobsWidth(50) /// 边角半圆形控件的高度
#define RegisterBtnWidth JobsWidth(64) /// 竖形按钮的宽度
#define InputViewOffset JobsWidth(20) /// 输入框承接控件之间的上下间距

#define Title1 @"返回登录".tr.addNewlines
#define Title2 @"新用户注册".tr.addNewlines
#define Title3 @"忘记密码".tr
#define Title4 @"返回首页".tr
#define Title5 @"保存用户名".tr
#define Title6 @"注册".tr
#define Title7 @"登录".tr
#define Title8 @"人工客服".tr
#define Title9 @"获取验证码".tr
#define Title10 @"人工客服".tr
#define Title11 @"您也可以通过以下方式联系客服".tr
#define Title12 @"以后".tr
/**
 
 1、账号密码长度提示为默认固定存在。
 2、玩家输入框中没有输入信息后，提示“账号不能为空”“密码不能为空”
 3、玩家输入的账号密码长度不够或者超出后，框显示为红色提示。
 4、玩家输入特殊字符后，提示玩家“账号密码不能使用特殊字符”
 5、密码和确定密码不同时，提示玩家：两次的输入密码不匹配，请仔细确认。
 6、电话号码可以最多20位数，超过后无法输入。且电话号码中无法包含特殊字符或者空格

 1、用户账号由6-15个字符组成，只能输入字母大小写和数字。
 2、用户密码由6-15个字符组成，只能输入字母大小写和数字。
 3、会员输入有误时，提示对应的错误码。
 4、手机验证错误时，提示玩家验证码有误。
 */
