//
//  UIViewController+GKCustomNavigationBar.m
//  FMNormal
//
//  Created by Jobs on 2025/5/5.
//

#import "UIViewController+GKCustomNavigationBar.h"

@implementation UIViewController (GKCustomNavigationBar)
#pragma mark —— 一些公有方法
-(JobsReturnGKNavBarByButtonModelBlock _Nonnull)gk_navTitleBtnBy{
    @jobs_weakify(self)
    return ^__kindof GKCustomNavigationBar *_Nullable(__kindof UIButtonModel *_Nullable model){
        @jobs_strongify(self)
        self.gk_navTitleBtnModel = model;
        if(model) self.gk_navTitleBtn.alpha = 1;
        return self.gk_navigationBar;
    };
}
#pragma mark —— Prop_strong(nullable)__kindof UIButtonModel *gk_navTitleBtnModel;
JobsKey(_gk_navTitleBtnModel)
@dynamic gk_navTitleBtnModel;
-(__kindof UIButtonModel *)gk_navTitleBtnModel{
    return Jobs_getAssociatedObject(_gk_navTitleBtnModel);
}

-(void)setGk_navTitleBtnModel:(__kindof UIButtonModel *)gk_navTitleBtnModel{
    Jobs_setAssociatedRETAIN_NONATOMIC(_gk_navTitleBtnModel, gk_navTitleBtnModel)
}
#pragma mark —— Prop_strong(nullable)__kindof UIButton *gk_navTitleBtn;
JobsKey(_gk_navTitleBtn)
@dynamic gk_navTitleBtn;
-(__kindof UIButton *)gk_navTitleBtn{
    UIButton *navTitleBtn = Jobs_getAssociatedObject(_gk_navTitleBtn);
    if (!navTitleBtn && self.gk_navTitleBtnModel) {
        navTitleBtn = UIButton.initByButtonModel(self.gk_navTitleBtnModel);
        Jobs_setAssociatedRETAIN_NONATOMIC(_gk_navTitleBtn, navTitleBtn)
        /// 父控件不能是self.gk_navigationBar。否则会造成约束与预想的出现偏差
        @jobs_weakify(self)
        self.view.addSubview(navTitleBtn)
            .masonryBy(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                if(self.gk_navLeftBarButtonItem){
                    make.centerX.equalTo(self.gk_navigationBar);
                    make.bottom.equalTo(self.gk_navigationBar).offset(JobsWidth(-5));
                }else{
                    make.center.equalTo(self.gk_navigationBar);
                }make.size.mas_equalTo(self.gk_navTitleBtnModel.jobsSize);
            });
    }return navTitleBtn;
}

-(void)setGk_navTitleBtn:(__kindof UIButton *)gk_navTitleBtn{
    Jobs_setAssociatedRETAIN_NONATOMIC(_gk_navTitleBtn, gk_navTitleBtn)
}
@end
