//
//  NSString+NSUserDefaults.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "NSString+NSUserDefaults.h"

@implementation NSString (NSUserDefaults)
#pragma mark —— 存值
/// 保存 BOOL 值
-(jobsByBOOLBlock _Nonnull)userDefaultsByBOOL{
    @jobs_weakify(self)
    return ^void(BOOL data){
        @jobs_strongify(self)
        [JobsUserDefaults setBool:data forKey:self];
        [JobsUserDefaults synchronize];/// 立即同步到磁盘
    };
}
/// 保存 Object 值
-(jobsByIDBlock _Nonnull)userDefaultsByObj{
    @jobs_weakify(self)
    return ^void(id _Nullable data){
        @jobs_strongify(self)
        [JobsUserDefaults setObject:data forKey:self];
        [JobsUserDefaults synchronize];/// 立即同步到磁盘
    };
}
/// 保存 NSInteger 值
-(jobsByNSIntegerBlock _Nonnull)userDefaultsByInteger{
    @jobs_weakify(self)
    return ^void(NSInteger data){
        @jobs_strongify(self)
        [JobsUserDefaults setInteger:data forKey:self];
        [JobsUserDefaults synchronize];/// 立即同步到磁盘
    };
}
/// 保存 float 值
-(jobsByFloatBlock _Nonnull)userDefaultsByFloat{
    @jobs_weakify(self)
    return ^void(float data){
        @jobs_strongify(self)
        [JobsUserDefaults setFloat:data forKey:self];
        [JobsUserDefaults synchronize];/// 立即同步到磁盘
    };
}
/// 保存 double 值
-(jobsByDoubleBlock _Nonnull)userDefaultsByDouble{
    @jobs_weakify(self)
    return ^void(double data){
        @jobs_strongify(self)
        [JobsUserDefaults setDouble:data forKey:self];
        [JobsUserDefaults synchronize];/// 立即同步到磁盘
    };
}
/// 保存 NSURL 值
-(jobsByURLBlock _Nonnull)userDefaultsByURL{
    @jobs_weakify(self)
    return ^void(NSURL *_Nullable url){
        @jobs_strongify(self)
        [JobsUserDefaults setURL:url forKey:self];
        [JobsUserDefaults synchronize];/// 立即同步到磁盘
    };
}
#pragma mark —— 取值
/// 读取 BOOL 值
-(JobsRetBOOLByVoidBlock _Nonnull)boolBy{
    @jobs_weakify(self)
    return ^BOOL(){
        @jobs_strongify(self)
        return [JobsUserDefaults boolForKey:self];
    };
}
/// 读取 NSInteger 值
-(JobsRetNSIntegerByVoidBlock _Nonnull)integerBy{
    @jobs_weakify(self)
    return ^NSInteger(){
        @jobs_strongify(self)
        return [JobsUserDefaults integerForKey:self];
    };
}
/// 读取 float 值
-(JobsRetFloatByVoidBlock _Nonnull)floatBy{
    @jobs_weakify(self)
    return ^float(){
        @jobs_strongify(self)
        return [JobsUserDefaults floatForKey:self];
    };
}
/// 读取 double 值
-(JobsRetDoubleByVoidBlock _Nonnull)doubleBy{
    @jobs_weakify(self)
    return ^double(){
        @jobs_strongify(self)
        return [JobsUserDefaults doubleForKey:self];
    };
}
/// 读取 double 值
-(JobsRetURLByVoidBlock _Nonnull)urlBy{
    @jobs_weakify(self)
    return ^NSURL *_Nullable(){
        @jobs_strongify(self)
        return [JobsUserDefaults URLForKey:self];
    };
}

@end
