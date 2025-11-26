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

-(void)make:(MASConstraintMaker *)make topOffset:(CGFloat)topOffset;

-(JobsRetVCByVCBlock _Nonnull)addChildViewController;
/// 将自身用导航控制器进行包裹（如果自身就是导航控制器就什么也不做的返回）
-(UINavigationController *_Nonnull)navCtrl;
/// 关闭系统自带的右滑关闭手势
-(jobsByVoidBlock _Nonnull)clzPopGesture;
/// 打开系统自带的右滑关闭手势
-(jobsByIDBlock _Nonnull)openPopGestureBy;

@end

NS_ASSUME_NONNULL_END
