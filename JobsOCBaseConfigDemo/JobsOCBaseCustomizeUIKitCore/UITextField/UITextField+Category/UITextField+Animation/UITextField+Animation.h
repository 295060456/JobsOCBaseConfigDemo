//
//  UITextField+Animation.h
//  Casino
//
//  Created by Jobs on 2021/12/20.
//

#import <UIKit/UIKit.h>
#import "NSString+Judgment.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Animation)
#pragma mark —— 一些动画
/// 输入的和某个预设定值不一致的时候，抖动动画
-(void)isValidate:(NSString *)validate;
/// 输入的为空，抖动动画
-(void)isEmptyText;

-(void)shakeAnimationForView;

@end

NS_ASSUME_NONNULL_END
