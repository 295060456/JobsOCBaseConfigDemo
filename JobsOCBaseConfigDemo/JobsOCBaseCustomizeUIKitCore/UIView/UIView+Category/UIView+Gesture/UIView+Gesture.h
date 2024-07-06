//
//  UIView+Gesture.h
//  DouDong-II
//
//  Created by Jobs on 2021/1/4.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsString.h"
#import "NSObject+Extras.h"
#import "NSObject+DynamicInvoke.h"

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

/*
 *  UIGestureRecognizer 是父类
 
    UITapGestureRecognizer    轻拍手势【OK】
    UISwipeGestureRecognizer    轻扫手势【OK】
    UILongPressGestureRecognizer    长按手势【OK】
    UIPanGestureRecognizer    平移手势【OK】
    UIPinchGestureRecognizer    捏合（缩放）手势【OK】
    UIRotationGestureRecognizer    旋转手势【OK】
    UIScreenEdgePanGestureRecognizer    屏幕边缘平移【OK】
 *
 */

/*
 * 长按手势是连续的。
 当在指定的时间段（minimumPressDuration）
 按下允许的手指的数量（numberOfTouchesRequired）
 并且触摸不超过允许的移动范围（allowableMovement）时，
 手势开始（UIGestureRecognizerStateBegan）。
 手指移动时，手势识别器转换到“更改”状态，
 并且当任何手指抬起时手势识别器结束（UIGestureRecognizerStateEnded）。
 *
 */

NS_ASSUME_NONNULL_BEGIN

#warning —— 本类不实现UIGestureRecognizerDelegate的原因说明:覆盖了UISCrollView 里面对应的方法

@interface UIView (Gesture)
// config
@property(nonatomic,weak,nullable)id target;
@property(nonatomic,assign)NSUInteger minimumNumberOfTouches API_UNAVAILABLE(tvos);
@property(nonatomic,assign)NSUInteger maximumNumberOfTouches API_UNAVAILABLE(tvos);
@property(nonatomic,assign)NSUInteger numberOfTapsRequired;/// 设置轻拍次数【UILongPressGestureRecognizer】【UITapGestureRecognizer】⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
@property(nonatomic,assign)NSUInteger numberOfTouchesRequired;/// 设置手指字数【UILongPressGestureRecognizer】【UITapGestureRecognizer】
@property(nonatomic,assign)NSTimeInterval minimumPressDuration;/// longPressGR最小长按时间【UILongPressGestureRecognizer】
@property(nonatomic,assign)CGFloat allowableMovement;///【UILongPressGestureRecognizer】
@property(nonatomic,assign)UISwipeGestureRecognizerDirection swipeGRDirection;/// swipe手势清扫方向
@property(nonatomic,assign)UIScrollTypeMask allowedScrollTypesMask API_AVAILABLE(ios(13.4));
@property(nonatomic,assign)CGFloat scale;/// 捏合范围
@property(nonatomic,assign)CGFloat rotate;/// 旋转角度
// UIGestureRecognizer
@property(nonatomic,strong)UILongPressGestureRecognizer *longPressGR;/// 长按手势
@property(nonatomic,strong)UITapGestureRecognizer *tapGR;/// 点击手势
@property(nonatomic,strong)UITapGestureRecognizer *doubleTapGR;/// 双击手势
@property(nonatomic,strong)UISwipeGestureRecognizer *swipeGR;/// 轻扫手势
@property(nonatomic,strong)UIPanGestureRecognizer *panGR;/// 平移手势
@property(nonatomic,strong)UIPinchGestureRecognizer *pinchGR;/// 捏合（缩放）手势
@property(nonatomic,strong)UIRotationGestureRecognizer *rotationGR;/// 旋转手势
@property(nonatomic,strong)UIScreenEdgePanGestureRecognizer *screenEdgePanGR;/// 屏幕边缘平移
// action
@property(nonatomic,strong)JobsSEL_IMP *longPressGR_SelImp;
@property(nonatomic,strong)JobsSEL_IMP *tapGR_SelImp;
@property(nonatomic,strong)JobsSEL_IMP *doubleTapGR_SelImp;
@property(nonatomic,strong)JobsSEL_IMP *swipeGR_SelImp;
@property(nonatomic,strong)JobsSEL_IMP *panGR_SelImp;
@property(nonatomic,strong)JobsSEL_IMP *pinchGR_SelImp;
@property(nonatomic,strong)JobsSEL_IMP *rotationGR_SelImp;
@property(nonatomic,strong)JobsSEL_IMP *screenEdgePanGR_SelImp;

-(void)Dealloc;

@end

NS_ASSUME_NONNULL_END

/**
 调用示例：设置长按手势和点击手势
 {
     _adView.numberOfTouchesRequired = 1;
     _adView.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
     _adView.minimumPressDuration = 0.1;
     _adView.numberOfTouchesRequired = 1;
     _adView.allowableMovement = 1;
     _adView.userInteractionEnabled = YES;
     _adView.target = self;/// ⚠️注意：任何手势这一句都要写

     {
         _adView.longPressGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable weakSelf,
                                                                                     UILongPressGestureRecognizer *  _Nullable arg) {
            NSLog(@"长按手势被触发");
            return nil;
         }];
         _adView.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
     }

     {
         _adView.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target,
                                                                               UITapGestureRecognizer *_Nullable arg) {
            NSLog(@"单击手势被触发");
            return nil;
         }];
         _adView.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
     }
     
     {
         _adView.doubleTapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target, UITapGestureRecognizer *_Nullable arg) {
             NSLog(@"双击手势被触发");
             return nil;
         }];
         _adView.doubleTapGR.enabled = YES; // 必须在设置完Target和selector以后方可开启执行
     }

 }

 */
