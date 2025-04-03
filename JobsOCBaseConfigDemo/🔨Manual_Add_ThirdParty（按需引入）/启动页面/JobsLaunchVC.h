//
//  JobsLaunchVC.h
//  FMOnlyH5
//
//  Created by Admin on 3/4/2025.
//

#import "BaseViewController.h"
#import "NSObject+Extras.h"
#import "FMHomeWebVC.h"

NS_ASSUME_NONNULL_BEGIN
/// 系统的启动页因为版本升级兼容度降低的问题，现在为了统一处理，即摒弃系统设置
/// 本页是对系统提供的Api接口LaunchScreen.storyboard的一个平替处理方案
/// 可以在这个基础上进行拓展：网络图文、倒计时按钮触发等一系列功能
@interface JobsLaunchVC : BaseViewController

@end

NS_ASSUME_NONNULL_END
