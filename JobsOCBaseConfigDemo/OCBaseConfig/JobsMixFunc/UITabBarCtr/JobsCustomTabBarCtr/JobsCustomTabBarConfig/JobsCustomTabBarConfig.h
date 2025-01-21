//
//  JobsCustomTabBarConfig.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"

NS_ASSUME_NONNULL_BEGIN
/// 对整个TabBar的配置
@interface JobsCustomTabBarConfig : NSObject<BaseProtocol>

@property(nonatomic,assign)CGFloat tabBarHeight;
@property(nonatomic,assign)CGFloat tabBarWidth;
@property(nonatomic,assign)CGFloat tabBarX;
@property(nonatomic,assign)CGFloat tabBarY;
@property(nonatomic,assign)CGSize tabBarSize;
@property(nonatomic,assign)CGPoint tabBarOrigin;
@property(nonatomic,assign)CGRect tabBarFrame;
@property(nonatomic,strong,nullable)UIColor *tabBarBackgroundColor;
@property(nonatomic,strong,nullable)UIImage *tabBarBackgroundImage;
@property(nonatomic,copy)NSMutableArray <__kindof UIButton *>*tabBarItems;
@property(nonatomic,copy)NSMutableArray <__kindof UIViewController *>*viewControllers;
@property(nonatomic,strong,null_resettable)NSMutableArray <__kindof NSNumber *>*tabBarItemYOffsets;

@end

NS_ASSUME_NONNULL_END
