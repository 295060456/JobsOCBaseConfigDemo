//
//  UIView+Gesture.h
//  DouDong-II
//
//  Created by Jobs on 2021/1/4.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "GestureProtocol.h"
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
@interface UIView (Gesture)<GestureProtocol>

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
     _adView.weak_target = self;/// ⚠️注意：任何手势这一句都要写

     {
         _adView.longPressGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable weakSelf,
                                                                                     UILongPressGestureRecognizer *  _Nullable arg) {
            JobsLog(@"长按手势被触发");
            return nil;
         }];
         _adView.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
     }

     {
         _adView.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target,
                                                                               UITapGestureRecognizer *_Nullable arg) {
            JobsLog(@"单击手势被触发");
            return nil;
         }];
         _adView.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
     }
     
     {
         _adView.doubleTapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target, UITapGestureRecognizer *_Nullable arg) {
             JobsLog(@"双击手势被触发");
             return nil;
         }];
         _adView.doubleTapGR.enabled = YES; // 必须在设置完Target和selector以后方可开启执行
     }

 }

 */
