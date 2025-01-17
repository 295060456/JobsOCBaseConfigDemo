//
//  TabBarItem.m
//  TabbarItemLottie
//
//  Created by Jobs on 2020/10/14.
//

#import "JobsTabBarItem.h"

@interface JobsTabBarItem ()

@property(nonatomic,strong)JobsTabBarItemConfig *tabBarControllerConfig;

@end

@implementation JobsTabBarItem

+(JobsReturnTabBarItemByConfigBlock _Nonnull)initByConfig{
    return ^__kindof UITabBarItem *_Nullable(__kindof JobsTabBarItemConfig *_Nullable data){
        return [self.class.alloc initWithConfig:data];
    };
}

-(instancetype)initWithConfig:(JobsTabBarItemConfig *_Nullable)config{
    if (self = [super init]) {
        if (config) {
            self.tabBarControllerConfig = config;
            
            self.image = [config.imageUnselected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.selectedImage = [config.imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.title = config.title;
            
            self.titleTextAttributesByNormalState(config.titleCorNormal);
            self.titleTextAttributesBySelectedState(config.titleCorNormal);
        }
    }return self;
}

@end
