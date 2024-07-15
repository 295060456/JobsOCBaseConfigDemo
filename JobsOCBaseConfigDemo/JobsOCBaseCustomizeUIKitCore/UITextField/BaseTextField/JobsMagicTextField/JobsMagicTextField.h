//
//  JobsMagicTextField.h
//  BHBMagicFieldDemo
//
//  Created by Jobs on 2020/12/6.
//  Copyright © 2020 bihongbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYTextField.h"
#import "UIView+Measure.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMagicTextField : ZYTextField

@property(nonatomic,assign,getter=isPlaceholdAnimationable)BOOL placeholdAnimationable;// 是否开启动画
@property(nonatomic,strong)UIColor *animationColor;// 动画最终字颜色
@property(nonatomic,strong)UIFont *animationFont;// 动画最终字体
@property(nonatomic,assign)CGFloat moveDistance;// 移动距离,默认为field高度的一半,设置0无效（关闭动画请使用isPlaceholdAnimationable）
@property(nonatomic,assign)NSTimeInterval animationTime;

@end

NS_ASSUME_NONNULL_END
