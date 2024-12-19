//
//  JobsTextField.m
//  FM
//
//  Created by User on 7/20/24.
//

#import "JobsTextField.h"

@interface JobsTextField ()

@property(nonatomic,copy,nullable)JobsReturnIDByIDBlock otherActionBlock;

@end

@implementation JobsTextField
BaseViewProtocol_synthesize
UITextFieldProtocol_synthesize
BaseProtocol_synthesize
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
    [self appointCornerCutToCircleByRoundingCorners:self.layoutSubviewsRectCorner
                                        cornerRadii:self.layoutSubviewsRectCornerSize];
}
#pragma mark —— 一些公有方法
-(void)otherActionBlock:(JobsReturnIDByIDBlock _Nullable)otherActionBlock{
    self.otherActionBlock = otherActionBlock;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {

    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
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
    if(self.notAllowEdit){
        if(self.otherActionBlock) self.otherActionBlock(textField);
    } return !self.notAllowEdit;
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
#pragma mark —— UITextFieldProtocol
-(void)setTextFieldPlaceholder:(NSString *)textFieldPlaceholder{
    _textFieldPlaceholder = textFieldPlaceholder;
    _realTextField.placeholder = _textFieldPlaceholder;
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    _realTextField.placeholderColor = _placeholderColor;
}

-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    _placeholderFont = placeholderFont;
    _realTextField.placeholderFont = _placeholderFont;
}

-(void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    _realTextField.font = titleFont;
}

-(void)setTextFieldSecureTextEntry:(BOOL)textFieldSecureTextEntry{
    _textFieldSecureTextEntry = textFieldSecureTextEntry;
    _realTextField.secureTextEntry = textFieldSecureTextEntry;
}

-(void)setTitleCor:(UIColor *)titleCor{
    _titleCor = titleCor;
    _realTextField.textColor = titleCor;
}

-(void)setTitle:(NSString *)title{
    _title = title;
    self.realTextField.text = title;
}

-(NSString *)title{
    return _realTextField.text;
}

-(void)setLeftView:(UIView *)leftView{
    _leftView = leftView;
    [self addSubview:_leftView];
    [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(self.leftViewByOutLineOffset);
        if (_leftView.width) make.width.mas_equalTo(_leftView.width);
        if (_leftView.height) make.height.mas_equalTo(_leftView.height);
    }];self.refresh();/// 会将之前设置的size值冲掉
}

-(void)setRightView:(UIView *)rightView{
    _rightView = rightView;
    [self addSubview:_rightView];
    [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-self.rightViewByOutLineOffset);
        if(self.isSizeZero(rightView.sizer)){
            if (rightView.width) make.width.mas_equalTo(rightView.width);
            if (rightView.height) make.height.mas_equalTo(rightView.height);
        }else make.size.mas_equalTo(rightView.sizer);
    }];self.refresh();/// 会将之前设置的size值冲掉
}
#pragma mark —— lazyLoad
-(UITextField *)realTextField{
    if(!_realTextField){
        @jobs_weakify(self)
        _realTextField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            @jobs_strongify(self)
            textField.delegate = self;
            textField.text = self.title;
            textField.font = self.titleFont;
            textField.textColor = self.titleCor;
            textField.secureTextEntry = self.textFieldSecureTextEntry;
            textField.backgroundColor = self.realTextFieldBgCor;
            textField.returnKeyType = self.returnKeyType;
            textField.keyboardAppearance = self.keyboardAppearance;
            textField.keyboardType = self.keyboardType;
            textField.leftViewMode = self.leftViewMode;
            textField.rightViewMode = self.rightViewMode;
            textField.attributedPlaceholder = self.attributedPlaceholder;
            textField.placeholder = self.textFieldPlaceholder;
            textField.placeholderColor = self.placeholderColor;
            textField.placeholderFont = self.placeholderFont;
            [self addSubview:textField];
            [textField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(self);
                make.left.equalTo(self.leftView ? self.leftView.mas_right : self).offset(self.leftViewByTextFieldOffset);
                make.right.equalTo(self.rightView ? self.rightView.mas_left : self).offset(-self.rightViewByTextFieldOffset);
            }];
        });
        [_realTextField jobsTextFieldEventFilterBlock:^BOOL(id data) {
//            @jobs_strongify(self)
            JobsLog(@"");
            return YES;
        } subscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            self.realTextField.text = x;
            if (self.objectBlock) self.objectBlock(x);
        }];
    }return _realTextField;
}

-(UIColor *)titleCor{
    if(!_titleCor){
        _titleCor = JobsBlackColor;
    }return _titleCor;
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
