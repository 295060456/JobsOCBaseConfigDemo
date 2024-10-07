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

@property(nonatomic,assign)CGSize popupArea;

@property(nonatomic,strong)UIButton *defaultBackgroundView;
@property(nonatomic,assign)NSInteger backgroundViewCount;
@property(nonatomic,strong)NSMutableArray *backgroundViewArray;
@property(nonatomic,strong)NSMutableArray *backgroundViewFrameArray;

@property(nonatomic,assign)BOOL disuseShowAlphaAnimation;
@property(nonatomic,assign)CGFloat showFromAlpha;
@property(nonatomic,assign)CGFloat showToAlpha;

@property(nonatomic,assign)BOOL disuseShowFrameAnimation;
@property(nonatomic,assign)CGRect showFromFrame;
@property(nonatomic,assign)CGRect showToFrame;

@property(nonatomic,assign)BOOL disuseHideAlphaAnimation;
@property(nonatomic,assign)CGFloat hideFromAlpha;
@property(nonatomic,assign)CGFloat hideToAlpha;

@property(nonatomic,assign)BOOL disuseHideFrameAnimation;
@property(nonatomic,assign)CGRect hideFromFrame;
@property(nonatomic,assign)CGRect hideToFrame;

/* TFPopupDelegate */
@property(nonatomic,assign)NSTimeInterval showAnimationDuration;
@property(nonatomic,assign)NSTimeInterval showAnimationDelay;
@property(nonatomic,assign)UIViewAnimationOptions showAnimationOptions;

@property(nonatomic,assign)NSTimeInterval hideAnimationDuration;
@property(nonatomic,assign)NSTimeInterval hideAnimationDelay;
@property(nonatomic,assign)UIViewAnimationOptions hideAnimationOptions;

@property(nonatomic,assign)PopupStyle style;//默认动画类型
@property(nonatomic,assign)PopupDirection direction;//默认动画方向，仅在滑动动画和泡泡动画下有效

//存储折叠和滑动时的方向
@property(nonatomic,assign)PopupDirection foldDirection;
@property(nonatomic,assign)PopupDirection slideDirection;

//监听弹框隐藏完毕回调,需要再显示弹框前调用此方法
@property(nonatomic,  copy)TFDelegateProcessBlock delegateProcessBlock;


#pragma mark - 拖动相关
//拖住手势
@property(nonatomic,strong)UIPanGestureRecognizer *dragGes;
//当前拖动的滚动视图
@property(nonatomic,strong)UIScrollView *currentDragScrollView;
//当前拖动的滚动视图
@property(nonatomic,assign)BOOL currentDragScrollViewAllowScroll;
//拖动开始点
@property(nonatomic,assign)CGPoint dragBeginSelfPoint;
@property(nonatomic,assign)CGPoint dragBeginSuperPoint;
//是否需要推测多拽方式
@property(nonatomic,assign)BOOL needDiscernDragStyle;
//运行时的真正拖拽方式
@property(nonatomic,assign)DragStyle runtimeDragStyle;
//推测拖动方式时的开始点
@property(nonatomic,assign)CGPoint discernDragStyleBeginSelfPoint;
@property(nonatomic,assign)CGPoint discernDragStyleBeginSuperPoint;
//拖动结束后要消失的目标frame
@property(nonatomic,assign)CGRect  dragDissmissFrame;

@end


@class TFPopupPoolBridge;
@interface TFPopupPool : NSObject
//已经弹出的弹窗，弱引用记录
@property(nonatomic,strong)NSMutableArray <TFPopupPoolBridge *>*pool;

+(void)refreshPool;
+(void)addToPool:(UIView *)popupView;
+(UIView *)findPopup:(NSString *)identifier;
+(NSArray <UIView *>*)allPopup;

@end


@interface TFPopupPoolBridge : NSObject

//已经弹出的弹窗，弱引用记录
@property(nonatomic,  weak)UIView *popupView;

@end


