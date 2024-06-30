//
//  UIView+Gesture.m
//  DouDong-II
//
//  Created by Jobs on 2021/1/4.
//

#import "UIView+Gesture.h"

#warning —— 本类不实现UIGestureRecognizerDelegate的原因说明:覆盖了 UISCrollView 里面对应的方法
@implementation UIView (Gesture)
#pragma mark —— 一些公有方法
-(void)defaultFunc{
    NSLog(@"defaultFunc");
}
/// 取消注册各种手势对应的方法
-(void)Dealloc{
    UILongPressGestureRecognizer *LongPressGR = objc_getAssociatedObject(self, _longPressGR);
    if (LongPressGR) {
        if (self.longPressGR_SelImp.selector) {
            [LongPressGR removeTarget:self.target
                               action:self.longPressGR_SelImp.selector];
        }
    }
    UITapGestureRecognizer *TapGR = objc_getAssociatedObject(self,_tapGR);
    if (TapGR) {
        if (self.tapGR_SelImp.selector) {
            [TapGR removeTarget:self.target
                         action:self.tapGR_SelImp.selector];
        }
    }
    UISwipeGestureRecognizer *SwipeGR = objc_getAssociatedObject(self, _swipeGR);
    if (SwipeGR) {
        if (self.swipeGR_SelImp.selector) {
            [SwipeGR removeTarget:self.target
                           action:self.swipeGR_SelImp.selector];
        }
    }
    UIPanGestureRecognizer *PanGR = objc_getAssociatedObject(self, _panGR);
    if (PanGR) {
        if (self.panGR_SelImp.selector) {
            [PanGR removeTarget:self.target
                         action:self.panGR_SelImp.selector];
        }
    }
    UIPinchGestureRecognizer *PinchGR = objc_getAssociatedObject(self, _pinchGR);
    if (PinchGR) {
        if (self.pinchGR_SelImp.selector) {
            [PinchGR removeTarget:self.target
                           action:self.pinchGR_SelImp.selector];
        }
    }
    UIRotationGestureRecognizer *RotationGR = objc_getAssociatedObject(self, _rotationGR);
    if (RotationGR) {
        if (self.rotationGR_SelImp.selector) {
            [RotationGR removeTarget:self.target
                              action:self.rotationGR_SelImp.selector];
        }
    }
    UIScreenEdgePanGestureRecognizer *ScreenEdgePanGR = objc_getAssociatedObject(self, _screenEdgePanGR);
    if (ScreenEdgePanGR) {
        if (self.screenEdgePanGR_SelImp.selector) {
            [ScreenEdgePanGR removeTarget:self.target
                                   action:self.screenEdgePanGR_SelImp.selector];
        }
    }
}
#pragma mark —— @property(nonatomic,strong,nullable)id target;/// 描述方法实现的位置
JobsKey(_target)
@dynamic target;
-(id)target{
    id target = Jobs_getAssociatedObject(_target);
    if (!target) {
        @jobs_weakify(self)
        Jobs_setAssociatedASSIGN(_target, weak_self)
    }return target;
}

-(void)setTarget:(id)target{
    Jobs_setAssociatedASSIGN(_target, target)
}
#pragma mark —— @property(nonatomic,assign)NSUInteger minimumNumberOfTouches API_UNAVAILABLE(tvos);
JobsKey(_minimumNumberOfTouches)
@dynamic minimumNumberOfTouches;
-(NSUInteger)minimumNumberOfTouches{
    return [Jobs_getAssociatedObject(_minimumNumberOfTouches) unsignedIntegerValue];
}

-(void)setMinimumNumberOfTouches:(NSUInteger)minimumNumberOfTouches{
    Jobs_setAssociatedRETAIN_NONATOMIC(_minimumNumberOfTouches, @(minimumNumberOfTouches))
}
#pragma mark —— @property(nonatomic,assign)NSUInteger maximumNumberOfTouches API_UNAVAILABLE(tvos);
JobsKey(_maximumNumberOfTouches)
@dynamic maximumNumberOfTouches;
-(NSUInteger)maximumNumberOfTouches{
    return [Jobs_getAssociatedObject(_maximumNumberOfTouches) unsignedIntegerValue];
}

-(void)setMaximumNumberOfTouches:(NSUInteger)maximumNumberOfTouches{
    Jobs_setAssociatedRETAIN_NONATOMIC(_maximumNumberOfTouches, @(maximumNumberOfTouches))
}
#pragma mark —— @property(nonatomic,assign)NSUInteger numberOfTapsRequired;// 设置轻拍次数【UILongPressGestureRecognizer】【UITapGestureRecognizer】
JobsKey(_numberOfTapsRequired)
@dynamic numberOfTapsRequired;
-(NSUInteger)numberOfTapsRequired{
    return [Jobs_getAssociatedObject(_numberOfTapsRequired) unsignedIntegerValue];
}

