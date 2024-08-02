//
//  LinkageMenuView.h
//  LinkageMenu
//
//  Created by 风间 on 2017/3/8.
//  Copyright © 2017年 EmotionV. All rights reserved.
//  github: https://github.com/EmotionV/LinkageMenu

#import <UIKit/UIKit.h>
#import "UIButton+UI.h"
#import "UIButtonModel.h"

@interface JobsLinkageMenuView : UIView

@property(nonatomic,strong)UIColor *selectViewColor;/// 滑块颜色
@property(nonatomic,strong)UIColor *textColor;/// 标题颜色
@property(nonatomic,strong)UIColor *selectTextColor;/// 标题选中的颜色
@property(nonatomic,assign)CGFloat textSize;/// 标题字体大小

-(instancetype)initWithFrame:(CGRect)frame
                   btnConfig:(UIButtonModel *)btnConfig;

@end
