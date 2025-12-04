//
//  LZTabBarItem.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/14.
//

#import <UIKit/UIKit.h>
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

#ifndef LZ_TAB_BAR_ITEM_TYPE_ENUM_DEFINED
#define LZ_TAB_BAR_ITEM_TYPE_ENUM_DEFINED
typedef enum : NSUInteger {
    LZTabBarItemTypeDefault,  /// 默认类型
    LZTabBarItemTypeImage,    /// 仅图片
    LZTabBarItemTypeText      /// 仅文字
} LZTabBarItemType;
#endif /* LZ_TAB_BAR_ITEM_TYPE_ENUM_DEFINED */

@protocol LZTabBarItemDelegate;

@interface LZTabBarItem : UIView

Prop_copy()NSString *icon;
Prop_copy()NSString *title;
Prop_strong()UIColor *titleColor;
Prop_assign()LZTabBarItemType type;
Prop_assign()id <LZTabBarItemDelegate> delegate;
@end

@protocol LZTabBarItemDelegate <NSObject>

-(void)tabBarItem:(LZTabBarItem *)item didSelectIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof LZTabBarItem *_Nonnull jobsMakeLZTabBarItem(jobsByLZTabBarItemBlock _Nonnull block){
    LZTabBarItem *data = LZTabBarItem.alloc.init;
    if (block) block(data);
    return data;
}
