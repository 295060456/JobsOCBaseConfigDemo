//
//  UIView+Navigator.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/3/24.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsViewNavigator.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Navigator)

@property(nonatomic,strong)JobsViewNavigator *navigator;
#pragma mark —— 配置
-(jobsByViewBlock _Nonnull)configViewNavigatorBySuperview;
-(jobsByViewBlock _Nonnull)configViewNavigatorBySuperview_;
-(jobsByViewBlock _Nonnull)configViewNavigatorByPushview;
-(jobsByViewBlock _Nonnull)configViewNavigatorByPushview_;
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView;
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView_;

@end

NS_ASSUME_NONNULL_END
