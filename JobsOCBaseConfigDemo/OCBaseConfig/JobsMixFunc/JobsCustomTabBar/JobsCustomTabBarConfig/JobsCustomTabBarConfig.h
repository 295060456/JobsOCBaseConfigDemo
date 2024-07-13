//
//  JobsCustomTabBarConfig.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsCustomTabBarConfig : NSObject

@property (nonatomic, assign) CGFloat tabBarHeight;
@property (nonatomic, strong) UIColor *tabBarBackgroundColor;
@property (nonatomic, strong) UIImage *tabBarBackgroundImage;
@property (nonatomic, strong) NSArray<UIView *> *tabBarItems;
@property (nonatomic, strong) NSArray<NSNumber *> *tabBarItemYOffsets;

+ (instancetype)sharedConfig;

@end

NS_ASSUME_NONNULL_END
