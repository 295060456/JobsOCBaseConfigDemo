//
//  UIScrollView+AnimationKit.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/7/2.
//

#import <UIKit/UIKit.h>
/// 排序方向
typedef enum : NSInteger {
    /// 排序方向-正序
    SortingType_Positive = 0,
    /// 排序方向-倒序
    SortingType_Reverse
} SortingType;

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (AnimationKit)
-(void)moveAnimWithSortingType:(SortingType)sortingType
                animationBlock:(nullable jobsByVoidBlock)animationBlock
               completionBlock:(nullable jobsByIDBlock)completionBlock;
#pragma mark —— moveSpringAnimation
-(void)moveSpringAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(nullable jobsByVoidBlock)animationBlock
                     completionBlock:(nullable jobsByIDBlock)completionBlock;
#pragma mark —— alphaAnimation
-(void)alphaAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(nullable jobsByVoidBlock)animationBlock
                completionBlock:(nullable jobsByIDBlock)completionBlock;
#pragma mark —— fallAnimation
-(void)fallAnimWithSortingType:(SortingType)sortingType
                animationBlock:(nullable jobsByVoidBlock)animationBlock
               completionBlock:(nullable jobsByIDBlock)completionBlock;
#pragma mark —— shakeAnimation
-(void)shakeAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(nullable jobsByVoidBlock)animationBlock
                completionBlock:(nullable jobsByIDBlock)completionBlock;
#pragma mark —— overTurnAnimation
-(void)overTurnAnimWithSortingType:(SortingType)sortingType
                    animationBlock:(nullable jobsByVoidBlock)animationBlock
                   completionBlock:(nullable jobsByIDBlock)completionBlock;
#pragma mark —— toTopAnimation
-(void)toTopAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(nullable jobsByVoidBlock)animationBlock
                completionBlock:(nullable jobsByIDBlock)completionBlock;
#pragma mark —— springListAnimation
-(void)springListAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(nullable jobsByVoidBlock)animationBlock
                     completionBlock:(nullable jobsByIDBlock)completionBlock;
#pragma mark —— shrinkToTopAnimation
-(void)shrinkToTopAnimWithSortingType:(SortingType)sortingType
                       animationBlock:(nullable jobsByVoidBlock)animationBlock;
#pragma mark —— layDownAnimation
-(void)layDownAnimWithSortingType:(SortingType)sortingType
                   animationBlock:(nullable jobsByVoidBlock)animationBlock
                  completionBlock:(nullable jobsByIDBlock)completionBlock;
#pragma mark —— roteAnimation
-(void)roteAnimWithSortingType:(SortingType)sortingType
                animationBlock:(nullable jobsByVoidBlock)animationBlock
               completionBlock:(nullable jobsByIDBlock)completionBlock;
@end

NS_ASSUME_NONNULL_END
