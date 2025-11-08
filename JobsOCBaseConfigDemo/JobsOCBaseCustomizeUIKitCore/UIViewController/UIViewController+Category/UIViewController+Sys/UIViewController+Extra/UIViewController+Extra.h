//
//  UIViewController+Extra.h
//  FM_Normal
//
//  Created by Jobs on 2025/4/18.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extra)

-(JobsRetVCByVCBlock _Nonnull)addChildViewController;
/// 关闭系统自带的右滑关闭手势
-(jobsByVoidBlock _Nonnull)clzPopGesture;
/// 打开系统自带的右滑关闭手势
-(jobsByIDBlock _Nonnull)openPopGestureBy;

@end

NS_ASSUME_NONNULL_END
