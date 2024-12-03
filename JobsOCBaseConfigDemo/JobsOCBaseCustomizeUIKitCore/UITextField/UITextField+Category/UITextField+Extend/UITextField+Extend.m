//
//  UITextField+Extend.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/15.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import "UITextField+Extend.h"

@implementation UITextField (Extend)
#pragma mark —— 一些功能方法
/// RAC 回调封装
-(RACDisposable *)jobsTextFieldEventFilterBlock:(JobsReturnBOOLByIDBlock _Nonnull)filterBlock
                             subscribeNextBlock:(jobsByIDBlock _Nonnull)subscribeNextBlock{
    return [[self.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
        return filterBlock ? filterBlock(value) : YES;
    }] subscribeNext:^(NSString * _Nullable x) {
        if (subscribeNextBlock) subscribeNextBlock(x);
    }];
}

-(JobsReturnStringByStringBlock _Nonnull)getCurrentTextFieldValueByReplacementString{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSString *_Nullable replacementString){
        @jobs_strongify(self)
        if (self.text.length >= 1) {
            return replacementString.isEqualToString(@"") ? self.text.substringToIndex(self.text.length - 1) : self.text.add(replacementString);
        }else return replacementString;
    };
}
/// 自定义系统的清除按钮
-(jobsByImageBlock _Nonnull)modifyClearButtonByImage{
    @jobs_weakify(self)
    return ^(UIImage *_Nullable image){
        @jobs_strongify(self)
        self.customSysClearBtn.jobsResetBtnImage(image);
        self.rightView = self.customSysClearBtn;
        self.rightViewMode = UITextFieldViewModeWhileEditing;
    };
}
#pragma mark —— @property(nonatomic,strong)UIButton *customSysClearBtn;
JobsKey(_customSysClearBtn)
@dynamic customSysClearBtn;
-(UIButton *)customSysClearBtn{
    UIButton *CustomSysClearBtn = Jobs_getAssociatedObject(_customSysClearBtn);
    if (!CustomSysClearBtn) {
        CustomSysClearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        CustomSysClearBtn.frame = CGRectMake(0.0f,0.0f,15.0f,15.0f);
        @jobs_weakify(self)
        [CustomSysClearBtn jobsBtnClickEventBlock:^id(UIButton *data) {
            @jobs_strongify(self)
            self.text = JobsInternationalization(@"");
            return nil;
        }];
        Jobs_setAssociatedRETAIN_NONATOMIC(_customSysClearBtn, CustomSysClearBtn)
    }return CustomSysClearBtn;
}

-(void)setCustomSysClearBtn:(UIButton *)customSysClearBtn{
    Jobs_setAssociatedRETAIN_NONATOMIC(_customSysClearBtn, customSysClearBtn)
}

@end
