//
//  JXCategoryIndicatorView+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/5/29.
//

#import "JobsBlock.h"

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryIndicatorView (Extra)

-(JobsReturnCategoryIndicatorViewByViewsBlock _Nonnull)byIndicators;

@end

NS_ASSUME_NONNULL_END
