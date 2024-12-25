//
//  UIView+Gesture.m
//  DouDong-II
//
//  Created by Jobs on 2021/1/4.
//

#import "UIView+Gesture.h"

#warning —— 本类不实现UIGestureRecognizerDelegate的原因说明:覆盖了 UISCrollView 里面对应的方法
@implementation UIView (Gesture)
#pragma mark —— 一些私有方法
-(void)gesture:(UIGestureRecognizer *_Nullable)gesture
        action:(SEL _Nullable)action{
    if (gesture) {
        gesture.target = self.weak_target;
        gesture.removeAction(action);
    }
}

-(JobsReturnGestureRecognizerByVoidStarBlock _Nonnull)deallocBy{
    @jobs_weakify(self)
    return ^__kindof UIGestureRecognizer *_Nullable(void *_Nullable key){
        @jobs_strongify(self)
        return objc_getAssociatedObject(self, key);
    };
}
#pragma mark —— 一些公有方法
-(void)defaultFunc{
    JobsLog(@"defaultFunc");
}
#pragma mark —— GestureProtocol
/// 取消注册各种手势对应的方法
-(void)Dealloc{
    [self gesture:self.deallocBy(_longPressGR) action:self.longPressGR_SelImp.selector];/// UILongPressGestureRecognizer
    [self gesture:self.deallocBy(_tapGR) action:self.tapGR_SelImp.selector]; /// UITapGestureRecognizer
    [self gesture:self.deallocBy(_doubleTapGR) action:self.doubleTapGR_SelImp.selector]; /// UITapGestureRecognizer
    [self gesture:self.deallocBy(_swipeGR) action:self.swipeGR_SelImp.selector]; /// UISwipeGestureRecognizer
    [self gesture:self.deallocBy(_panGR) action:self.panGR_SelImp.selector]; /// UIPanGestureRecognizer
    [self gesture:self.deallocBy(_pinchGR) action:self.pinchGR_SelImp.selector]; /// UIPinchGestureRecognizer
    [self gesture:self.deallocBy(_rotationGR) action:self.rotationGR_SelImp.selector]; /// UIRotationGestureRecognizer
    [self gesture:self.deallocBy(_screenEdgePanGR)  action:self.screenEdgePanGR_SelImp.selector]; /// UIScreenEdgePanGestureRecognizer
}
/// @property(nonatomic,assign)NSUInteger minimumNumberOfTouches API_UNAVAILABLE(tvos);
PROP_NSUInteger(minimumNumberOfTouches, MinimumNumberOfTouches)
/// @property(nonatomic,assign)NSUInteger maximumNumberOfTouches API_UNAVAILABLE(tvos);
PROP_NSUInteger(maximumNumberOfTouches, MaximumNumberOfTouches)
/// @property(nonatomic,assign)NSUInteger numberOfTapsRequired;// 设置轻拍次数【UILongPressGestureRecognizer】【UITapGestureRecognizer】
PROP_NSUInteger(numberOfTapsRequired, NumberOfTapsRequired)
/// @property(nonatomic,assign)NSUInteger numberOfTouchesRequired;// 设置手指字数【UILongPressGestureRecognizer】【UITapGestureRecognizer】
PROP_NSUInteger(numberOfTouchesRequired, NumberOfTouchesRequired)
///@property(nonatomic,assign)NSTimeInterval minimumPressDuration;// longPressGR最小长按时间【UILongPressGestureRecognizer】
PROP_DOUBLE(minimumPressDuration, MinimumPressDuration)
/// @property(nonatomic,assign)CGFloat allowableMovement;//【UILongPressGestureRecognizer】
PROP_CGFloat(allowableMovement, AllowableMovement)
/// @property(nonatomic,assign)UISwipeGestureRecognizerDirection swipeGRDirection;// swipe手势清扫方向
PROP_NSUInteger(swipeGRDirection, SwipeGRDirection)
/// @property(nonatomic,assign)UIScrollTypeMask allowedScrollTypesMask;
PROP_NSInteger(allowedScrollTypesMask, AllowedScrollTypesMask)
/// @property(nonatomic,assign)CGFloat scale;
PROP_CGFloat(scale, Scale)
/// @property(nonatomic,assign)CGFloat rotate;
PROP_CGFloat(rotate, Rotate)
#pragma mark —— @property(nonatomic,strong)UILongPressGestureRecognizer *longPressGR;// 长按手势
JobsKey(_longPressGR)
@dynamic longPressGR;
-(UILongPressGestureRecognizer *)longPressGR{
    UILongPressGestureRecognizer *LongPressGR = Jobs_getAssociatedObject(_longPressGR);
    JobsLog(@"self.weak_target = %@",self.weak_target);
    if (!LongPressGR) {
        @jobs_weakify(self)
        LongPressGR = jobsMakeLongPressGesture(^(__kindof UILongPressGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            gesture.delegate = self.weak_target;
            if (self.minimumPressDuration)  gesture.minimumPressDuration = self.minimumPressDuration;// longPressGR最小长按时间,默认0.5
            if (self.numberOfTouchesRequired) gesture.numberOfTouchesRequired = self.numberOfTouchesRequired;// 设置手指字数,默认1
            if (self.allowableMovement) gesture.allowableMovement = self.allowableMovement;// 手势失败前允许的最大像素移动,默认10
            if (self.longPressGR_SelImp.selector) {
                gesture.addAction(self.longPressGR_SelImp.selector);
            }self.addGesture(gesture);
            [self setLongPressGR:gesture];
        });
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
    JobsLog(@"self.weak_target = %@",self.weak_target);
    if (!TapGR) {
        @jobs_weakify(self)
        TapGR = jobsMakeTapGesture(^(__kindof UITapGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            gesture.delegate = self.weak_target;
            if (self.numberOfTapsRequired) gesture.numberOfTapsRequired = self.numberOfTapsRequired;// 设置轻拍次数,默认0
            if (self.numberOfTouchesRequired) gesture.numberOfTouchesRequired = self.numberOfTouchesRequired;// 设置手指字数,默认1
            if (self.tapGR_SelImp.selector) gesture.addAction(self.tapGR_SelImp.selector);
            self.addGesture(gesture);
            [self setTapGR:gesture];
        });
    }return TapGR;
}

-(void)setTapGR:(UITapGestureRecognizer *)tapGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tapGR, tapGR)
}
#pragma mark —— @property(nonatomic,strong)UITapGestureRecognizer *doubleTapGR;/// 双击手势
JobsKey(_doubleTapGR)
@dynamic doubleTapGR;
-(UITapGestureRecognizer *)doubleTapGR{
    UITapGestureRecognizer *DoubleTapGR = Jobs_getAssociatedObject(_doubleTapGR);
    JobsLog(@"self.weak_target = %@",self.weak_target);
    if (!DoubleTapGR) {
        @jobs_weakify(self)
        DoubleTapGR = jobsMakeTapGesture(^(__kindof UITapGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            gesture.delegate = self.weak_target;
            gesture.numberOfTapsRequired = 2; // 设置为双击
            gesture.numberOfTouchesRequired = self.numberOfTouchesRequired ? self.numberOfTouchesRequired : 1; // 设置手指字数, 默认1
            if (self.doubleTapGR_SelImp.selector) gesture.addAction(self.doubleTapGR_SelImp.selector);
            self.addGesture(gesture);
            [self setDoubleTapGR:gesture];
        });
    }return DoubleTapGR;
}

