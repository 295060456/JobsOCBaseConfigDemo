//
//  WeakTarget.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/7/2.
//

#import "WeakTarget.h"

@implementation WeakTarget

+(instancetype)withTarget:(id)target {
    WeakTarget *w = WeakTarget.new;
    w.target = target;
    return w;
}

@end
