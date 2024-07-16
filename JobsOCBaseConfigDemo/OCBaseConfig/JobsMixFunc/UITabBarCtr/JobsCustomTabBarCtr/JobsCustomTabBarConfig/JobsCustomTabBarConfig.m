//
//  JobsCustomTabBarConfig.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import "JobsCustomTabBarConfig.h"

@interface JobsCustomTabBarConfig ()

@end

@implementation JobsCustomTabBarConfig
static JobsCustomTabBarConfig *JobsCustomTabBarConfigInstance = nil;
static dispatch_once_t JobsCustomTabBarConfigOnceToken;
+(instancetype)sharedManager {
    dispatch_once(&JobsCustomTabBarConfigOnceToken, ^{
        JobsCustomTabBarConfigInstance = [super allocWithZone:NULL].init;
    });return JobsCustomTabBarConfigInstance;
}
/// 单例的销毁
+(void)destroyInstance {
    JobsCustomTabBarConfigOnceToken = 0;
    JobsCustomTabBarConfigInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+(instancetype)allocWithZone:(struct _NSZone *)zone {
    dispatch_once(&JobsCustomTabBarConfigOnceToken, ^{
        JobsCustomTabBarConfigInstance = [super allocWithZone:zone];
    });return JobsCustomTabBarConfigInstance;
}

-(instancetype)copyWithZone:(NSZone *)zone {
    return self;
}

-(instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(CGFloat)tabBarHeight{
    if (!_tabBarHeight) {
        _tabBarHeight = JobsTabBarHeightByBottomSafeArea(AppDelegate.jobsCustomTabBarVC);
    }return _tabBarHeight;
}

@end
