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
BaseButtonProtocol_synthesize
BaseProtocol_synthesize
static JobsCustomTabBarConfig *JobsCustomTabBarConfigInstance = nil;
static dispatch_once_t JobsCustomTabBarConfigOnceToken;
+(instancetype)sharedManager {
    dispatch_once(&JobsCustomTabBarConfigOnceToken, ^{
        if(!JobsCustomTabBarConfigInstance){
            JobsCustomTabBarConfigInstance = [super allocWithZone:NULL].init;
        }
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
/// 防止外部调用copy
-(instancetype)copyWithZone:(NSZone *)zone {
    return self;
}
/// 防止外部调用mutableCopy
-(instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(CGFloat)tabBarHeight{
    if (!_tabBarHeight) {
        _tabBarHeight = JobsTabBarHeightByBottomSafeArea(nil);
    }return _tabBarHeight;
}

-(NSMutableArray<__kindof NSNumber *> *)tabBarItemYOffsets{
    if(!_tabBarItemYOffsets){
        @jobs_weakify(self)
        _tabBarItemYOffsets = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
            @jobs_strongify(self)
            for (int d = 0; d < self.tabBarItems.count; d++) {
                arr.add(@(0));
            }
        });
    }return _tabBarItemYOffsets;
}

@end
