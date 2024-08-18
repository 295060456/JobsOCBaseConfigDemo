//
//  JobsTextField.m
//  FM
//
//  Created by User on 7/20/24.
//

#import "JobsTextField.h"

@interface JobsTextField ()

@property(nonatomic,strong,nullable)JobsReturnIDByIDBlock otherActionBlock;

@end

@implementation JobsTextField
BaseViewProtocol_synthesize
BaseProtocol_synthesize
UIViewModelProtocol_synthesize
@synthesize leftView = _leftView;
@synthesize rightView = _rightView;
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {

    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
    [self layoutSubviewsCutCnrByRoundingCorners:self.layoutSubviewsRectCorner
                                    cornerRadii:self.layoutSubviewsRectCornerSize];
}
#pragma mark —— 一些公有方法
-(void)otherActionBlock:(JobsReturnIDByIDBlock)otherActionBlock{
    self.otherActionBlock = otherActionBlock;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {

    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.leftView.alpha = 1;
        self.realTextField.alpha = 1;
        self.rightView.alpha = 1;
    };
}
#pragma mark —— UITextFieldDelegate
/// 含义：在文本字段即将开始编辑时调用。返回YES表示允许编辑，返回NO则表示不允许编辑。
/// 用途：您可以使用此方法进行输入验证或单元格选择，以决定是否允许用户开始编辑。
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(self.otherActionBlock) self.otherActionBlock(textField);
    return !self.otherActionBlock;
}
/// 含义：文本字段已经开始编辑时调用。
/// 用途：在此方法中，您可以开始相应的操作，例如更新用户界面（UI），显示工具条等。
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
/// 含义：在文本字段即将结束编辑时调用。返回YES表示允许结束编辑，返回NO则表示不允许结束编辑。
/// 用途：您可以在这里执行验证，例如检查用户输入的有效性。
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
/// 含义：文本字段已经结束编辑时调用。
/// 用途：在此方法中，可以处理输入完成后的操作，例如更新数据模型或用户界面的状态。
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}
/// 含义：文本字段结束编辑时调用，并带有结束原因。
/// 用途：可以根据不同的结束原因执行不同的操作。
/// API_AVAILABLE(ios(10.0))
-(void)textFieldDidEndEditing:(UITextField *)textField
                        reason:(UITextFieldDidEndEditingReason)reason{
    
}
/// 含义：在文本字段的字符将要改变时调用，因为用户输入、删除或粘贴内容。返回YES允许更改，返回NO禁止更改。
/// 用途：您可以用于限制输入的字符类型或长度，或实现某些格式化规则。
-(BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string{
    return YES;
}
/// 含义：在文本字段的选中文本发生改变时调用。
/// 用途：可以用于实时更新相关UI或执行某些操作。
/// API_AVAILABLE(ios(13.0), tvos(13.0));
-(void)textFieldDidChangeSelection:(UITextField *)textField{
    
}
/// 含义：在清除文本字段内容之前调用。返回YES允许清除，返回NO禁止清除。
/// 用途：可以用于提示用户、确认清除操作或进行额外的验证。
-(BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}
/// 含义：在用户按下“Return”键时调用。返回YES表示处理当前输入（如关闭键盘），返回NO表示不处理。
/// 用途：一般用于提交表单，关闭键盘，或进行下一步的输入。
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}
/// 含义：在文本字段要展示编辑菜单时调用。可自定义菜单内容。
/// 用途：可以提供自定义的剪切、复制、粘贴等操作选项。
/// API_AVAILABLE(ios(16.0))
-(nullable UIMenu *)textField:(UITextField *)textField
  editMenuForCharactersInRange:(NSRange)range
              suggestedActions:(NSArray<UIMenuElement *> *)suggestedActions{
    return nil;
}
/// 含义：在文本字段即将展示编辑菜单时调用。
/// 用途：可以在菜单展示前进行动画处理或其他UI调整。
/// API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos)
-(void)textField:(UITextField *)textField
willPresentEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator{
    
}
/// 含义：在文本字段即将消失编辑菜单时调用。
/// 用途：可以在菜单消失前进行相关清理或动画效果。
/// API_AVAILABLE(ios(16.0)) API_UNAVAILABLE(tvos, watchos)
-(void)textField:(UITextField *)textField
willDismissEditMenuWithAnimator:(id<UIEditMenuInteractionAnimating>)animator{
    
}
#pragma mark —— set方法
-(void)setLeftView:(UIView *)leftView{
    _leftView = leftView;
    [self addSubview:_leftView];
    [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(self.leftViewByOutLineOffset);
        
        if (_leftView.width) {
            make.width.mas_equalTo(_leftView.width);
        }
        
        if (_leftView.height) {
            make.height.mas_equalTo(_leftView.height);
        }
    }];
    /// 会将之前设置的size值冲掉
    [self layoutIfNeeded];
    NSLog(@"");
}

-(void)setRightView:(UIView *)rightView{
    _rightView = rightView;
    [self addSubview:_rightView];
    [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-self.rightViewByOutLineOffset);
        
        if (rightView.width) {
            make.width.mas_equalTo(rightView.width);
        }
        
        if (rightView.height) {
            make.height.mas_equalTo(rightView.height);
        }
    }];
    /// 会将之前设置的size值冲掉
    [self layoutIfNeeded];
    NSLog(@"");
}

-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    _realTextField.placeholder = _placeholder;
}

-(void)setText:(NSString *)text{
    _text = text;
    _realTextField.text = _text;
}
#pragma mark —— lazyLoad
-(UITextField *)realTextField{
    if(!_realTextField){
        _realTextField = UITextField.new;
        _realTextField.text = self.text;
        _realTextField.textColor = self.textColor;
        _realTextField.delegate = self;
        _realTextField.backgroundColor = self.realTextFieldBgCor;
        _realTextField.returnKeyType = self.returnKeyType;
        _realTextField.keyboardAppearance = self.keyboardAppearance;
        _realTextField.keyboardType = self.keyboardType;
        _realTextField.leftViewMode = self.leftViewMode;
        _realTextField.rightViewMode = self.rightViewMode;
        _realTextField.attributedPlaceholder = self.attributedPlaceholder;
        _realTextField.placeholder = self.placeholder;
        _realTextField.placeholderColor = self.placeholderColor;
        _realTextField.placeholderFont = self.placeholderFont;
        @jobs_weakify(self)
        [_realTextField jobsTextFieldEventFilterBlock:^BOOL(id data) {
//            @jobs_strongify(self)
            NSLog(@"");
            return YES;
        } subscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            self.realTextField.text = x;
            if (self.jobsBlock) self.jobsBlock(x);
        }];
        [self addSubview:_realTextField];
        [_realTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.left.equalTo(self.leftView ? self.leftView.mas_right : self).offset(self.leftViewByTextFieldOffset);
            make.right.equalTo(self.rightView ? self.rightView.mas_left : self).offset(-self.rightViewByTextFieldOffset);
        }];
    }return _realTextField;
}

-(UIColor *)textColor{
    if(!_textColor){
        _textColor = JobsBlackColor;
    }return _textColor;
}

-(UIColor *)realTextFieldBgCor{
    if(!_realTextFieldBgCor){
        _realTextFieldBgCor = JobsWhiteColor;
    }return _realTextFieldBgCor;
}

-(UIColor *)placeholderColor{
    if(!_placeholderColor){
        _placeholderColor = JobsBlackColor;
    }return _placeholderColor;
}

-(UIFont *)placeholderFont{
    if(!_placeholderFont){
        _placeholderFont = JobsFontRegular(JobsWidth(14));
    }return _placeholderFont;
}

@end
