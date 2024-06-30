//
//  UIView+UIBackgroundConfig.m
//  Casino
//
//  Created by Jobs on 2021/12/25.
//

#import "UIView+UIBackgroundConfig.h"

@implementation UIView (UIBackgroundConfig)
#pragma mark —— @property(nonatomic,strong)UIBackgroundConfiguration *backgroundConfig;
JobsKey(_backgroundConfig)
@dynamic backgroundConfig;
-(UIBackgroundConfiguration *)backgroundConfig{
    UIBackgroundConfiguration *BackgroundConfig = Jobs_getAssociatedObject(_backgroundConfig);
    if (!BackgroundConfig) {
        BackgroundConfig = UIBackgroundConfiguration.listPlainHeaderFooterConfiguration;
        BackgroundConfig.image = JobsIMG(@"设置_背景1");
        BackgroundConfig.backgroundInsets = NSDirectionalEdgeInsetsMake(JobsWidth(3),
                                                                        JobsWidth(15),
                                                                        JobsWidth(3),
                                                                        JobsWidth(15));
        Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundConfig, BackgroundConfig);
    }return BackgroundConfig;
}

-(void)setBackgroundConfig:(UIBackgroundConfiguration *)backgroundConfig{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundConfig, backgroundConfig);
}

@end

