//
//  JobsLaunchDef.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/20.
//

#ifndef JobsLaunchDef_h
#define JobsLaunchDef_h

#ifndef JOBS_LAUNCH_BG_TYPE_ENUM_DEFINED
#define JOBS_LAUNCH_BG_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsLaunchBgType) {
    JobsLaunchBgType_Image = 0, /// 背景只是一张图
    JobsLaunchBgType_video      /// 背景是视频资源
};
#endif /* JOBS_LAUNCH_BG_TYPE_ENUM_DEFINED */

#ifndef LaunchConfig
#define LaunchConfig JobsLaunchConfig.sharedInstance
#endif

#endif /* JobsLaunchDef_h */
