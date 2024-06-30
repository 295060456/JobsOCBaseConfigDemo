//
//  UIProgressView+Extra.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/13.
//

#import "UIProgressView+Extra.h"

@implementation UIProgressView (Extra)
/// 进度条动画展现到当前值
/// 资料来源：https://www.jianshu.com/p/14a93c6dd929
/// @param duration 持续时间
/// @param progress 当前值
-(void)animateWithDuration:(CGFloat)duration
                  progress:(CGFloat)progress{
    [self setProgress:0.00001 animated:NO];
    [self setProgress:0.0 animated:YES];
    @jobs_weakify(self)
    [UIView animateWithDuration:duration
                     animations:^{
        @jobs_strongify(self)
        [self setProgress:progress animated:YES];
    } completion:^(BOOL finished) {}];
}

@end
