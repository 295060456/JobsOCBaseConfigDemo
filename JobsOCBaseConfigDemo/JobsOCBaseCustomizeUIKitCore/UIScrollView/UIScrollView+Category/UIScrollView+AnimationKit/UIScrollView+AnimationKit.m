//
//  UIScrollView+AnimationKit.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/7/2.
//

#import "UIScrollView+AnimationKit.h"

@implementation UIScrollView (AnimationKit)
#pragma mark —— 一些私有方法
-(void)sortingType:(SortingType)sortingType
             cells:(NSArray *)cells
             block:(jobsByNSUIntegerBlock)block{
    if (sortingType == SortingType_Positive) {
        for (NSUInteger i = 0; i < cells.count; i++) {
            if (block) block(i);
        }
    }else if (sortingType == SortingType_Reverse){
        for (NSUInteger i = cells.count - 1; i > 0; i--) {
            if (block) block(i);
        }
    }else{}
}
#pragma mark —— moveAnimation
-(void)moveAnimWithSortingType:(SortingType)sortingType
                animationBlock:(nullable jobsByVoidBlock)animationBlock
               completionBlock:(nullable jobsByIDBlock)completionBlock{
    NSArray *cells = self.scrollViewCells;
    CGFloat totalTime = 0.3;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(-JobsMainScreen_WIDTH(), 0);
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.25
                              delay:i * (totalTime/cells.count)
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.transform = CGAffineTransformIdentity;
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— moveSpringAnimation
-(void)moveSpringAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(nullable jobsByVoidBlock)animationBlock
                     completionBlock:(nullable jobsByIDBlock)completionBlock{
    NSArray <UIView *>*cells = self.scrollViewCells;
    CGFloat totalTime = 0.4;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(-JobsMainScreen_WIDTH(), 0);
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.4
                              delay:i*(totalTime/cells.count)
             usingSpringWithDamping:0.7
              initialSpringVelocity:1/0.7
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
            @jobs_strongify(cell)
            cell.transform = CGAffineTransformIdentity;
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— alphaAnimation
-(void)alphaAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(nullable jobsByVoidBlock)animationBlock
                completionBlock:(nullable jobsByIDBlock)completionBlock{
    NSArray *cells = self.scrollViewCells;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = nil;
        if (sortingType == SortingType_Positive) {
            cell = [self scrollViewCellsAtIndex:i];
        }else if (sortingType == SortingType_Reverse){
            cell = [self scrollViewCellsAtIndex:self.scrollViewCells.count - 1 - i];
        }else{}
        
        cell.alpha = 0.0;
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.3
                              delay:i * 0.05
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.alpha = 1.0;
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— fallAnimation
-(void)fallAnimWithSortingType:(SortingType)sortingType
                animationBlock:(nullable jobsByVoidBlock)animationBlock
               completionBlock:(nullable jobsByIDBlock)completionBlock{
    NSArray *cells = self.scrollViewCells;
    NSTimeInterval totalTime = 0.8;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0, - JobsMainScreen_HEIGHT());
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.3
                              delay:(cells.count - i) * (totalTime / cells.count)
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.transform = CGAffineTransformIdentity;
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— shakeAnimation
-(void)shakeAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(nullable jobsByVoidBlock)animationBlock
                completionBlock:(nullable jobsByIDBlock)completionBlock{
    NSArray *cells = self.scrollViewCells;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        if (i % 2 == 0) {
            cell.transform = CGAffineTransformMakeTranslation(-JobsMainScreen_WIDTH(),0);
        }else {
            cell.transform = CGAffineTransformMakeTranslation(JobsMainScreen_WIDTH(),0);
        }
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.4
                              delay:i * 0.03
             usingSpringWithDamping:0.75
              initialSpringVelocity:1 / 0.75
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.transform = CGAffineTransformIdentity;
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— overTurnAnimation
-(void)overTurnAnimWithSortingType:(SortingType)sortingType
                    animationBlock:(nullable jobsByVoidBlock)animationBlock
                   completionBlock:(nullable jobsByIDBlock)completionBlock{
    NSArray *cells = self.scrollViewCells;
    NSTimeInterval totalTime = 0.7;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        cell.layer.opacity = 0.0;
        cell.layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.3
                              delay:i * (totalTime / cells.count)
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.layer.opacity = 1.0;
            cell.layer.transform = CATransform3DIdentity;
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— toTopAnimation
-(void)toTopAnimWithSortingType:(SortingType)sortingType
                 animationBlock:(nullable jobsByVoidBlock)animationBlock
                completionBlock:(nullable jobsByIDBlock)completionBlock{
    NSArray *cells = self.scrollViewCells;
    NSTimeInterval totalTime = 0.8;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        cell.transform = CGAffineTransformMakeTranslation(0,JobsMainScreen_HEIGHT());
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.35
                              delay:i*(totalTime/cells.count)
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            @jobs_strongify(cell)
            cell.transform = CGAffineTransformIdentity;
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— springListAnimation
-(void)springListAnimWithSortingType:(SortingType)sortingType
                      animationBlock:(nullable jobsByVoidBlock)animationBlock
                     completionBlock:(nullable jobsByIDBlock)completionBlock{
    NSArray *cells = self.scrollViewCells;
    NSTimeInterval totalTime = 1.0;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        cell.layer.opacity = 0.7;
        cell.layer.transform = CATransform3DMakeTranslation(0, -JobsMainScreen_HEIGHT(), 20);
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.4
                              delay:i * (totalTime/cells.count)
             usingSpringWithDamping:0.65
              initialSpringVelocity:1 / 0.65
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
            @jobs_strongify(cell)
            cell.layer.opacity = 1.0;
            cell.layer.transform = CATransform3DMakeTranslation(0, 0, 20);
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— shrinkToTopAnimation
-(void)shrinkToTopAnimWithSortingType:(SortingType)sortingType
                       animationBlock:(nullable jobsByVoidBlock)animationBlock{
    NSArray *cells = self.scrollViewCells;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        CGRect rect = [cell convertRect:cell.bounds fromView:self];
        cell.transform = CGAffineTransformMakeTranslation(0, -rect.origin.y);
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.5
                         animations:^{
            @jobs_strongify(cell)
            cell.transform = CGAffineTransformIdentity;
            if (animationBlock) animationBlock();
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}
#pragma mark —— layDownAnimation
-(void)layDownAnimWithSortingType:(SortingType)sortingType
                   animationBlock:(nullable jobsByVoidBlock)animationBlock
                  completionBlock:(nullable jobsByIDBlock)completionBlock{
    NSArray *cells = self.scrollViewCells;
    NSMutableArray *rectArr = NSMutableArray.array;
    NSTimeInterval totalTime = 0.8;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block1 = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        CGRect rect = cell.frame;
        [rectArr addObject:[NSValue valueWithCGRect:rect]];
        rect.origin.y = i * 10;
        cell.frame = rect;
        cell.layer.transform = CATransform3DMakeTranslation(0, 0, i * 5);
    };
    
    jobsByNSUIntegerBlock block2 = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        CGRect rect = [[rectArr objectAtIndex:i] CGRectValue];
        @jobs_weakify(cell)
        [UIView animateWithDuration:(totalTime/cells.count) * i
                         animations:^{
            @jobs_strongify(cell)
            cell.frame = rect;
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            @jobs_strongify(cell)
            cell.layer.transform = CATransform3DIdentity;
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block1];
    [self sortingType:sortingType
                cells:cells
                block:block2];
}
#pragma mark —— roteAnimation
-(void)roteAnimWithSortingType:(SortingType)sortingType
                animationBlock:(nullable jobsByVoidBlock)animationBlock
               completionBlock:(nullable jobsByIDBlock)completionBlock{
    NSArray *cells = self.scrollViewCells;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.fromValue = @(-M_PI);
    animation.toValue = 0;
    animation.duration = 0.3;
    animation.removedOnCompletion = NO;
    animation.repeatCount = 3;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
    @jobs_weakify(self)
    jobsByNSUIntegerBlock block = ^(NSUInteger i){
        @jobs_strongify(self)
        UIView *cell = [self scrollViewCellsAtIndex:i];
        cell.alpha = 0.0;
        @jobs_weakify(cell)
        [UIView animateWithDuration:0.1
                              delay:i * 0.25
                            options:0
                         animations:^{
            @jobs_strongify(cell)
            cell.alpha = 1.0;
            if (animationBlock) animationBlock();
        } completion:^(BOOL finished) {
            @jobs_strongify(cell)
            [cell.layer addAnimation:animation
                              forKey:@"rotationYkey"];
            if (completionBlock) completionBlock(@(finished));
        }];
    };
    [self sortingType:sortingType
                cells:cells
                block:block];
}

@end
