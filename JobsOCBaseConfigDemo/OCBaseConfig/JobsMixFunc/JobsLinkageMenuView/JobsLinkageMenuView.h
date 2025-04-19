//
//  LinkageMenuView.h
//  LinkageMenu
//
//  Created by 风间 on 2017/3/8.
//  Copyright © 2017年 EmotionV. All rights reserved.
//  github: https://github.com/EmotionV/LinkageMenu

#import "BaseView.h"
#import "UIButton+UI.h"
#import "UIButtonModel.h"

@class JobsLinkageMenuViewConfig;

@interface JobsLinkageMenuView : BaseView

Prop_strong()UIColor *selectViewColor;/// 滑块颜色
Prop_strong()UIColor *textColor;/// 标题颜色
Prop_strong()UIColor *selectTextColor;/// 标题选中的颜色
Prop_assign()CGFloat textSize;/// 标题字体大小

-(instancetype)initWithFrame:(CGRect)frame
                   btnConfig:(UIButtonModel *)btnConfig
       linkageMenuViewConfig:(JobsLinkageMenuViewConfig *)linkageMenuViewConfig;
@end

@interface JobsLinkageMenuViewConfig : NSObject

Prop_assign()CGFloat MENU_WIDTH;/// 左侧菜单栏宽度，默认136
Prop_assign()CGFloat BOTTOMVIEW_HEIGHT;/// 滑块高度
Prop_assign()CGFloat BOTTOMVIEW_WIDTH;/// 滑块宽度
Prop_assign()CGFloat LINEVIEW_WIDTH;/// 分割线宽度
Prop_assign()CGFloat ANIMATION_TIME;/// 菜单栏滚动的时间

@end
