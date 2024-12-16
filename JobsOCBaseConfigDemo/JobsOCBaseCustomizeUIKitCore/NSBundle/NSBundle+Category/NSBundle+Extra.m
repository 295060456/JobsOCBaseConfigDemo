//
//  NSBundle+Extra.m
//  FM
//
//  Created by User on 9/1/24.
//

#import "NSBundle+Extra.h"

@implementation NSBundle (Extra)

+(JobsReturnBundleByStringBlock _Nonnull)initByPath{
    return ^NSBundle *_Nullable(NSString *_Nullable path){
        return [NSBundle bundleWithPath:path];
    };
}

+(JobsReturnBundleByURLBlock _Nonnull)initByURL{
    return ^NSBundle *_Nullable(NSURL *_Nullable path){
        return [NSBundle bundleWithURL:path];
    };
}

+(JobsReturnBundleByClsBlock _Nonnull)initByCls{
    return ^NSBundle *_Nullable(Class _Nullable cls){
        return [NSBundle bundleForClass:cls];
    };
}

+(JobsReturnBundleByStringBlock _Nonnull)initByID{
    return ^NSBundle *_Nullable(NSString *_Nullable identifier){
        return [NSBundle bundleWithIdentifier:identifier];
    };
}

-(JobsReturnIDByStringBlock _Nonnull)objectForInfoDictionaryKey{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self objectForInfoDictionaryKey:data];
    };
}

@end
