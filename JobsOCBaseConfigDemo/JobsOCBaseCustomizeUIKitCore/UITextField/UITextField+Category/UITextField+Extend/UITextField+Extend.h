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
-(RACDisposable *)jobsTextFieldEventFilterBlock:(JobsRetBOOLByIDBlock _Nonnull)filterBlock
                             subscribeNextBlock:(jobsByIDBlock _Nonnull)subscribeNextBlock;
/// 自定义系统的清除按钮
-(JobsRetStrByStrBlock _Nonnull)getCurrentTextFieldValueByReplacementString;
/// 自定义系统的清除按钮
-(jobsByImageBlock _Nonnull)modifyClearButtonByImage;

@end

NS_ASSUME_NONNULL_END
/**
 -(UITextField *)idTypeTextField{
     if(!_idTypeTextField){
         @jobs_weakify(self)
         _idTypeTextField = self.addSubview(jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
             textField.byDelegate(self)
                 .bySecureTextEntry(NO)
                 .byClearButtonMode(UITextFieldViewModeNever)
                 .byLeftViewMode(UITextFieldViewModeNever)
                 .byRightViewMode(UITextFieldViewModeNever)
                 .byText(@"")
                 .byFont(pingFangHKRegular(JobsWidth(14)))
                 .byTextCor(JobsBlackColor)
                 .byPlaceholder(@"ID Type".tr)
                 .byPlaceholderColor(JobsGrayColor)
                 .byPlaceholderFont(pingFangHKRegular(JobsWidth(14)));
         })).setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
             data.layerCor = JobsCor(@"#DEDEDE");
             data.jobsWidth = 1;
             data.cornerRadiusValue = JobsWidth(32 / 2);
         })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
             @jobs_strongify(self)
             make.top.equalTo(self.idTypeTitleLab.mas_bottom).offset(JobsWidth(8));
             make.left.equalTo(self.section_1_titleLab);
             make.width.mas_equalTo(JobsWidth(345));
         }).on();
     }return _idTypeTextField;
 }
 */
