//
//  TFPopupParam.h
//  TFPopupDemo
//
//  Created by ztf on 2019/1/18.
//  Copyright © 2019年 ztf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,PopupDirection) {
    PopupDirectionContainerCenter = 0,
    PopupDirectionTop,
    PopupDirectionTopRight,
    PopupDirectionRight,
    PopupDirectionRightBottom,
    PopupDirectionBottom,
    PopupDirectionBottomLeft,
    PopupDirectionLeft,
    PopupDirectionLeftTop,
    PopupDirectionFrame,
};


typedef NS_ENUM(NSInteger,DragStyle) {
    DragStyleNone = 0,//不可拖拽
    DragStyleToTop = 1 << 0,//可以向上拖拽,可自由组合其他三个方向
    DragStyleToLeft = 1 << 1,//可以向左拖拽,可自由组合其他三个方向
    DragStyleToRight = 1 << 2,//可以向右拖拽,可自由组合其他三个方向
    DragStyleToBottom = 1 << 3,//可以向下拖拽,可自由组合其他三个方向
    DragStyleFree = 1000,//可以向任何方向拖拽,但松手后不消失
};


typedef NS_ENUM(NSInteger,PopupStyle) {
    PopupStyleNone = 0,
    PopupStyleDefaultAlpha = 1 << 0,
    PopupStyleDefaultFrame = 1 << 1,
    PopupStyleExtensionMask = 1 << 2,
    PopupStyleExtensionAniamtion = 1 << 3,
};

typedef NS_ENUM(NSInteger,TFPopupState) {
    TFPopupStateShow = 0,
    TFPopupStateHide,
};


@interface TFPopupParam : NSObject

/* 【全局属性】参数载体
 object0,object1,object1,用于弹框时需要传递的参数;
 */
@property(nonatomic,strong)id object0;
@property(nonatomic,strong)id object1;
@property(nonatomic,strong)id object2;

/* 【全局属性】时间
 duration,动画时间default=0.3
 showAnimationDelay,动画延迟执行时间:调用弹出后延迟此时间后执行弹出动画
 hideAnimationDelay,动画延迟执行时间:调用消失后延迟此时间后执行弹出动画
 autoDissmissDuration,自动消失时间,default=0
 animationOptions,默认渐隐和frame动画的动画曲线default=UIViewAnimationOptionCurveEaseOut
 */
@property(nonatomic,assign)NSTimeInterval duration;
@property(nonatomic,assign)NSTimeInterval showAnimationDelay;
@property(nonatomic,assign)NSTimeInterval hideAnimationDelay;
@property(nonatomic,assign)NSTimeInterval autoDissmissDuration;
@property(nonatomic,assign)UIViewAnimationOptions animationOptions;


/* 【全局属性】背景
 disuseBackground,不使用背景,default=NO,如果设为YES则自定义代理的方法也会被禁止
 backgroundColor,默认背景的背景颜色,default=0.3alpha的黑色
 backgroundColorClear,默认背景的背景色设为透明
 disuseBackgroundTouchHide,禁止点击背景消失弹框
 disuseShowBackgroundAlphaAnimation,不使用显示时的渐隐动画default=NO
 disuseShowBackgroundAlphaAnimation,不使用消失时的渐隐动画default=NO
 */
@property(nonatomic,assign)BOOL disuseBackground;
@property(nonatomic,strong)UIColor *backgroundColor;
@property(nonatomic,assign)BOOL backgroundColorClear;
@property(nonatomic,assign)BOOL disuseBackgroundTouchHide;
@property(nonatomic,assign)BOOL disuseShowBackgroundAlphaAnimation;
@property(nonatomic,assign)BOOL disuseHideBackgroundAlphaAnimation;


