//
//  JobsAppTools.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/11.
//

#import "JobsAppTools.h"

@interface JobsAppTools ()

@end

@implementation JobsAppTools

static JobsAppTools *JobsAppToolsInstance = nil;
static dispatch_once_t JobsAppToolsOnceToken;
+ (instancetype)sharedManager {
    dispatch_once(&JobsAppToolsOnceToken, ^{
        JobsAppToolsInstance = [super allocWithZone:NULL].init;
    });return JobsAppToolsInstance;
}
/// 单例的销毁
+ (void)destroyInstance {
    JobsAppToolsOnceToken = 0;
    JobsAppToolsInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    dispatch_once(&JobsAppToolsOnceToken, ^{
        JobsAppToolsInstance = [super allocWithZone:zone];
    });return JobsAppToolsInstance;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return self;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

@end
