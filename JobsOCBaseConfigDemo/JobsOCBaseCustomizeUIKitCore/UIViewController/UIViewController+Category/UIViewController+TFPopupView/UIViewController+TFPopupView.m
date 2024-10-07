//
//  UIViewController+TFPopupView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/29.
//

#import "UIViewController+TFPopupView.h"

@implementation UIViewController (TFPopupView)
/// 弹出筛选视图
-(__kindof UIView *)popUpFiltrationView{
    self.popupParameter.disuseBackgroundTouchHide = NO;
    if ([self isKindOfClass:UIViewController.class]) {
        [self.filtrationView tf_showFold:self.view
                             targetFrame:jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = JobsFiltrationView.viewSizeByModel(nil).width;
            data.jobsHeight = JobsFiltrationView.viewSizeByModel(nil).height;
        })
                               direction:PopupDirectionTop
                              popupParam:self.popupParameter];
    }return self.filtrationView;
}
/// 弹出自定义视图
-(__kindof UIView *)popUpCustomView{
    self.popupParameter.disuseBackgroundTouchHide = NO;
    if ([self isKindOfClass:UIViewController.class]) {
        [self.customView tf_showFold:self.view
                         targetFrame:jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = JobsCustomView.viewSizeByModel(nil).width;
            data.jobsHeight = JobsCustomView.viewSizeByModel(nil).height;
        })
                           direction:PopupDirectionTop
                          popupParam:self.popupParameter];
    }return self.customView;
}
/// 关闭弹出的视图
-(jobsByViewBlock _Nonnull)hidePopupView{
    return ^(__kindof UIView *_Nullable view){
        [view tf_hide:nil];
    };
}
#pragma mark —— @property(nonatomic,strong)JobsFiltrationView *filtrationView;/// 过滤
JobsKey(_filtrationView)
@dynamic filtrationView;
-(JobsFiltrationView *)filtrationView{
    JobsFiltrationView *FiltrationView = Jobs_getAssociatedObject(_filtrationView);
    if (!FiltrationView) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_filtrationView, JobsFiltrationView
                                           .BySize(JobsFiltrationView.viewSizeByModel(nil))
                                           .JobsRichViewByModel2(nil));
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
        Jobs_setAssociatedRETAIN_NONATOMIC(_customView, JobsCustomView
                                           .BySize(JobsFiltrationView.viewSizeByModel(nil))
                                           .JobsRichViewByModel2(nil))
    }return CustomView;
}

-(void)setCustomView:(JobsCustomView *)customView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_customView, customView)
}

@end
