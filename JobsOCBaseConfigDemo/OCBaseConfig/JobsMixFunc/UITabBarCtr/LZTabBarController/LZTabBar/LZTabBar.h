//
//  LZTabBar.h
//  LZTabBarController
//
//  Created by Artron_LQQ on 2016/12/12.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZTabBarItem.h"

@protocol LZTabBarDelegate;

@interface LZTabBar : UIView<LZTabBarItemDelegate>

@property(nonatomic,strong)NSArray<LZTabBarItem *> *items;
@property(nonatomic,assign)id <LZTabBarDelegate> delegate;

@end

@protocol LZTabBarDelegate <NSObject>

-(void)tabBar:(LZTabBar *)tab
didSelectItem:(LZTabBarItem *)item
      atIndex:(NSInteger)index;

@end


