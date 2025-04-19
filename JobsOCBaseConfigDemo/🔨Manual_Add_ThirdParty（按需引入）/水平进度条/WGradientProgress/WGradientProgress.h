//
//  WGradientProgress.h
//  WGradientProgressDemo
//
//  Created by zilin_weng on 15/7/19.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
#import "WGradientProgressModel.h"

@interface WGradientProgress : UIView

Prop_assign()CGFloat progress;
Prop_assign()CGFloat increment;/// 只能允许 0 ~ 1 范围内 每一单位
Prop_assign()BOOL isShowRoad;/// 是否显示即将运动的轨迹
Prop_assign()BOOL isShowFence;/// 是否显示栅栏
Prop_assign()CGFloat fenceLayer_x;/// 栅栏位置
Prop_assign()CGFloat fenceLayer_width;
Prop_assign()NSTimeInterval color_timeInterval;/// 色彩翻滚的频率
Prop_assign()NSTimeInterval length_timeInterval;/// 长度变化的频率
Prop_assign()NSTimeInterval length_timeSecIntervalSinceDate;/// 长度变化的时间延迟
Prop_assign()WGradientProgressType progressType;
Prop_strong()UIColor * _Nullable progressColor;
Prop_strong()UIColor * _Nullable fenceLayerColor;/// 栅栏颜色

-(void)showOnParent;/// 启动色彩翻滚
-(void)hide;
-(void)start;
-(void)pause;
-(void)resume;
-(void)reset;

@end
