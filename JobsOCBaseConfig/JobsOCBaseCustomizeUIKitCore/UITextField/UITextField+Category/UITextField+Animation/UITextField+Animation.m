//
//  UITextField+Animation.m
//  Casino
//
//  Created by Jobs on 2021/12/20.
//

#import "UITextField+Animation.h"

@implementation UITextField (Animation)
#pragma mark —— 一些动画
/// 输入的和某个预设定值不一致的时候，抖动动画
-(void)isValidate:(NSString *)validate{
    if (![self.text isEqualToString:validate]) {
        [self shakeAnimationForView];
    }
}
/// 输入的为空，抖动动画
-(void)isEmptyText{
    if ([NSString isNullString:self.text]) {
        [self shakeAnimationForView];
    }
}

-(void)shakeAnimationForView{
    CALayer *lay_lb = self.layer;
    CGPoint pos_lb = lay_lb.position;
    CGPoint y = CGPointMake(pos_lb.x - 10, pos_lb.y);
    CGPoint x = CGPointMake(pos_lb.x + 10, pos_lb.y);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    [animation setAutoreverses:YES];
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    [lay_lb addAnimation:animation forKey:nil];
}

@end
