//
//  LZTabBarConfig.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/14.
//

#import "LZTabBarConfig.h"

@implementation LZTabBarConfig

- (instancetype)init {
    if (self = [super init]) {
        _isNavigation = YES;
        _normalColor = JobsGrayColor;
        _selectedColor = JobsRedColor;
    }return self;
}

@end
