//
//  UIViewController+TFPopupView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/29.
//

#import "UIViewController+TFPopupView.h"

@implementation UIViewController (TFPopupView)
/// 弹出筛选视图
-(UIView *)popUpFiltrationView{
    self.popupParameter.disuseBackgroundTouchHide = NO;
    CGRect targetFrame = CGRectMake(0,
                                    0,
                                    JobsFiltrationView.viewSizeByModel(nil).width,
                                    JobsFiltrationView.viewSizeByModel(nil).height);
    if ([self isKindOfClass:UIViewController.class]) {
        [self.filtrationView tf_showFold:self.view
                             targetFrame:targetFrame
                               direction:PopupDirectionTop
                              popupParam:self.popupParameter];
    }return self.filtrationView;
}
/// 弹出自定义视图
-(UIView *)popUpCustomView{
    self.popupParameter.disuseBackgroundTouchHide = NO;
    CGRect targetFrame = CGRectMake(0,
                                    0,
                                    JobsCustomView.viewSizeByModel(nil).width,
                                    JobsCustomView.viewSizeByModel(nil).height);
    if ([self isKindOfClass:UIViewController.class]) {
        [self.customView tf_showFold:self.view
                         targetFrame:targetFrame
                           direction:PopupDirectionTop
                          popupParam:self.popupParameter];
    }return self.customView;
}
/// 关闭弹出的视图
-(void)hidePopupView:(UIView *)popupView{
    [popupView tf_hide];
}
#pragma mark —— @property(nonatomic,strong)JobsFiltrationView *filtrationView;/// 过滤
JobsKey(_filtrationView)
@dynamic filtrationView;
-(JobsFiltrationView *)filtrationView{
    JobsFiltrationView *FiltrationView = Jobs_getAssociatedObject(_filtrationView);
    if (!FiltrationView) {
        FiltrationView = JobsFiltrationView.new;
        FiltrationView.Size = JobsFiltrationView.viewSizeByModel(nil);
        FiltrationView.jobsRichViewByModel(nil);
        Jobs_setAssociatedRETAIN_NONATOMIC(_filtrationView, FiltrationView)
    }return FiltrationView;
}

-(void)setFiltrationView:(JobsFiltrationView *)filtrationView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_filtrationView, filtrationView)
}
#pragma mark —— @property(nonatomic,strong)JobsCustomView *customView;/// 自定义
JobsKey(_customView)
@dynamic customView;
-(JobsCustomView *)customView{
    JobsCustomView *CustomView = Jobs_getAssociatedObject(_customView);
    if (!CustomView) {
        CustomView = JobsCustomView.new;
        CustomView.Size = JobsFiltrationView.viewSizeByModel(nil);
        CustomView.jobsRichViewByModel(nil);
        Jobs_setAssociatedRETAIN_NONATOMIC(_customView, CustomView)
    }return CustomView;
}

-(void)setCustomView:(JobsCustomView *)customView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_customView, customView)
}

@end
