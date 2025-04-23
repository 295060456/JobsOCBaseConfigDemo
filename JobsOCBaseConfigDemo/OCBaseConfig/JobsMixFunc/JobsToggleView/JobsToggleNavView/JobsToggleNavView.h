//
//  RPTaggedNavView.h
//  RPTaggedNavView
//
//  Created by Tao on 2018/8/8.
//  Copyright © 2018年 Tao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "BaseView.h"
#import "JobsMakes.h"
#import "BaseButton.h"
#import "UIButton+UI.h"
#import "UIView+Extras.h"
#import "UIView+Measure.h"
#import "UIButtonModel.h"
#import "JobsToggleNavViewProtocol.h"

@interface JobsToggleNavView : BaseView<JobsToggleNavViewProtocol>
/// UI
Prop_copy(nullable)NSMutableArray <__kindof UIButton *>*buttonsArray;
/// 选择某一个标签
-(jobsByNSIntegerBlock _Nonnull)selectingOneTagByIndex;

@end

NS_INLINE __kindof JobsToggleNavView *_Nonnull jobsMakeToggleNavView(jobsByToggleNavViewBlock _Nonnull block){
    JobsToggleNavView *data = JobsToggleNavView.alloc.init;
    if (block) block(data);
    return data;
}