-(void)setNumberOfTapsRequired:(NSUInteger)numberOfTapsRequired{
    Jobs_setAssociatedRETAIN_NONATOMIC(_numberOfTapsRequired, @(numberOfTapsRequired))
}
#pragma mark —— @property(nonatomic,assign)NSUInteger numberOfTouchesRequired;// 设置手指字数【UILongPressGestureRecognizer】【UITapGestureRecognizer】
JobsKey(_numberOfTouchesRequired)
@dynamic numberOfTouchesRequired;
-(NSUInteger)numberOfTouchesRequired{
    return [Jobs_getAssociatedObject(_numberOfTouchesRequired) unsignedIntegerValue];
}

-(void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired{
    Jobs_setAssociatedRETAIN_NONATOMIC(_numberOfTouchesRequired, @(numberOfTouchesRequired))
}
#pragma mark —— @property(nonatomic,assign)NSTimeInterval minimumPressDuration;// longPressGR最小长按时间【UILongPressGestureRecognizer】
JobsKey(_minimumPressDuration)
@dynamic minimumPressDuration;
-(NSTimeInterval)minimumPressDuration{
    return [Jobs_getAssociatedObject(_minimumPressDuration) doubleValue];
}

-(void)setMinimumPressDuration:(NSTimeInterval)minimumPressDuration{
    Jobs_setAssociatedRETAIN_NONATOMIC(_minimumPressDuration, @(minimumPressDuration))
}
#pragma mark —— @property(nonatomic,assign)CGFloat allowableMovement;//【UILongPressGestureRecognizer】
JobsKey(_allowableMovement)
@dynamic allowableMovement;
-(CGFloat)allowableMovement{
    return [Jobs_getAssociatedObject(_allowableMovement) floatValue];
}

-(void)setAllowableMovement:(CGFloat)allowableMovement{
    Jobs_setAssociatedRETAIN_NONATOMIC(_allowableMovement, @(allowableMovement))
}
#pragma mark —— @property(nonatomic,assign)UISwipeGestureRecognizerDirection swipeGRDirection;// swipe手势清扫方向
JobsKey(_swipeGRDirection)
@dynamic swipeGRDirection;
-(UISwipeGestureRecognizerDirection)swipeGRDirection{
    return [Jobs_getAssociatedObject(_swipeGRDirection) unsignedIntegerValue];
}

-(void)setSwipeGRDirection:(UISwipeGestureRecognizerDirection)swipeGRDirection{
    Jobs_setAssociatedRETAIN_NONATOMIC(_swipeGRDirection, @(swipeGRDirection))
}
#pragma mark —— @property(nonatomic,assign)UIScrollTypeMask allowedScrollTypesMask;
JobsKey(_allowedScrollTypesMask)
@dynamic allowedScrollTypesMask;
-(UIScrollTypeMask)allowedScrollTypesMask{
    return [Jobs_getAssociatedObject(_allowedScrollTypesMask) integerValue];
}

-(void)setAllowedScrollTypesMask:(UIScrollTypeMask)allowedScrollTypesMask{
    Jobs_setAssociatedRETAIN_NONATOMIC(_allowedScrollTypesMask, @(allowedScrollTypesMask))
}
#pragma mark —— @property(nonatomic,assign)CGFloat scale;
JobsKey(_scale)
@dynamic scale;
-(CGFloat)scale{
    return [Jobs_getAssociatedObject(_scale) floatValue];
}

-(void)setScale:(CGFloat)scale{
    Jobs_setAssociatedRETAIN_NONATOMIC(_scale, @(scale))
}
#pragma mark —— @property(nonatomic,assign)CGFloat rotate;
JobsKey(_rotate)
@dynamic rotate;
-(CGFloat)rotate{
    return [Jobs_getAssociatedObject(_rotate) floatValue];
}

-(void)setRotate:(CGFloat)rotate{
    Jobs_setAssociatedRETAIN_NONATOMIC(_rotate, @(rotate))
}
#pragma mark —— @property(nonatomic,strong)UILongPressGestureRecognizer *longPressGR;// 长按手势
JobsKey(_longPressGR)
@dynamic longPressGR;
-(UILongPressGestureRecognizer *)longPressGR{
    UILongPressGestureRecognizer *LongPressGR = Jobs_getAssociatedObject(_longPressGR);
    if (!LongPressGR) {
        LongPressGR = UILongPressGestureRecognizer.new;
        NSLog(@"self.target = %@",self.target);
        LongPressGR.delegate = self.target;
        if (self.minimumPressDuration) {
            LongPressGR.minimumPressDuration = self.minimumPressDuration;// longPressGR最小长按时间,默认0.5
        }
        if (self.numberOfTouchesRequired) {
            LongPressGR.numberOfTouchesRequired = self.numberOfTouchesRequired;// 设置手指字数,默认1
        }
        if (self.allowableMovement) {
            LongPressGR.allowableMovement = self.allowableMovement;// 手势失败前允许的最大像素移动,默认10
        }
        if (self.longPressGR_SelImp.selector) {
            [LongPressGR addTarget:self.target action:self.longPressGR_SelImp.selector];
        }
        [self addGestureRecognizer:LongPressGR];
        Jobs_setAssociatedRETAIN_NONATOMIC(_longPressGR, LongPressGR)
    }return LongPressGR;
}

-(void)setLongPressGR:(UILongPressGestureRecognizer *)longPressGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_longPressGR, longPressGR)
}
#pragma mark —— @property(nonatomic,strong)UITapGestureRecognizer *tapGR;// 点击手势
JobsKey(_tapGR)
@dynamic tapGR;
-(UITapGestureRecognizer *)tapGR{
    UITapGestureRecognizer *TapGR = Jobs_getAssociatedObject(_tapGR);
    if (!TapGR) {
        TapGR = UITapGestureRecognizer.new;
        NSLog(@"self.target = %@",self.target);
        TapGR.delegate = self.target;
        if (self.numberOfTapsRequired) {
            TapGR.numberOfTapsRequired = self.numberOfTapsRequired;// 设置轻拍次数,默认0
        }
        if (self.numberOfTouchesRequired) {
            TapGR.numberOfTouchesRequired = self.numberOfTouchesRequired;// 设置手指字数,默认1
        }
        if (self.tapGR_SelImp.selector) {
            [TapGR addTarget:self.target action:self.tapGR_SelImp.selector];
        }
        [self addGestureRecognizer:TapGR];
        Jobs_setAssociatedRETAIN_NONATOMIC(_tapGR, TapGR)
    }return TapGR;
}

