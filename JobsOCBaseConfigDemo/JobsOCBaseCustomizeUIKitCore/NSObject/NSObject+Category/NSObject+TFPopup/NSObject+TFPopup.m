//
//  NSObject+TFPopup.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "NSObject+TFPopup.h"

@implementation NSObject (TFPopup)

-(__kindof UIView *)checkByView:(UIView *)view
                         action:(jobsByVoidBlock _Nullable)action {
    if (view) {
        if (action) action(); // 执行传入的操作
    } else {
        toast(@"请初始化视图");
    }return view;
}
#pragma mark —— 弹出提示框
-(jobsByStringBlock _Nonnull)toastMsg{
    return ^(NSString *_Nullable msg) {
        [TFPopupToast tf_show:MainWindow
                          msg:msg
                animationType:TFAnimationTypeScale];
    };
}
#pragma mark —— 创建缩放模式下的View
/// 没有自定义 popupParam（缩放模式）
-(jobsByViewBlock _Nonnull)popupShowScaleWithView{
    @jobs_weakify(self)
    return ^(UIView __kindof * _Nullable view) {
        @jobs_strongify(self)
        [self checkByView:view action:^{
            @jobs_strongify(self)
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
                [view tf_showNormal:MainWindow
                           animated:YES];
            }
        }];
    };
}
/// 有自定义popupParam（缩放模式）
-(void)popupShowScaleWithView:(UIView __kindof *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParameter{
    @jobs_weakify(self)
    [self checkByView:view action:^{
        @jobs_strongify(self)
        if (popupParameter) {
            [view tf_showNormal:MainWindow popupParam:popupParameter];
        }else{
            self.popupShowScaleWithView(view);
        }
    }];
}
#pragma mark —— 创建滑动模式的View
/// 没有自定义 popupParam（滑动模式）
-(jobsByViewBlock _Nonnull)popupShowSlideWithView{
    @jobs_weakify(self)
    return ^(UIView __kindof * _Nullable view) {
        @jobs_strongify(self)
        [self checkByView:view action:^{
            TFPopupParam *popupParameter = makeSlidePopupParameterByViewHeight(view.Size.height);
            if(AppDelegate.tabBarVC){
                [view tf_showSlide:AppDelegate.tabBarVC.view
                         direction:popupParameter.bubbleDirection
                        popupParam:popupParameter];
            }else{
                [view tf_showSlide:MainWindow
                         direction:popupParameter.bubbleDirection
                        popupParam:popupParameter];
            }
        }];
    };
}
/// 有自定义popupParam（滑动模式）
-(void)popupShowSlideWithView:(UIView __kindof *_Nonnull)view
               popupParameter:(TFPopupParam *_Nullable)popupParameter{
    if(!popupParameter) popupParameter = makeSlidePopupParameterByViewHeight(view.height);
    [self checkByView:view action:^{
        if(AppDelegate.tabBarVC){
            [view tf_showSlide:AppDelegate.tabBarVC.view
                     direction:popupParameter.bubbleDirection
                    popupParam:popupParameter];
        }else{
            [view tf_showSlide:MainWindow
                     direction:popupParameter.bubbleDirection
                    popupParam:popupParameter];
        }
    }];
}
#pragma mark —— PopView
/// 出现的弹窗需要手动触发关闭——禁止点击背景消失弹框
-(jobsByViewBlock _Nonnull)show_view{
    @jobs_weakify(self)
    return ^(UIView *_Nonnull view) {
        @jobs_strongify(self)
        self.popupParameter.dragEnable = YES;
        self.popupParameter.disuseBackgroundTouchHide = YES;/// 禁止点击背景消失弹框
        [self checkByView:view action:^{
            @jobs_strongify(self)
            [view tf_showSlide:MainWindow
                     direction:PopupDirectionContainerCenter
                    popupParam:self.popupParameter];
        }];
    };
}
/// 出现的弹窗需要手动触发关闭——允许点击背景消失弹框
-(jobsByViewBlock _Nonnull)show_view2{
    @jobs_weakify(self)
    return ^(UIView *_Nonnull view) {
        @jobs_strongify(self)
        self.popupParameter.dragEnable = YES;
        self.popupParameter.backgroundColor = JobsBlackColor.colorWithAlphaComponent(.3f);
        self.popupParameter.disuseBackgroundTouchHide = NO;/// 允许点击背景消失弹框
        [self checkByView:view action:^{
            @jobs_strongify(self)
            [view tf_showSlide:MainWindow
                     direction:PopupDirectionContainerCenter
                    popupParam:self.popupParameter];
        }];
    };
}
/// 出现的弹窗自动触发关闭
-(jobsByViewBlock _Nonnull)show_tips{
    @jobs_weakify(self)
    return ^(UIView *_Nonnull view) {
        @jobs_strongify(self)
        [self checkByView:view action:^{
            @jobs_strongify(self)
            [view tf_showSlide:MainWindow
                     direction:PopupDirectionContainerCenter
                    popupParam:self.tipsParameter];
        }];
    };
}
#warning 这样写的目的是方便在其他地方调用
/// 公告
-(JobsNoticePopupView *)noticePopupView{
    return JobsNoticePopupView
        .BySize(JobsNoticePopupView.viewSizeByModel(nil))
        .JobsRichViewByModel2(UIViewModel.new);
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
#pragma mark —— @property(nonatomic,strong)TFPopupParam *tipsParameter;
JobsKey(_tipsParameter)
@dynamic tipsParameter;
-(TFPopupParam *)tipsParameter{
    TFPopupParam *TipsParameter = Jobs_getAssociatedObject(_popupParameter);
    if (!TipsParameter) {
        TipsParameter = makeNormalTipsParameter();
        Jobs_setAssociatedRETAIN_NONATOMIC(_tipsParameter, TipsParameter)
    }return TipsParameter;
}

-(void)setTipsParameter:(TFPopupParam *)tipsParameter{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tipsParameter, tipsParameter)
}

@end
