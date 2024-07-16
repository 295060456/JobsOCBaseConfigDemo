//
//  NotifiManager.m
//  CoreTextLearning
//
//  Created by alan comb on 2021/4/10.
//

#import "NotifiManager.h"
#import "NotifiOperation.h"
#import "NotifiViewFactory.h"

@interface NotifiManager()

@property(nonatomic, strong) NSOperationQueue* queue;

@end

@implementation NotifiManager

+ (instancetype)shared {
    static NotifiManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)setQueueNaxConcurrentOperationCount:(NSInteger)count{
    self.queue.maxConcurrentOperationCount = count;
}

- (void)showNotifiWithData:(id)data
                    onView:(UIView*)onView
               finishBlock:(FinishBlock)finishBlock{
    NotifiOperation* op = [NotifiOperation addOperatioOnView:onView
                                                        Info:data
                                               completeBlock:^(NSString *key) {
        if (finishBlock) {
            finishBlock(key);
        }
    }];
    [self.queue addOperation:op];
}

- (void)updateNotifiWithData:(id)data
                 finishBlock:(FinishBlock)finishBlock{
    NSString* key = data[kNotifiViewKey];
    NotifiView* nView = [[NotifiViewFactory shared] fetchViewWithKey:key];
    if (nView) {
        [nView updateWithData:data finish:^(NSString *key) {
            NSLog(@"更新完成!Key => %@", key);
        }];
    }
}
#pragma mark —— lazyLoad
- (NSOperationQueue *)queue{
    if (!_queue) {
        _queue = NSOperationQueue.new;
        _queue.maxConcurrentOperationCount = 1;
    }return _queue;
}

@end
