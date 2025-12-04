//
//  TransitionAnimation.h
//  CCSildeTabBarController
//
//  Created by wsk on 16/8/22.
//  Copyright © 2016年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefineProperty.h"

@interface TransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

-(instancetype)initWithTargetEdge:(UIRectEdge)targetEdge;

Prop(readwrite)UIRectEdge targetEdge;

@end
