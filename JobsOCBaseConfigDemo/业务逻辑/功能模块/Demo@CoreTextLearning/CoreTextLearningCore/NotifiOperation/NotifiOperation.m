//
//  NotifiOperation.m
//  CoreTextLearning
//
//  Created by alan comb on 2021/4/10.
//

#import "NotifiOperation.h"
#import "NotifiViewFactory.h"

@implementation NotifiOperation

@synthesize finished = _finished;
@synthesize executing = _executing;
@synthesize cancelled = _cancelled;

- (instancetype)init{
    if (self = [super init]) {
        _executing = NO;
        _finished  = NO;
    }return self;
}

+ (instancetype)addOperatioOnView:(UIView *)fatherView
                             Info:(id)data
                    completeBlock:(FinishBlock)finishBlock{
    NotifiOperation *op = [[NotifiOperation alloc] init];
    op.data = data;
    op.fatherView = fatherView;
    op.finishBlock  = finishBlock;
    return op;
}

- (void)start {
    if ([self isCancelled]) {
        _finished = YES;
        return;
    }
    _executing = YES;
    [[NotifiViewFactory shared] fetchAvailableView:^(NotifiView * _Nullable view) {
        @weakify(self)
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            @strongify(self)
            [self.fatherView addSubview:view];
            [view layoutIfNeeded];
            @weakify(self)
            [view showWithData:self.data
                        finish:^(NSString *key) {
                @strongify(self)
                self.finished = YES;
                if (self.finishBlock) {
                    self.finishBlock(key);
                }
            }];
        }];
    }];
}
#pragma mark —— 手动触发 KVO
- (void)setExecuting:(BOOL)executing{
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)setFinished:(BOOL)finished{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setCancelled:(BOOL)cancelled{
    [self willChangeValueForKey:@"isCancelled"];
    _cancelled = cancelled;
    [self didChangeValueForKey:@"isCancelled"];
}

@end
