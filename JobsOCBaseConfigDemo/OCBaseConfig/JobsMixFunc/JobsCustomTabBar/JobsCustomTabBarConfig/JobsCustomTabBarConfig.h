//
//  JobsCustomTabBarConfig.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// 对整个TabBar的配置
@interface JobsCustomTabBarConfig : NSObject

@property(nonatomic,assign)CGFloat tabBarHeight;
@property(nonatomic,strong)UIColor *tabBarBackgroundColor;
@property(nonatomic,strong)UIImage *tabBarBackgroundImage;
@property(nonatomic,strong)NSArray <UIButton *>*tabBarItems;
@property(nonatomic,strong)NSArray <NSNumber *>*tabBarItemYOffsets;

+(instancetype)sharedManager;
+(void)destroyInstance;

@end

NS_ASSUME_NONNULL_END
