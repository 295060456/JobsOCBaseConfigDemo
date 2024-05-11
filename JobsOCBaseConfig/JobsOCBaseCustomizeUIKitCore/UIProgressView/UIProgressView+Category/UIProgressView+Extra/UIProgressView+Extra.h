//
//  UIProgressView+Extra.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIProgressView (Extra)
/// 进度条动画展现到当前值
/// 资料来源：https://www.jianshu.com/p/14a93c6dd929
/// @param duration 持续时间
/// @param progress 当前值
-(void)animateWithDuration:(CGFloat)duration
                  progress:(CGFloat)progress;

@end

NS_ASSUME_NONNULL_END
