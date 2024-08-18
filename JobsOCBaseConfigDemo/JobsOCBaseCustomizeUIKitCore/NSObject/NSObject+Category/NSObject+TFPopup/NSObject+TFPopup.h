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

static inline TFPopupParam *_Nonnull makeNormalTipsParameter(void){
    TFPopupParam *popupParameter = TFPopupParam.new;
    popupParameter.duration = 0.3;
    popupParameter.showAnimationDelay = 0;
    popupParameter.hideAnimationDelay = 0;
    popupParameter.autoDissmissDuration = 1;
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
@property(nonatomic,strong)TFPopupParam *tipsParameter;
#pragma mark —— 弹出提示框
-(jobsByStringBlock _Nonnull)toastMsg;
#pragma mark —— 创建缩放模式下的View
/// 没有自定义 popupParam（缩放模式）
-(jobsByViewBlock _Nonnull)popupShowScaleWithView;
/// 有自定义popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView __kindof *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParameter;
#pragma mark —— 创建滑动模式的View
/// 没有自定义 popupParam（滑动模式）
-(jobsByViewBlock _Nonnull)popupShowSlideWithView;
/// 有自定义popupParam（滑动模式）
-(void)popupShowSlideWithView:(UIView __kindof *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParameter;
#pragma mark —— PopView
/// 出现的弹窗需要手动触发关闭
-(jobsByViewBlock _Nonnull)show_view;
/// 出现的弹窗自动触发关闭
-(jobsByViewBlock _Nonnull)show_tips;
#warning 这样写的目的是方便在其他地方调用
/// 公告
-(JobsNoticePopupView *)noticePopupView;

@end

NS_ASSUME_NONNULL_END
