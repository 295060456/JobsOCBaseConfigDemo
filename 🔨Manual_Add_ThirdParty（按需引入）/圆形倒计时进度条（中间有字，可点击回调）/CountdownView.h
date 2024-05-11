//
//  CountdownView.h
//  GuideViewDemo
//
//  Created by 天蓝 on 2016/12/2.
//  Copyright © 2016年 PT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownView : UIView

@property(nonatomic,copy)void (^blockTapAction)(void);
@property(nonatomic,copy)void (^blockAnimationFinishedAction)(void);
@property(nonatomic,assign)NSInteger time;
@property(nonatomic,copy)NSString *str;
@property(nonatomic,strong)UIFont *font;
@property(nonatomic,strong)UIColor *textColor;

@end
