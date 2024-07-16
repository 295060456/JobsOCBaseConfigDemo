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
@property(nonatomic,strong,nullable)UIColor *tabBarBackgroundColor;
@property(nonatomic,strong,nullable)UIImage *tabBarBackgroundImage;
@property(nonatomic,strong)NSMutableArray <__kindof UIButton *>*tabBarItems;
@property(nonatomic,strong)NSMutableArray <__kindof UIViewController *>*viewControllers;
@property(nonatomic,strong,null_resettable)NSMutableArray <__kindof NSNumber *>*tabBarItemYOffsets;

+(instancetype)sharedManager;
+(void)destroyInstance;

@end

NS_ASSUME_NONNULL_END
