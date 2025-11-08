//
//  NSBundle+Extra.m
//  FM
//
//  Created by User on 9/1/24.
//

#import "NSBundle+Extra.h"

@implementation NSBundle (Extra)

+(JobsRetBundleByStrBlock _Nonnull)initByPath{
    return ^NSBundle *_Nullable(NSString *_Nullable path){
        return [NSBundle bundleWithPath:path];
    };
}

+(JobsRetBundleByURLBlock _Nonnull)initByURL{
    return ^NSBundle *_Nullable(NSURL *_Nullable path){
        return [NSBundle bundleWithURL:path];
    };
}

+(JobsRetBundleByClsBlock _Nonnull)initByCls{
    return ^NSBundle *_Nullable(Class _Nullable cls){
        return [NSBundle bundleForClass:cls];
    };
}

+(JobsRetBundleByStrBlock _Nonnull)initByID{
    return ^NSBundle *_Nullable(NSString *_Nullable identifier){
        return [NSBundle bundleWithIdentifier:identifier];
    };
}

-(JobsRetIDByStrBlock _Nonnull)objectForInfoDictionaryKey{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self objectForInfoDictionaryKey:data];
    };
}

@end
