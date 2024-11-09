//
//  UIBezierPath+Extras.m
//  test
//
//  Created by zwwuchn on 2019/1/2.
//  Copyright © 2019 zwwuchn. All rights reserved.
//

#import "UIBezierPath+Extras.h"

@implementation UIBezierPath (Extras)
/// 将指定的文本（text）转换成一个 UIBezierPath 对象，可以用于自定义文本的绘制效果
+(UIBezierPath *)bezierPathWithText:(NSString *)text
                               font:(UIFont *)font
                   andWithDirection:(TransformLayerDirectionType)textDirection {
    CTFontRef ctFont = CTFontCreateWithName((__bridge CFStringRef)font.fontName,
                                            font.pointSize,
                                            NULL);
    if (!ctFont) return nil;
    NSDictionary *attrs = @{ (__bridge id)kCTFontAttributeName:(__bridge id)ctFont };
    NSAttributedString *attrString = JobsAttributedStringByAttributes(text, attrs);
    CFRelease(ctFont);
    CTLineRef line = CTLineCreateWithAttributedString((__bridge CFTypeRef)attrString);
    if (!line) return nil;
    CGMutablePathRef cgPath = CGPathCreateMutable();
    CFArrayRef runs = CTLineGetGlyphRuns(line);
    for (CFIndex iRun = 0, iRunMax = CFArrayGetCount(runs);
         iRun < iRunMax;
         iRun++) {
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runs, iRun);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        for (CFIndex iGlyph = 0,iGlyphMax = CTRunGetGlyphCount(run);
             iGlyph < iGlyphMax;
             iGlyph++) {
            CFRange glyphRange = CFRangeMake(iGlyph, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, glyphRange, &glyph);
            CTRunGetPositions(run, glyphRange, &position);
            CGPathRef glyphPath = CTFontCreatePathForGlyph(runFont, glyph, NULL);
            if (glyphPath) {
                CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI * textDirection * 0.5);
                CGAffineTransform transform2 =  CGAffineTransformMakeTranslation(position.x, position.y);
                CGAffineTransform transform = CGAffineTransformConcat(transform1, transform2);
                CGPathAddPath(cgPath, &transform, glyphPath);
                CGPathRelease(glyphPath);
            }
        }
    }
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:cgPath];
    CGRect boundingBox = CGPathGetPathBoundingBox(cgPath);
    CFRelease(cgPath);
    CFRelease(line);
    [path applyTransform:CGAffineTransformMakeScale(1.0, -1.0)];
    [path applyTransform:CGAffineTransformMakeTranslation(0.0, boundingBox.size.height)];
    
    return path;
}
/// addLineToPoint
-(jobsByPointBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^(CGPoint data){
        @jobs_strongify(self)
        [self addLineToPoint:data];
    };
}
/// moveToPoint
-(jobsByPointBlock _Nonnull)moveTo{
    @jobs_weakify(self)
    return ^(CGPoint data){
        @jobs_strongify(self)
        [self moveToPoint:data];
    };
}

@end
