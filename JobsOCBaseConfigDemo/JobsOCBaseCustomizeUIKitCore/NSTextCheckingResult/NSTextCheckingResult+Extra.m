//
//  NSTextCheckingResult+Extra.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "NSTextCheckingResult+Extra.h"

@implementation NSTextCheckingResult (Extra)

-(JobsRetRangeByIntegerBlock _Nonnull)rangeAtIndex{
    @jobs_weakify(self)
    return ^NSRange (NSInteger data){
        @jobs_strongify(self)
        return [self rangeAtIndex:data];
    };
}

@end
