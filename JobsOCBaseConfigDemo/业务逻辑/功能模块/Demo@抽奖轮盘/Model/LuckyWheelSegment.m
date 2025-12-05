//
//  LuckyWheelSegment.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 12/5/25.
//

#import "LuckyWheelSegment.h"

@interface LuckyWheelSegment ()

+ (NSString *)verticalStringFrom:(NSString *)text;

@end

@implementation LuckyWheelSegment

- (instancetype)init {
    return [self initWithText:nil
                     textFont:[UIFont systemFontOfSize:14]
                    textColor:[UIColor blackColor]
               attributedText:nil
              backgroundColor:[UIColor clearColor]
             placeholderImage:nil
               imageURLString:nil];
}

- (instancetype)initWithText:(NSString *)text
                    textFont:(UIFont *)textFont
                   textColor:(UIColor *)textColor
              attributedText:(NSAttributedString *)attributedText
             backgroundColor:(UIColor *)backgroundColor
            placeholderImage:(UIImage *)placeholderImage
              imageURLString:(NSString *)imageURLString {
    if (self = [super init]) {
        if (text.length > 0) {
            _text = [[self class] verticalStringFrom:text];
        } else {
            _text = nil;
        }
        _textFont        = textFont ?: [UIFont systemFontOfSize:14];
        _textColor       = textColor ?: [UIColor blackColor];
        _attributedText  = attributedText;
        _backgroundColor = backgroundColor ?: [UIColor clearColor];
        _placeholderImage = placeholderImage;
        _imageURLString   = imageURLString;
    }return self;
}

/// 把字符串转成竖排（逐个“字”之间插入 \n），兼容 emoji 等复合字符
+ (NSString *)verticalStringFrom:(NSString *)text {
    if (text.length == 0) return text;
    NSMutableString *result = [NSMutableString string];
    [text enumerateSubstringsInRange:NSMakeRange(0, text.length)
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString * _Nullable substring,
                                       NSRange substringRange,
                                       NSRange enclosingRange,
                                       BOOL * _Nonnull stop) {
        if (substring) {
            [result appendString:substring];
            if (NSMaxRange(substringRange) < text.length) {
                [result appendString:@"\n"];
            }
        }
    }];return result;
}

@end
