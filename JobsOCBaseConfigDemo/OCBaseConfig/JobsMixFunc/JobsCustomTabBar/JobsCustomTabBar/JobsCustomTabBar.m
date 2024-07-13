//
//  JobsCustomTabBar.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import "JobsCustomTabBar.h"

@implementation JobsCustomTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    JobsCustomTabBarConfig *config = [JobsCustomTabBarConfig sharedConfig];
    
    if (config.tabBarBackgroundImage) {
        self.backgroundColor = [UIColor colorWithPatternImage:config.tabBarBackgroundImage];
    } else {
        self.backgroundColor = config.tabBarBackgroundColor;
    }
    
    NSInteger itemCount = config.tabBarItems.count;
    CGFloat itemWidth = self.frame.size.width / itemCount;
    
    for (NSInteger index = 0; index < itemCount; index++) {
        UIView *item = config.tabBarItems[index];
        CGFloat xPosition = itemWidth * index;
        CGFloat yOffset = (index < config.tabBarItemYOffsets.count) ? [config.tabBarItemYOffsets[index] floatValue] : 0;
        item.frame = CGRectMake(xPosition, yOffset, itemWidth, self.frame.size.height);
        [self addSubview:item];
    }
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setup];
}

@end
