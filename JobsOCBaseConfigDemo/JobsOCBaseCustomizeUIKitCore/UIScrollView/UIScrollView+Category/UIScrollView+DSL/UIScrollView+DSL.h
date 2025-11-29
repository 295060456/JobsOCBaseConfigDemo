//
//  UIScrollView+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import <UIKit/UIKit.h>
#import <TargetConditionals.h>
#import "JobsBlock.h"
#import "UIScrollViewDSLProtocol.h"

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (DSL)<UIScrollViewDSLProtocol>

@end

NS_ASSUME_NONNULL_END
