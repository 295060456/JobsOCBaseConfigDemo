//
//  UIView+AutoSelfAdaptionSize.m
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#import "UIView+AutoSelfAdaptionSize.h"

@implementation UIView (AutoSelfAdaptionSize)
#pragma mark —— UILabel
/// 确定Label的字体大小，使其宽度自适应
-(jobsByVoidBlock _Nonnull)labelAutoWidthByFont{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if ([self isKindOfClass:UILabel.class]) {
            UILabel *label = (UILabel *)self;
            [label sizeToFit];// 必须有text，然后根据text来进行约束计算和布局
        }
    };
}
/// 确定Label的宽度，使字体大小自适应
-(jobsByVoidBlock _Nonnull)labelAutoFontByWidth{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if ([self isKindOfClass:UILabel.class]) {
            UILabel *label = (UILabel *)self;
            label.adjustsFontSizeToFitWidth = YES;// 必须有text，然后根据text来进行约束计算和布局
        }
    };
}
#pragma mark —— UIButton
/// 确定Button的字体大小，使其宽度自适应
-(jobsByVoidBlock _Nonnull)buttonAutoWidthByFont{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if ([self isKindOfClass:UIButton.class]) {
            UIButton *btn = (UIButton *)self;
            /// 必须有text，然后根据text来进行约束计算和布局
            [btn.titleLabel sizeToFit];
            [btn sizeToFit];
        }
    };
}
/// 确定Button的宽度，使字体大小自适应
-(jobsByVoidBlock _Nonnull)buttonAutoFontByWidth{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if ([self isKindOfClass:UIButton.class]) {
            UIButton *btn = (UIButton *)self;
            [btn.titleLabel sizeToFit];
            btn.titleLabel.adjustsFontSizeToFitWidth = YES;
        }
    };
}
/// 自适应宽度
-(CGRect)getFrameWithFreeWidth:(CGPoint)origin
                      maxHight:(CGFloat)maxHight{
    CGRect frame = CGRectZero;
    if ([self isKindOfClass:UILabel.class]) {
        UILabel *label = (UILabel *)self;
        //计算自适应高度
        CGRect rect = [label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHight)
                                               options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                            attributes:@{NSFontAttributeName:label.font}
                                               context:nil];
        frame = CGRectMake(origin.x,
                           origin.y,
                           rect.size.width,
                           maxHight);
        JobsLog(@"Label");
    }
    
    if ([self isKindOfClass:UIButton.class]) {
        UIButton *button = (UIButton *)self;
        CGRect rect = [button.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHight)
                                                           options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                        attributes:@{NSFontAttributeName:button.titleLabel.font}
                                                           context:nil];
        frame = CGRectMake(origin.x,
                           origin.y,
                           rect.size.width,
                           maxHight);
        JobsLog(@"Button");
    }return frame;
}
/// 自适应高度
-(CGRect)getFrameWithFreeHight:(CGPoint)origin
                      maxWidth:(CGFloat)maxWidth{
    CGRect frame = CGRectZero;
    if ([self isKindOfClass:UILabel.class]) {
        UILabel *label = (UILabel *)self;
        label.numberOfLines = 0;//无限行
        CGRect rect = [label.text boundingRectWithSize:CGSizeMake(maxWidth,MAXFLOAT)
                                               options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                            attributes:@{NSFontAttributeName:label.font}
                                               context:nil];
        frame = CGRectMake(origin.x,
                           origin.y,
                           rect.size.width,
                           rect.size.height);
        JobsLog(@"Label");
    }
    
    if ([self isKindOfClass:UIButton.class]) {
        UIButton *button = (UIButton *)self;
        button.titleLabel.numberOfLines = 0;//无限行
        CGRect rect = [button.titleLabel.text boundingRectWithSize:CGSizeMake(200,MAXFLOAT)
                                                           options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                                        attributes:@{NSFontAttributeName:button.titleLabel.font}
                                                           context:nil];
        
        frame = CGRectMake(origin.x,
                           origin.y,
                           rect.size.width,
                           rect.size.height);
        JobsLog(@"Button");
    }return frame;
}
/// 自适应宽度--->可调整字间距
-(CGRect)getFrameWithFreeWidth:(CGPoint)origin
                      maxHight:(CGFloat)maxHight
                     textSpace:(CGFloat)textSpace{
    CGRect frame = CGRectZero;
    if ([self isKindOfClass:UILabel.class]) {
        UILabel *label = (UILabel *)self;
        //创建可变字符串属性
        NSMutableAttributedString *attributedString = toMutAttributedString(label.attributedText);
        //调整间距
        attributedString.addkCTKernAttributeNameByParagraphStyleModel(jobsMakeParagraphStyleModel(^(__kindof JobsParagraphStyleModel * _Nullable data) {
            data.value = @(textSpace);
            data.range = NSMakeRange(0, attributedString.length);
        }));
        label.attributedText = attributedString;
        //计算自适应高度
        CGRect rect = [label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHight)
                                               options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                            attributes:@{NSFontAttributeName:label.font,
                                                         NSKernAttributeName:@(textSpace)}
                                               context:nil];
        frame = CGRectMake(origin.x,
                           origin.y,
                           rect.size.width,
                           maxHight);
        JobsLog(@"Label");
    }return frame;
}
/// 自适应高度--->可调整字间距和行间距
-(CGRect)getFrameWithFreeHight:(CGPoint)origin
                      maxWidth:(CGFloat)maxWidth
                     textSpace:(CGFloat)textSpace
                     lineSpace:(CGFloat)lineSpace{
    CGRect frame = CGRectZero;
    if ([self isKindOfClass:UILabel.class]) {
        UILabel *label = (UILabel *)self;
        label.numberOfLines = 0;//无限行
        // 字间距
        NSMutableAttributedString *attributedString = [AttributedString initWithString:label.text
                                                                            attributes:@{NSKernAttributeName:@(textSpace),
                                                                                         NSFontAttributeName:label.font}];
        // 行间距
        // 给可变的属性字符串 添加段落格式
        [attributedString addAttribute:NSParagraphStyleAttributeName
                                 value:jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
            data.lineSpacing = lineSpace;
            data.baseWritingDirection = NSWritingDirectionLeftToRight;// 从左到右
        })

                                 range:NSMakeRange(0, label.text.length)];
        label.attributedText = attributedString;
        //设置文本偏移量
       // [attributedString addAttribute:NSBaselineOffsetAttributeName value:@(1) range:NSMakeRange(0, label.text.length)];
        //计算自适应高度
        CGRect rect = [label.attributedText boundingRectWithSize:CGSizeMake(maxWidth,MAXFLOAT)
                                               options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                               context:nil];
        frame = CGRectMake(origin.x,
                           origin.y,
                           rect.size.width,
                           rect.size.height);
        JobsLog(@"Label");
    }return frame;
}

@end
