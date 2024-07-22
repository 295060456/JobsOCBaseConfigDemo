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

#pragma mark —— 创建数据源
static inline TFPopupParam * _Nonnull makeSlidePopupParameterByViewHeight(CGFloat viewHeight){
    TFPopupParam *popupParameter = TFPopupParam.new;
    popupParameter.bubbleDirection = PopupDirectionBottom;
    if(viewHeight){
        popupParameter.popupSize = CGSizeMake(JobsMainScreen_WIDTH(), viewHeight);
    }else{
        popupParameter.popupSize = CGSizeMake(JobsMainScreen_WIDTH(), 300);
    }
    popupParameter.dragEnable = YES;
    return popupParameter;
}

static inline TFPopupParam *_Nonnull makeNormalPopupParameter(void){
    TFPopupParam *popupParameter = TFPopupParam.new;
    popupParameter.duration = 0.3;
    popupParameter.showAnimationDelay = 0;
    popupParameter.hideAnimationDelay = 0;
    popupParameter.autoDissmissDuration = 0;
    popupParameter.dragEnable = NO;
    popupParameter.disuseBackgroundTouchHide = YES;
    return popupParameter;
}

static inline TFPopupParam *_Nonnull makeSlidePopupParameterByViewSize(CGSize viewSize){
    TFPopupParam *popupParameter = TFPopupParam.new;
    popupParameter.bubbleDirection = PopupDirectionBottom;
    if(jobsZeroSizeValue(viewSize)){
        popupParameter.popupSize = CGSizeMake(JobsMainScreen_WIDTH(), 300);
    }else{
        popupParameter.popupSize = viewSize;
    }
    popupParameter.dragEnable = YES;
    return popupParameter;
}
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
#pragma mark —— PopView
-(JobsNoticePopupView *)noticePopupView;

@end

NS_ASSUME_NONNULL_END
