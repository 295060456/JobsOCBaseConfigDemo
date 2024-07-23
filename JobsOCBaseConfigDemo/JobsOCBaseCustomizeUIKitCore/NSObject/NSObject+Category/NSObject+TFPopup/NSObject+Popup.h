//
//  NSObject+TFPopup.h
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import <Foundation/Foundation.h>
#import "AppDelegate+TabBarCtr.h"

#if __has_include(<TFPopup/TFPopup.h>)
#import <TFPopup/TFPopup.h>
#else
#import "TFPopup.h"
#endif

#import "LoginView.h" /// 登录
#import "SignUpView.h" /// 注册
#import "PwdSettingView.h" /// 密码重置-密码确认
#import "PwdSettingByCodeView.h" /// 密码重置-手机验证码

NS_ASSUME_NONNULL_BEGIN
/// 弹出一个弹窗
@interface NSObject (TFPopup)
/// Data
@property(nonatomic,strong)TFPopupParam *popupParameter;
#pragma mark —— 创建缩放模式的View
/// 没有自定义 popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView *_Nonnull)view;
/// 有自定义popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParam;
#pragma mark —— 创建滑动模式的View
/// 没有自定义 popupParam（滑动模式）
-(void)popupshowSlideWithView:(UIView *_Nonnull)view;
/// 有自定义popupParam（滑动模式）
-(void)popupshowSlideWithView:(UIView *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParam;
#pragma mark —— 创建数据源
/// 一般的数据源
-(TFPopupParam *)makeNormalPopupParameter;
-(TFPopupParam *)makeSlidePopupParameterByViewHeight:(CGFloat)viewHeight;
-(TFPopupParam *)makeSlidePopupParameterByViewSize:(CGSize)viewSize;
#pragma mark —— PopView
+(JobsNoticePopupView *)makeNoticePopupView;
+(LoginView *)makePopLoginView;
+(SignUpView *)makePopSignUpView;
+(PwdSettingView *)makePopPwdSettingView;
+(PwdSettingByCodeView *)makePwdSettingByCodeView;

@end

NS_ASSUME_NONNULL_END
