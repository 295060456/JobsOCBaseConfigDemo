//
//  UITextField+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (DSL)
#pragma mark —— 基础文本
-(JobsRetTextFieldByStringBlock _Nonnull)byText;
-(JobsRetTextFieldByAttributedStringBlock _Nonnull)byAttributedText API_AVAILABLE(ios(6.0));
-(JobsRetTextFieldByCorBlock _Nonnull)byTextCor;
-(JobsRetTextFieldByFontBlock _Nonnull)byFont;
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byTextAlignment;
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byBorderStyle;
-(JobsRetTextFieldByNSDictionaryBlock _Nonnull)byDefaultTextAttributes API_AVAILABLE(ios(7.0));
#pragma mark —— 占位符
-(JobsRetTextFieldByStringBlock _Nonnull)byPlaceholder;
-(JobsRetTextFieldByCorBlock _Nonnull)byPlaceholderColor;
-(JobsRetTextFieldByFontBlock _Nonnull)byPlaceholderFont;
-(JobsRetTextFieldByAttributedStringBlock _Nonnull)byAttributedPlaceholder API_AVAILABLE(ios(6.0));
#pragma mark —— 编辑行为
-(JobsRetTextFieldByBOOLBlock _Nonnull)byClearsOnBeginEditing;
-(JobsRetTextFieldByBOOLBlock _Nonnull)byAdjustsFontSizeToFitWidth;
-(JobsRetTextFieldByCGFloatrBlock _Nonnull)byMinimumFontSize;
-(JobsRetTextFieldByBOOLBlock _Nonnull)byAllowsEditingTextAttributes API_AVAILABLE(ios(6.0));
-(JobsRetTextFieldByNSDictionaryBlock _Nonnull)byTypingAttributes API_AVAILABLE(ios(6.0));
-(JobsRetTextFieldByBOOLBlock _Nonnull)byClearsOnInsertion API_AVAILABLE(ios(6.0));
#pragma mark —— 背景
-(JobsRetTextFieldByImageBlock _Nonnull)byBackground;
-(JobsRetTextFieldByImageBlock _Nonnull)byDisabledBackground;
#pragma mark —— 清除按钮
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byClearButtonMode;
#pragma mark —— 左右视图
-(JobsRetTextFieldByViewBlock _Nonnull)byLeftView;
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byLeftViewMode;
-(JobsRetTextFieldByViewBlock _Nonnull)byRightView;
-(JobsRetTextFieldByNSIntegerBlock _Nonnull)byRightViewMode;
#pragma mark —— 输入视图
-(JobsRetTextFieldByViewBlock _Nonnull)byInputView;
-(JobsRetTextFieldByViewBlock _Nonnull)byInputAccessoryView API_UNAVAILABLE(visionos);
#pragma mark —— delegate
-(JobsRetTextFieldByDelegateBlock _Nonnull)byDelegate;
#pragma mark —— 键盘
-(JobsRetTextFieldByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance;
-(JobsRetTextFieldByKeyboardTypeBlock _Nonnull)byKeyboardType;
-(JobsRetTextFieldByReturnKeyTypeBlock _Nonnull)byReturnKeyType;
#pragma mark —— 其他
-(JobsRetTextFieldByBOOLBlock _Nonnull)bySecureTextEntry;

@end

NS_ASSUME_NONNULL_END