-(void)setTapGR:(UITapGestureRecognizer *)tapGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tapGR, tapGR)
}
#pragma mark —— @property(nonatomic,strong)UISwipeGestureRecognizer *swipeGR;// 轻扫手势
JobsKey(_swipeGR)
@dynamic swipeGR;
-(UISwipeGestureRecognizer *)swipeGR{
    UISwipeGestureRecognizer *SwipeGR = Jobs_getAssociatedObject(_swipeGR);
    if (!SwipeGR) {
        SwipeGR = UISwipeGestureRecognizer.new;
        NSLog(@"self.target = %@",self.target);
        SwipeGR.delegate = self.target;
        SwipeGR.direction = self.swipeGRDirection;// 清扫方向。如果多组可以用|来进行,默认UISwipeGestureRecognizerDirectionRight
        SwipeGR.numberOfTouchesRequired = self.numberOfTouchesRequired;// 设置手指字数,默认1
        if (self.swipeGR_SelImp.selector) {
            [SwipeGR addTarget:self.target
                        action:self.swipeGR_SelImp.selector];
        }
        [self addGestureRecognizer:SwipeGR];
        Jobs_setAssociatedRETAIN_NONATOMIC(_swipeGR, SwipeGR)
    }return SwipeGR;
}

-(void)setSwipeGR:(UISwipeGestureRecognizer *)swipeGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_swipeGR, swipeGR)
}
#pragma mark —— @property(nonatomic,strong)UIPanGestureRecognizer *panGR;// 平移手势
JobsKey(_panGR)
@dynamic panGR;
-(UIPanGestureRecognizer *)panGR{
    UIPanGestureRecognizer *PanGR = Jobs_getAssociatedObject(_panGR);
    if (!PanGR) {
        PanGR = UIPanGestureRecognizer.new;
        NSLog(@"self.target = %@",self.target);
        PanGR.delegate = self.target;
        PanGR.minimumNumberOfTouches = self.minimumNumberOfTouches;
        if (@available(iOS 13.4, *)) {
            PanGR.allowedScrollTypesMask = self.allowedScrollTypesMask;
        }
        if (self.panGR_SelImp.selector) {
            [PanGR addTarget:self.target
                      action:self.panGR_SelImp.selector];
        }
        [self addGestureRecognizer:PanGR];
        [self setPanGR:PanGR];
        Jobs_setAssociatedRETAIN_NONATOMIC(_panGR, PanGR)
    }return PanGR;
}

