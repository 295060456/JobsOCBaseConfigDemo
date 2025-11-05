//
//  NotifiManager.h
//  CoreTextLearning
//
//  Created by alan comb on 2021/4/10.
//

#import <Foundation/Foundation.h>
#import "NotifiView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotifiManager : NSObject

+ (instancetype)shared;
/** 设置队列的并发数(不可大于绑定的notifiView的个数) */
- (void)setQueueNaxConcurrentOperationCount:(NSInteger)count;
/** 显示notifiView */
- (void)showNotifiWithData:(id)data
                    onView:(UIView*)onView
               finishBlock:(FinishBlock)finishBlock;
/** 更新notifiView */
- (void)updateNotifiWithData:(id)data
                 finishBlock:(FinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
