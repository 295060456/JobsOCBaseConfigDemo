//
//  RPTaggedNavView.h
//  RPTaggedNavView
//
//  Created by Tao on 2018/8/8.
//  Copyright © 2018年 Tao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "BaseButton.h"
#import "UIButton+UI.h"
#import "UIView+Measure.h"
#import "UIButtonModel.h"
#import "JobsToggleNavViewProtocol.h"

@interface JobsToggleNavView : BaseView<JobsToggleNavViewProtocol>
/// 选择某一个标签
-(jobsByNSIntegerBlock _Nonnull)selectingOneTagWithIndex;

@end
