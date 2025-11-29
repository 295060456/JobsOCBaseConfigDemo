//
//  UIProgressView+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIProgressView (DSL)
#pragma mark - Style
-(JobsRetProgressViewByStyleBlock _Nonnull)byProgressViewStyle;
#pragma mark - Progress
-(JobsRetProgressViewByFloatBlock _Nonnull)byProgress;
-(JobsRetProgressViewByFloatAnimatedBlock _Nonnull)byProgressAnimated;
#pragma mark - Tint & Image
-(JobsRetProgressViewByColorBlock _Nonnull)byProgressTintColor;
-(JobsRetProgressViewByColorBlock _Nonnull)byTrackTintColor;
-(JobsRetProgressViewByImageBlock _Nonnull)byProgressImage;
-(JobsRetProgressViewByImageBlock _Nonnull)byTrackImage;
#pragma mark - NSProgress 绑定
-(JobsRetProgressViewByNSProgressBlock _Nonnull)byObservedProgress;

@end

NS_ASSUME_NONNULL_END
