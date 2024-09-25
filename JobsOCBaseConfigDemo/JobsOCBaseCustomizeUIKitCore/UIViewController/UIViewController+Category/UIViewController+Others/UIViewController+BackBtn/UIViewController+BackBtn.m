//
//  UIViewController+BackBtn.m
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import "UIViewController+BackBtn.h"

@implementation UIViewController (BackBtn)
/// GKNavigationBar 返回按钮点击方法
///【子类需要覆写 】创建返回键的点击事件
-(jobsByBtnBlock _Nonnull)backBtnClickEvent{
    @jobs_weakify(self)
    return ^(UIButton *_Nullable sender) {
        @jobs_strongify(self)
        self.jobsBackBtnClickEvent(sender);
    };
}
#pragma mark —— @property(nonatomic,strong)BaseButton *backBtnCategory;
JobsKey(_backBtnCategory)
@dynamic backBtnCategory;
-(BaseButton *)backBtnCategory{
    BaseButton *BackBtnCategory = Jobs_getAssociatedObject(_backBtnCategory);
    if (!BackBtnCategory) {
        @jobs_weakify(self)
        BackBtnCategory = BaseButton.jobsInit()
            .bgColor(JobsClearColor.colorWithAlphaComponent(0))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePlacement(1)
            .jobsResetBtnImage(self.viewModel.backBtnIMG ? : JobsBuddleIMG(nil,@"Frameworks/GKNavigationBar.framework/GKNavigationBar",nil,self.gk_backStyle == GKNavigationBarBackStyleBlack ? @"btn_back_black" : @"btn_back_white"))
            .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
            .jobsResetBtnTitleCor(self.viewModel.backBtnTitleModel.textCor ? : JobsBlackColor)
            .jobsResetBtnTitleFont(self.viewModel.backBtnTitleModel.font)
            .jobsResetBtnTitle(self.viewModel.backBtnTitleModel.text)
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                self.backBtnClickEvent(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategory, BackBtnCategory)
    }return BackBtnCategory;
}

-(void)setBackBtnCategory:(UIButton *)backBtnCategory{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategory, backBtnCategory)
}
#pragma mark —— @property(nonatomic,strong)UIBarButtonItem *backBtnCategoryItem;
JobsKey(_backBtnCategoryItem)
@dynamic backBtnCategoryItem;
-(UIBarButtonItem *)backBtnCategoryItem{
    UIBarButtonItem *BackBtnCategoryItem = Jobs_getAssociatedObject(_backBtnCategoryItem);
    if (!BackBtnCategoryItem) {
        BackBtnCategoryItem = JobsBarButtonItem(self.backBtnCategory);
        Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategoryItem, BackBtnCategoryItem)
    }return BackBtnCategoryItem;
}

-(void)setBackBtnCategoryItem:(UIBarButtonItem *)backBtnCategoryItem{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategoryItem, backBtnCategoryItem)
}

@end
