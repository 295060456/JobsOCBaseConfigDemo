//
//  CAShapeLayer+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/5/9.
//

#import <QuartzCore/QuartzCore.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAShapeLayer (Extra)
/// 迎合链式语法而做的封装
-(JobsReturnCAShapeLayerByCGFloatBlock _Nonnull)lineWidthBy;
-(JobsReturnCAShapeLayerByCorBlock _Nonnull)strokeColorBy;
-(JobsReturnCAShapeLayerByCGColorRefBlock _Nonnull)strokeColorByCGColorRef;
-(JobsReturnCAShapeLayerByBezierPathBlock _Nonnull)pathByBezierPath;
-(JobsReturnCAShapeLayerByCGPathRefBlock _Nonnull)pathByPathRef;
-(JobsReturnCAShapeLayerByCorBlock _Nonnull)fillColorBy;
-(JobsReturnCAShapeLayerByCGColorRefBlock _Nonnull)fillColorByGColorRef;

@end

NS_ASSUME_NONNULL_END
