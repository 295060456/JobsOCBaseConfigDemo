//
//  JobsLaunchConfig.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import "UITextModelProtocol.h"
#import "UIViewModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLaunchConfig : NSObject
<
UITextModelProtocol
,UIViewModelProtocol
>

+(void)destroyAppDoorSingleton;
+(instancetype)sharedInstance;
#pragma mark —— 关于跳过按钮的配置
/// 请使用 UITextModelProtocol 里面的属性 和 UIViewModelProtocol里面的部分属性


@end

NS_ASSUME_NONNULL_END
