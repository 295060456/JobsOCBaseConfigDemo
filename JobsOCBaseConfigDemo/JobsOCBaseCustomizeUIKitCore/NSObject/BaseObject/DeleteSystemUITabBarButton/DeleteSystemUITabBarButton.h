//
//  DeleteSystemUITabBarButton.h
//  JinXian Finance
//
//  Created by Jobs on 2017/6/7.
//  Copyright © 2017年 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeleteSystemUITabBarButton : NSObject

/**
 * 移除 系统自带的 UITabBarButton
 */
+(void)deleteSystemUITabBarButton:(UITabBar *)tabBar;

@end

NS_ASSUME_NONNULL_END
