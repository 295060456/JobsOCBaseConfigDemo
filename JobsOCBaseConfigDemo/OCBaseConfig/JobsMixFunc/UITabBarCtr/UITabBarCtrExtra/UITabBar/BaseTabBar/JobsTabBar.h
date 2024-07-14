//
//  CustomTabBar.h
//  HitTesting
//
//  Created by mac on 2017/5/19.
//  Copyright © 2017年 flowyears. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "JobsLoadingImage.h"
#import "UIView+Measure.h"

#ifndef ALIGNMENT_TYPE_ENUM_DEFINED
#define ALIGNMENT_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, AlignmentType) {
    ImageLeftTitleRight,/// 图左，文字右
    ImageRightTitleLeft,/// 图右，文字左
    ImageTopTitleBottom,/// 图上，文字下
    ImageBottomTitleTop /// 图下，文字上
};
#endif /* ALIGNMENT_TYPE_ENUM_DEFINED */

// 超过 6 个 系统会变成更多，过不了审核
@interface JobsTabBar : UITabBar<BaseViewProtocol>

@property(nonatomic,assign)AlignmentType alignmentType;

-(CGFloat)customTabBarOffsetHeight;

@end
