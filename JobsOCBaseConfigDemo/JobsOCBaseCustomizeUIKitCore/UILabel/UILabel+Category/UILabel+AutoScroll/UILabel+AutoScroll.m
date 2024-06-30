//
//  UILabel+AutoScroll.m
//  labelExpand
//
//  Created by 李灿 on 2021/3/25.
//

#import "UILabel+AutoScroll.h"

@implementation UILabel (AutoScroll)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MethodSwizzle(self, @selector(setText:), @selector(autoScrollSetText:));
        MethodSwizzle(self, @selector(setTextColor:), @selector(autoScrollSetTextColor:));
        MethodSwizzle(self, @selector(setFont:), @selector(autoScrollSetFont:));
        MethodSwizzle(self, @selector(setFrame:), @selector(autoScrollSetFrame:));
        MethodSwizzle(self, @selector(drawTextInRect:), @selector(autoScrollDrawText:));
    });
}
/// 用于替换系统setText方法
/// @param text 标签显示的文字
-(void)autoScrollSetText:(NSString *)text{
    [self autoScrollSetText:text];
    if(self.labelShowingType == UILabelShowingType_02){
        // 这句是为了让textlayer超出label的部分不显示
        self.layer.masksToBounds = true;
    }
}
/// 用于替换系统setTextColor方法
/// @param color 文字颜色
-(void)autoScrollSetTextColor:(UIColor *)color{
    [self autoScrollSetTextColor:color];
}
/// 用于替换系统的setFont方法
/// @param font 字体
-(void)autoScrollSetFont:(UIFont *)font{
    [self autoScrollSetFont:font];
}
/// 用于替换系统的setFrame方法
/// @param frame 坐标
-(void)autoScrollSetFrame:(CGRect)frame{
    [self autoScrollSetFrame:frame];
    if (self.labelShowingType == UILabelShowingType_02) {/// 一行显示。定宽、定高、定字体。多余部分scrollerView
        [self setTextLayerScroll];
    }
}
/// 用于替换系统的drawText方法
/// @param rect frame
-(void)autoScrollDrawText:(CGRect)rect{
    if (!self.shouldAutoScroll){
        [self autoScrollDrawText:rect];
    }
    [self setTextLayerScroll];
}

@end

/**
 
 /// 根据文字长短自动判断是否需要显示TextLayer，并且滚动
 -(void)setTextLayerScroll{
     if (self.labelShowingType == UILabelShowingType_02) {/// 一行显示。定宽、定高、定字体。多余部分scrollerView
         CATextLayer * textLayer = self.getTextLayer;
         if (self.shouldAutoScroll){
             CABasicAnimation * ani = self.getAnimation;
             [textLayer addAnimation:ani forKey:nil];
             [self.layer addSublayer:textLayer];
         }else{
             [textLayer removeAllAnimations];
             [textLayer removeFromSuperlayer];
         }
     }
 }
 /// runtime存放textLayer，避免多次生成
 -(CATextLayer *)getTextLayer{
     CATextLayer * layer = objc_getAssociatedObject(self, _cmd);
     if (!layer) {
         layer = CATextLayer.layer;
         objc_setAssociatedObject(self,
                                  _cmd,
                                  layer,
                                  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
     }
     CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
     CGFloat stringWidth = size.width;
     layer.frame = CGRectMake(0, 0, stringWidth, self.frame.size.height);
     layer.alignmentMode = kCAAlignmentCenter;
     layer.font = (__bridge CFTypeRef _Nullable)(self.font.fontName);
     layer.fontSize = self.font.pointSize;
     layer.foregroundColor = self.textColor.CGColor;
     layer.string = self.text;
     // 不写这句可能导致layer的文字在某些情况下不清晰
     layer.contentsScale = UIScreen.mainScreen.scale;
     return layer;
 }
 /// runtime存放动画对象，避免多次生成
 -(CABasicAnimation *)getAnimation{
     
     CABasicAnimation * ani = objc_getAssociatedObject(self, _cmd);
     if (!ani) {
         ani = [CABasicAnimation animationWithKeyPath:@"position.x"];
         objc_setAssociatedObject(self,
                                  _cmd,
                                  ani,
                                  OBJC_ASSOCIATION_RETAIN_NONATOMIC);
     }
     CATextLayer * textLayer = self.getTextLayer;
     CGPoint point = textLayer.position;
     CGFloat lenth = textLayer.frame.size.width - self.frame.size.width;
     // 起点位置
     CGPoint pointSrc = CGPointMake(point.x + 20, point.y);
     // 终点位置
     CGPoint pointDes = CGPointMake(pointSrc.x - lenth - 30, pointSrc.y);
     id toValue = [NSValue valueWithCGPoint:pointDes];
     id fromValue = [NSValue valueWithCGPoint:pointSrc];
     ani.toValue = toValue;
     ani.fromValue = fromValue;
     ani.duration = 2;
     ani.fillMode = kCAFillModeBoth;
     ani.repeatCount = HUGE_VALF;
     // 结束后逆向执行动画
     ani.autoreverses = YES;
     ani.removedOnCompletion = false;
     return ani;
 }
 /// 判断是否需要滚动
 -(BOOL)shouldAutoScroll{
     BOOL shouldScroll = false;
     if (self.numberOfLines == 1) {
         CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
         CGFloat stringWidth = size.width;
         CGFloat labelWidth = self.frame.size.width;
         if (labelWidth < stringWidth) {
             shouldScroll = true;
         }
     }
     
     Class ModelClass = NSClassFromString(@"_UIAlertControllerActionView");
     if ([self.superview.superview isKindOfClass:ModelClass]) {
         shouldScroll = false;
     }return shouldScroll;
 }
 
 */
