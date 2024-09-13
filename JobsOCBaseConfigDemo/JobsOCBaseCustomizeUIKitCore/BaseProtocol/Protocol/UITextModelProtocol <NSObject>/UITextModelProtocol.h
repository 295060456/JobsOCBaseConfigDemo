//
// UITextModelProtocol.h
// JobsOCBaseConfig
//
// Created by Jobs on 2022/1/17.
//

#import <Foundation/Foundation.h>

@class JobsRichTextConfig;

NS_ASSUME_NONNULL_BEGIN

@protocol UITextModelProtocol <NSObject>
@optional
#pragma mark —— Common
@property(nonatomic,assign)NSTextAlignment textAlignment;/// 主文字对齐方式
@property(nonatomic,assign)NSLineBreakMode lineBreakMode;/// 主文字提行方式
@property(nonatomic,assign)NSTextAlignment subTextAlignment;/// 副文字对齐方式
@property(nonatomic,assign)NSLineBreakMode subLineBreakMode;/// 副文字提行方式
@property(nonatomic,assign)CGFloat textLineSpacing;
@property(nonatomic,copy)NSString *placeholder;
@property(nonatomic,strong)UIColor *placeholderColor;
@property(nonatomic,assign)NSInteger curWordCount;/// 目前字数
@property(nonatomic,assign)NSInteger maxWordCount;/// 最大限制字数
#pragma mark —— Normal
/// 主标题
@property(nonatomic,copy,nullable)NSString *text;
@property(nonatomic,strong,nullable)UIFont *font;
@property(nonatomic,strong,nullable)UIColor *textCor;/// 主字体颜色
@property(nonatomic,strong,nullable)NSAttributedString *attributedText API_AVAILABLE(ios(6.0));
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *> *titleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > titleAttributedStr
/// 子标题
@property(nonatomic,copy,nullable)NSString *subText;
@property(nonatomic,strong,nullable)UIFont *subFont;
@property(nonatomic,strong,nullable)UIColor *subTextCor;/// 主字体颜色
@property(nonatomic,strong,nullable)NSAttributedString *attributedSubText API_AVAILABLE(ios(6.0));
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *> *subTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > titleAttributedStr
#pragma mark —— Selected
/// 主标题
@property(nonatomic,strong,nullable)NSString *selectedText;
@property(nonatomic,strong,nullable)UIFont *selectedFont;
@property(nonatomic,strong,nullable)UIColor *selectedTextCor;/// 主字体颜色
@property(nonatomic,strong,nullable)NSAttributedString *selectedAttributedText API_AVAILABLE(ios(6.0));
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *> *selectedTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > selectedAttributedText
/// 子标题
@property(nonatomic,strong,nullable)NSString *selectedSubText;
@property(nonatomic,strong,nullable)UIFont *selectedSubFont;
@property(nonatomic,strong,nullable)UIColor *selectedSubTextCor;/// 主字体颜色
@property(nonatomic,strong,nullable)NSAttributedString *selectedAttributedSubText API_AVAILABLE(ios(6.0));
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *> *selectedSubTitleAttributedDataMutArr;/// 对于富文本优先级：titleAttributedDataMutArr > selectedAttributedText
@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UITextModelProtocol
/// 和 UIViewModel 重复定义的部分
#ifndef UITextModelProtocol_UIViewModelSynthesize
#define UITextModelProtocol_UIViewModelSynthesize \
@synthesize lineBreakMode = _lineBreakMode;\
@synthesize subLineBreakMode = _subLineBreakMode;\

#endif

#ifndef UITextModelProtocol_synthesize
#define UITextModelProtocol_synthesize \
\
@synthesize textAlignment = _textAlignment;\
@synthesize subTextAlignment = _subTextAlignment;\
@synthesize textLineSpacing = _textLineSpacing;\
@synthesize placeholder = _placeholder;\
@synthesize placeholderColor = _placeholderColor;\
@synthesize curWordCount = _curWordCount;\
@synthesize maxWordCount = _maxWordCount;\
@synthesize text = _text;\
@synthesize font = _font;\
@synthesize textCor = _textCor;\
@synthesize subText = _subText;\
@synthesize subFont = _subFont;\
@synthesize subTextCor = _subTextCor;\
@synthesize attributedText = _attributedText;\
@synthesize titleAttributedDataMutArr = _titleAttributedDataMutArr;\
@synthesize selectedText = _selectedText;\
@synthesize selectedFont = _selectedFont;\
@synthesize selectedTextCor = _selectedTextCor;\
@synthesize selectedAttributedText = _selectedAttributedText;\
@synthesize selectedTitleAttributedDataMutArr = _selectedTitleAttributedDataMutArr;\

#endif

#pragma mark —— @dynamic UITextModelProtocol
#ifndef UITextModelProtocol_dynamic
#define UITextModelProtocol_dynamic \
@dynamic textAlignment;\
@dynamic subTextAlignment;\
@dynamic lineBreakMode;\
@dynamic subLineBreakMode;\
@dynamic textLineSpacing;\
@dynamic placeholder;\
@dynamic placeholderColor;\
@dynamic curWordCount;\
@dynamic maxWordCount;\
@dynamic text;\
@dynamic font;\
@dynamic textCor;\
@dynamic subText;\
@dynamic subFont;\
@dynamic subTextCor;\
@dynamic attributedText;\
@dynamic titleAttributedDataMutArr;\
@dynamic selectedText;\
@dynamic selectedFont;\
@dynamic selectedTextCor;\
@dynamic selectedAttributedText;\
@dynamic selectedTitleAttributedDataMutArr;\

#endif

