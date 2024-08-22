//
//  NSMutableDictionary+Extra.m
//  FM
//
//  Created by User on 8/16/24.
//

#import "NSMutableDictionary+Extra.h"

@implementation NSMutableDictionary (Extra)

-(jobsKeyValueBlock)add{
    @jobs_weakify(self)
    return ^(id <NSCopying>_Nonnull key,id _Nonnull value) {
        @jobs_strongify(self)
        if(!key){
            NSLog(@"Key 不能为空");
            return;
        }
        
        if(!value){
            NSLog(@"Value 不能为空");
            return;
        }
        
        if(key && value) [self setObject:value forKey:key];
    };
}

@end
