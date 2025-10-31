//
//  WeakTarget.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/7/2.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeakTarget : NSObject

Prop_weak(nullable)id target;

+(instancetype)withTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
