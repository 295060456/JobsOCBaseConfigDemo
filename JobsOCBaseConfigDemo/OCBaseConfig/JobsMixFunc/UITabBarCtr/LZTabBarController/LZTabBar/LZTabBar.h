//
//  LZTabBar.h
//  LZTabBarController
//
//  Created by Artron_LQQ on 2016/12/12.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "LZTabBarItem.h"

@protocol LZTabBarDelegate;

@interface LZTabBar : UIView<LZTabBarItemDelegate>

Prop_copy()NSArray<LZTabBarItem *>* _Nullable items;
Prop_assign()id <LZTabBarDelegate> _Nullable delegate;

@end

@protocol LZTabBarDelegate <NSObject>

-(void)tabBar:(LZTabBar *_Nonnull)tab
didSelectItem:(LZTabBarItem *_Nonnull)item
      atIndex:(NSInteger)index;

@end

NS_INLINE __kindof LZTabBar *_Nonnull jobsMakeLZTabBar(jobsByLZTabBarBlock _Nonnull block){
    LZTabBar *data = LZTabBar.alloc.init;
    if (block) block(data);
    return data;
}

