//
//  UIWindow+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/10.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (Extra)

+(JobsReturnWindowByWindowSceneBlock _Nonnull)initByScene;
/// 横屏模式下的Window（宽高互换）
-(__kindof UIWindow *)landscape;
/// 横屏模式下Window的宽高互换
-(JobsReturnCGRectByVoidBlock _Nonnull)landscapeWindowFrame;

@end

NS_ASSUME_NONNULL_END
