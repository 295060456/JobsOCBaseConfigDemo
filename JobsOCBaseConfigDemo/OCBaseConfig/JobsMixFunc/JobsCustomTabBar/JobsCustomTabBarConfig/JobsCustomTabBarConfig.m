//
//  JobsCustomTabBarConfig.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import "JobsCustomTabBarConfig.h"

@implementation JobsCustomTabBarConfig

+ (instancetype)sharedConfig {
    static JobsCustomTabBarConfig *sharedConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedConfig = [[self alloc] init];
    });
    return sharedConfig;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _tabBarHeight = 50.0;
        _tabBarBackgroundColor = [UIColor whiteColor];
        _tabBarItems = @[];
        _tabBarItemYOffsets = @[];
    }
    return self;
}

@end
