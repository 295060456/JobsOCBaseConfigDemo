//
//  UIViewController+SuspendBtn.h
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import <UIKit/UIKit.h>
#import "JobsSuspendBtn.h"
#import "UIButton+UI.h"
#import "JobsLoadingImage.h"
#import "MacroDef_App.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SuspendBtn)

@property(nonatomic,strong)JobsSuspendBtn *suspendBtn;

@end

NS_ASSUME_NONNULL_END
/**
 
   【 使用示例】
    suspendBtn按钮点击事件集成了点击旋转的动效
    [self.suspendBtn stopRotateAnimation];
 
 */
