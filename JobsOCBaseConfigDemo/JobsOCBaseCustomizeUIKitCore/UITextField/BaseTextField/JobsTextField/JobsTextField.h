//
//  JobsTextField.h
//  FM
//
//  Created by User on 7/20/24.
//

#import "BaseView.h"
#import "JobsBlock.h"
#import "MacroDef_Cor.h"
#import "MacroDef_String.h"
#import "UITextModelProtocol.h"
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
,UITextModelProtocol
>
/// UI
@property(nonatomic,strong,nullable)__kindof UIView *leftView;
@property(nonatomic,strong,nonnull)UITextField *realTextField;
@property(nonatomic,strong,nullable)__kindof UIView *rightView;
/// Data
@property(nonatomic,assign)CGFloat leftViewByOutLineOffset;
@property(nonatomic,assign)CGFloat leftViewByTextFieldOffset;
@property(nonatomic,assign)CGFloat rightViewByOutLineOffset;
@property(nonatomic,assign)CGFloat rightViewByTextFieldOffset;
@property(nonatomic,strong,null_resettable)UIColor *realTextFieldBgCor;
@property(nonatomic,assign)UIKeyboardAppearance keyboardAppearance;
@property(nonatomic,assign)UIKeyboardType keyboardType;
@property(nonatomic,assign)UIReturnKeyType returnKeyType;
@property(nonatomic,assign)UITextFieldViewMode leftViewMode;
@property(nonatomic,assign)UITextFieldViewMode rightViewMode;
@property(nonatomic,assign)BOOL notAllowEdit;/// 默认不允许编辑
@property(nonatomic,assign)BOOL secureTextEntry;
@property(nullable,nonatomic,copy)NSString *placeholder;
@property(nullable,nonatomic,copy)NSAttributedString *attributedPlaceholder API_AVAILABLE(ios(6.0));
//@property(nullable,nonatomic,copy)NSString *text;/// UITextModelProtocol
//@property(nonatomic,strong,null_resettable)UIColor *textCor;/// UITextModelProtocol
//@property(nonatomic,strong,null_resettable)UIColor *placeholderColor;/// UITextModelProtocol
//@property(nonatomic,strong,null_resettable)UIFont *placeholderFont;/// UITextModelProtocol

-(void)otherActionBlock:(JobsReturnIDByIDBlock)otherActionBlock;

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
     NSLog(@"Text changed via KVO: %@", newText);
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
     NSLog(@"Text changed: %@", newText);
 }];

 // 模拟改变 text 值
 textField.text = @"新内容";
 // 手动发送信号
 [textFieldSignal sendNext:textField.text];

 */
