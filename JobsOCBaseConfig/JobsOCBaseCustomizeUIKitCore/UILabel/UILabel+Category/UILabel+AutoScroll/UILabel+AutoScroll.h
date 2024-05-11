//
//  UILabel+AutoScroll.h
//  labelExpand
//
//  Created by 李灿 on 2021/3/25.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
#import "UIView+Extras.h"

NS_ASSUME_NONNULL_BEGIN
/**
    UILabel显示不全时循环滚动显示
    不建议用，因为runtime交换方法，入侵性太高
    参考资料：https://github.com/aYq524/AutoScrollLabel
 */
@interface UILabel (AutoScroll)

@end

NS_ASSUME_NONNULL_END
