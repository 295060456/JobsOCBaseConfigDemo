
//
//  GestureProtocol.h
//  FM
//
//  Created by Admin on 25/12/2024.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"
#import "BaseProtocol.h"

@class JobsSEL_IMP;

NS_ASSUME_NONNULL_BEGIN

@protocol GestureProtocol <BaseProtocol>
@optional
Prop_assign()NSUInteger minimumNumberOfTouches API_UNAVAILABLE(tvos);
Prop_assign()NSUInteger maximumNumberOfTouches API_UNAVAILABLE(tvos);
Prop_assign()NSUInteger numberOfTapsRequired;/// 设置轻拍次数【UILongPressGestureRecognizer】【UITapGestureRecognizer】⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
Prop_assign()NSUInteger numberOfTouchesRequired;/// 设置手指字数【UILongPressGestureRecognizer】【UITapGestureRecognizer】
Prop_assign()NSTimeInterval minimumPressDuration;/// longPressGR最小长按时间【UILongPressGestureRecognizer】
Prop_assign()CGFloat allowableMovement;///【UILongPressGestureRecognizer】
Prop_assign()UISwipeGestureRecognizerDirection swipeGRDirection;/// swipe手势清扫方向
Prop_assign()UIScrollTypeMask allowedScrollTypesMask API_AVAILABLE(ios(13.4));
Prop_assign()CGFloat scale;/// 捏合范围
Prop_assign()CGFloat rotate;/// 旋转角度
// UIGestureRecognizer
Prop_strong(nullable)UILongPressGestureRecognizer *longPressGR;/// 长按手势
Prop_strong(nullable)UITapGestureRecognizer *tapGR;/// 点击手势
Prop_strong(nullable)UITapGestureRecognizer *doubleTapGR;/// 双击手势
Prop_strong(nullable)UISwipeGestureRecognizer *swipeGR;/// 轻扫手势
Prop_strong(nullable)UIPanGestureRecognizer *panGR;/// 平移手势
Prop_strong(nullable)UIPinchGestureRecognizer *pinchGR;/// 捏合（缩放）手势
Prop_strong(nullable)UIRotationGestureRecognizer *rotationGR;/// 旋转手势
Prop_strong(nullable)UIScreenEdgePanGestureRecognizer *screenEdgePanGR;/// 屏幕边缘平移
// action
Prop_strong(nullable)JobsSEL_IMP *longPressGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *tapGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *doubleTapGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *swipeGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *panGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *pinchGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *rotationGR_SelImp;
Prop_strong(nullable)JobsSEL_IMP *screenEdgePanGR_SelImp;

-(void)Dealloc;

@end

NS_ASSUME_NONNULL_END

#ifndef GestureProtocol_synthesize
#define GestureProtocol_synthesize \
\
@synthesize minimumNumberOfTouches = _minimumNumberOfTouches; \
@synthesize maximumNumberOfTouches = _maximumNumberOfTouches; \
@synthesize numberOfTapsRequired = _numberOfTapsRequired; \
@synthesize numberOfTouchesRequired = _numberOfTouchesRequired; \
@synthesize minimumPressDuration = _minimumPressDuration; \
@synthesize allowableMovement = _allowableMovement; \
@synthesize swipeGRDirection = _swipeGRDirection; \
@synthesize allowedScrollTypesMask = _allowedScrollTypesMask; \
@synthesize scale = _scale; \
@synthesize rotate = _rotate; \
\
@synthesize longPressGR = _longPressGR; \
@synthesize tapGR = _tapGR; \
@synthesize doubleTapGR = _doubleTapGR; \
@synthesize swipeGR = _swipeGR; \
@synthesize panGR = _panGR; \
@synthesize pinchGR = _pinchGR; \
@synthesize rotationGR = _rotationGR; \
@synthesize screenEdgePanGR = _screenEdgePanGR; \
\
@synthesize longPressGR_SelImp = _longPressGR_SelImp; \
@synthesize tapGR_SelImp = _tapGR_SelImp; \
@synthesize doubleTapGR_SelImp = _doubleTapGR_SelImp; \
@synthesize swipeGR_SelImp = _swipeGR_SelImp; \
@synthesize panGR_SelImp = _panGR_SelImp; \
@synthesize pinchGR_SelImp = _pinchGR_SelImp; \
@synthesize rotationGR_SelImp = _rotationGR_SelImp; \
@synthesize screenEdgePanGR_SelImp = _screenEdgePanGR_SelImp; \

#endif /* GestureProtocol_synthesize */

#ifndef GestureProtocol_dynamic
#define GestureProtocol_dynamic \
\
@dynamic minimumNumberOfTouches; \
@dynamic maximumNumberOfTouches; \
@dynamic numberOfTapsRequired; \
@dynamic numberOfTouchesRequired; \
@dynamic minimumPressDuration; \
@dynamic allowableMovement; \
@dynamic swipeGRDirection; \
@dynamic allowedScrollTypesMask; \
@dynamic scale; \
@dynamic rotate; \
\
@dynamic longPressGR; \
@dynamic tapGR; \
@dynamic doubleTapGR; \
@dynamic swipeGR; \
@dynamic panGR; \
@dynamic pinchGR; \
@dynamic rotationGR; \
@dynamic screenEdgePanGR; \
\
@dynamic longPressGR_SelImp; \
@dynamic tapGR_SelImp; \
@dynamic doubleTapGR_SelImp; \
@dynamic swipeGR_SelImp; \
@dynamic panGR_SelImp; \
@dynamic pinchGR_SelImp; \
@dynamic rotationGR_SelImp; \
@dynamic screenEdgePanGR_SelImp; \

#endif /* GestureProtocol_dynamic */
