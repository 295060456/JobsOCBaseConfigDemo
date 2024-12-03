//
//  UITextFieldProtocol.h
//  FM
//
//  Created by Admin on 3/12/2024.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UITextFieldProtocol <BaseProtocol>
#pragma mark —— 关于数据
/// UITextField.text
Prop_copy(nullable) NSString *title;/// 主标题
Prop_strong(nullable) UIColor *titleCor;/// 主标题文字颜色
Prop_strong(nullable) UIFont *titleFont;/// 主标题字体
/// UITextField.placeholder
Prop_copy(nullable) NSString *textFieldPlaceholder;/// 避免与系统的 placeholder 产生冲突
Prop_strong(nullable) UIColor *placeholderColor;
Prop_strong(nullable) UIFont *placeholderFont;
#pragma mark —— 关于UI
Prop_strong(nullable)UIColor *baseBackgroundColor;/// 背景颜色
Prop_assign() NSTextAlignment placeHolderAlignment; /// PlaceHolder的位置（左/中/右）
Prop_assign() CGFloat cornerRadiusValue;/// 圆切角—作用于所有的角
Prop_strong(nullable)UIColor *layerBorderCor;/// 描边的颜色
Prop_assign() CGFloat borderWidth;/// 描边线的宽度
#pragma mark —— 关于UI偏移量
Prop_assign() CGFloat offset; ///【对UITextField,.text的偏移】光标的起始距离距离控件最左边(不包括leftView)的差值
Prop_assign() CGFloat placeHolderOffset; /// 【对UITextField,.placeHolder的偏移】左/右/居中 对齐的时候的偏移量 传正值
Prop_assign() CGFloat leftViewOffsetX; /// leftView 距离控件最左边的差值
Prop_assign() CGFloat rightViewOffsetX; /// TextField的删除按钮距离控件最右边的差值
Prop_assign() CGFloat fieldEditorOffset; /// 因为设置了leftView后fieldEditor所需的偏移量
#pragma mark —— 关于子UI
Prop_assign() BOOL isShowDelBtn;/// 是否显示删除按钮，默认不显示
Prop_assign() BOOL useCustomClearButton;/// 是否使用自定义的删除按钮 默认不使用
Prop_assign() BOOL isShowMenu; /// 是否显示菜单 默认不显示
#pragma mark —— 关于键盘
Prop_assign() CGFloat TFRiseHeight; /// 键盘在此手机上的最高弹起，区别于全面屏结合非全面屏，有一个安全区域34
#pragma mark —— Sys 以下属性的优先级最高，分别对应了系统中的各自的方法名
Prop_assign() CGRect clearButtonRectForBounds;/// 重置clearButton位置
Prop_assign() CGRect borderRectForBounds;/// 重置边缘区域
Prop_assign() CGRect drawPlaceholderInRect;/// Placeholder位置 【初始化的时候调用】🥶和placeholderRectForBounds有什么区别？
Prop_assign() CGRect leftViewRectForBounds;/// leftView位置 【键盘弹起会调用此方法，但是键盘落下去不会调用】❤️
Prop_assign() CGRect rightViewRectForBounds;/// rightView位置 【键盘弹起会调用此方法，但是键盘落下去不会调用】❤️
Prop_assign() CGRect placeholderRectForBounds;/// Placeholder区域 【键盘弹起会调用此方法，但是键盘落下去不会调用】❤️ UITextFieldLabel的高度，即承载placeholder的控件的高度
Prop_assign() CGRect textRectForBounds;/// 重置文字区域 ，这也是结束编辑的时候的文字区域 【未编辑状态下光标的起始位置】【键盘弹起+落下会调用此方法】❤️❤️这个属性决定承载text的控件UITextLayoutFragmentView的父控件UITextLayoutCanvasView和UITouchPassthroughView的Fram。图层结构由上至下是：UITextLayoutFragmentView—>UITextLayoutCanvasView—>UITouchPassthroughView。其x和y都是0，文本超过这个size会以...的形式出现。textRectForBounds的高度过于小就会导致UITextLayoutFragmentView加载不到图层。一般这里的最后一个参数（高度，固定写死100，不要有任何比例尺）
Prop_assign() CGRect editingRectForBounds;/// 重置编辑区域【编辑状态下的起始位置】、UIFieldEditor的位置大小【键盘弹起+落下会调用此方法】❤️❤️这个值，一般 == textRectForBounds。当超过输入距离的时候，新输入的字符会将之前的字符往左边顶

@end

NS_ASSUME_NONNULL_END

#ifndef UITextFieldProtocol_synthesize
#define UITextFieldProtocol_synthesize \
\
@synthesize title = _title; \
@synthesize titleCor = _titleCor; \
@synthesize titleFont = _titleFont; \
@synthesize textFieldPlaceholder = _textFieldPlaceholder; \
@synthesize placeholderColor = _placeholderColor; \
@synthesize placeholderFont = _placeholderFont; \
@synthesize baseBackgroundColor = _baseBackgroundColor; \
@synthesize placeHolderAlignment = _placeHolderAlignment; \
@synthesize cornerRadiusValue = _cornerRadiusValue; \
@synthesize layerBorderCor = _layerBorderCor; \
@synthesize borderWidth = _borderWidth; \
@synthesize offset = _offset; \
@synthesize leftViewOffsetX = _leftViewOffsetX; \
@synthesize rightViewOffsetX = _rightViewOffsetX; \
@synthesize fieldEditorOffset = _fieldEditorOffset; \
@synthesize placeHolderOffset = _placeHolderOffset; \
@synthesize isShowDelBtn = _isShowDelBtn; \
@synthesize useCustomClearButton = _useCustomClearButton; \
@synthesize isShowMenu = _isShowMenu; \
@synthesize TFRiseHeight = _TFRiseHeight; \
@synthesize clearButtonRectForBounds = _clearButtonRectForBounds; \
@synthesize borderRectForBounds = _borderRectForBounds; \
@synthesize drawPlaceholderInRect = _drawPlaceholderInRect; \
@synthesize leftViewRectForBounds = _leftViewRectForBounds; \
@synthesize rightViewRectForBounds = _rightViewRectForBounds; \
@synthesize placeholderRectForBounds = _placeholderRectForBounds; \
@synthesize textRectForBounds = _textRectForBounds; \
@synthesize editingRectForBounds = _editingRectForBounds; \

#endif

#ifndef UITextFieldProtocol_dynamic
#define UITextFieldProtocol_dynamic \
\
@dynamic title;\
@dynamic titleCor; \
@dynamic titleFont; \
@dynamic textFieldPlaceholder; \
@dynamic placeholderColor; \
@dynamic placeholderFont; \
@dynamic baseBackgroundColor; \
@dynamic placeHolderAlignment; \
@dynamic cornerRadiusValue; \
@dynamic layerBorderCor; \
@dynamic borderWidth; \
@dynamic offset; \
@dynamic leftViewOffsetX; \
@dynamic rightViewOffsetX; \
@dynamic fieldEditorOffset; \
@dynamic placeHolderOffset; \
@dynamic isShowDelBtn; \
@dynamic useCustomClearButton; \
@dynamic isShowMenu; \
@dynamic TFRiseHeight; \
@dynamic clearButtonRectForBounds; \
@dynamic borderRectForBounds; \
@dynamic drawPlaceholderInRect; \
@dynamic leftViewRectForBounds; \
@dynamic rightViewRectForBounds; \
@dynamic placeholderRectForBounds; \
@dynamic textRectForBounds; \
@dynamic editingRectForBounds; \

#endif
