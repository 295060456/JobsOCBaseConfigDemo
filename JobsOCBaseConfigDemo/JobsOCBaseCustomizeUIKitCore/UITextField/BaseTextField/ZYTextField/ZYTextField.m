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
            @jobs_weakify(self)
            self.layerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                @jobs_strongify(self)
                data.cornerRadius = self.ZYTextFieldCornerRadius;
                data.jobsWidth = self.ZYTextFieldBorderWidth;
                data.layerCor = self.ZYTextFieldBorderColor;
                data.masksToBounds = ZYTextFieldMasksToBounds;//必须写在最后，否则绘制无效
            }));
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
    return jobsEqualToZeroRect(self.clearButtonRectForBounds) ? [super clearButtonRectForBounds:bounds] : self.clearButtonRectForBounds;
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
    /// 计算占位文字的 Size
    @jobs_weakify(self)
    CGSize placeholderSize = [self.placeholder sizeWithAttributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
        @jobs_strongify(self)
        if(self.placeholderFont) [data setValue:self.placeholderFont forKey:NSFontAttributeName];
    })];
    [self.placeholder drawInRect:jobsEqualToZeroRect(self.drawPlaceholderInRect) ? jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        data.jobsX = 0;
        data.jobsY = (rect.size.height - placeholderSize.height) / 2;
        data.jobsWidth = rect.size.width;
        data.jobsHeight = rect.size.height;
    }) : self.drawPlaceholderInRect
                  withAttributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
        @jobs_strongify(self)
        if(self.placeholderColor) [data setValue:self.placeholderColor forKey:NSForegroundColorAttributeName];
        if(self.placeholderFont) [data setValue:self.placeholderFont forKey:NSFontAttributeName];
    })];
}
/// 重写来重置边缘区域
-(CGRect)borderRectForBounds:(CGRect)bounds{
    return jobsEqualToZeroRect(self.borderRectForBounds) ? [super borderRectForBounds:bounds] : self.borderRectForBounds;
}
/// 重写来重置占位符区域 【键盘弹起会调用此方法】
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    @jobs_weakify(self)
    CGRect newbounds = bounds;
    CGSize size = [self.placeholder sizeWithAttributes:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
        @jobs_strongify(self)
        [data setValue:self.placeholderFont forKey:NSFontAttributeName];
    })];
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
-(CGRect)textRectForBounds:(CGRect)bounds{
    @jobs_weakify(self)
    return jobsEqualToZeroRect(self.textRectForBounds) ? jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        @jobs_strongify(self)
        data.jobsX = (bounds.origin.x + self.offset) + (self.leftView.Origin.x + self.leftView.sizer.width + self.leftViewOffsetX);
        data.jobsY = bounds.origin.y;
        data.jobsWidth = bounds.size.width - (self.offset + self.leftViewOffsetX + self.rightViewOffsetX);
        data.jobsHeight = bounds.size.height;
    }) : self.textRectForBounds;
}
/// 重写来重置编辑区域【编辑状态下的起始位置】、UIFieldEditor的位置大小【键盘弹起会调用此方法】
-(CGRect)editingRectForBounds:(CGRect)bounds{
    @jobs_weakify(self)
    return jobsEqualToZeroRect(self.editingRectForBounds) ? jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
        @jobs_strongify(self)
        data.jobsX = (bounds.origin.x + self.offset) + (self.leftView.Origin.x + self.leftView.sizer.width + self.leftViewOffsetX);
        data.jobsY = bounds.origin.y;
        data.jobsWidth = bounds.size.width - (self.offset + self.leftViewOffsetX + self.rightViewOffsetX + self.fieldEditorOffset);
        data.jobsHeight = bounds.size.height;
    }) : self.editingRectForBounds;
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
