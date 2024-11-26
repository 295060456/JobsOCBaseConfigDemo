//
//  JobsOnceExecutor.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/12/24.
//

#import "JobsOnceExecutor.h"

@interface JobsOnceExecutor ()

@end

@implementation JobsOnceExecutor
/// 利用时间戳做key保证当前key的唯一性。整个App全局只执行一次的代码
+(void)executeOnceForObject:(id)object withBlock:(dispatch_block_t)block {
    NSMutableDictionary *onceTokens = objc_getAssociatedObject(object,
                                                               @selector(executeOnceForObject:withBlock:));
    if (!onceTokens) {
        onceTokens = NSMutableDictionary.dictionary;
        objc_setAssociatedObject(object,
                                 @selector(executeOnceForObject:withBlock:),
                                 onceTokens,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSString *identifier = NSUUID.UUID.UUIDString;
    NSValue *onceTokenValue = onceTokens.valueForKey(identifier);
    dispatch_once_t *onceTokenPointer;
    
    if (!onceTokenValue) {
        onceTokenPointer = malloc(sizeof(dispatch_once_t));
        *onceTokenPointer = 0;
        onceTokenValue = [NSValue valueWithPointer:onceTokenPointer];
        onceTokenValue.jobsKVC(identifier,onceTokenValue);
    } else {
        onceTokenPointer = onceTokenValue.pointerValue;
    }dispatch_once(onceTokenPointer, block);
}
/// 利用时间戳做key保证当前key的唯一性。当前调用类只执行一次
-(void)executeOnceWithBlock:(dispatch_block_t)block {
    NSMutableDictionary *onceTokens = objc_getAssociatedObject(self,
                                                               @selector(executeOnceWithBlock:));
    if (!onceTokens) {
        onceTokens = NSMutableDictionary.dictionary;
        objc_setAssociatedObject(self,
                                 @selector(executeOnceWithBlock:),
                                 onceTokens,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSString *identifier = NSUUID.UUID.UUIDString;
    NSValue *onceTokenValue = onceTokens[identifier];
    dispatch_once_t *onceTokenPointer;
    
    if (!onceTokenValue) {
        onceTokenPointer = malloc(sizeof(dispatch_once_t));
        *onceTokenPointer = 0;
        onceTokenValue = [NSValue valueWithPointer:onceTokenPointer];
        onceTokens[identifier] = onceTokenValue;
    } else {
        onceTokenPointer = onceTokenValue.pointerValue;
    }dispatch_once(onceTokenPointer, block);
}

@end
