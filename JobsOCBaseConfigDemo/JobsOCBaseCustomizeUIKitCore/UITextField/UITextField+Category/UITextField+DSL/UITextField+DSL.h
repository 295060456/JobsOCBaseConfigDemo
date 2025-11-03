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
-(JobsReturnTextFieldByStringBlock _Nonnull)byText;
-(JobsReturnTextFieldByAttributedStringBlock _Nonnull)byAttributedText API_AVAILABLE(ios(6.0));
-(JobsReturnTextFieldByCorBlock _Nonnull)byTextCor;
-(JobsReturnTextFieldByFontBlock _Nonnull)byFont;
-(JobsReturnTextFieldByNSIntegerBlock _Nonnull)byTextAlignment;
-(JobsReturnTextFieldByNSIntegerBlock _Nonnull)byBorderStyle;
-(JobsReturnTextFieldByNSDictionaryBlock _Nonnull)byDefaultTextAttributes API_AVAILABLE(ios(7.0));
#pragma mark —— 占位符
-(JobsReturnTextFieldByStringBlock _Nonnull)byPlaceholder;
-(JobsReturnTextFieldByCorBlock _Nonnull)byPlaceholderColor;
-(JobsReturnTextFieldByFontBlock _Nonnull)byPlaceholderFont;
-(JobsReturnTextFieldByAttributedStringBlock _Nonnull)byAttributedPlaceholder API_AVAILABLE(ios(6.0));
#pragma mark —— 编辑行为
-(JobsReturnTextFieldByBOOLBlock _Nonnull)byClearsOnBeginEditing;
-(JobsReturnTextFieldByBOOLBlock _Nonnull)byAdjustsFontSizeToFitWidth;
-(JobsReturnTextFieldByCGFloatrBlock _Nonnull)byMinimumFontSize;
-(JobsReturnTextFieldByBOOLBlock _Nonnull)byAllowsEditingTextAttributes API_AVAILABLE(ios(6.0));
-(JobsReturnTextFieldByNSDictionaryBlock _Nonnull)byTypingAttributes API_AVAILABLE(ios(6.0));
-(JobsReturnTextFieldByBOOLBlock _Nonnull)byClearsOnInsertion API_AVAILABLE(ios(6.0));
#pragma mark —— 背景
-(JobsReturnTextFieldByImageBlock _Nonnull)byBackground;
-(JobsReturnTextFieldByImageBlock _Nonnull)byDisabledBackground;
#pragma mark —— 清除按钮
-(JobsReturnTextFieldByNSIntegerBlock _Nonnull)byClearButtonMode;
#pragma mark —— 左右视图
-(JobsReturnTextFieldByViewBlock _Nonnull)byLeftView;
-(JobsReturnTextFieldByNSIntegerBlock _Nonnull)byLeftViewMode;
-(JobsReturnTextFieldByViewBlock _Nonnull)byRightView;
-(JobsReturnTextFieldByNSIntegerBlock _Nonnull)byRightViewMode;
#pragma mark —— 输入视图
-(JobsReturnTextFieldByViewBlock _Nonnull)byInputView;
-(JobsReturnTextFieldByViewBlock _Nonnull)byInputAccessoryView API_UNAVAILABLE(visionos);
#pragma mark —— delegate
-(JobsReturnTextFieldByDelegateBlock _Nonnull)byDelegate;
#pragma mark —— 键盘
-(JobsReturnTextFieldByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance;
-(JobsReturnTextFieldByKeyboardTypeBlock _Nonnull)byKeyboardType;
-(JobsReturnTextFieldByReturnKeyTypeBlock _Nonnull)byReturnKeyType;
#pragma mark —— 其他
-(JobsReturnTextFieldByBOOLBlock _Nonnull)bySecureTextEntry;

@end

NS_ASSUME_NONNULL_END
