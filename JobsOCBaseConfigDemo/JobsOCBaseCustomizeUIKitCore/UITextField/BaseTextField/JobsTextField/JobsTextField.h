//
//  JobsTextField.h
//  FM
//
//  Created by User on 7/20/24.
//

#import "BaseView.h"
#import "MacroDef_Cor.h"
#import "MacroDef_String.h"
#import "UITextModelProtocol.h"
#import "UITextField+Placeholder.h"
#import "UITextField+Extend.h"

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
@property(nonatomic,strong,nullable)UIView *leftView;
@property(nonatomic,strong,nonnull)UITextField *realTextField;
@property(nonatomic,strong,nullable)UIView *rightView;
/// Data
@property(nonatomic,assign)CGFloat leftViewByOutLineOffset;
@property(nonatomic,assign)CGFloat leftViewByTextFieldOffset;
@property(nonatomic,assign)CGFloat rightViewByOutLineOffset;
@property(nonatomic,assign)CGFloat rightViewByTextFieldOffset;
@property(nonatomic,strong,null_resettable)UIColor *realTextFieldBgCor;
@property(nonatomic,strong,null_resettable)UIColor *placeholderColor;
@property(nonatomic,strong,null_resettable)UIFont *placeholderFont;
@property(nonatomic,assign)UIReturnKeyType returnKeyType;
@property(nonatomic,assign)UIKeyboardAppearance keyboardAppearance;
@property(nonatomic,assign)UIKeyboardType keyboardType;
@property(nonatomic,assign)UITextFieldViewMode leftViewMode;
@property(nonatomic,assign)UITextFieldViewMode rightViewMode;
@property(nullable,nonatomic,copy)NSString *placeholder;
@property(nullable,nonatomic,copy)NSAttributedString *attributedPlaceholder API_AVAILABLE(ios(6.0));

@end

NS_ASSUME_NONNULL_END
