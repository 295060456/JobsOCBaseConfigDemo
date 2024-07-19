//
//  AnimationLabel.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsAnimationLabel : UILabel
/**
 动画数字改变
 
 @param fromValue 开始数值
 @param toValue 结束数值
 @param duration 动画时间
 @param complete 完成回调
 */
- (void)animationTextStartValue:(CGFloat)fromValue
                       endValue:(CGFloat)toValue
                       duration:(CGFloat)duration
                       complete:(void (^)(UILabel *label, CGFloat value))complete;
@end

NS_ASSUME_NONNULL_END

/**
 
 调用示例：
 -(JobsAnimationLabel *)animationLab{
     if (!_animationLab) {
         _animationLab = JobsAnimationLabel.new;
         _animationLab.textColor = JobsBlackColor;
         
         _animationLab.text = @"12";
         _animationLab.value = 12;
         _animationLab.lastValue = 120;
         
         [_animationLab animationTextStartValue:_animationLab.value
                                       endValue:_animationLab.lastValue
                                       duration:1.0
                                       complete:^(UILabel *label, CGFloat value) {
             label.text = [NSString stringWithFormat:@"%f", value];
             label.value = value;
             label.lastValue = (label.value * 3);
         }];
         
         [self addSubview:_animationLab];
         [_animationLab mas_makeConstraints:^(MASConstraintMaker *make) {
             make.bottom.equalTo(self.progressView);
             make.left.equalTo(self.progressView);
         }];
     }return _animationLab;
 }

 */
