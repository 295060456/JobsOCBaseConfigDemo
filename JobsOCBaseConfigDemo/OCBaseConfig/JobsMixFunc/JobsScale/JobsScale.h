//
//  JobsScale.h
//  FM
//
//  Created by Mac on 9/22/25.
//

#import <UIKit/UIKit.h>
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
/// 在 App 入口处配置一次（设计稿尺寸，比如 375x812）
FOUNDATION_EXPORT void JXScaleSetup(CGFloat designWidth, CGFloat designHeight);
/// 可选：按安全区可用高度/宽度来算比例（会读取 keyWindow 的 safeAreaInsets）
FOUNDATION_EXPORT void JXScaleSetupUsingSafeArea(CGFloat designWidth, CGFloat designHeight);
/// 水平方向缩放（基于设计稿宽度）
FOUNDATION_EXPORT CGFloat w(CGFloat value);
/// 垂直方向缩放（基于设计稿高度）
FOUNDATION_EXPORT CGFloat h(CGFloat value);
/// 字体缩放（通常跟宽度一致，你也可以改成 min(scaleX, scaleY)）
FOUNDATION_EXPORT CGFloat fz(CGFloat fontPointSize);
/// 获取当前比例（调试/自检用）
FOUNDATION_EXPORT CGFloat JXScaleX(void);
FOUNDATION_EXPORT CGFloat JXScaleY(void);

NS_ASSUME_NONNULL_END
