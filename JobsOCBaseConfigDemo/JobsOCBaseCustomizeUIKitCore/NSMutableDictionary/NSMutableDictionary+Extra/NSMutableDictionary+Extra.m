//
//  NSMutableDictionary+Extra.m
//  FM
//
//  Created by User on 8/16/24.
//

#import "NSMutableDictionary+Extra.h"

@implementation NSMutableDictionary (Extra)

-(jobsKeyValueBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^(id <NSCopying>_Nonnull key,id _Nonnull value) {
        @jobs_strongify(self)
        if(isNull(key)) return;
        if(!value) return;
        if(key && value) [self setObject:value forKey:key];
    };
}

-(jobsByIDBlock _Nonnull)saveDataBy{
    @jobs_weakify(self)
    return ^(JobsKeyValueModel *_Nullable model){
        @jobs_strongify(self)
        if (isValue(model.key)) {
            [self setObject:model.data forKey:model.key];
        }
    };
}

@end
