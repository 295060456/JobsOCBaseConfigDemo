//
//  NSObject+TFPopup.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "NSObject+TFPopup.h"

@implementation NSObject (TFPopup)
#pragma mark —— 保证弹窗一定是被初始化
-(__kindof UIView *)checkByView:(UIView *)view action:(jobsByVoidBlock _Nullable)action {
    if (view) {
        if (action) action(); // 执行传入的操作
    } else {
        toast(@"请初始化视图");
    }return view;
}
#pragma mark —— 关闭所有的弹出提示框
-(jobsByViewBlock _Nonnull)tfHideAllPopupView{
    return ^(__kindof UIView *_Nullable data) {
        for (__kindof UIView *popupView in UIView.tf_getAllPopup) {
            [popupView tf_hide:nil];
        }
    };
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
    return ^(__kindof UIView *_Nullable data) {
        @jobs_strongify(self)
        [self checkByView:data action:^{
            @jobs_strongify(self)
            if (KindOfVCCls(self)) {
                UIViewController *vc = (UIViewController *)self;
                [data tf_showScale:vc.view
                            offset:CGPointZero
                        popupParam:self.popupParameter];
            }else if (KindOfViewCls(self)){
                UIView *v = (UIView *)self;
                [data tf_showScale:v
                            offset:CGPointZero
                        popupParam:self.popupParameter];
            }else{
                [data tf_showNormal:MainWindow
                           animated:YES];
            }
        }];
    };
}
/// 有自定义popupParam（缩放模式）
-(void)popupShowScaleWithView:(__kindof UIView *_Nonnull)data
               popupParameter:(TFPopupParam *_Nullable)popupParameter{
    @jobs_weakify(self)
    [self checkByView:data action:^{
        @jobs_strongify(self)
        if (popupParameter) {
            [data tf_showNormal:MainWindow popupParam:popupParameter];
        }else{
            self.popupShowScaleWithView(data);
        }
    }];
}
#pragma mark —— 创建滑动模式的View
/// 没有自定义 popupParam（滑动模式）
-(jobsByViewBlock _Nonnull)popupShowSlideWithView{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable data) {
        @jobs_strongify(self)
        [self checkByView:data action:^{
            TFPopupParam *popupParameter = makeSlidePopupParameterByViewHeight(data.sizer.height);
            if(AppDelegate.tabBarVC){
                [data tf_showSlide:AppDelegate.tabBarVC.view
                         direction:popupParameter.bubbleDirection
                        popupParam:popupParameter];
            }else{
                [data tf_showSlide:MainWindow
                         direction:popupParameter.bubbleDirection
                        popupParam:popupParameter];
            }
        }];
    };
}
/// 有自定义popupParam（滑动模式）
-(void)popupShowSlideWithView:(__kindof UIView *_Nonnull)data
               popupParameter:(TFPopupParam *_Nullable)popupParameter{
    if(!popupParameter) popupParameter = makeSlidePopupParameterByViewHeight(data.height);
    [self checkByView:data action:^{
        if(AppDelegate.tabBarVC){
            [data tf_showSlide:AppDelegate.tabBarVC.view
                     direction:popupParameter.bubbleDirection
                    popupParam:popupParameter];
        }else{
            [data tf_showSlide:MainWindow
                     direction:popupParameter.bubbleDirection
                    popupParam:popupParameter];
        }
    }];
}
#pragma mark —— PopView.Core(私有方法)
-(jobsByViewBlock _Nonnull)_showViewCore{
    @jobs_weakify(self)
    return ^(UIView *_Nonnull data) {
        @jobs_strongify(self)
        self.popupParameter.dragEnable = YES;
        self.popupParameter.disuseBackgroundTouchHide = YES;/// 禁止点击背景消失弹框
        [self checkByView:data action:^{
            @jobs_strongify(self)
            [data tf_showSlide:MainWindow
                     direction:PopupDirectionContainerCenter
                    popupParam:self.popupParameter];
        }];
    };
}