-(void)setDoubleTapGR:(UITapGestureRecognizer *)doubleTapGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_doubleTapGR, doubleTapGR)
}
#pragma mark —— @property(nonatomic,strong)UISwipeGestureRecognizer *swipeGR;// 轻扫手势
JobsKey(_swipeGR)
@dynamic swipeGR;
-(UISwipeGestureRecognizer *)swipeGR{
    UISwipeGestureRecognizer *SwipeGR = Jobs_getAssociatedObject(_swipeGR);
    JobsLog(@"self.weak_target = %@",self.weak_target);
    if (!SwipeGR) {
        @jobs_weakify(self)
        SwipeGR = jobsMakeSwipeGesture(^(__kindof UISwipeGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            gesture.delegate = self.weak_target;
            gesture.direction = self.swipeGRDirection;// 清扫方向。如果多组可以用|来进行,默认UISwipeGestureRecognizerDirectionRight
            gesture.numberOfTouchesRequired = self.numberOfTouchesRequired;// 设置手指字数,默认1
            if (self.swipeGR_SelImp.selector) gesture.addAction(self.swipeGR_SelImp.selector);
            self.addGesture(gesture);
            [self setSwipeGR:gesture];
        });
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
    JobsLog(@"self.weak_target = %@",self.weak_target);
    if (!PanGR) {
        @jobs_weakify(self)
        PanGR = jobsMakePanGesture(^(__kindof UIPanGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            gesture.delegate = self.weak_target;
            gesture.minimumNumberOfTouches = self.minimumNumberOfTouches;
            if (@available(iOS 13.4, *)) gesture.allowedScrollTypesMask = self.allowedScrollTypesMask;
            if (self.panGR_SelImp.selector) gesture.addAction(self.panGR_SelImp.selector);
            self.addGesture(gesture);
            [self setPanGR:gesture];
        });
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
    JobsLog(@"self.weak_target = %@",self.weak_target);
    if (!PinchGR) {
        @jobs_weakify(self)
        PinchGR = jobsMakePinchGesture(^(__kindof UIPinchGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            gesture.delegate = self.weak_target;
            gesture.scale = self.scale;
            if (self.pinchGR_SelImp.selector) gesture.addAction(self.pinchGR_SelImp.selector);
            self.addGesture(gesture);
            [self setPinchGR:gesture];
        });
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
    JobsLog(@"self.weak_target = %@",self.weak_target);
    if (!RotationGR) {
        @jobs_weakify(self)
        RotationGR = jobsMakeRotationGesture(^(__kindof UIRotationGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            gesture.delegate = self.weak_target;
            gesture.rotation = self.rotate;
            if (self.rotationGR_SelImp.selector) gesture.addAction(self.rotationGR_SelImp.selector);
            self.addGesture(gesture);
            [self setRotationGR:gesture];
        });
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
    JobsLog(@"self.weak_target = %@",self.weak_target);
    if (!ScreenEdgePanGR) {
        @jobs_weakify(self)
        ScreenEdgePanGR = jobsMakeScreenEdgePanGestureRecognizer(^(__kindof UIScreenEdgePanGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            gesture.delegate = self.weak_target;
            if (self.screenEdgePanGR_SelImp.selector) gesture.addAction(self.screenEdgePanGR_SelImp.selector);
            self.addGesture(gesture);
            [self setScreenEdgePanGR:gesture];
        });
    }return ScreenEdgePanGR;
}

-(void)setScreenEdgePanGR:(UIScreenEdgePanGestureRecognizer *)screenEdgePanGR{
    Jobs_setAssociatedRETAIN_NONATOMIC(_screenEdgePanGR, screenEdgePanGR)
}
/// @property(nonatomic,strong)JobsSEL_IMP *longPressGR_SelImp;
PROP_STRONG_OBJECT_Default_TYPE(JobsSEL_IMP, longPressGR_SelImp, LongPressGR_SelImp)
/// @property(nonatomic,strong)JobsSEL_IMP *tapGR_SelImp;
PROP_STRONG_OBJECT_Default_TYPE(JobsSEL_IMP, tapGR_SelImp, TapGR_SelImp)
/// @property(nonatomic,strong)JobsSEL_IMP *doubleTapGR_SelImp;
PROP_STRONG_OBJECT_Default_TYPE(JobsSEL_IMP, doubleTapGR_SelImp, DoubleTapGR_SelImp)
/// @property(nonatomic,strong)JobsSEL_IMP *swipeGR_SelImp;
PROP_STRONG_OBJECT_Default_TYPE(JobsSEL_IMP, swipeGR_SelImp, SwipeGR_SelImp)
/// @property(nonatomic,strong)JobsSEL_IMP *panGR_SelImp;
PROP_STRONG_OBJECT_Default_TYPE(JobsSEL_IMP, panGR_SelImp, PanGR_SelImp)
/// @property(nonatomic,strong)JobsSEL_IMP *pinchGR_SelImp;
PROP_STRONG_OBJECT_Default_TYPE(JobsSEL_IMP, pinchGR_SelImp, PinchGR_SelImp)
/// @property(nonatomic,strong)JobsSEL_IMP *rotationGR_SelImp;
PROP_STRONG_OBJECT_Default_TYPE(JobsSEL_IMP, rotationGR_SelImp, RotationGR_SelImp)
/// @property(nonatomic,strong)JobsSEL_IMP *screenEdgePanGR_SelImp;
PROP_STRONG_OBJECT_Default_TYPE(JobsSEL_IMP, screenEdgePanGR_SelImp, ScreenEdgePanGR_SelImp)

@end
