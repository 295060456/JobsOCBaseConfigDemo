//
//  UIViewController+BackBtn.m
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import "UIViewController+BackBtn.h"

@implementation UIViewController (BackBtn)
/// GKNavigationBar 返回按钮点击方法
-(void)backItemClick:(id)sender{
    [self backBtnClickEvent:sender];
}
/// 【创建返回键】没有配置按钮的normalImage属性，也没有配置点击事件
-(UIButton *)makeBackBtn:(UIViewModel *)viewModel{
    UIButton *backBtnCategory = UIButton.new;
    backBtnCategory.titleFont(viewModel.backBtnTitleModel.font);
    backBtnCategory.normalTitle(viewModel.backBtnTitleModel.text);
    backBtnCategory.normalTitleColor(viewModel.backBtnTitleModel.textCor ? : JobsBlackColor);
    [backBtnCategory layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading
                                        imagePadding:JobsWidth(8)];
    backBtnCategory.makeBtnLabelByShowingType(UILabelShowingType_03);
    return backBtnCategory;
}
/// 配置返回键图片
-(UIImage *)makeBackBtnImage{
    return self.viewModel.backBtnIMG ? : JobsBuddleIMG(nil,@"Frameworks/GKNavigationBar.framework/GKNavigationBar",nil,self.gk_backStyle == GKNavigationBarBackStyleBlack ? @"btn_back_black" : @"btn_back_white");
}
///【子类需要覆写 】创建返回键的点击事件
-(void)backBtnClickEvent:(UIButton *_Nullable)sender{
    if (self.jobsBackBlock) {
        self.jobsBackBlock(sender);
    }
    switch (self.pushOrPresent) {
        case ComingStyle_PRESENT:{
            [self dismissViewControllerAnimated:YES completion:nil];
        }break;
        case ComingStyle_PUSH:{
            self.navigationController ? [self.navigationController popViewControllerAnimated:YES] : [self dismissViewControllerAnimated:YES completion:nil];
        }break;
            
        default:
            break;
    }
}
#pragma mark —— @property(nonatomic,strong)BackBtn *backBtnCategory;
JobsKey(_backBtnCategory)
@dynamic backBtnCategory;
-(UIButton *)backBtnCategory{
    UIButton *BackBtnCategory = Jobs_getAssociatedObject(_backBtnCategory);
    if (!BackBtnCategory) {
        BackBtnCategory = [self makeBackBtn:self.viewModel];
        BackBtnCategory.normalImage(self.makeBackBtnImage);
        @jobs_weakify(self)
        [BackBtnCategory jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            [self backBtnClickEvent:x];
            return nil;
        }];
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
        BackBtnCategoryItem = [UIBarButtonItem.alloc initWithCustomView:self.backBtnCategory];
        Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategoryItem, BackBtnCategoryItem)
    }return BackBtnCategoryItem;
}

-(void)setBackBtnCategoryItem:(UIBarButtonItem *)backBtnCategoryItem{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategoryItem, backBtnCategoryItem)
}

@end
