//
//  UIWindow+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (Extra)
/// 横屏模式下的Window（宽高互换）
-(__kindof UIWindow *)landscape;

@end

NS_ASSUME_NONNULL_END
