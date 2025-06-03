//
//  UIButton+Animation.h
//  Casino
//
//  Created by Jobs on 2021/12/30.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "CALayer+Extra.h"
#import "CABasicAnimation+Extra.h"
#import "CAPropertyAnimation+Extra.h"
#import "CAAnimation+Extra.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Animation)
/// 点击按钮，按钮的imageView旋转360°
-(__kindof CABasicAnimation *)revolution;
/// 停止旋转360s
-(JobsByCAPropertyAnimationBlock _Nonnull)stopRevolutionBy;
/// 开始旋转（旋转360度，持续N秒后自动停止）
-(jobsByCGFloatBlock _Nonnull)startRevolutionBy;
/// 点击时旋转180°，再点击时再转回来
-(void)rotateHalfCycle;

@end

NS_ASSUME_NONNULL_END
