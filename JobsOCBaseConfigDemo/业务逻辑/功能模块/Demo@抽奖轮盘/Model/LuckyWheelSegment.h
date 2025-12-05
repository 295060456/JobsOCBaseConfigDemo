//
//  LuckyWheelSegment.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 12/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// Segment 模型（对应 Swift: LuckyWheelSegment）
@interface LuckyWheelSegment : NSObject
/// 普通文本（如果有 attributedText，则优先用 attributedText）
@property (nullable, nonatomic, copy)   NSString *text;
@property (nullable, nonatomic, strong) UIFont *textFont;
@property (nullable, nonatomic, strong) UIColor *textColor;
/// 富文本（你可以自己传入竖排 / 换行好的富文本）
@property (nullable, nonatomic, copy)   NSAttributedString *attributedText;
/// 扇形背景颜色
@property (nullable, nonatomic, strong) UIColor *backgroundColor;
/// 占位图（在扇形外圈显示的圆形图片）
@property (nullable, nonatomic, strong) UIImage *placeholderImage;
/// 图片 URL 字符串（后续你可以自己扩展网络加载方案）
@property (nullable, nonatomic, copy)   NSString *imageURLString;
/// 方便初始化，内部会把 text 做“竖排换行”
- (instancetype)initWithText:(nullable NSString *)text
                    textFont:(UIFont *)textFont
                   textColor:(UIColor *)textColor
              attributedText:(nullable NSAttributedString *)attributedText
             backgroundColor:(UIColor *)backgroundColor
            placeholderImage:(nullable UIImage *)placeholderImage
              imageURLString:(nullable NSString *)imageURLString;
@end

NS_ASSUME_NONNULL_END
