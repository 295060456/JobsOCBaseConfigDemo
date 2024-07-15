//
//  CFGradientLabel.m
//  My_BaseProj
//
//  Created by Jobs on 2020/7/8.
//  Copyright © 2020 Corp. All rights reserved.
//

#import "CFGradientLabel.h"

@interface CFGradientLabel ()

@end

@implementation CFGradientLabel

- (void)drawRect:(CGRect)rect {

    CGSize textSize = [self.text sizeWithAttributes:@{NSFontAttributeName : self.font}];
    CGRect textRect = (CGRect){0, 0, textSize};
    // 画文字(不做显示用, 主要作用是设置 layer 的 mask)
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.textColor set];
    [self.text drawWithRect:rect
                    options:NSStringDrawingUsesLineFragmentOrigin
                 attributes:@{NSFontAttributeName : self.font}
                    context:NULL];
    // 坐标(只对设置后的画到 context 起作用, 之前画的文字不起作用)
    CGContextTranslateCTM(context,
                          0.0f,
                          rect.size.height - (rect.size.height - textSize.height) * 0.5);
    CGContextScaleCTM(context,
                      1.0f,
                      -1.0f);
    
    CGImageRef alphaMask = CGBitmapContextCreateImage(context);
    CGContextClearRect(context, rect); // 清除之前画的文字
    // 设置mask
    CGContextClipToMask(context,
                        rect,
                        alphaMask);
    // 画渐变色
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)self.colors, NULL);
    CGPoint startPoint = CGPointMake(textRect.origin.x,
                                     textRect.origin.y);
    CGPoint endPoint = CGPointMake(textRect.origin.x + textRect.size.width,
                                   textRect.origin.y + textRect.size.height);
    CGContextDrawLinearGradient(context,
                                gradient,
                                startPoint,
                                endPoint,
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    // 释放内存
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    CFRelease(alphaMask);
}

@end
