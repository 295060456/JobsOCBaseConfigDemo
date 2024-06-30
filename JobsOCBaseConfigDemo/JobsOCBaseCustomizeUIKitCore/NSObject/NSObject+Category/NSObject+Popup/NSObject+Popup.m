//
//  NSObject+Popup.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "NSObject+Popup.h"

@implementation NSObject (Popup)
#pragma mark —— 创建缩放模式下的View
/// 没有自定义 popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView *_Nullable)view{
    if (!view) view = self.popupView;
    if ([self isKindOfClass:UIViewController.class]) {
        UIViewController *vc = (UIViewController *)self;
        [view tf_showScale:vc.view offset:CGPointZero popupParam:self.popupParameter];
    }else if ([self isKindOfClass:UIView.class]){
        UIView *v = (UIView *)self;
        [view tf_showScale:v offset:CGPointZero popupParam:self.popupParameter];
    }else{
        [view tf_showNormal:jobsGetMainWindow() animated:YES];
    }
}
/// 有自定义popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView *_Nullable)view
               popupParameter:(TFPopupParam *_Nullable)popupParameter{
    if (popupParameter) {
        [view tf_showNormal:jobsGetMainWindow() popupParam:popupParameter];
    }else{
        [self popupShowScaleWithView:view];
    }
}
#pragma mark —— 创建滑动模式的View
/// 没有自定义 popupParam（滑动模式）
-(void)popupshowSlideWithView:(UIView *_Nullable)view{
    if (!view) view = self.popupView;
    TFPopupParam *popupParameter = [self makeSlidePopupParameterByViewHeight:view.size.height];
    extern AppDelegate *appDelegate;
    if(appDelegate.tabBarVC){
        [view tf_showSlide:appDelegate.tabBarVC.view
                 direction:popupParameter.bubbleDirection
                popupParam:popupParameter];
    }else{
        [view tf_showSlide:jobsGetMainWindow()
                 direction:popupParameter.bubbleDirection
                popupParam:popupParameter];
    }
}
/// 有自定义popupParam（滑动模式）
-(void)popupshowSlideWithView:(UIView *_Nullable)view
               popupParameter:(TFPopupParam *_Nullable)popupParameter{
    if(!popupParameter) popupParameter = [self makeSlidePopupParameterByViewHeight:view.height];
    extern AppDelegate *appDelegate;
    if(appDelegate.tabBarVC){
        [view tf_showSlide:appDelegate.tabBarVC.view
                 direction:popupParameter.bubbleDirection
                popupParam:popupParameter];
    }else{
        [view tf_showSlide:jobsGetMainWindow()
                 direction:popupParameter.bubbleDirection
                popupParam:popupParameter];
    }
}
#pragma mark —— 创建数据源
/// 一般的数据源
-(TFPopupParam *)makeNormalPopupParameter{
    TFPopupParam *popupParameter = TFPopupParam.new;
    popupParameter.duration = 0.3;
    popupParameter.showAnimationDelay = 0;
    popupParameter.hideAnimationDelay = 0;
    popupParameter.autoDissmissDuration = 0;
    popupParameter.dragEnable = NO;
    popupParameter.disuseBackgroundTouchHide = YES;
    return popupParameter;
}
/// 滑动模式下的数据源
-(TFPopupParam *)makeSlidePopupParameterByViewHeight:(CGFloat)viewHeight{
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

-(TFPopupParam *)makeSlidePopupParameterByViewSize:(CGSize)viewSize{
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
#pragma mark —— @property(nonatomic,strong)TFPopupParam *popupParameter;
JobsKey(_popupParameter)
@dynamic popupParameter;
-(TFPopupParam *)popupParameter{
    TFPopupParam *PopupParameter = Jobs_getAssociatedObject(_popupParameter);
    if (!PopupParameter) {
        PopupParameter = self.makeNormalPopupParameter;
        Jobs_setAssociatedRETAIN_NONATOMIC(_popupParameter, PopupParameter)
    }return PopupParameter;
}

-(void)setPopupParameter:(TFPopupParam *)popupParameter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_popupParameter, popupParameter)
}
#pragma mark —— @property(nonatomic,strong)NoticePopupView *popupView;
JobsKey(_popupView)
@dynamic popupView;
-(JobsNoticePopupView *)popupView{
    JobsNoticePopupView *PopupView = Jobs_getAssociatedObject(_popupView);
    if (!PopupView) {
        PopupView = JobsNoticePopupView.new;
        PopupView.size = CGSizeMake(JobsMainScreen_WIDTH() - 12 * 2, JobsMainScreen_HEIGHT() * 2 / 3);
        [PopupView richElementsInViewWithModel:UIViewModel.new];
        [self setPopupView:PopupView];
        Jobs_setAssociatedRETAIN_NONATOMIC(_popupView, PopupView)
    }return PopupView;
}

-(void)setPopupView:(JobsNoticePopupView *)popupView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_popupView, popupView)
}

@end
