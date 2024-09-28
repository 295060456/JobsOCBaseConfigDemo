//
//  NSNotificationCenter+JobsBlock.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 9/24/23.
//

#import "NSNotificationCenter+JobsBlock.h"

@implementation NSNotificationCenter (JobsBlock)
-(jobsByIDBlock _Nonnull)remove{
    return ^(id _Nullable data){
        [JobsNotificationCenter removeObserver:data];
    };
}

-(jobsByKey_ValueBlock)Remove{
    return ^(NSString *_Nonnull key,id _Nullable value){
        [JobsNotificationCenter removeObserver:value
                                          name:key
                                        object:nil];
    };
}
#pragma mark —— @property(nonatomic,copy)jobsByNotificationBlock jobsNotificationBlock;
-(jobsByNotificationBlock)jobsNotificationBlock{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setJobsNotificationBlock:(jobsByNotificationBlock)jobsNotificationBlock{
    objc_setAssociatedObject(self,
                             _cmd,
                             jobsNotificationBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
