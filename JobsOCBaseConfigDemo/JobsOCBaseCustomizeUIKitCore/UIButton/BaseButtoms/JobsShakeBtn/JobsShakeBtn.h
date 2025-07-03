//
//  JobsShakeBtn.h
//  My_BaseProj
//
//  Created by hello on 2019/7/4.
//  Copyright © 2019 Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MacroDef_Cor.h"
#import "UIView+Chain.h"
#import "UIView+Gesture.h"
#import "UIButton+UI.h"
#import "JobsLoadingImage.h"
#import "NSObject+CallBackInfoByBlock.h"
/// hidden 的 权限优先级 > alpha
NS_ASSUME_NONNULL_BEGIN
/// 高仿iOS长按删除+抖动
@interface JobsShakeBtn : UIButton

@property(nonatomic,assign,getter=isShaking)BOOL shaking;// 是否抖动
Prop_strong()UIImageView *iconBtn;// 右上角的按钮

@end

NS_ASSUME_NONNULL_END
