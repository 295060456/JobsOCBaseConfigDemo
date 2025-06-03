//
//  UIButton+Animation.m
//  Casino
//
//  Created by Jobs on 2021/12/30.
//

#import "UIButton+Animation.h"

@implementation UIButton (Animation)
/// 点击按钮，按钮的imageView旋转360°
-(__kindof CABasicAnimation *)revolution{
    return self.imageView.layer.addAnimation(CABasicAnimation.animationByKeyPath(@"transform.rotation.z")
                                             .repeatCountBy(MAXFLOAT)
                                             .toValueBy(@(-M_PI * 2.0))
                                             .durationBy(0.4)
                                             .cumulativeBy(YES)
                                             .removedOnCompletionBy(NO));;
}
/// 停止旋转360s
-(JobsByCAPropertyAnimationBlock _Nonnull)stopRevolutionBy{
    @jobs_weakify(self)
    return ^(__kindof CAPropertyAnimation *_Nullable animation){
        @jobs_strongify(self)
        self.imageView.layer.removeAnimationBy(animation);
    };
}
/// 开始旋转（旋转360度，持续N秒后自动停止）
-(jobsByCGFloatBlock _Nonnull)startRevolutionBy{
    @jobs_weakify(self)
    return ^(CGFloat data){
        @jobs_strongify(self)
        CABasicAnimation *rotationAnim = self.revolution;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                     (int64_t)(data * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
            self.stopRevolutionBy(rotationAnim);
        });
    };
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
