//
//  JobsTextField.h
//  FM
//
//  Created by User on 7/20/24.
//

#import "BaseView.h"
#import "DefineProperty.h"
#import "JobsBlock.h"
#import "MacroDef_Cor.h"
#import "MacroDef_String.h"
#import "UITextFieldProtocol.h"
#import "UITextField+Placeholder.h"
#import "UITextField+Extend.h"
#import "NSObject+Measure.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsTextField : BaseView
<
UITextFieldDelegate
,UITextFieldProtocol
>
/// UI
Prop_strong(nonnull) UITextField *realTextField;
/// 这个值需要在leftView之前设置才有效
-(JobsReturnJobsTextFieldByCGFloatBlock _Nonnull)byLeftViewByOutLineOffset;
-(JobsReturnJobsTextFieldByCGFloatBlock _Nonnull)byLeftViewByTextFieldOffset;
/// 这个值需要在rightView之前设置才有效
-(JobsReturnJobsTextFieldByCGFloatBlock _Nonnull)byRightViewByOutLineOffset;
-(JobsReturnJobsTextFieldByCGFloatBlock _Nonnull)byRightViewByTextFieldOffset;

-(JobsReturnJobsTextFieldByViewBlock _Nonnull)byLeftView;
-(JobsReturnJobsTextFieldByViewBlock _Nonnull)byRightView;

-(JobsReturnJobsTextFieldByBOOLBlock _Nonnull)byNotAllowEdit;
/// 只有在输入框不允许编辑的大前提之下，才允许加入手势
-(JobsReturnJobsTextFieldByGestureRecognizerBlock _Nonnull)byGesture;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTextField *_Nonnull makeJobsTextField(jobsByJobsTextFieldBlock _Nonnull block){
    JobsTextField *data = JobsTextField.alloc.init;
    if (block) block(data);
    return data;
}
/**
 当 UITextField 本身是不可编辑状态（enabled = NO 或 userInteractionEnabled = NO）时，直接更改其 text 属性不会触发 RAC 的绑定，因为 RAC 的绑定通常依赖于控件的事件（如 UIControlEventEditingChanged）来检测变化。
 
 [[RACObserve(textField, text) distinctUntilChanged] subscribeNext:^(NSString *newText) {
     JobsLog(@"Text changed via KVO: %@", newText);
 }];

 // 修改 text 属性
 textField.text = @"新内容";
 
 或者
 
 UITextField *textField = [[UITextField alloc] init];
 textField.enabled = NO; // 设置为不可编辑状态

 // 创建一个信号
 RACSubject *textFieldSignal = [RACSubject subject];

 // 绑定信号
 [textFieldSignal subscribeNext:^(NSString *newText) {
     JobsLog(@"Text changed: %@", newText);
 }];

 // 模拟改变 text 值
 textField.text = @"新内容";
 // 手动发送信号
 [textFieldSignal sendNext:textField.text];

 */

/**
 
 -(JobsTextField *)textField_birthDay{
     if(!_textField_birthDay){
         @jobs_weakify(self)
         _textField_birthDay = makeJobsTextField(^(__kindof JobsTextField * _Nullable data) {
             @jobs_strongify(self)
             data.layoutSubviewsRectCorner = UIRectCornerAllCorners;
             data.layoutSubviewsRectCornerSize = CGSizeMake(JobsWidth(8), JobsWidth(8));
             data.byLeftViewByOutLineOffset(JobsWidth(4))
                 .byLeftViewByTextFieldOffset(JobsWidth(4))
                 .byRightViewByTextFieldOffset(JobsWidth(4))
                 .byRightViewByOutLineOffset(JobsWidth(14))
                 .byLeftView(BaseButton.jobsInit()
                             .jobsResetBtnBgImage(@"📅".img)
                             .onClickBy(^(UIButton *x){
                                 JobsLog(@"");
                             }).onLongPressGestureBy(^(id data){
                                 JobsLog(@"");
                             }).bySize(CGSizeMake(JobsWidth(16), JobsWidth(16))))
                 .byRightView(BaseButton.jobsInit()
                              .jobsResetBtnBgImage(@"向下的箭头".img)
                              .onClickBy(^(UIButton *x){
                                  @jobs_strongify(self)
                                  self.popupParameter = nil;
                                  ShowView(self.calenderView);
                              }).onLongPressGestureBy(^(id data){
                                  JobsLog(@"");
                              }).bySize(CGSizeMake(JobsWidth(16), JobsWidth(16))))
                 .byBgColor(@"#f7f7f7".cor)
                 .JobsRichViewByModel2(nil)
                 // 真实的textField，输入回调（每次输入的字符），如果要当前textField的字符，请取值textField.text
                 .JobsBlock1(^(id _Nullable data) {
                     JobsLog(@"ddf = %@",data);
                 });
             data.realTextField
                 .byReturnKeyType(UIReturnKeyDefault)
                 .byKeyboardAppearance(UIKeyboardAppearanceDefault)
                 .byKeyboardType(UIKeyboardTypePhonePad)
                 .byLeftViewMode(UITextFieldViewModeNever)
                 .byRightViewMode(UITextFieldViewModeNever)
                 .byPlaceholder(@"Pick a Date".tr)
                 .byPlaceholderColor(@"#BBBBBB".cor)
                 .byPlaceholderFont(pingFangTCRegular(15))
                 .byAttributedPlaceholder(nil)
                 .byTextCor(@"#788190".cor)
                 .bySecureTextEntry(NO);
         })
         .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
             data.layerCor = @"#BBBBBB".cor;
             data.jobsWidth = 1;
             data.cornerRadiusValue = JobsWidth(8);
         }))
         .addOn(self.scrollView)
         .byAdd(^(MASConstraintMaker *make) {
             @jobs_strongify(self)
             make.size.mas_equalTo(CGSizeMake(JobsWidth(346), JobsWidth(40)));
             make.top.equalTo(self.birthDayTitleLab.mas_bottom).offset(JobsWidth(10));
             make.left.equalTo(self.scrollView).offset(JobsWidth(19));
         });
     }return _textField_birthDay;
 }

 */
