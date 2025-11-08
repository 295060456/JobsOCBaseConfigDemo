//
//  UITextField+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import "UITextField+DSL.h"

@implementation UITextField (DSL)
#pragma mark —— 基础文本
-(JobsRetTextFieldByStringBlock _Nonnull)byText {
    @jobs_weakify(self)
    return ^__kindof UITextField * (NSString * _Nullable text) {
        @jobs_strongify(self)
        self.text = text;
        return self;
    };
}

-(JobsRetTextFieldByAttributedStringBlock _Nonnull)byAttributedText {
    @jobs_weakify(self)
    return ^__kindof UITextField * (NSAttributedString * _Nullable attrText) {
        @jobs_strongify(self)
        if (@available(iOS 6.0, *)) {
            self.attributedText = attrText;
        }return self;
    };
}

-(JobsRetTextFieldByCorBlock _Nonnull)byTextCor {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UIColor * _Nullable color) {
        @jobs_strongify(self)
        self.textColor = color;
        return self;
    };
}

-(JobsRetTextFieldByFontBlock _Nonnull)byFont {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UIFont * _Nullable font) {
        @jobs_strongify(self)
        self.font = font;
        return self;
    };
}

-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byTextAlignment {
    @jobs_weakify(self)
    return ^__kindof UITextField * (NSTextAlignment alignment) {
        @jobs_strongify(self)
        self.textAlignment = alignment;
        return self;
    };
}

-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byBorderStyle {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UITextBorderStyle style) {
        @jobs_strongify(self)
        self.borderStyle = style;
        return self;
    };
}

-(JobsRetTextFieldByNSDictionaryBlock _Nonnull)byDefaultTextAttributes {
    @jobs_weakify(self)
    return ^__kindof UITextField * (NSDictionary<NSAttributedStringKey,id> * _Nullable attrs) {
        @jobs_strongify(self)
        if (@available(iOS 7.0, *)) {
            self.defaultTextAttributes = attrs ?: @{};
        }return self;
    };
}
#pragma mark —— 占位符
-(JobsRetTextFieldByStringBlock _Nonnull)byPlaceholder {
    @jobs_weakify(self)
    return ^__kindof UITextField * (NSString * _Nullable ph) {
        @jobs_strongify(self)
        self.placeholder = ph;
        return self;
    };
}

-(JobsRetTextFieldByCorBlock _Nonnull)byPlaceholderColor{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(__kindof UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.placeholderColor = cor;
        return self;
    };
}

-(JobsRetTextFieldByFontBlock _Nonnull)byPlaceholderFont{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(__kindof UIFont *_Nullable font){
        @jobs_strongify(self)
        self.placeholderFont = font;
        return self;
    };
}

-(JobsRetTextFieldByAttributedStringBlock _Nonnull)byAttributedPlaceholder {
    @jobs_weakify(self)
    return ^__kindof UITextField * (NSAttributedString * _Nullable ph) {
        @jobs_strongify(self)
        if (@available(iOS 6.0, *)) {
            self.attributedPlaceholder = ph;
        }return self;
    };
}
#pragma mark —— 编辑行为
-(JobsRetTextFieldByBOOLBlock _Nonnull)byClearsOnBeginEditing {
    @jobs_weakify(self)
    return ^__kindof UITextField * (BOOL on) {
        @jobs_strongify(self)
        self.clearsOnBeginEditing = on;
        return self;
    };
}

-(JobsRetTextFieldByBOOLBlock _Nonnull)byAdjustsFontSizeToFitWidth {
    @jobs_weakify(self)
    return ^__kindof UITextField * (BOOL on) {
        @jobs_strongify(self)
        self.adjustsFontSizeToFitWidth = on;
        return self;
    };
}

-(JobsRetTextFieldByCGFloatrBlock _Nonnull)byMinimumFontSize {
    @jobs_weakify(self)
    return ^__kindof UITextField * (CGFloat size) {
        @jobs_strongify(self)
        self.minimumFontSize = size;
        return self;
    };
}

