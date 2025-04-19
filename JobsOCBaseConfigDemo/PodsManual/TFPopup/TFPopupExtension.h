//
//  TFPopupExtension.h
//  TFPopupDemo
//
//  Created by Time on 2019/3/4.
//  Copyright © 2019 ztf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TFPopupParam.h"

typedef NS_ENUM(NSInteger,DelegateProcess) {
    DelegateProcessWillGetConfiguration = 0,//将要获取弹出配置
    DelegateProcessDidGetConfiguration,//已经获取弹出配置
    DelegateProcessWillShow,//将要弹出
    DelegateProcessDidShow,//已经调用完弹出,正在执行动画
    DelegateProcessShowAnimationDidFinish,//弹出动画执行完成
    DelegateProcessWillHide,//将要消失
    DelegateProcessDidHide,//已经调用完消失,正在执行动画
    DelegateProcessHideAnimationDidFinish,//消失动画执行完成
    DelegateProcessBackgroundDidTouch,//默认背景点击
};

typedef void(^TFDelegateProcessBlock)(UIView *pop,DelegateProcess pro);

@interface TFPopupExtension : NSObject

/* TFPopupDataSource */
@property(nonatomic,  weak)UIView *inView;

Prop_assign()CGSize popupArea;

Prop_strong()UIButton *defaultBackgroundView;
Prop_assign()NSInteger backgroundViewCount;
Prop_copy()NSMutableArray *backgroundViewArray;
Prop_copy()NSMutableArray *backgroundViewFrameArray;

Prop_assign()BOOL disuseShowAlphaAnimation;
Prop_assign()CGFloat showFromAlpha;
Prop_assign()CGFloat showToAlpha;

Prop_assign()BOOL disuseShowFrameAnimation;
Prop_assign()CGRect showFromFrame;
Prop_assign()CGRect showToFrame;

Prop_assign()BOOL disuseHideAlphaAnimation;
Prop_assign()CGFloat hideFromAlpha;
Prop_assign()CGFloat hideToAlpha;

Prop_assign()BOOL disuseHideFrameAnimation;
Prop_assign()CGRect hideFromFrame;
Prop_assign()CGRect hideToFrame;

/* TFPopupDelegate */
Prop_assign()NSTimeInterval showAnimationDuration;
Prop_assign()NSTimeInterval showAnimationDelay;
Prop_assign()UIViewAnimationOptions showAnimationOptions;

Prop_assign()NSTimeInterval hideAnimationDuration;
Prop_assign()NSTimeInterval hideAnimationDelay;
Prop_assign()UIViewAnimationOptions hideAnimationOptions;

Prop_assign()PopupStyle style;//默认动画类型
Prop_assign()PopupDirection direction;//默认动画方向，仅在滑动动画和泡泡动画下有效

//存储折叠和滑动时的方向
Prop_assign()PopupDirection foldDirection;
Prop_assign()PopupDirection slideDirection;

//监听弹框隐藏完毕回调,需要再显示弹框前调用此方法
@property(nonatomic,  copy)TFDelegateProcessBlock delegateProcessBlock;


#pragma mark - 拖动相关
//拖住手势
Prop_strong()UIPanGestureRecognizer *dragGes;
//当前拖动的滚动视图
Prop_strong()UIScrollView *currentDragScrollView;
//当前拖动的滚动视图
Prop_assign()BOOL currentDragScrollViewAllowScroll;
//拖动开始点
Prop_assign()CGPoint dragBeginSelfPoint;
Prop_assign()CGPoint dragBeginSuperPoint;
//是否需要推测多拽方式
Prop_assign()BOOL needDiscernDragStyle;
//运行时的真正拖拽方式
Prop_assign()DragStyle runtimeDragStyle;
//推测拖动方式时的开始点
Prop_assign()CGPoint discernDragStyleBeginSelfPoint;
Prop_assign()CGPoint discernDragStyleBeginSuperPoint;
//拖动结束后要消失的目标frame
Prop_assign()CGRect  dragDissmissFrame;

@end


@class TFPopupPoolBridge;
@interface TFPopupPool : NSObject
//已经弹出的弹窗，弱引用记录
Prop_copy()NSMutableArray <TFPopupPoolBridge *>*pool;

+(void)refreshPool;
+(void)addToPool:(UIView *)popupView;
+(UIView *)findPopup:(NSString *)identifier;
+(NSArray <UIView *>*)allPopup;

@end


@interface TFPopupPoolBridge : NSObject

//已经弹出的弹窗，弱引用记录
@property(nonatomic,  weak)UIView *popupView;

@end


