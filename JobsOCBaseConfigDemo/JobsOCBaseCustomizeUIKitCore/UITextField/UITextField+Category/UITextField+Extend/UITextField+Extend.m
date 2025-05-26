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
            return replacementString.isEqualToString(JobsEmpty) ? self.text.substringToIndex(self.text.length - 1) : self.text.add(replacementString);
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

-(JobsReturnTextFieldByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(id <UITextFieldDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsReturnTextFieldByBOOLBlock _Nonnull)bySecureTextEntry{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.secureTextEntry = data;
        return self;
    };
}

-(JobsReturnTextFieldByModeBlock _Nonnull)byClearButtonMode{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextFieldViewMode data){
        @jobs_strongify(self)
        self.clearButtonMode = data;
        return self;
    };
}

-(JobsReturnTextFieldByModeBlock _Nonnull)byLeftViewMode{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextFieldViewMode data){
        @jobs_strongify(self)
        self.leftViewMode = data;
        return self;
    };
}

-(JobsReturnTextFieldByModeBlock _Nonnull)byRightViewMode{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UITextFieldViewMode data){
        @jobs_strongify(self)
        self.rightViewMode = data;
        return self;
    };
}

-(JobsReturnTextFieldByStringBlock _Nonnull)byText{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(__kindof NSString *_Nullable str){
        @jobs_strongify(self)
        self.text = str;
        return self;
    };
}

-(JobsReturnTextFieldByFontBlock _Nonnull)byFont{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(__kindof UIFont *_Nullable font){
        @jobs_strongify(self)
        self.font = font;
        return self;
    };
}

-(JobsReturnTextFieldByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.textColor = cor;
        return self;
    };
}

-(JobsReturnTextFieldByStringBlock _Nonnull)byPlaceholder{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(__kindof NSString *_Nullable str){
        @jobs_strongify(self)
        self.placeholder = str;
        return self;
    };
}

-(JobsReturnTextFieldByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.placeholderColor = cor;
        return self;
    };
}

-(JobsReturnTextFieldByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(__kindof UIFont *_Nullable font){
        @jobs_strongify(self)
        self.placeholderFont = font;
        return self;
    };
}

-(JobsReturnTextFieldByAttributedStringBlock _Nonnull)byAttributedText{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(__kindof NSAttributedString *_Nullable str){
        @jobs_strongify(self)
        self.attributedText = str;
        return self;
    };
}

-(JobsReturnTextFieldByAttributedStringBlock _Nonnull)byAttributedPlaceholder{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(__kindof NSAttributedString *_Nullable str){
        @jobs_strongify(self)
        /// 这里如不判空，则placeholder写不进去
        if(str) self.attributedPlaceholder = str;
        return self;
    };
}

-(JobsReturnTextFieldByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UIKeyboardAppearance appearance){
        @jobs_strongify(self)
        self.keyboardAppearance = appearance;
        return self;
    };
}

-(JobsReturnTextFieldByKeyboardTypeBlock _Nonnull)byKeyboardType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UIKeyboardType type){
        @jobs_strongify(self)
        self.keyboardType = type;
        return self;
    };
}

-(JobsReturnTextFieldByReturnKeyTypeBlock _Nonnull)byReturnKeyType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UIReturnKeyType type){
        @jobs_strongify(self)
        self.returnKeyType = type;
        return self;
    };
}
#pragma mark —— Prop_strong()UIButton *customSysClearBtn;
JobsKey(_customSysClearBtn)
@dynamic customSysClearBtn;
-(__kindof UIButton *)customSysClearBtn{
    UIButton *CustomSysClearBtn = Jobs_getAssociatedObject(_customSysClearBtn);
    if (!CustomSysClearBtn) {
        @jobs_weakify(self)
        CustomSysClearBtn = BaseButton.jobsInit()
//            .bgColorBy(JobsWhiteColor)
//            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
//            .jobsResetImagePadding(1)
//            .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
//            .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
//            .jobsResetBtnTitleCor(JobsWhiteColor)
//            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
//            .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                self.text = JobsInternationalization(@"");
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            }).byFrame(CGRectMake(0.0f,0.0f,15.0f,15.0f));
        Jobs_setAssociatedRETAIN_NONATOMIC(_customSysClearBtn, CustomSysClearBtn)
    }return CustomSysClearBtn;
}

-(void)setCustomSysClearBtn:(__kindof UIButton *)customSysClearBtn{
    Jobs_setAssociatedRETAIN_NONATOMIC(_customSysClearBtn, customSysClearBtn)
}

@end
