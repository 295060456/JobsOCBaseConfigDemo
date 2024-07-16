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