-(void)setPanGR:(UIPanGestureRecognizer *)panGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_panGR, panGR)
}
#pragma mark —— @property(nonatomic,strong)UIPinchGestureRecognizer *pinchGR;// 捏合（缩放）手势
JobsKey(_pinchGR)
@dynamic pinchGR;
-(UIPinchGestureRecognizer *)pinchGR{
    UIPinchGestureRecognizer *PinchGR = Jobs_getAssociatedObject(_pinchGR);
    if (!PinchGR) {
        PinchGR = UIPinchGestureRecognizer.new;
        NSLog(@"self.target = %@",self.target);
        PinchGR.delegate = self.target;
        PinchGR.scale = self.scale;
        if (self.pinchGR_SelImp.selector) {
            [PinchGR addTarget:self.target
                        action:self.pinchGR_SelImp.selector];
        }
        [self addGestureRecognizer:PinchGR];
        Jobs_setAssociatedRETAIN_NONATOMIC(_pinchGR, PinchGR)
    }return PinchGR;
}

-(void)setPinchGR:(UIPinchGestureRecognizer *)pinchGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_pinchGR, pinchGR)
}
#pragma mark —— @property(nonatomic,strong)UIRotationGestureRecognizer *rotationGR;// 旋转手势
JobsKey(_rotationGR)
@dynamic rotationGR;
-(UIRotationGestureRecognizer *)rotationGR{
    UIRotationGestureRecognizer *RotationGR = Jobs_getAssociatedObject(_rotationGR);
    if (!RotationGR) {
        RotationGR = UIRotationGestureRecognizer.new;
        NSLog(@"self.target = %@",self.target);
        RotationGR.delegate = self.target;
        RotationGR.rotation = self.rotate;
        if (self.rotationGR_SelImp.selector) {
            [RotationGR addTarget:self.target
                           action:self.rotationGR_SelImp.selector];
        }
        [self addGestureRecognizer:RotationGR];
        Jobs_setAssociatedRETAIN_NONATOMIC(_rotationGR, RotationGR)
    }return RotationGR;
}

-(void)setRotationGR:(UIRotationGestureRecognizer *)rotationGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_rotationGR, rotationGR)
}
#pragma mark —— @property(nonatomic,strong)UIScreenEdgePanGestureRecognizer *screenEdgePanGR;// 屏幕边缘平移
JobsKey(_screenEdgePanGR)
@dynamic screenEdgePanGR;
-(UIScreenEdgePanGestureRecognizer *)screenEdgePanGR{
    UIScreenEdgePanGestureRecognizer *ScreenEdgePanGR = Jobs_getAssociatedObject(_screenEdgePanGR);
    if (!ScreenEdgePanGR) {
        ScreenEdgePanGR = UIScreenEdgePanGestureRecognizer.new;
        NSLog(@"self.target = %@",self.target);
        ScreenEdgePanGR.delegate = self.target;
        if (self.screenEdgePanGR_SelImp.selector) {
            [ScreenEdgePanGR addTarget:self.target
                                action:self.screenEdgePanGR_SelImp.selector];
        }
        [self addGestureRecognizer:ScreenEdgePanGR];
        Jobs_setAssociatedRETAIN_NONATOMIC(_screenEdgePanGR, ScreenEdgePanGR)
    }return ScreenEdgePanGR;
}

-(void)setScreenEdgePanGR:(UIScreenEdgePanGestureRecognizer *)screenEdgePanGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_screenEdgePanGR, screenEdgePanGR)
}
#pragma mark —— @property(nonatomic,strong)JobsSEL_IMP *longPressGR_SelImp;
JobsKey(_longPressGR_SelImp)
@dynamic longPressGR_SelImp;
-(JobsSEL_IMP *)longPressGR_SelImp{
    JobsSEL_IMP *SEL_IMP = Jobs_getAssociatedObject(_longPressGR_SelImp);
    if (!SEL_IMP) {
        SEL_IMP = JobsSEL_IMP.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_longPressGR_SelImp, SEL_IMP)
    }return SEL_IMP;
}

