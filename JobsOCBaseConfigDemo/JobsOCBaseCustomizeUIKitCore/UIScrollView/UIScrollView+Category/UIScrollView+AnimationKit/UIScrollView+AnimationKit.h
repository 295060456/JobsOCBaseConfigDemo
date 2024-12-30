//
//  UIScrollView+AnimationKit.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/7/2.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+Extra.h"
#import "NSMutableArray+Extra.h"
#import "JobsDefineAllEnumHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (AnimationKit)
-(void)moveAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— moveSpringAnimation
-(void)moveSpringAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                     completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— alphaAnimation
-(void)alphaAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— fallAnimation
-(void)fallAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— shakeAnimation
-(void)shakeAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— overTurnAnimation
-(void)overTurnAnimWithSortingType:(SortingType)sortingType
                    animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                   completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— toTopAnimation
-(void)toTopAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— springListAnimation
-(void)springListAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                     completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— shrinkToTopAnimation
-(void)shrinkToTopAnimWithSortingType:(SortingType)sortingType
                       animationBlock:(jobsByVoidBlock _Nullable)animationBlock;
#pragma mark —— layDownAnimation
-(void)layDownAnimWithSortingType:(SortingType)sortingType
                   animationBlock:(jobsByVoidBlock _Nullable)animationBlock
                  completionBlock:(jobsByIDBlock _Nullable)completionBlock;
#pragma mark —— roteAnimation
-(void)roteAnimWithSortingType:(SortingType)sortingType
                animationBlock:(jobsByVoidBlock _Nullable)animationBlock
               completionBlock:(jobsByIDBlock _Nullable)completionBlock;
@end

NS_ASSUME_NONNULL_END