-(jobsByViewBlock _Nonnull)_showViewCore2{
    @jobs_weakify(self)
    return ^(UIView *_Nonnull data) {
        @jobs_strongify(self)
        self.popupParameter.dragEnable = YES;
        self.popupParameter.backgroundColor = JobsBlackColor.colorWithAlphaComponent(.3f);
        self.popupParameter.disuseBackgroundTouchHide = NO;/// 允许点击背景消失弹框
        [self checkByView:data action:^{
            @jobs_strongify(self)
            [data tf_showSlide:MainWindow
                     direction:PopupDirectionContainerCenter
                    popupParam:self.popupParameter];
        }];
    };
}

-(jobsByViewBlock _Nonnull)_showTipsCore{
    @jobs_weakify(self)
    return ^(UIView *_Nonnull data) {
        @jobs_strongify(self)
        [self checkByView:data action:^{
            @jobs_strongify(self)
            [data tf_showSlide:MainWindow
                     direction:PopupDirectionContainerCenter
                    popupParam:self.tipsParameter];
        }];
    };
}
#pragma mark —— PopView
/// 出现的弹窗需要手动触发关闭——禁止点击背景消失弹框（不带数据）
-(jobsByViewBlock _Nonnull)show_view{
    @jobs_weakify(self)
    return ^(UIView *_Nonnull data) {
        @jobs_strongify(self)
        self.popupParameter.popupSize = !jobsZeroSizeValue(data.sizer) ? data.sizer : data.viewSizeByModel(nil);
        self._showViewCore(data);
    };
}
/// 出现的弹窗需要手动触发关闭——禁止点击背景消失弹框（带数据）
-(jobsByViewAndDataBlock _Nonnull)show_viewByModel{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable view,id _Nullable data) {
        @jobs_strongify(self)
        self.popupParameter.popupSize = data ? view.viewSizeByModel(data) : view.sizer;
        self._showViewCore(view);
    };
}
/// 出现的弹窗需要手动触发关闭——禁止点击背景消失弹框（带数据）
-(jobsByViewAndDataBlock _Nonnull)showViewByModel{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable view,id _Nullable data) {
        @jobs_strongify(self)
        self.popupParameter.popupSize = data ? view.viewSizeByModel(data) : view.sizer;
        self._showViewCore(view);
    };
}
/// 出现的弹窗需要手动触发关闭——允许点击背景消失弹框（不带数据）
-(jobsByViewBlock _Nonnull)show_view2{
    @jobs_weakify(self)
    return ^(UIView *_Nonnull data) {
        @jobs_strongify(self)
        self.popupParameter.popupSize = !jobsZeroSizeValue(data.sizer) ? data.sizer : data.viewSizeByModel(nil);
        self._showViewCore2(data);
    };
}
/// 出现的弹窗需要手动触发关闭——允许点击背景消失弹框（带数据）
-(jobsByViewAndDataBlock _Nonnull)showViewByModel2{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable view,id _Nullable data) {
        @jobs_strongify(self)
        self.popupParameter.popupSize = data ? view.viewSizeByModel(data) : view.sizer;
        self._showViewCore2(view);
    };
}
/// 出现的弹窗自动触发关闭（不带数据）
-(jobsByViewBlock _Nonnull)show_tips{
    @jobs_weakify(self)
    return ^(UIView *_Nonnull data) {
        @jobs_strongify(self)
        self.tipsParameter.popupSize = !jobsZeroSizeValue(data.sizer) ? data.sizer : data.viewSizeByModel(nil);
        self._showTipsCore(data);
    };
}
/// 出现的弹窗自动触发关闭（带数据）
-(jobsByViewAndDataBlock _Nonnull)showTipsByModel{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable view,id _Nullable data) {
        @jobs_strongify(self)
        self.tipsParameter.popupSize = data ? view.viewSizeByModel(data) : view.sizer;
        self._showTipsCore(view);
    };
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
