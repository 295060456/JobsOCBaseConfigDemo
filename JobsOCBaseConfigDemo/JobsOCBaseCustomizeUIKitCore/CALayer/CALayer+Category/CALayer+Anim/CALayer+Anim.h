//
//  CALayer+Anim.h
//  Carpenter
//
//  Created by 冯成林 on 15/4/23.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "NSString+Others.h"
/// 反转方向
typedef NS_ENUM(NSUInteger, AnimReverDirection) {
    AnimReverDirectionX = 0,    /// X轴反转
    AnimReverDirectionY,        /// Y轴反转
    AnimReverDirectionZ         /// Z轴反转
};

@interface CALayer (Anim)

-(CAAnimation *)anim_shake:(NSArray *)rotations
                  duration:(NSTimeInterval)duration
               repeatCount:(NSUInteger)repeatCount;
-(CAAnimation *)anim_revers:(AnimReverDirection)direction
                   duration:(NSTimeInterval)duration
                  isReverse:(BOOL)isReverse
                repeatCount:(NSUInteger)repeatCount
             timingFuncName:(NSString *)timingFuncName;


@end
