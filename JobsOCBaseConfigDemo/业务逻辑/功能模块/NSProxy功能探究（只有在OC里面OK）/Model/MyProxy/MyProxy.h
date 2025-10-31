//
//  MyProxy.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/7/2.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"
#import "JobsBlock.h"
#import "WeakTarget.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyProxy : NSProxy

Prop_strong(nullable)NSMutableArray *targets;
Prop_strong(nullable)NSMutableArray <WeakTarget *>*weakTargets;

+(instancetype)proxy;
-(jobsByIDBlock _Nonnull)addTargetBy;
-(jobsByIDBlock _Nonnull)addWeakTargetBy;

@end

NS_ASSUME_NONNULL_END