/* 【全局属性】拖拽控制
 dragEnable,是否可拖拽,默认为NO,设为YES时tf_showSlide的上下左右方向默认可以向消失的方向拖拽
 dragStyle,拖拽类型/方向
 dragBouncesEnable,拖拽到底的时候是否有弹性效果
 discernScrollEnable,当拖拽的view中包含scrollview时,是否兼容识别拖拽
 dragAutoDissmissMinDistance,拖拽松手时的距离大于此距离时拖拽消失,否则恢复原位
 */
@property(nonatomic,assign)BOOL dragEnable;
@property(nonatomic,assign)DragStyle dragStyle;
@property(nonatomic,assign)BOOL dragBouncesEnable;
@property(nonatomic,assign)BOOL discernScrollEnable;
@property(nonatomic,assign)NSUInteger dragAutoDissmissMinDistance;


/* 【全局属性】弹框渐隐动画
 disuseShowPopupAlphaAnimation,不使用弹出时的渐隐动画default=NO
 disuseHidePopupAlphaAnimation,不使用消失时的渐隐动画default=NO
 disuseShowPopupFrameAnimation,不使用弹出时的frame动画default=NO
 disuseHidePopupFrameAnimation,不使用消失时的frame动画default=NO
 */
@property(nonatomic,assign)BOOL disuseShowPopupAlphaAnimation;
@property(nonatomic,assign)BOOL disuseHidePopupAlphaAnimation;
@property(nonatomic,assign)BOOL disuseShowPopupFrameAnimation;
@property(nonatomic,assign)BOOL disuseHidePopupFrameAnimation;


/* 【全局属性】弹框尺寸和区域
 popupAreaRect,弹框所在区域尺寸,default=父视图的bounds,此属性决定了弹框的位置和大小计算
 popupSize,弹框尺寸,default=弹框的frame.size
 offset,弹框偏移,offset.x正为右移,offset.y正为下移
 popOriginFrame,弹框初始frame
 popTargetFrame,弹框动画后的frame
 keepPopupOriginFrame,是否保持原有frame不变,值为YES时,不对frame进行计算和操作
 zIndex,多个弹窗同时出现时的层次，默认为0
 */
@property(nonatomic,assign)CGRect popupAreaRect;
@property(nonatomic,assign)CGSize popupSize;
@property(nonatomic,assign)CGPoint offset;
@property(nonatomic,assign)CGRect popOriginFrame;
@property(nonatomic,assign)CGRect popTargetFrame;
@property(nonatomic,assign)BOOL keepPopupOriginFrame;
@property(nonatomic,assign)NSInteger zIndex;

/* 【全局属性】属性动画 和 默认缩放动画冲突
 showKeyPath,显示时的属性动画keyPath
 showFromValue,显示动画初始值
 showToValue,,显示动画结束值
 hideKeyPath,隐藏时的属性动画keyPath
 hideFromValue,隐藏动画初始值
 hideToValue,隐藏动画结束值
 */
@property(nonatomic,  copy)NSString *showKeyPath;
@property(nonatomic,strong)id showFromValue;
@property(nonatomic,strong)id showToValue;
@property(nonatomic,  copy)NSString *hideKeyPath;
@property(nonatomic,strong)id hideFromValue;
@property(nonatomic,strong)id hideToValue;


/* 【泡泡弹出方式属性】
 basePoint,弹出泡泡基于哪个点
 bubbleDirection,弹出泡泡的方向,八个方向
 */
@property(nonatomic,assign)CGPoint basePoint;
@property(nonatomic,assign)PopupDirection bubbleDirection;


/* 【全局属性】遮罩
 maskShowFromPath,必须参数
 maskShowToPath,必须参数
 maskHideFromPath,非必填，为空时值为maskShowToPath
 maskHideToPath,非必填，为空时值为maskShowFromPath
 */
@property(nonatomic,strong)UIBezierPath *maskShowFromPath;
@property(nonatomic,strong)UIBezierPath *maskShowToPath;
@property(nonatomic,strong)UIBezierPath *maskHideFromPath;
@property(nonatomic,strong)UIBezierPath *maskHideToPath;

@end

