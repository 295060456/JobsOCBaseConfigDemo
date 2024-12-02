//
//  NSData+Other.m
//  JobsOCBaseConfig
//
//  Created by admin on 6/5/24.
//

#import "NSData+Other.h"

@implementation NSData (Other)
#pragma mark —— 对系统初始化方法的封装
-(JobsReturnDataByDataBlock _Nonnull)initWithData{
    @jobs_weakify(self)
    return ^NSData *_Nullable(NSData *_Nullable data){
        @jobs_strongify(self)
        return [self initWithData:data];
    };
}

+(JobsReturnDataByDataBlock _Nonnull)initByData{
    return ^NSData *_Nullable(NSData *_Nullable data){
        return [NSData dataWithData:data];
    };
}

+(JobsReturnDataByURLBlock _Nonnull)initByURL{
    return ^NSData *_Nullable(NSURL *_Nullable data){
        return [NSData dataWithContentsOfURL:data];
    };
}

+(JobsReturnDataByStringBlock _Nonnull)dataByContentsOfFile{
    return ^NSData *_Nullable(__kindof NSString *_Nullable data){
        return [NSData dataWithContentsOfFile:data];
    };
}

+(JobsReturnDataByStringBlock _Nonnull)initByBase64EncodedString{
    return ^NSData *_Nullable(__kindof NSString *_Nullable data){
        return [NSData.alloc initWithBase64EncodedString:data options:NSDataBase64DecodingIgnoreUnknownCharacters];
    };
}

+(JobsReturnDataByDataBlock _Nonnull)initByBase64EncodedData{
    return ^NSData *_Nullable(NSData *_Nullable data){
        return [NSData.alloc initWithBase64EncodedData:data options:NSDataBase64DecodingIgnoreUnknownCharacters];
    };
}

+(JobsReturnDataByStringBlock _Nonnull)dataByContentsOfFile_ReadingMappedIfSafe{
    return ^NSData *_Nullable(__kindof NSString *_Nullable string){
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfFile:string
                                              options:NSDataReadingMappedIfSafe
                                                error:&error];
        if(error) NSLog(@"error = %@",error.description);
        return data;
    };
}

+(JobsReturnDataByStringBlock _Nonnull)dataByContentsOfFile_NSDataReadingUncached{
    return ^NSData *_Nullable(__kindof NSString *_Nullable string){
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfFile:string
                                              options:NSDataReadingUncached
                                                error:&error];
        if(error) NSLog(@"error = %@",error.description);
        return data;
    };
}

+(JobsReturnDataByStringBlock _Nonnull)dataByContentsOfFile_NSDataReadingMappedAlways API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0)){
    return ^NSData *_Nullable(__kindof NSString *_Nullable string){
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfFile:string
                                              options:NSDataReadingMappedAlways
                                                error:&error];
        if(error) NSLog(@"error = %@",error.description);
        return data;
    };
}

+(JobsReturnDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingMappedIfSafe{
    return ^NSData *_Nullable(NSURL *_Nullable url){
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url
                                             options:NSDataReadingMappedIfSafe
                                               error:&error];
        if(error) NSLog(@"error = %@",error.description);
        return data;
    };
}

+(JobsReturnDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingUncached{
    return ^NSData *_Nullable(NSURL *_Nullable url){
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url
                                             options:NSDataReadingUncached
                                               error:&error];
        if(error) NSLog(@"error = %@",error.description);
        return data;
    };
}

+(JobsReturnDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingMappedAlways API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0)){
    return ^NSData *_Nullable(NSURL *_Nullable url){
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url
                                             options:NSDataReadingMappedAlways
                                               error:&error];
        if(error) NSLog(@"error = %@",error.description);
        return data;
    };
}
#pragma mark —— 一些功能性的
/// 解压缩字符串
-(NSString *)decompressToStr{
    NSError *error = nil;
    NSString *string = @"";
    NSData *data = [NSKeyedUnarchiver unarchivedObjectOfClass:NSData.class
                                                     fromData:self
                                                        error:&error];
    if(error) NSLog(@"%@",error.description);
    if(data) string = data.stringByUTF8Encoding;
    return string;
}

-(NSString *)stringByUTF8Encoding{
    return NSString.initByUTF8Data(self);
}

@end
