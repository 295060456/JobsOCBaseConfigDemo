//
// UITextModelProtocol.h
// JobsOCBaseConfig
//
// Created by Jobs on 2022/1/17.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"

@class JobsRichTextConfig;

NS_ASSUME_NONNULL_BEGIN

@protocol UITextModelProtocol <NSObject>
@optional
#pragma mark —— Common
Prop_assign()NSTextAlignment textAlignment;/// 主文字对齐方式
Prop_assign()NSLineBreakMode lineBreakMode;/// 主文字提行方式
Prop_assign()NSTextAlignment subTextAlignment;/// 副文字对齐方式
Prop_assign()NSLineBreakMode subLineBreakMode;/// 副文字提行方式
Prop_assign()CGFloat textLineSpacing;
Prop_copy(nullable)NSString *placeholder;
Prop_strong(nullable)UIColor *placeholderColor;
Prop_strong(nullable)UIFont *placeholderFont;
Prop_assign()NSInteger curWordCount;/// 目前字数
Prop_assign()NSInteger maxWordCount;/// 最大限制字数
#pragma mark —— Normal
/// 主标题
Prop_copy(nullable)NSString *text;
Prop_strong(nullable)UIFont *font;
Prop_strong(nullable)UIColor *textCor;/// 主字体颜色
Prop_strong(nullable)NSAttributedString *attributedTitle API_AVAILABLE(ios(6.0));
Prop_strong(nullable)NSMutableArray <JobsRichTextConfig *> *titleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > titleAttributedStr
/// 子标题
Prop_copy(nullable)NSString *subText;
Prop_strong(nullable)UIFont *subFont;
Prop_strong(nullable)UIColor *subTextCor;/// 主字体颜色
Prop_strong(nullable)NSAttributedString *attributedSubTitle API_AVAILABLE(ios(6.0));
Prop_strong(nullable)NSMutableArray <JobsRichTextConfig *> *subTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > titleAttributedStr
#pragma mark —— Selected
/// 主标题
Prop_copy(nullable)NSString *selectedText;
Prop_strong(nullable)UIFont *selectedFont;
Prop_strong(nullable)UIColor *selectedTextCor;/// 主字体颜色
Prop_strong(nullable)NSAttributedString *selectedAttributedText API_AVAILABLE(ios(6.0));
Prop_strong(nullable)NSMutableArray <JobsRichTextConfig *> *selectedTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > selectedAttributedText
/// 子标题
Prop_copy(nullable)NSString *selectedSubText;
Prop_strong(nullable)UIFont *selectedSubFont;
Prop_strong(nullable)UIColor *selectedSubTextCor;/// 主字体颜色
Prop_strong(nullable)NSAttributedString *selectedAttributedSubText API_AVAILABLE(ios(6.0));
Prop_strong(nullable)NSMutableArray <JobsRichTextConfig *> *selectedSubTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > selectedAttributedText
@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UITextModelProtocol
#ifndef UITextModelProtocol_synthesize_part1
#define UITextModelProtocol_synthesize_part1 \
\
@synthesize attributedTitle = _attributedTitle;\
@synthesize attributedSubTitle = _attributedSubTitle;\

#endif

#ifndef UITextModelProtocol_synthesize_part2
#define UITextModelProtocol_synthesize_part2 \
\
@synthesize lineBreakMode = _lineBreakMode;\
@synthesize subLineBreakMode = _subLineBreakMode;\

#endif

#ifndef UITextModelProtocol_synthesize_part3
#define UITextModelProtocol_synthesize_part3 \
\
@synthesize textAlignment = _textAlignment;\
@synthesize subTextAlignment = _subTextAlignment;\
@synthesize textLineSpacing = _textLineSpacing;\
@synthesize placeholder = _placeholder;\
@synthesize placeholderColor = _placeholderColor;\
@synthesize placeholderFont = _placeholderFont;\
@synthesize curWordCount = _curWordCount;\
@synthesize maxWordCount = _maxWordCount;\
@synthesize text = _text;\
@synthesize font = _font;\
@synthesize textCor = _textCor;\
@synthesize subText = _subText;\
@synthesize subFont = _subFont;\
@synthesize subTextCor = _subTextCor;\
@synthesize subTitleAttributedDataMutArr = _subTitleAttributedDataMutArr;\
@synthesize titleAttributedDataMutArr = _titleAttributedDataMutArr;\
@synthesize selectedText = _selectedText;\
@synthesize selectedFont = _selectedFont;\
@synthesize selectedTextCor = _selectedTextCor;\
@synthesize selectedAttributedText = _selectedAttributedText;\
@synthesize selectedTitleAttributedDataMutArr = _selectedTitleAttributedDataMutArr;\
@synthesize selectedSubText = _selectedSubText;\
@synthesize selectedSubFont = _selectedSubFont;\
@synthesize selectedSubTextCor = _selectedSubTextCor;\
@synthesize selectedAttributedSubText = _selectedAttributedSubText;\
@synthesize selectedSubTitleAttributedDataMutArr = _selectedSubTitleAttributedDataMutArr;\

#endif

#ifndef UITextModelProtocol_synthesize
#define UITextModelProtocol_synthesize \
\
UITextModelProtocol_synthesize_part1 \
UITextModelProtocol_synthesize_part2 \
UITextModelProtocol_synthesize_part3

#endif

#pragma mark —— @dynamic UITextModelProtocol
#ifndef UITextModelProtocol_dynamic
#define UITextModelProtocol_dynamic \
\
@dynamic textAlignment;\
@dynamic subTextAlignment;\
@dynamic lineBreakMode;\
@dynamic subLineBreakMode;\
@dynamic textLineSpacing;\
@dynamic placeholder;\
@dynamic placeholderColor;\
@dynamic placeholderFont;\
@dynamic curWordCount;\
@dynamic maxWordCount;\
@dynamic text;\
@dynamic font;\
@dynamic textCor;\
@dynamic subText;\
@dynamic subFont;\
@dynamic subTextCor;\
@dynamic attributedSubTitle;\
@dynamic subTitleAttributedDataMutArr;\
@dynamic attributedTitle;\
@dynamic titleAttributedDataMutArr;\
@dynamic selectedText;\
@dynamic selectedFont;\
@dynamic selectedTextCor;\
@dynamic selectedAttributedText;\
@dynamic selectedTitleAttributedDataMutArr;\
@dynamic selectedSubText;\
@dynamic selectedSubFont;\
@dynamic selectedSubTextCor;\
@dynamic selectedAttributedSubText;\
@dynamic selectedSubTitleAttributedDataMutArr;\

#endif

