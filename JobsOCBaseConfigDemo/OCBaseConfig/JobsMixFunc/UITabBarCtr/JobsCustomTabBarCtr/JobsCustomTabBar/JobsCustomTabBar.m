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
        self.setup();
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.setup();
    }return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.setup();
}

-(jobsByVoidBlock _Nonnull)setup{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
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
    };
}

-(jobsByViewBlock _Nonnull)configMasonryBy{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable view){
        @jobs_strongify(self)
        [view addSubview:self];
        if(!jobsZeroRectValue(JobsCustomTabBarConfig_appDelegate.tabBarFrame)){
            self.frame = JobsCustomTabBarConfig_appDelegate.tabBarFrame;
        }else{
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                
                if(JobsCustomTabBarConfig_appDelegate.tabBarX){
                    make.left.mas_equalTo(JobsCustomTabBarConfig_appDelegate.tabBarX);
                }else{
                    make.centerX.equalTo(view);
                }
                
                if (JobsCustomTabBarConfig_appDelegate.tabBarY) {
                    make.top.mas_equalTo(JobsCustomTabBarConfig_appDelegate.tabBarY);
                }else{
                    make.bottom.equalTo(view);
                }
                
                if (!jobsZeroPointValue(JobsCustomTabBarConfig_appDelegate.tabBarOrigin)) {
                    make.left.mas_equalTo(JobsCustomTabBarConfig_appDelegate.tabBarOrigin.x);
                    make.top.mas_equalTo(JobsCustomTabBarConfig_appDelegate.tabBarOrigin.y);
                }
                
                if (!jobsZeroSizeValue(JobsCustomTabBarConfig_appDelegate.tabBarSize)) {
                    make.size.mas_equalTo(JobsCustomTabBarConfig_appDelegate.tabBarSize);
                }
                
                if(JobsCustomTabBarConfig_appDelegate.tabBarHeight){
                    // 这里使用 JobsCustomTabBarConfig.sharedManager.tabBarHeight 会崩
                    make.height.mas_equalTo(JobsCustomTabBarConfig_appDelegate.tabBarHeight);
                }
                
                if(JobsCustomTabBarConfig_appDelegate.tabBarWidth){
                    // 这里使用 JobsCustomTabBarConfig.sharedManager.tabBarWidth 会崩
                    make.width.mas_equalTo(JobsCustomTabBarConfig_appDelegate.tabBarWidth);
                }
            }];
            [view layoutIfNeeded];
        }
    };
}

@end
