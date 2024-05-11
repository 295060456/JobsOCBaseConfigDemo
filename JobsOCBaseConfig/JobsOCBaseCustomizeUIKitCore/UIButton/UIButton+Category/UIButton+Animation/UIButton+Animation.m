//
//  UIButton+Animation.m
//  Casino
//
//  Created by Jobs on 2021/12/30.
//

#import "UIButton+Animation.h"

@implementation UIButton (Animation)
/// 点击按钮，按钮的imageView旋转360°
-(CABasicAnimation *)revolution{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: -M_PI * 2.0];
    rotationAnimation.duration = 0.4;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    rotationAnimation.removedOnCompletion = NO;
    [self.imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    return rotationAnimation;
}
/// 停止旋转360
-(void)stopRevolution{
    [self.imageView.layer removeAnimationForKey:@"rotationAnimation"];
}
/// 点击时旋转180°，再点击时再转回来
-(void)rotateHalfCycle{
    if(self.deviceSystemVersion.floatValue >= 13.0f){
        [UIView animateWithDuration:0.25 animations:^{
            if (CGAffineTransformEqualToTransform(self.imageView.transform, CGAffineTransformIdentity)) {
                self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
            } else {
                self.imageView.transform = CGAffineTransformIdentity;
            }
        }];
    }else{
        SuppressWdeprecatedDeclarationsWarning(
                                               [UIView beginAnimations:@"rotate" context:nil];
                                               [UIView setAnimationDuration:.25f];
                                               if(CGAffineTransformEqualToTransform(self.imageView.transform,
                                                                                    CGAffineTransformIdentity)){
                                                   self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
                                               }else {
                                                   self.imageView.transform = CGAffineTransformIdentity;
                                               }
                                               [UIView commitAnimations];);
    }
}

@end
