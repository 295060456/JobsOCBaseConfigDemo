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

@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)UIColor *titleColor;
@property(nonatomic,assign)LZTabBarItemType type;
@property(nonatomic,assign)id <LZTabBarItemDelegate> delegate;
@end

@protocol LZTabBarItemDelegate <NSObject>

- (void)tabBarItem:(LZTabBarItem *)item
    didSelectIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
