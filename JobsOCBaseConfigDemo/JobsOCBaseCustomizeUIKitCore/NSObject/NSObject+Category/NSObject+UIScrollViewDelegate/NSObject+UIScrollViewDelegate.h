//
//  NSObject+UIScrollViewDelegate.h
//  Casino
//
//  Created by Jobs on 2021/12/22.
//

#import <Foundation/Foundation.h>
#import "UIScrollView+Extra.h"

NS_ASSUME_NONNULL_BEGIN
/// ⚠️主类实现了此代理即会屏蔽此分类的实现，因为是在NSObject分类实现，所以可覆盖面包括UIViewController 和UIView
@interface NSObject (UIScrollViewDelegate)<UIScrollViewDelegate>

@end

NS_ASSUME_NONNULL_END
