//
//  UITextField+Extend.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/9/15.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#import "JobsString.h"
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "UIButton+SimplyMake.h"
#import "UITextField+Placeholder.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Extend)

Prop_strong()__kindof UIButton *customSysClearBtn;
/// RAC 回调封装
-(RACDisposable *)jobsTextFieldEventFilterBlock:(JobsReturnBOOLByIDBlock _Nonnull)filterBlock
                             subscribeNextBlock:(jobsByIDBlock _Nonnull)subscribeNextBlock;
/// 自定义系统的清除按钮
-(JobsReturnStringByStringBlock _Nonnull)getCurrentTextFieldValueByReplacementString;
/// 自定义系统的清除按钮
-(jobsByImageBlock _Nonnull)modifyClearButtonByImage;
///
-(JobsReturnTextFieldByDelegateBlock _Nonnull)byDelegate;
-(JobsReturnTextFieldByBOOLBlock _Nonnull)bySecureTextEntry;
-(JobsReturnTextFieldByModeBlock _Nonnull)byClearButtonMode;
-(JobsReturnTextFieldByModeBlock _Nonnull)byLeftViewMode;
-(JobsReturnTextFieldByModeBlock _Nonnull)byRightViewMode;
-(JobsReturnTextFieldByStringBlock _Nonnull)byText;
-(JobsReturnTextFieldByFontBlock _Nonnull)byFont;
-(JobsReturnTextFieldByCorBlock _Nonnull)byTextCor;
-(JobsReturnTextFieldByStringBlock _Nonnull)byPlaceholder;
-(JobsReturnTextFieldByCorBlock _Nonnull)byPlaceholderColor;
-(JobsReturnTextFieldByFontBlock _Nonnull)byPlaceholderFont;
-(JobsReturnTextFieldByAttributedStringBlock _Nonnull)byAttributedText;
-(JobsReturnTextFieldByAttributedStringBlock _Nonnull)byAttributedPlaceholder;
-(JobsReturnTextFieldByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance;
-(JobsReturnTextFieldByKeyboardTypeBlock _Nonnull)byKeyboardType;
-(JobsReturnTextFieldByReturnKeyTypeBlock _Nonnull)byReturnKeyType;

@end

NS_ASSUME_NONNULL_END
/**
 -(UITextField *)idTypeTextField{
     if(!_idTypeTextField){
         _idTypeTextField = self.addSubview(jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
             textField.byDelegate(self)
                 .bySecureTextEntry(NO)
                 .byClearButtonMode(UITextFieldViewModeNever)
                 .byLeftViewMode(UITextFieldViewModeNever)
                 .byRightViewMode(UITextFieldViewModeNever)
                 .byText(@"")
                 .byFont(pingFangHKRegular(JobsWidth(14)))
                 .byTextCor(JobsBlackColor)
                 .byPlaceholder(JobsInternationalization(@"ID Type"))
                 .byPlaceholderColor(JobsGrayColor)
                 .byPlaceholderFont(pingFangHKRegular(JobsWidth(14)));
         })).setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
             data.layerCor = JobsCor(@"#DEDEDE");
             data.jobsWidth = 1;
             data.cornerRadiusValue = JobsWidth(32 / 2);
         })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
             make.top.equalTo(self.idTypeTitleLab.mas_bottom).offset(JobsWidth(8));
             make.left.equalTo(self.section_1_titleLab);
             make.width.mas_equalTo(JobsWidth(345));
         }).on();
     }return _idTypeTextField;
 }
 */