-(JobsRetTextFieldByBOOLBlock _Nonnull)byAllowsEditingTextAttributes {
    @jobs_weakify(self)
    return ^__kindof UITextField * (BOOL on) {
        @jobs_strongify(self)
        if (@available(iOS 6.0, *)) {
            self.allowsEditingTextAttributes = on;
        }return self;
    };
}

-(JobsRetTextFieldByNSDictionaryBlock _Nonnull)byTypingAttributes {
    @jobs_weakify(self)
    return ^__kindof UITextField * (NSDictionary<NSAttributedStringKey,id> * _Nullable attrs) {
        @jobs_strongify(self)
        if (@available(iOS 6.0, *)) {
            self.typingAttributes = attrs;
        }return self;
    };
}

-(JobsRetTextFieldByBOOLBlock _Nonnull)byClearsOnInsertion {
    @jobs_weakify(self)
    return ^__kindof UITextField * (BOOL on) {
        @jobs_strongify(self)
        if (@available(iOS 6.0, *)) {
            self.clearsOnInsertion = on;
        }return self;
    };
}
#pragma mark —— 背景
-(JobsRetTextFieldByImageBlock _Nonnull)byBackground {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UIImage * _Nullable img) {
        @jobs_strongify(self)
        self.background = img;
        return self;
    };
}

-(JobsRetTextFieldByImageBlock _Nonnull)byDisabledBackground {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UIImage * _Nullable img) {
        @jobs_strongify(self)
        self.disabledBackground = img;
        return self;
    };
}
#pragma mark —— 清除按钮
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byClearButtonMode {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UITextFieldViewMode mode) {
        @jobs_strongify(self)
        self.clearButtonMode = mode;
        return self;
    };
}
#pragma mark —— 左右视图
-(JobsRetTextFieldByViewBlock _Nonnull)byLeftView {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UIView * _Nullable v) {
        @jobs_strongify(self)
        self.leftView = v;
        return self;
    };
}

-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byLeftViewMode {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UITextFieldViewMode mode) {
        @jobs_strongify(self)
        self.leftViewMode = mode;
        return self;
    };
}

-(JobsRetTextFieldByViewBlock _Nonnull)byRightView {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UIView * _Nullable v) {
        @jobs_strongify(self)
        self.rightView = v;
        return self;
    };
}

-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byRightViewMode {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UITextFieldViewMode mode) {
        @jobs_strongify(self)
        self.rightViewMode = mode;
        return self;
    };
}
#pragma mark —— 输入视图
-(JobsRetTextFieldByViewBlock _Nonnull)byInputView {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UIView * _Nullable v) {
        @jobs_strongify(self)
        self.inputView = v;
        return self;
    };
}

-(JobsRetTextFieldByViewBlock _Nonnull)byInputAccessoryView {
    @jobs_weakify(self)
    return ^__kindof UITextField * (UIView * _Nullable v) {
        @jobs_strongify(self)
        self.inputAccessoryView = v; // visionOS 不可用，已在 .h 标注
        return self;
    };
}
#pragma mark —— delegate
-(JobsRetTextFieldByDelegateBlock _Nonnull)byDelegate {
    @jobs_weakify(self)
    return ^__kindof UITextField * (id<UITextFieldDelegate> _Nullable dg) {
        @jobs_strongify(self)
        self.delegate = dg;
        return self;
    };
}
#pragma mark —— 键盘
-(JobsRetTextFieldByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UIKeyboardAppearance appearance){
        @jobs_strongify(self)
        self.keyboardAppearance = appearance;
        return self;
    };
}

-(JobsRetTextFieldByKeyboardTypeBlock _Nonnull)byKeyboardType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UIKeyboardType type){
        @jobs_strongify(self)
        self.keyboardType = type;
        return self;
    };
}

-(JobsRetTextFieldByReturnKeyTypeBlock _Nonnull)byReturnKeyType{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(UIReturnKeyType type){
        @jobs_strongify(self)
        self.returnKeyType = type;
        return self;
    };
}
#pragma mark —— 其他
-(JobsRetTextFieldByBOOLBlock _Nonnull)bySecureTextEntry{
    @jobs_weakify(self)
    return ^__kindof UITextField *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.secureTextEntry = data;
        return self;
    };
}

@end