-(void)setLongPressGR_SelImp:(JobsSEL_IMP *)longPressGR_SelImp{
    Jobs_setAssociatedRETAIN_NONATOMIC(_longPressGR_SelImp, longPressGR_SelImp)
}
#pragma mark —— @property(nonatomic,strong)JobsSEL_IMP *tapGR_SelImp;
JobsKey(_tapGR_SelImp)
@dynamic tapGR_SelImp;
-(JobsSEL_IMP *)tapGR_SelImp{
    JobsSEL_IMP *SEL_IMP = Jobs_getAssociatedObject(_tapGR_SelImp);
    if (!SEL_IMP) {
        SEL_IMP = JobsSEL_IMP.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_tapGR_SelImp, SEL_IMP)
    }return SEL_IMP;
}

-(void)setTapGR_SelImp:(JobsSEL_IMP *)tapGR_SelImp{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tapGR_SelImp, tapGR_SelImp)
}
#pragma mark —— @property(nonatomic,strong)JobsSEL_IMP *swipeGR_SelImp;
JobsKey(_swipeGR_SelImp)
@dynamic swipeGR_SelImp;
-(JobsSEL_IMP *)swipeGR_SelImp{
    JobsSEL_IMP *SEL_IMP = Jobs_getAssociatedObject(_swipeGR_SelImp);
    if (!SEL_IMP) {
        SEL_IMP = JobsSEL_IMP.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_swipeGR_SelImp, SEL_IMP)
    }return SEL_IMP;
}
-(void)setSwipeGR_SelImp:(JobsSEL_IMP *)swipeGR_SelImp{
    Jobs_setAssociatedRETAIN_NONATOMIC(_swipeGR_SelImp, swipeGR_SelImp)
}
#pragma mark —— @property(nonatomic,strong)JobsSEL_IMP *panGR_SelImp;
JobsKey(_panGR_SelImp)
@dynamic panGR_SelImp;
-(JobsSEL_IMP *)panGR_SelImp{
    JobsSEL_IMP *SEL_IMP = Jobs_getAssociatedObject(_panGR_SelImp);
    if (!SEL_IMP) {
        SEL_IMP = JobsSEL_IMP.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_panGR_SelImp, SEL_IMP)
    }return SEL_IMP;
}

-(void)setPanGR_SelImp:(JobsSEL_IMP *)panGR_SelImp{
    Jobs_setAssociatedRETAIN_NONATOMIC(_panGR_SelImp, panGR_SelImp)
}
#pragma mark —— @property(nonatomic,strong)JobsSEL_IMP *pinchGR_SelImp;
JobsKey(_pinchGR_SelImp)
@dynamic pinchGR_SelImp;
-(JobsSEL_IMP *)pinchGR_SelImp{
    JobsSEL_IMP *SEL_IMP = Jobs_getAssociatedObject(_pinchGR_SelImp);
    if (!SEL_IMP) {
        SEL_IMP = JobsSEL_IMP.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_pinchGR_SelImp, SEL_IMP)
    }return SEL_IMP;
}

-(void)setPinchGR_SelImp:(JobsSEL_IMP *)pinchGR_SelImp{
    Jobs_setAssociatedRETAIN_NONATOMIC(_pinchGR_SelImp, pinchGR_SelImp)
}
#pragma mark —— @property(nonatomic,strong)JobsSEL_IMP *rotationGR_SelImp;
JobsKey(_rotationGR_SelImp)
@dynamic rotationGR_SelImp;
-(JobsSEL_IMP *)rotationGR_SelImp{
    JobsSEL_IMP *SEL_IMP = Jobs_getAssociatedObject(_rotationGR_SelImp);
    if (!SEL_IMP) {
        SEL_IMP = JobsSEL_IMP.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_rotationGR_SelImp, SEL_IMP)
    }return SEL_IMP;
}

-(void)setRotationGR_SelImp:(JobsSEL_IMP *)rotationGR_SelImp{
    Jobs_setAssociatedRETAIN_NONATOMIC(_rotationGR_SelImp, rotationGR_SelImp)
}
#pragma mark —— @property(nonatomic,strong)JobsSEL_IMP *screenEdgePanGR_SelImp;
JobsKey(_screenEdgePanGR_SelImp)
@dynamic screenEdgePanGR_SelImp;
-(JobsSEL_IMP *)screenEdgePanGR_SelImp{
    JobsSEL_IMP *SEL_IMP = Jobs_getAssociatedObject(_screenEdgePanGR_SelImp);
    if (!SEL_IMP) {
        SEL_IMP = JobsSEL_IMP.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_screenEdgePanGR_SelImp, SEL_IMP)
    }return SEL_IMP;
}

-(void)setScreenEdgePanGR_SelImp:(JobsSEL_IMP *)screenEdgePanGR_SelImp{
    Jobs_setAssociatedRETAIN_NONATOMIC(_screenEdgePanGR_SelImp, screenEdgePanGR_SelImp)
}

@end

