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
-(JobsRetCAShapeLayerByCGFloatBlock _Nonnull)lineWidthBy;
-(JobsRetCAShapeLayerByCorBlock _Nonnull)strokeColorBy;
-(JobsRetCAShapeLayerByCGCorRefBlock _Nonnull)strokeColorByCGColorRef;
-(JobsRetCAShapeLayerByBezierPathBlock _Nonnull)pathByBezierPath;
-(JobsRetCAShapeLayerByCGPathRefBlock _Nonnull)pathByPathRef;
-(JobsRetCAShapeLayerByCorBlock _Nonnull)fillColorBy;
-(JobsRetCAShapeLayerByCGCorRefBlock _Nonnull)fillColorByGColorRef;

@end

NS_ASSUME_NONNULL_END
