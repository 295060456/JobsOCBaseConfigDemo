//
//  NSObject+TFPopup.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "NSObject+TFPopup.h"
//
@implementation NSObject (TFPopup)
#pragma mark —— 弹出提示框
-(void)toastMsg:(NSString *)msg{
    [TFPopupToast tf_show:jobsGetMainWindow()
                      msg:msg
            animationType:TFAnimationTypeScale];
}
#pragma mark —— 创建缩放模式下的View
/// 没有自定义 popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView *_Nonnull)view{
    if (!view) return;
    if (KindOfVCCls(self)) {
        UIViewController *vc = (UIViewController *)self;
        [view tf_showScale:vc.view
                    offset:CGPointZero
                popupParam:self.popupParameter];
    }else if (KindOfViewCls(self)){
        UIView *v = (UIView *)self;
        [view tf_showScale:v
                    offset:CGPointZero
                popupParam:self.popupParameter];
    }else{
        [view tf_showNormal:jobsGetMainWindow()
                   animated:YES];
    }
}
/// 有自定义popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParameter{
    if (popupParameter) {
        [view tf_showNormal:jobsGetMainWindow() popupParam:popupParameter];
    }else{
        [self popupShowScaleWithView:view];
    }
}
#pragma mark —— 创建滑动模式的View
/// 没有自定义 popupParam（滑动模式）
-(void)popupshowSlideWithView:(UIView *_Nonnull)view{
    if (!view) return;
    TFPopupParam *popupParameter = makeSlidePopupParameterByViewHeight(view.size.height);
    if(AppDelegate.tabBarVC){
        [view tf_showSlide:AppDelegate.tabBarVC.view
                 direction:popupParameter.bubbleDirection
                popupParam:popupParameter];
    }else{
        [view tf_showSlide:jobsGetMainWindow()
                 direction:popupParameter.bubbleDirection
                popupParam:popupParameter];
    }
}
/// 有自定义popupParam（滑动模式）
-(void)popupshowSlideWithView:(UIView *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParameter{
    if(!popupParameter) popupParameter = makeSlidePopupParameterByViewHeight(view.height);
    if(AppDelegate.tabBarVC){
        [view tf_showSlide:AppDelegate.tabBarVC.view
                 direction:popupParameter.bubbleDirection
                popupParam:popupParameter];
    }else{
        [view tf_showSlide:jobsGetMainWindow()
                 direction:popupParameter.bubbleDirection
                popupParam:popupParameter];
    }
}
#pragma mark —— @property(nonatomic,strong)TFPopupParam *popupParameter;
JobsKey(_popupParameter)
@dynamic popupParameter;
-(TFPopupParam *)popupParameter{
    TFPopupParam *PopupParameter = Jobs_getAssociatedObject(_popupParameter);
    if (!PopupParameter) {
        PopupParameter = makeNormalPopupParameter();
        Jobs_setAssociatedRETAIN_NONATOMIC(_popupParameter, PopupParameter)
    }return PopupParameter;
}

-(void)setPopupParameter:(TFPopupParam *)popupParameter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_popupParameter, popupParameter)
}
#pragma mark —— PopView
-(JobsNoticePopupView *)noticePopupView{
    JobsNoticePopupView *_noticePopupView = JobsNoticePopupView.new;
    _noticePopupView.size = [JobsNoticePopupView viewSizeWithModel:nil];
    [_noticePopupView richElementsInViewWithModel:UIViewModel.new];
    return _noticePopupView;
}

@end
