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
/// Data
Prop_assign() CGFloat leftViewByOutLineOffset; /// 这个值需要在leftView之前设置才有效
Prop_assign() CGFloat leftViewByTextFieldOffset;
Prop_assign() CGFloat rightViewByOutLineOffset;
Prop_assign() CGFloat rightViewByTextFieldOffset;
Prop_strong(null_resettable) UIColor *realTextFieldBgCor;

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
