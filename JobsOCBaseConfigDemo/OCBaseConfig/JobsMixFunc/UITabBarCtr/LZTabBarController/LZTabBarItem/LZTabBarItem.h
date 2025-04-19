//
//  LZTabBarItem.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    LZTabBarItemTypeDefault,
    LZTabBarItemTypeImage,
    LZTabBarItemTypeText,
} LZTabBarItemType;

@protocol LZTabBarItemDelegate;

@interface LZTabBarItem : UIView

Prop_copy()NSString *icon;
Prop_copy()NSString *title;
Prop_strong()UIColor *titleColor;
Prop_assign()LZTabBarItemType type;
Prop_assign()id <LZTabBarItemDelegate> delegate;
@end

@protocol LZTabBarItemDelegate <NSObject>

- (void)tabBarItem:(LZTabBarItem *)item
    didSelectIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
