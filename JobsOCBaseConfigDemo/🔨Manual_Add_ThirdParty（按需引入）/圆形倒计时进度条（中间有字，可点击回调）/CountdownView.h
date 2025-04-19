//
//  CountdownView.h
//  GuideViewDemo
//
//  Created by 天蓝 on 2016/12/2.
//  Copyright © 2016年 PT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownView : UIView

Prop_assign()NSInteger time;
Prop_copy()NSString *str;
Prop_strong()UIFont *font;
Prop_strong()UIColor *textColor;

Prop_copy()void (^blockTapAction)(void);
Prop_copy()void (^blockAnimationFinishedAction)(void);

@end
