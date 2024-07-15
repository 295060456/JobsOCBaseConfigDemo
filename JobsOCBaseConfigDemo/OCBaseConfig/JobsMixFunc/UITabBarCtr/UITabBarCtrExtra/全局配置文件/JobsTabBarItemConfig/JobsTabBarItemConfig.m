//
//  TabBarControllerConfig.m
//  TabbarItemLottie
//
//  Created by Jobs on 2020/10/16.
//

#import "JobsTabBarItemConfig.h"

@interface JobsTabBarItemConfig ()

@end

@implementation JobsTabBarItemConfig
static JobsTabBarItemConfig *JobsTabBarCtrlConfigInstance = nil;
static dispatch_once_t JobsTabBarCtrlConfigOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&JobsTabBarCtrlConfigOnceToken, ^{
        JobsTabBarCtrlConfigInstance = [super allocWithZone:NULL].init;
    });return JobsTabBarCtrlConfigInstance;
}
/// 单例的销毁
+(void)destroyInstance {
    JobsTabBarCtrlConfigOnceToken = 0;
    JobsTabBarCtrlConfigInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+(instancetype)allocWithZone:(struct _NSZone *)zone {
    dispatch_once(&JobsTabBarCtrlConfigOnceToken, ^{
        JobsTabBarCtrlConfigInstance = [super allocWithZone:zone];
    });return JobsTabBarCtrlConfigInstance;
}

-(instancetype)copyWithZone:(NSZone *)zone {
    return self;
}

-(instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}
#pragma mark —— lazyLoad
-(UIColor *)titleCorNormal{
    if (!_titleCorNormal) {
        _titleCorNormal = HEXCOLOR(0xB59E83);
    }return _titleCorNormal;
}

-(UIColor *)titleCorSelected{
    if (!_titleCorSelected) {
        _titleCorSelected = HEXCOLOR(0xB48B48);
    }return _titleCorSelected;
}

-(UIFont *)fontNormal{
    if (!_fontNormal) {
        //TODO
    }return _fontNormal;
}

-(UIFont *)fontSelected{
    if (!_fontSelected) {
        //TODO
    }return _fontSelected;
}

-(BOOL)isNotNeedCheckLogin{
    if (!_isNotNeedCheckLogin) {
        _isNotNeedCheckLogin = YES;
    }return _isNotNeedCheckLogin;
}

@end
