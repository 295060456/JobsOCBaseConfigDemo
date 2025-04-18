//
//  JobsMagicTextField.h
//  BHBMagicFieldDemo
//
//  Created by Jobs on 2020/12/6.
//  Copyright © 2020 bihongbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "ZYTextField.h"
#import "UIView+Measure.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMagicTextField : ZYTextField

Prop_assign(getter=isPlaceholdAnimationable)BOOL placeholdAnimationable; /// 是否开启动画
Prop_strong()UIColor *animationColor; /// 动画最终字颜色
Prop_strong()UIFont *animationFont; /// 动画最终字体
Prop_assign()CGFloat moveDistance; /// 移动距离,默认为field高度的一半,设置0无效（关闭动画请使用isPlaceholdAnimationable）
Prop_assign()NSTimeInterval animationTime;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsMagicTextField *_Nonnull jobsMakeMagicTextField(jobsByMagicTextFieldBlock _Nonnull block){
    JobsMagicTextField *data = JobsMagicTextField.alloc.init;
    if (block) block(data);
    return data;
}
