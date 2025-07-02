//
//  JobsCustomTabBarConfig.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"
#import "BaseButtonProtocol.h"

NS_ASSUME_NONNULL_BEGIN
/// 对整个TabBar的配置
@interface JobsCustomTabBarConfig : NSObject<BaseProtocol,BaseButtonProtocol>

Prop_assign()CGFloat tabBarHeight;
Prop_assign()CGFloat tabBarWidth;
Prop_assign()CGFloat tabBarX;
Prop_assign()CGFloat tabBarY;
Prop_assign()CGSize tabBarSize;
Prop_assign()CGPoint tabBarOrigin;
Prop_assign()CGRect tabBarFrame;
Prop_strong(nullable)UIColor *tabBarBackgroundColor;
Prop_strong(nullable)UIImage *tabBarBackgroundImage;
Prop_strong()NSMutableArray <__kindof UIButton *>*tabBarItems;
Prop_strong()NSMutableArray <__kindof UIViewController *>*viewControllers;
Prop_copy(null_resettable)NSMutableArray <__kindof NSNumber *>*tabBarItemYOffsets;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsCustomTabBarConfig *_Nonnull jobsMakeNormalCustomTabBarConfig(jobsByCustomTabBarConfigBlock _Nonnull block){
    JobsCustomTabBarConfig *data = JobsCustomTabBarConfig.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JobsCustomTabBarConfig *_Nonnull jobsMakeSharedManagerCustomTabBarConfig(jobsByCustomTabBarConfigBlock _Nonnull block){
    JobsCustomTabBarConfig *data = JobsCustomTabBarConfig.sharedManager;
    if (block) block(data);
    return data;
}
