//
//  JobsAppDoorConfig.h
//  JobsAppDoor
//
//  Created by Jobs on 2020/12/7.
//

#import <Foundation/Foundation.h>
#import "MacroDef_Func.h"

typedef NS_ENUM(NSInteger, CurrentPage) {
    /// 登录
    CurrentPage_login = 0,
    /// 注册
    CurrentPage_register,
    /// 忘记密码
    CurrentPage_forgotCode
};

typedef NS_ENUM(NSInteger, JobsAppDoorBgType){
    /// 背景只是一张图
    JobsAppDoorBgType_Image = 0,
    /// 背景是视频资源
    JobsAppDoorBgType_video
};

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

#define Cor1 [JobsBlackColor colorWithAlphaComponent:0.9007f]
#define Cor2 [JobsBlackColor colorWithAlphaComponent:0.5984f]
#define Cor3 HEXCOLOR(0xE1CD62)
#define Cor4 [UIColor.whiteColor colorWithAlphaComponent:0.9007f]
#define Cor5 HEXCOLOR(0x502600)

#define ThingsHeight JobsWidth(50)//边角半圆形控件的高度
#define RegisterBtnWidth JobsWidth(64)//竖形按钮的宽度
#define InputViewOffset JobsWidth(20)//输入框承接控件之间的上下间距

#define Title1 JobsInternationalization(@"返\n回\n登\n录")
#define Title2 JobsInternationalization(@"新\n用\n户\n注\n册")
#define Title3 JobsInternationalization(@"忘记密码")
#define Title4 JobsInternationalization(@"返回首页")
#define Title5 JobsInternationalization(@"保存用户名")
#define Title6 JobsInternationalization(@"注册")
#define Title7 JobsInternationalization(@"登录")
#define Title8 JobsInternationalization(@"人工客服")
#define Title9 JobsInternationalization(@"获取验证码")
#define Title10 JobsInternationalization(@"人工客服")
#define Title11 JobsInternationalization(@"您也可以通过以下方式联系客服")
#define Title12 JobsInternationalization(@"以后")

/**
 
 1.账号密码长度提示为默认固定存在。
 2.玩家输入框中没有输入信息后，提示“账号不能为空”“密码不能为空”
 3.玩家输入的账号密码长度不够或者超出后，框显示为红色提示。
 4.玩家输入特殊字符后，提示玩家“账号密码不能使用特殊字符”
 5.密码和确定密码不同时，提示玩家：两次的输入密码不匹配，请仔细确认。
 6.电话号码可以最多20位数，超过后无法输入。且电话号码中无法包含特殊字符或者空格

 1.用户账号由6-15个字符组成，只能输入字母大小写和数字。
 2.用户密码由6-15个字符组成，只能输入字母大小写和数字。
 3.会员输入有误时，提示对应的错误码。
 4.手机验证错误时，提示玩家验证码有误。
 */

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorConfig : NSObject

@end

NS_ASSUME_NONNULL_END
