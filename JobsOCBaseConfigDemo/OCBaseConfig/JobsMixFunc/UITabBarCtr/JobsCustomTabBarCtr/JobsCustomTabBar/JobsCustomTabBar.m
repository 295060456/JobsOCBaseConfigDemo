//
//  JobsCustomTabBar.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import "JobsCustomTabBar.h"

@interface JobsCustomTabBar ()

@end

@implementation JobsCustomTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setup];
    }return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setup];
}

- (void)setup {
    JobsCustomTabBarConfig *config = AppDelegate.jobsCustomTabBarConfig;/// 此时还没有初始化 JobsCustomTabBarConfig.sharedManager;
    self.backgroundColor = config.tabBarBackgroundImage ? self.byPatternImage(config.tabBarBackgroundImage) :config.tabBarBackgroundColor;
    NSInteger itemCount = config.tabBarItems.count;
    CGFloat itemWidth = (config.tabBarWidth ? : JobsRealWidth()) / itemCount;
    for (NSInteger index = 0; index < itemCount; index++) {
        UIView *item = config.tabBarItems[index];
        CGFloat xPosition = itemWidth * index;
        CGFloat yOffset = (index < config.tabBarItemYOffsets.count) ? [config.tabBarItemYOffsets[index] floatValue] : 0;
        item.frame = CGRectMake(xPosition,
                                yOffset,
                                itemWidth,
                                config.tabBarHeight);
        [self addSubview:item];
    }
}

@end
