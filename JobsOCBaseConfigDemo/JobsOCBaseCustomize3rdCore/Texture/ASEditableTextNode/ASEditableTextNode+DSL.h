//
//  ASEditableTextNode+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/6/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASEditableTextNode (DSL)

-(JobsRetEditableTextNodeByBoolBlock _Nonnull)byScrollEnabled;
-(JobsRetEditableTextNodeByDictBlock _Nonnull)byTypingAttributes;
-(JobsRetEditableTextNodeByRangeBlock _Nonnull)bySelectedRange;
-(JobsRetEditableTextNodeByAttrTextBlock _Nonnull)byPlaceholder;
-(JobsRetEditableTextNodeByAttrTextBlock _Nonnull)byText;
-(JobsRetEditableTextNodeByInsetsBlock _Nonnull)byTextContainerInset;
-(JobsRetEditableTextNodeByUIntBlock _Nonnull)byMaximumLinesToDisplay;
-(JobsRetEditableTextNodByeAutocapBlock _Nonnull)byAutocapitalizationType;
-(JobsRetEditableTextNodeByAutocorrBlock _Nonnull)byAutocorrectionType;
-(JobsRetEditableTextNodeBySpellBlock _Nonnull)bySpellCheckingType;
-(JobsRetEditableTextNodeByKeyboardTypeBlock _Nonnull)byKeyboardType;
-(JobsRetEditableTextNodeByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance;
-(JobsRetEditableTextNodeByReturnKeyBlock _Nonnull)byReturnKeyType;
-(JobsRetEditableTextNodeByBoolBlock _Nonnull)byEnablesReturnKeyAutomatically;
-(JobsRetEditableTextNodeByBoolBlock _Nonnull)bySecureTextEntry;
-(JobsRetEditableTextNodeByTextViewBlock _Nonnull)byTextView;
/// 事件（Begin / Change / End）
-(JobsRetEditableTextNodeByOnBeginBlock _Nonnull)onBeginEditingBy;
-(JobsRetEditableTextNodeByOnChangeBlock _Nonnull)onTextChangeBy;
-(JobsRetEditableTextNodeByOnEndBlock _Nonnull)onEndEditingBy;

@end

NS_ASSUME_NONNULL_END
