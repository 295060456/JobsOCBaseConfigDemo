#import "ZYTextField.h"

@interface ZYTextField ()

@end

@implementation ZYTextField

-(instancetype)init{
    if (self = [super init]) {
        self.placeHolderAlignment = NSTextAlignmentLeft;
        self.textAlignment = NSTextAlignmentLeft;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)setIsShowDelBtn:(BOOL)isShowDelBtn{
    _isShowDelBtn = isShowDelBtn;
    self.clearButtonMode = _isShowDelBtn ? UITextFieldViewModeWhileEditing : UITextFieldViewModeNever;
}

-(void)setUseCustomClearButton:(BOOL)useCustomClearButton{
    _useCustomClearButton = useCustomClearButton;
    if (_useCustomClearButton) {
        [self modifyClearButtonWithImage:JobsBuddleIMG(nil,@"ZYTextField",JobsInternationalization(@""), @"CloseCircle（小号）.png")];
    }
}
/// 必须在self有具体frame的时候才管用
-(void)setZYTextFieldMasksToBounds:(BOOL)ZYTextFieldMasksToBounds{
    _ZYTextFieldMasksToBounds = ZYTextFieldMasksToBounds;
    if (jobsEqualToZeroRect(self.bounds)) {
        NSLog(@"self.frame 为空，绘制失败");
    }else{
        if (_ZYTextFieldMasksToBounds) {
            self.layer.cornerRadius = self.ZYTextFieldCornerRadius;
            self.layer.borderColor = self.ZYTextFieldBorderColor.CGColor;
            self.layer.borderWidth = self.ZYTextFieldBorderWidth;
            self.layer.masksToBounds = ZYTextFieldMasksToBounds;//必须写在最后，否则绘制无效
        }
    }
}
#pragma mark —— (重写父类方法) UIResponder
/// iOS UIMenuController
-(BOOL)canPerformAction:(SEL)action
             withSender:(id)sender{
//    UIMenuController.sharedMenuController.menuVisible = self.isShowMenu;
    return self.isShowMenu;
}
/// 当前文本框聚焦时就会调用
-(BOOL)becomeFirstResponder{
    return [super becomeFirstResponder];
}
/// 当前文本框失去焦点时就会调用
-(BOOL)resignFirstResponder{
    return [super resignFirstResponder];
}
#pragma mark —— (重写父类方法) UITextField
/// 重写来重置clearButton位置,改变size可能导致button的图片失真
-(CGRect)clearButtonRectForBounds:(CGRect)bounds{
    return jobsEqualToZeroRect(self.clearButtonRectForBounds) ? [self clearButtonRectForBounds:bounds] : self.clearButtonRectForBounds;
}
/// leftView——Rect 【键盘弹起会调用此方法】？
-(CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += self.leftViewOffsetX;
    return jobsEqualToZeroRect(self.leftViewRectForBounds) ? iconRect : self.leftViewRectForBounds;
}
/// rightView——Rect 【键盘弹起会调用此方法】
- (CGRect)rightViewRectForBounds:(CGRect)bounds{
    CGRect iconRect = [super rightViewRectForBounds:bounds];
    iconRect.origin.x -= self.rightViewOffsetX;
    return jobsEqualToZeroRect(self.rightViewRectForBounds) ? iconRect : self.rightViewRectForBounds;
}
/// 重写改变绘制占位符属性。重写时调用super可以按默认图形属性绘制;若自己完全重写绘制函数，就不用调用super了
-(void)drawPlaceholderInRect:(CGRect)rect{// 0\0\217.6\27.3
    CGSize placeholderSize = [self.placeholder sizeWithAttributes: @{NSFontAttributeName : self.placeholderFont}];/// 计算占位文字的 Size
    CGRect drawInRect = CGRectMake(0,
                                   (rect.size.height - placeholderSize.height) / 2,
                                   rect.size.width,
                                   rect.size.height);
    [self.placeholder drawInRect:jobsEqualToZeroRect(self.drawPlaceholderInRect) ? drawInRect : self.drawPlaceholderInRect
                  withAttributes:@{NSForegroundColorAttributeName : self.placeholderColor,
                                   NSFontAttributeName : self.placeholderFont}];
}
/// 重写来重置边缘区域
-(CGRect)borderRectForBounds:(CGRect)bounds{
    return jobsEqualToZeroRect(self.borderRectForBounds) ? [super borderRectForBounds:bounds] : self.borderRectForBounds;
}
/// 重写来重置占位符区域 【键盘弹起会调用此方法】
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    
    CGRect newbounds = bounds;
    CGSize size = [self.placeholder sizeWithAttributes:@{NSFontAttributeName:self.placeholderFont}];
    
    switch (self.placeHolderAlignment) {
        case NSTextAlignmentLeft:{
            newbounds.origin.x += self.placeHolderOffset + self.leftViewOffsetX;
        }break;
        case NSTextAlignmentCenter:{
            CGFloat width = bounds.size.width - size.width;
            newbounds.origin.x = width / 2 + self.placeHolderOffset + self.leftViewOffsetX;
            newbounds.size.width = size.width;
        }break;
        case NSTextAlignmentRight:{
            CGFloat width = bounds.size.width - size.width;
            newbounds.origin.x = width - (self.placeHolderOffset + self.leftViewOffsetX);
            newbounds.size.width = size.width;
        }break;
        default:
            break;
    }return jobsEqualToZeroRect(self.placeholderRectForBounds) ? newbounds : self.placeholderRectForBounds;
}
/// 重写来重置文字区域 【未编辑状态下光标的起始位置】【键盘弹起会调用此方法】
-(CGRect)textRectForBounds:(CGRect)bounds{//0\0\100\100 -—> 0\0\255.333\32 <->0\0\100\100
    CGRect textRectForBounds = CGRectMake((bounds.origin.x + self.offset) + (self.leftView.origin.x + self.leftView.size.width + self.leftViewOffsetX),
                                          bounds.origin.y,
                                          bounds.size.width - (self.offset + self.leftViewOffsetX + self.rightViewOffsetX),
                                          bounds.size.height);
    return jobsEqualToZeroRect(self.textRectForBounds) ? textRectForBounds : self.textRectForBounds;
}
/// 重写来重置编辑区域【编辑状态下的起始位置】、UIFieldEditor的位置大小【键盘弹起会调用此方法】
-(CGRect)editingRectForBounds:(CGRect)bounds{// 0\0\217.6\27.3
    CGRect editingRectForBounds = CGRectMake((bounds.origin.x + self.offset) + (self.leftView.origin.x + self.leftView.size.width + self.leftViewOffsetX),
                                             bounds.origin.y,
                                             bounds.size.width - (self.offset + self.leftViewOffsetX + self.rightViewOffsetX + self.fieldEditorOffset),
                                             bounds.size.height);
    return jobsEqualToZeroRect(self.editingRectForBounds) ? editingRectForBounds : self.editingRectForBounds;
}
#pragma mark —— lazyLoad
-(CGFloat)offset{
    if (_offset == 0) {
        _offset = 0.1;
    }return _offset;
}

-(CGFloat)leftViewOffsetX{
    if (_leftViewOffsetX == 0) {
        _leftViewOffsetX = 0.1;
    }return _leftViewOffsetX;
}

-(CGFloat)rightViewOffsetX{
    if (_rightViewOffsetX == 0) {
        _rightViewOffsetX = 0.1;
    }return _rightViewOffsetX;
}

-(CGFloat)ZYTextFieldBorderWidth{
    if (_ZYTextFieldBorderWidth == 0) {
        _ZYTextFieldBorderWidth = 0.1;
    }return _ZYTextFieldBorderWidth;
}

-(UIColor *)ZYTextFieldBorderColor{
    if (!_ZYTextFieldBorderColor) {
        _ZYTextFieldBorderColor = JobsBlackColor;
    }return _ZYTextFieldBorderColor;
}

-(CGFloat)fieldEditorOffset{
    if (!_fieldEditorOffset) {
        _fieldEditorOffset = JobsWidth(50);
    }return _fieldEditorOffset;
}

@end
