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
#pragma mark —— @property(nonatomic,strong)BackBtn *backBtnCategory;
JobsKey(_backBtnCategory)
@dynamic backBtnCategory;
-(UIButton *)backBtnCategory{
    UIButton *BackBtnCategory = Jobs_getAssociatedObject(_backBtnCategory);
    if (!BackBtnCategory) {
        @jobs_weakify(self)
        BackBtnCategory = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                            background:nil
                                            buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                         textAlignment:NSTextAlignmentCenter
                                                      subTextAlignment:NSTextAlignmentCenter
                                                           normalImage:self.viewModel.backBtnIMG ? : JobsBuddleIMG(nil,@"Frameworks/GKNavigationBar.framework/GKNavigationBar",nil,self.gk_backStyle == GKNavigationBarBackStyleBlack ? @"btn_back_black" : @"btn_back_white")
                                                        highlightImage:nil
                                                       attributedTitle:nil
                                               selectedAttributedTitle:nil
                                                    attributedSubtitle:nil
                                                                 title:self.viewModel.backBtnTitleModel.text
                                                              subTitle:nil
                                                             titleFont:self.viewModel.backBtnTitleModel.font
                                                          subTitleFont:nil
                                                              titleCor:self.viewModel.backBtnTitleModel.textCor ? : JobsBlackColor
                                                           subTitleCor:nil
                                                    titleLineBreakMode:NSLineBreakByWordWrapping
                                                 subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                   baseBackgroundColor:JobsClearColor.colorWithAlphaComponent(0)
                                                       backgroundImage:nil
                                                          imagePadding:JobsWidth(8)
                                                          titlePadding:JobsWidth(0)
                                                        imagePlacement:NSDirectionalRectEdgeLeading
                                            contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                              contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                         contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                     cornerRadiusValue:JobsWidth(0)
                                                       roundingCorners:UIRectCornerAllCorners
                                                  roundingCornersRadii:CGSizeZero
                                                        layerBorderCor:nil
                                                           borderWidth:JobsWidth(0)
                                                         primaryAction:nil
                                            longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                         id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                                       clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            self.backBtnClickEvent(x);
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
        BackBtnCategoryItem = JobsBarButtonItem(self.backBtnCategory);
        Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategoryItem, BackBtnCategoryItem)
    }return BackBtnCategoryItem;
}

-(void)setBackBtnCategoryItem:(UIBarButtonItem *)backBtnCategoryItem{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backBtnCategoryItem, backBtnCategoryItem)
}

@end
