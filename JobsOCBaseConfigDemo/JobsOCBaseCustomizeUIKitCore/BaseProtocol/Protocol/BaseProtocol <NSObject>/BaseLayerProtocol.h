//
//  BaseLayerProtocol.h
//  FM
//
//  Created by Admin on 11/12/2024.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseLayerProtocol <NSObject>
@optional
Prop_assign()CGFloat cornerRadiusValue;/// 圆切角—作用于所有的角
Prop_assign()UIRectCorner roundingCorners;/// ❤️这个属性如果不是UIRectCornerAllCorners，在某些情况下，按钮会不可见 圆切角—作用于指定的方位   ❤️这个属性如果不是UIRectCornerAllCorners，在某些情况下，按钮会不可见
Prop_assign()CGSize roundingCornersRadii;/// 圆切角—指定方位的Size大小
Prop_strong(nullable)UIColor *layerBorderCor;/// 描边的颜色
Prop_assign()CGFloat borderWidth;/// 描边线的宽度
Prop_assign()BOOL masksToBounds;

@end

NS_ASSUME_NONNULL_END

#ifndef BaseLayerProtocol_synthesize_part1
#define BaseLayerProtocol_synthesize_part1 \
\
@synthesize layerBorderCor = _layerBorderCor;\

#endif /* BaseLayerProtocol_synthesize_part1 */

#ifndef BaseLayerProtocol_synthesize_part2
#define BaseLayerProtocol_synthesize_part2 \
\
@synthesize borderWidth = _borderWidth;\

#endif /* BaseLayerProtocol_synthesize_part2 */

#ifndef BaseLayerProtocol_synthesize_part3
#define BaseLayerProtocol_synthesize_part3 \
\
@synthesize cornerRadiusValue = _cornerRadiusValue;\
@synthesize masksToBounds = _masksToBounds;\
@synthesize roundingCorners = _roundingCorners;\
@synthesize roundingCornersRadii = _roundingCornersRadii;\

#endif /* BaseLayerProtocol_synthesize_part3 */

#ifndef BaseLayerProtocol_synthesize
#define BaseLayerProtocol_synthesize \
\
BaseLayerProtocol_synthesize_part1 \
BaseLayerProtocol_synthesize_part2 \
BaseLayerProtocol_synthesize_part3 \

#endif /* BaseLayerProtocol_synthesize */

#ifndef BaseLayerProtocol_dynamic
#define BaseLayerProtocol_dynamic \
\
@dynamic layerBorderCor;\
@dynamic borderWidth;\
@dynamic cornerRadiusValue;\
@dynamic masksToBounds;\
@dynamic roundingCorners;\
@dynamic roundingCornersRadii;\

#endif /* BaseLayerProtocol_dynamic */
