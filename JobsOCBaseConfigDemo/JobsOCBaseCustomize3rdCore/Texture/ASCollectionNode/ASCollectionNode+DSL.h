//
//  ASCollectionNode+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/6/25.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

static inline void jobs_on_main(jobsByVoidBlock _Nullable work) {
    if (NSThread.isMainThread) {
        if(work) work();
    }else {
        dispatch_async(dispatch_get_main_queue(), work);
    }
}

@interface ASCollectionNode (DSL)

@end

NS_ASSUME_NONNULL_END
