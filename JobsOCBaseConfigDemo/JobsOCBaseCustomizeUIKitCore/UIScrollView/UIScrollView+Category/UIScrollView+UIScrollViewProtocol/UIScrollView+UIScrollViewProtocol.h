//
//  UIScrollView+UIScrollViewProtocol.h
//  Casino
//
//  Created by Jobs on 2021/12/22.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "UIScrollViewProtocol.h"
#import "JobsDefineAllEnumHeader.h"
#import "UIView+Measure.h"

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (UIScrollViewProtocol)<UIScrollViewProtocol>

@end

NS_ASSUME_NONNULL_END
